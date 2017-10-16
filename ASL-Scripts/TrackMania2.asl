state("ManiaPlanet")
{
	// 2017-31-08 02:31:12 PM
	// SoI: 0x19C3000
	// https://github.com/NeKzor
}

startup
{
	// Memory stuff
	vars.GameRestart = false;
	vars.FirstMap = string.Empty;
	vars.CategoryName = string.Empty;
	vars.GameInfo = string.Empty;
	vars.Watchers = new MemoryWatcherList();
	vars.LoadingState = new MemoryWatcher<bool>(IntPtr.Zero);
	vars.GameInfo = new StringWatcher(IntPtr.Zero, ReadStringType.ASCII, 33);
	vars.ERaceState = new MemoryWatcher<int>(IntPtr.Zero);
	vars.TryInit = (Func<Process, ProcessModuleWow64Safe, bool>)((gameProc, module) =>
	{
		// \x83\x3D\x00\x00\x00\x00\x00\x8B\x0D\x00\x00\x00\x00\x75\x08\x85\xC9 xx????xxx????xxxx
		var LoadingTarget = new SigScanTarget(9,
			"83 3D ?? ?? ?? ?? 00",		// cmp dword ptr [ManiaPlanet.exe+17B4220],00
			"8B 0D ?? ?? ?? ??",		// mov ecx,[ManiaPlanet.exe+17B4224]
			"75 08",					// jne ManiaPlanet.exe+7E7B77
			"85 C9"						// test ecx,ecx
		);

		LoadingTarget.OnFound = (proc, _, ptr) =>
		{
			//print("LoadingTarget = 0x" + ptr.ToString("X"));
			return proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
		};

		var Scanner = new SignatureScanner(gameProc, module.BaseAddress, module.ModuleMemorySize);
		var LoadingAddr = (IntPtr)Scanner.Scan(LoadingTarget);

		if (LoadingAddr != IntPtr.Zero)
		{
			vars.LoadingState = new MemoryWatcher<bool>(LoadingAddr);

			// Don't have time to make sigs for this :^)
			vars.GameInfo = new StringWatcher(new DeepPointer("ManiaPlanet.exe", 0x017F5448, 0x20, 0x240, 0x0), ReadStringType.ASCII, 33);
			vars.ERaceState = new MemoryWatcher<int>(new DeepPointer("ManiaPlanet.exe", 0x017E9B54, 0xC, 0x2D8, 0x104, 0xDC, 0x108));

			vars.Watchers.Clear();
			vars.Watchers.AddRange(new MemoryWatcher[]
			{
				vars.LoadingState,
				vars.GameInfo,
				vars.ERaceState
			});
			vars.Watchers.UpdateAll(gameProc);
			return true;
		}
		return false;
	});

	// Used for splitting
	vars.CompletedMaps = new List<string>();
	vars.MapSplit = (Func<bool, bool>)((state) =>
	{
		if (state)
			vars.CompletedMaps.Add(vars.CurrentMapName);
		return state;
	});
	vars.GetFirstMap = (Func<string, string>)((categoryName) =>
	{
		switch (categoryName)
		{
			case "All Flags":
			case "White":
				return "[Game] init challenge '$fff$sA01'";
			case "Green":
				return "[Game] init challenge '$fff$sB01'";
			case "Blue":
				return "[Game] init challenge '$fff$sC01'";
			case "Red":
				return "[Game] init challenge '$fff$sD01'";
			case "Black":
				return "[Game] init challenge '$fff$sE01'";
			default:
				return string.Empty;
		}
	});

	// Settings
	settings.Add("SplitOnMapChange", false, "Auto split on map change:");
	settings.Add("SplitOnMapExit", false, "When leaving a map.", "SplitOnMapChange");
	settings.Add("SplitOnMapLoad", false, "When entering a map.", "SplitOnMapChange");
	settings.Add("SplitOnMapFinish", true, "Auto split when finishing a map.");

	// Generate map list + settings
	vars.Maps = new List<string>();
	for (int i = 0; i < 5; i++)
	{
		for (int j = 1; j <= 15; j++)
		{
			if ((j > 5) && (i == 4))
				goto done;
			var map = string.Format("[Game] init challenge '$fff$s{0}{1}'", (char)(i + 65), j.ToString("D2"));
			vars.Maps.Add(map);
			settings.Add(map, true, map.Substring(29, 3), "SplitOnMapFinish");
		}
	}
done:
}

