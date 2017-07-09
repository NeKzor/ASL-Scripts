state("ManiaPlanet")
{
	// 2017-06-01 11:50:47 AM
	// SoI: 0x19AA000
	// https://github.com/NeKzor
}

startup
{
	vars.GameRestart = false;
	vars.FirstMap = string.Empty;
	vars.CategoryName = string.Empty;
	vars.Watchers = new MemoryWatcherList();
	vars.LoadingState = new MemoryWatcher<bool>(IntPtr.Zero);
	vars.GameInfo = new StringWatcher(IntPtr.Zero, ReadStringType.ASCII, 33);
	vars.CpCounter = new MemoryWatcher<int>(IntPtr.Zero);
	vars.TryInit = (Func<Process, ProcessModuleWow64Safe, bool>)((gameProc, module) =>
	{
		var LoadingTarget = new SigScanTarget(9, "83 3D ?? ?? ?? ?? 00",	// cmp dword ptr [ManiaPlanet.exe+17B4220],00
												 "8B 0D ?? ?? ?? ??",		// mov ecx,[ManiaPlanet.exe+17B4224]
												 "75 08",					// jne ManiaPlanet.exe+7E7B77
												 "85 C9");					// test ecx,ecx

		var GameInfoTarget = new SigScanTarget(11, "CE",					// into 
												   "6F",					// outsd 
												   "01 02",					// add [edx],eax
												   "00 00",					// add [eax],al
												   "00 00",					// add [eax],al
												   "00 00",					// add [eax],al
												   "00 78 21");				// add [eax+21],bh


		var CpsTarget = new SigScanTarget(12, "89 41 04",					// mov [ecx+04],eax
											  "C7 41 08 ?? ?? ?? ??",		// mov [ecx+08],00000000
											  "8B 0D ?? ?? ?? ??",			// mov ecx,[ManiaPlanet.exe+17B3E40]
											  "E8 ?? ?? ?? ??",				// call ManiaPlanet.exe+7D5F40
											  "85 DB");						// test ebx,ebx

		LoadingTarget.OnFound = (proc, _, ptr) => proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
		GameInfoTarget.OnFound = (proc, _, ptr) =>
		{
			if (proc.ReadPointer(ptr, out ptr))
				if (proc.ReadPointer(ptr + 0x354, out ptr))
					if (proc.ReadPointer(ptr + 0x110, out ptr))
						if (proc.ReadPointer(ptr + 0x48C, out ptr))
							if (proc.ReadPointer(ptr + 0x28, out ptr))
								return ptr + 0x0;
			return IntPtr.Zero;
		};
		CpsTarget.OnFound = (proc, _, ptr) =>
		{
			if (proc.ReadPointer(ptr, out ptr))
				if (proc.ReadPointer(ptr, out ptr))
					if (proc.ReadPointer(ptr + 0x14, out ptr))
						return ptr + 0xAC;
			return IntPtr.Zero;
		};

		var Scanner = new SignatureScanner(gameProc, module.BaseAddress, module.ModuleMemorySize);
		var LoadingAdr = (IntPtr)Scanner.Scan(LoadingTarget);
		var GameInfoAdr = (IntPtr)Scanner.Scan(GameInfoTarget);
		var CpsAdr = (IntPtr)Scanner.Scan(CpsTarget);

		if ((LoadingAdr != IntPtr.Zero) && (GameInfoAdr != IntPtr.Zero) && (CpsAdr != IntPtr.Zero))
		{
			vars.LoadingState = new MemoryWatcher<bool>(LoadingAdr);
			vars.GameInfo = new StringWatcher(GameInfoAdr, ReadStringType.ASCII, 33);
			vars.CpCounter = new MemoryWatcher<int>(CpsAdr);

			vars.Watchers.Clear();
			vars.Watchers.AddRange(new MemoryWatcher[]
			{
				vars.LoadingState,
				vars.GameInfo,
				vars.CpCounter
			});
			vars.Watchers.UpdateAll(gameProc);
			return true;
		}
		return false;
	});
	vars.GetRequiredCps = (Func<string, uint>)((mapName) =>
	{
		if (vars.Maps.ContainsKey(mapName))
		{
			switch (timer.Run.GameName)
			{
				case "TrackMania² Canyon":
					return vars.Maps[mapName].Item1;
				case "TrackMania² Lagoon":
					return vars.Maps[mapName].Item2;
				case "TrackMania² Stadium":
					return vars.Maps[mapName].Item3;
				case "TrackMania² Valley":
					return vars.Maps[mapName].Item4;
			}
		}
		return 1337u;
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
	// Thanks to RastaBobby for collecting most of the cp data
	vars.Maps = new Dictionary<string, Tuple<uint, uint, uint, uint>>()
	{
		{ "[Game] init challenge '$fff$sA01'", new Tuple<uint, uint, uint, uint>(3, 4, 5, 4) },
		{ "[Game] init challenge '$fff$sA02'", new Tuple<uint, uint, uint, uint>(2, 6, 5, 4) },
		{ "[Game] init challenge '$fff$sA03'", new Tuple<uint, uint, uint, uint>(1, 4, 3, 4) },
		{ "[Game] init challenge '$fff$sA04'", new Tuple<uint, uint, uint, uint>(3, 4, 6, 3) },
		{ "[Game] init challenge '$fff$sA05'", new Tuple<uint, uint, uint, uint>(15, 14, 12, 12) },
		{ "[Game] init challenge '$fff$sA06'", new Tuple<uint, uint, uint, uint>(3, 5, 5, 5) },
		{ "[Game] init challenge '$fff$sA07'", new Tuple<uint, uint, uint, uint>(3, 2, 5, 5) },
		{ "[Game] init challenge '$fff$sA08'", new Tuple<uint, uint, uint, uint>(2, 2, 1, 2) },
		{ "[Game] init challenge '$fff$sA09'", new Tuple<uint, uint, uint, uint>(4, 4, 6, 6) },
		{ "[Game] init challenge '$fff$sA10'", new Tuple<uint, uint, uint, uint>(20, 12, 18, 15) },
		{ "[Game] init challenge '$fff$sA11'", new Tuple<uint, uint, uint, uint>(3, 4, 5, 4) },
		{ "[Game] init challenge '$fff$sA12'", new Tuple<uint, uint, uint, uint>(4, 6, 6, 5) },
		{ "[Game] init challenge '$fff$sA13'", new Tuple<uint, uint, uint, uint>(2, 3, 2, 3) },
		{ "[Game] init challenge '$fff$sA14'", new Tuple<uint, uint, uint, uint>(3, 5, 4, 5) },
		{ "[Game] init challenge '$fff$sA15'", new Tuple<uint, uint, uint, uint>(20, 24, 21, 15) },
		{ "[Game] init challenge '$fff$sB01'", new Tuple<uint, uint, uint, uint>(999, 7, 7, 6) },
		{ "[Game] init challenge '$fff$sB02'", new Tuple<uint, uint, uint, uint>(999, 8, 5, 5) },
		{ "[Game] init challenge '$fff$sB03'", new Tuple<uint, uint, uint, uint>(999, 6, 3, 4) },
		{ "[Game] init challenge '$fff$sB04'", new Tuple<uint, uint, uint, uint>(999, 5, 6, 6) },
		{ "[Game] init challenge '$fff$sB05'", new Tuple<uint, uint, uint, uint>(999, 14, 21, 18) },
		{ "[Game] init challenge '$fff$sB06'", new Tuple<uint, uint, uint, uint>(999, 4, 9, 7) },
		{ "[Game] init challenge '$fff$sB07'", new Tuple<uint, uint, uint, uint>(999, 7, 6, 6) },
		{ "[Game] init challenge '$fff$sB08'", new Tuple<uint, uint, uint, uint>(999, 3, 5, 3) },
		{ "[Game] init challenge '$fff$sB09'", new Tuple<uint, uint, uint, uint>(999, 8, 6, 4) },
		{ "[Game] init challenge '$fff$sB10'", new Tuple<uint, uint, uint, uint>(999, 20, 18, 15) },
		{ "[Game] init challenge '$fff$sB11'", new Tuple<uint, uint, uint, uint>(999, 5, 6, 5) },
		{ "[Game] init challenge '$fff$sB12'", new Tuple<uint, uint, uint, uint>(999, 5, 8, 7) },
		{ "[Game] init challenge '$fff$sB13'", new Tuple<uint, uint, uint, uint>(999, 5, 4, 5) },
		{ "[Game] init challenge '$fff$sB14'", new Tuple<uint, uint, uint, uint>(999, 6, 7, 6) },
		{ "[Game] init challenge '$fff$sB15'", new Tuple<uint, uint, uint, uint>(999, 30, 15, 21) },
		{ "[Game] init challenge '$fff$sC01'", new Tuple<uint, uint, uint, uint>(999, 10, 10, 7) },
		{ "[Game] init challenge '$fff$sC02'", new Tuple<uint, uint, uint, uint>(999, 10, 13, 6) },
		{ "[Game] init challenge '$fff$sC03'", new Tuple<uint, uint, uint, uint>(999, 2, 3, 3) },
		{ "[Game] init challenge '$fff$sC04'", new Tuple<uint, uint, uint, uint>(999, 13, 8, 7) },
		{ "[Game] init challenge '$fff$sC05'", new Tuple<uint, uint, uint, uint>(999, 18, 21, 21) },
		{ "[Game] init challenge '$fff$sC06'", new Tuple<uint, uint, uint, uint>(999, 3, 7, 9) },
		{ "[Game] init challenge '$fff$sC07'", new Tuple<uint, uint, uint, uint>(999, 8, 6, 6) },
		{ "[Game] init challenge '$fff$sC08'", new Tuple<uint, uint, uint, uint>(999, 8, 4, 5) },
		{ "[Game] init challenge '$fff$sC09'", new Tuple<uint, uint, uint, uint>(999, 10, 9, 9) },
		{ "[Game] init challenge '$fff$sC10'", new Tuple<uint, uint, uint, uint>(999, 28, 24, 24) },
		{ "[Game] init challenge '$fff$sC11'", new Tuple<uint, uint, uint, uint>(999, 12, 8, 8) },
		{ "[Game] init challenge '$fff$sC12'", new Tuple<uint, uint, uint, uint>(999, 6, 9, 7) },
		{ "[Game] init challenge '$fff$sC13'", new Tuple<uint, uint, uint, uint>(999, 6, 12, 3) },
		{ "[Game] init challenge '$fff$sC14'", new Tuple<uint, uint, uint, uint>(999, 9, 7, 9) },
		{ "[Game] init challenge '$fff$sC15'", new Tuple<uint, uint, uint, uint>(999, 27, 24, 30) },
		{ "[Game] init challenge '$fff$sD01'", new Tuple<uint, uint, uint, uint>(999, 8, 7, 12) },
		{ "[Game] init challenge '$fff$sD02'", new Tuple<uint, uint, uint, uint>(999, 6, 6, 6) },
		{ "[Game] init challenge '$fff$sD03'", new Tuple<uint, uint, uint, uint>(999, 6, 6, 3) },
		{ "[Game] init challenge '$fff$sD04'", new Tuple<uint, uint, uint, uint>(999, 9, 7, 10) },
		{ "[Game] init challenge '$fff$sD05'", new Tuple<uint, uint, uint, uint>(999, 40, 18, 27) },
		{ "[Game] init challenge '$fff$sD06'", new Tuple<uint, uint, uint, uint>(999, 14, 10, 9) },
		{ "[Game] init challenge '$fff$sD07'", new Tuple<uint, uint, uint, uint>(999, 13, 11, 8) },
		{ "[Game] init challenge '$fff$sD08'", new Tuple<uint, uint, uint, uint>(999, 6, 3, 4) },
		{ "[Game] init challenge '$fff$sD09'", new Tuple<uint, uint, uint, uint>(999, 11, 8, 13) },
		{ "[Game] init challenge '$fff$sD10'", new Tuple<uint, uint, uint, uint>(999, 20, 30, 50) },
		{ "[Game] init challenge '$fff$sD11'", new Tuple<uint, uint, uint, uint>(999, 7, 12, 8) },
		{ "[Game] init challenge '$fff$sD12'", new Tuple<uint, uint, uint, uint>(999, 12, 12, 999) },
		{ "[Game] init challenge '$fff$sD13'", new Tuple<uint, uint, uint, uint>(999, 13, 4, 999) },
		{ "[Game] init challenge '$fff$sD14'", new Tuple<uint, uint, uint, uint>(999, 9, 13, 999) },
		{ "[Game] init challenge '$fff$sD15'", new Tuple<uint, uint, uint, uint>(999, 33, 90, 999) },
		{ "[Game] init challenge '$fff$sE01'", new Tuple<uint, uint, uint, uint>(999, 14, 11, 999) },
		{ "[Game] init challenge '$fff$sE02'", new Tuple<uint, uint, uint, uint>(999, 13, 16, 999) },
		{ "[Game] init challenge '$fff$sE03'", new Tuple<uint, uint, uint, uint>(999, 14, 25, 999) },
		{ "[Game] init challenge '$fff$sE04'", new Tuple<uint, uint, uint, uint>(999, 19, 25, 999) },
		{ "[Game] init challenge '$fff$sE05'", new Tuple<uint, uint, uint, uint>(999, 120, 150, 999) }
	};

	settings.Add("SplitOnMapChange", true, "Auto split on map change:");
	settings.Add("SplitOnMapExit", true, "When leaving a map.", "SplitOnMapChange");
	settings.Add("SplitOnMapLoad", false, "When entering a map.", "SplitOnMapChange");
	settings.Add("SplitOnMapFinish", false, "Auto split when finishing a map.");
	foreach (var map in vars.Maps)
		settings.Add(map.Key, true, map.Key.Substring(29, 3), "SplitOnMapFinish");
}

init
{
	vars.Init = false;
	vars.Module = modules.First();
	vars.OldMapName = string.Empty;
	vars.CurrentMapName = string.Empty;
	vars.RequiredCps = 1337u;
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
				{
					vars.CurrentMapName = vars.GameInfo.Current;
					vars.RequiredCps = vars.GetRequiredCps(vars.CurrentMapName);
				}
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
	if ((vars.LoadingState.Old) && (!vars.LoadingState.Current))
		return (vars.CurrentMapName == vars.FirstMap);
	return false;
}

reset
{
	if (vars.OldMapName != vars.CurrentMapName)
		return (vars.CurrentMapName == vars.FirstMap);
	return false;
}

split
{
	// Map change
	if ((settings["SplitOnMapExit"]) && (vars.CurrentMapName.StartsWith("[Game] main menu")) && (vars.OldMapName.StartsWith("[Game] init challenge")))
		return true;
	if ((settings["SplitOnMapLoad"]) && (vars.OldMapName.StartsWith("[Game] main menu")) && (vars.CurrentMapName.StartsWith("[Game] init challenge")))
		return true;
	// Finish line
	if (vars.CpCounter.Current != vars.CpCounter.Old)
	{
		if (vars.CpCounter.Current == vars.RequiredCps)
		{
			// End of any map
			if (settings[vars.CurrentMapName])
				return true;
			// End of category
			switch (vars.CategoryName as string)
			{
				case "White":
					return (vars.CurrentMapName == "[Game] init challenge '$fff$sA15'");
				case "Green":
					return (vars.CurrentMapName == "[Game] init challenge '$fff$sB15'");
				case "Blue":
					return (vars.CurrentMapName == "[Game] init challenge '$fff$sC15'");
				case "Red":
					return (vars.CurrentMapName == "[Game] init challenge '$fff$sD15'");
				case "Black":
				case "All Flags":
					return (vars.CurrentMapName == "[Game] init challenge '$fff$sE05'");
			}
		}
	}
	return false;
}

exit
{
	timer.IsGameTimePaused = true;
	vars.GameRestart = true;
}