init
{
	vars.Init = false;
	vars.Module = modules.First();
	vars.OldMapName = string.Empty;
	vars.CurrentMapName = string.Empty;
}

update
{
	vars.Watchers.UpdateAll(game);
	// Get category from Splits Editor
	if ((timer.CurrentPhase == TimerPhase.NotRunning) && (vars.CategoryName != timer.Run.CategoryName))
	{
		vars.CategoryName = timer.Run.CategoryName;
		vars.FirstMap = vars.GetFirstMap(vars.CategoryName);
	}
	if (vars.Init)
	{
		if ((vars.GameInfo.Old != null) && (vars.GameInfo.Current != null))
		{
			vars.OldMapName = vars.CurrentMapName;
			if (vars.GameInfo.Current != vars.GameInfo.Old)
			{
				if (vars.GameInfo.Current.StartsWith("[Game] init challenge"))
					vars.CurrentMapName = vars.GameInfo.Current;
				else if ((vars.GameInfo.Current.StartsWith("[Game] main menu")) || (vars.GameInfo.Current.StartsWith("Script 'Media/Apps/MainMenu")))
					vars.CurrentMapName = "[Game] main menu";
			}
			// Scan again when title pack has loaded
			if ((vars.GameInfo.Old.StartsWith("[Game] Loading title")) && (vars.GameInfo.Current.StartsWith("[Game] main menu")))
				vars.GameRestart = !vars.TryInit(game, vars.Module);
		}
	}
	else if ((vars.TryInit(game, vars.Module)) && (vars.GameInfo.Current != null))
		vars.Init = (vars.GameInfo.Current.StartsWith("[Game]")) || (vars.GameInfo.Current.StartsWith("Script"));
}

isLoading
{
	return (vars.LoadingState.Current) || (!vars.Init) || (vars.GameRestart);
}

start
{
	return (vars.LoadingState.Old) && (!vars.LoadingState.Current) && (vars.CurrentMapName == vars.FirstMap);
}

reset
{
	if ((vars.OldMapName == vars.CurrentMapName) || (vars.CurrentMapName != vars.FirstMap))
		return false;
	vars.CompletedMaps.Clear();
	return true;
}

split
{
	// Map change
	if ((settings["SplitOnMapExit"]) && (vars.CurrentMapName.StartsWith("[Game] main menu")) && (vars.OldMapName.StartsWith("[Game] init challenge")))
		return true;
	if ((settings["SplitOnMapLoad"]) && (vars.OldMapName.StartsWith("[Game] main menu")) && (vars.CurrentMapName.StartsWith("[Game] init challenge")))
		return true;

	// Finish line
	if ((vars.ERaceState.Old == 1) && (vars.ERaceState.Current == 2) && (!vars.LoadingState.Current) && (!vars.CompletedMaps.Contains(vars.CurrentMapName)))
	{
		// End of any map
		if (settings[vars.CurrentMapName])
			return vars.MapSplit(true);

		// End of category
		switch (vars.CategoryName as string)
		{
			case "White":
				return vars.MapSplit(vars.CurrentMapName == "[Game] init challenge '$fff$sA15'");
			case "Green":
				return vars.MapSplit(vars.CurrentMapName == "[Game] init challenge '$fff$sB15'");
			case "Blue":
				return vars.MapSplit(vars.CurrentMapName == "[Game] init challenge '$fff$sC15'");
			case "Red":
				return vars.MapSplit(vars.CurrentMapName == "[Game] init challenge '$fff$sD15'");
			case "Black":
			case "All Flags":
				return vars.MapSplit(vars.CurrentMapName == "[Game] init challenge '$fff$sE05'");
		}
	}
	return false;
}

exit
{
	timer.IsGameTimePaused = true;
	vars.GameRestart = true;
}