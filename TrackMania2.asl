state("ManiaPlanet")
{
	// 2017-08-31 02:31:12 PM
	// SoI: 0x19C3000
	// https://github.com/NeKzor
}

startup
{
	// Memory stuff
	vars.Watchers = new MemoryWatcherList();
	vars.LoadingState = new MemoryWatcher<bool>(IntPtr.Zero);
	vars.RaceState = new MemoryWatcher<int>(IntPtr.Zero);
	vars.LoadMap = new StringWatcher(IntPtr.Zero, ReadStringType.ASCII, 33);
	vars.GameInfo = new StringWatcher(IntPtr.Zero, ReadStringType.ASCII, 33);
	
	vars.TryInit = (Func<Process, ProcessModuleWow64Safe, bool>)((gameProc, module) =>
	{
		// \x83\x3D\x00\x00\x00\x00\x00\x8B\x0D\x00\x00\x00\x00\x75\x08\x85\xC9 xx????xxx????xxxx
		var LoadingTarget = new SigScanTarget(9, "83 3D ?? ?? ?? ?? 00 8B 0D ?? ?? ?? ?? 75 08 85 C9");

		// \x54\x9B\x7E\x01\x6C\x9B\x7E\x01\x38\x9B\x7E\x01 xxxxxxxxxxxx
		var RaceStateTarget = new SigScanTarget(0, "54 9B 7E 01 6C 9B 7E 01 38 9B 7E 01");
		
		// \xA1\x00\x00\x00\x00\x89\x42\x04\xE8\x00\x00\x00\x00\x33\xC0 x????xxxx????xx
		var GameInfoTarget = new SigScanTarget(1, "A1 ?? ?? ?? ?? 89 42 04 E8 ?? ?? ?? ?? 33 C0 ");			
		
		LoadingTarget.OnFound = (proc, _, ptr) =>
		{
			print("[ASL] LoadingTarget = 0x" + ptr.ToString("X"));
			return proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
		};
		RaceStateTarget.OnFound = (proc, _, ptr) =>
		{
			print("[ASL] RaceStateTarget = 0x" + ptr.ToString("X"));
			return proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
		};
		GameInfoTarget.OnFound = (proc, _, ptr) =>
		{
			print("[ASL] GameInfoTarget = 0x" + ptr.ToString("X"));
			return proc.ReadPointer(ptr, out ptr) ? proc.ReadPointer(ptr - 4, out ptr) ? ptr : IntPtr.Zero : IntPtr.Zero;
		};

		var Scanner = new SignatureScanner(gameProc, module.BaseAddress, module.ModuleMemorySize);
		var LoadingAddr = Scanner.Scan(LoadingTarget);
		var RaceStateAddr = Scanner.Scan(RaceStateTarget);
		var GameInfoAddr = Scanner.Scan(GameInfoTarget);
		
		print("[ASL] LoadingAddr = 0x" + LoadingAddr.ToString("X"));
		print("[ASL] RaceStateAddr = 0x" + RaceStateAddr.ToString("X"));
		print("[ASL] GameInfoAddr = 0x" + GameInfoAddr.ToString("X"));
		
		if ((LoadingAddr != IntPtr.Zero) && (RaceStateAddr != IntPtr.Zero) && (GameInfoAddr != IntPtr.Zero))
		{
			print("[ASL] Scan Completed!");
			vars.LoadingState = new MemoryWatcher<bool>(LoadingAddr);
			vars.RaceState = new MemoryWatcher<int>(new DeepPointer("ManiaPlanet.exe", (int)RaceStateAddr, 0xC, 0x2D8, 0x104, 0xDC, 0x108));
			vars.LoadMap = new StringWatcher(new DeepPointer("ManiaPlanet.exe", 0x017B1858, 0x0), 64);
			vars.GameInfo = new StringWatcher(GameInfoAddr, ReadStringType.ASCII, 33);
			
			vars.Watchers.Clear();
			vars.Watchers.AddRange(new MemoryWatcher[]
			{
				vars.LoadingState,
				vars.RaceState,
				vars.LoadMap,
				vars.GameInfo
			});
			vars.Watchers.UpdateAll(gameProc);
			print("[ASL] GameInfo = " + vars.GameInfo.Current);
			return true;
		}
		print("[ASL] Scan Failed!");
		return false;
	});

	// Used for splitting
	vars.GetCategory = (Func<string>)(() =>
	{
		switch (timer.Run.CategoryName)
		{
			case "All Flags":
			case "White":
			case "Green":
			case "Blue":
			case "Red":
			case "Black":
				return timer.Run.CategoryName;
			default:
				return "All Flags";
		}
	});
	vars.GetFirstMap = (Func<string>)(() =>
	{
		switch (vars.GetCategory() as string)
		{
			case "All Flags":
			case "White":
				return "LoadMap '$fff$sA01'";
			case "Green":
				return "LoadMap '$fff$sB01'";
			case "Blue":
				return "LoadMap '$fff$sC01'";
			case "Red":
				return "LoadMap '$fff$sD01'";
			case "Black":
				return "LoadMap '$fff$sE01'";
			// This should never happen but w/e
			default:
				return "LoadMap '$fff$sA01'";
		}
	});

	// Settings
	settings.Add("SplitOnMapChange", false, "Auto split on map change.");
	settings.Add("SplitOnMapFinish", true, "Auto split when finishing a map.");
	settings.Add("SmartSplit", false, "Auto split detection for unofficial maps.");
	
	for (int i = 0; i < 5; i++)
	{
		var cat = (i == 0) ? "White Flag" : (i == 1) ? "Green Flag" : (i == 2) ? "Blue Flag" : (i == 3) ? "Red Flag" : "Black Flag";
		settings.Add(cat, true, cat, "SplitOnMapFinish");
		for (int j = 1; j <= 15; j++)
		{
			if ((j > 5) && (i == 4))
				goto done;
			var map = string.Format("LoadMap '$fff$s{0}{1}'", (char)(i + 65), j.ToString("D2"));
			settings.Add(map, true, map.Substring(15, 3), cat);
		}
	}
done:

	// Others
	vars.GameRestart = false;
	vars.StartedMap = string.Empty;
}

init
{
	vars.Init = false;
	vars.Module = modules.First();
}

update
{
	vars.Watchers.UpdateAll(game);
	if (vars.Init)
	{
		// Rescan when titlepack is loading
		if (vars.GameInfo.Current.StartsWith("[Maniaplanet]"))
		{
			print("[ASL] TP Scan!");
			vars.Init = vars.TryInit(game, vars.Module);
		}
		
		// Unpause timer when titlepack has loaded
		if (vars.GameRestart)
		{
			vars.GameRestart = (vars.GameInfo.Current.StartsWith("[Game] main menu")) && (vars.GameInfo.Old.StartsWith("[Game] Loading title"));
			if (!vars.GameRestart)
			{
				timer.IsGameTimePaused = false;
				print("[ASL] Unpaused GameTime!");
			}
		}
		
		// Some debug info :^)
		if (vars.GameInfo.Current != vars.GameInfo.Old)
			print("[ASL] GameInfo Changed! (" + vars.GameInfo.Current + ")");
		if (vars.LoadingState.Current != vars.LoadingState.Old)
			print("[ASL] LoadingState Changed! (" + vars.LoadingState.Current + ")");
		if (vars.LoadMap.Current != vars.LoadMap.Old)
			print("[ASL] LoadMap Changed! (" + vars.LoadMap.Current + ")");
	}
	else if (vars.GameRestart)
	{
		// Scan until titlepack has loaded
		if (!vars.GameInfo.Current.StartsWith("[Maniaplanet]"))
		{
			print("[ASL] GameRestart Scan!");
			vars.TryInit(game, vars.Module);
		}
		else
		{
			vars.Init = true;
			vars.GameRestart = false;
		}
	}
	else
	{
		print("[ASL] Default Scan!");
		vars.Init = vars.TryInit(game, vars.Module);
	}
}

isLoading
{
	return (vars.LoadingState.Current) || (!vars.Init);
}

start
{
	if ((vars.LoadingState.Old) && (!vars.LoadingState.Current))
	{
		if ((vars.LoadMap.Current == vars.GetFirstMap()) || (settings["SmartSplit"]))
		{
			// Used for SmartSplit auto reset
			vars.StartedMap = vars.LoadMap.Current;
			return true;
		}
	}
	return false;
}

reset
{
	// Stops working after some time :/
	if ((vars.GameInfo.Old != vars.GameInfo.Current) && (vars.GameInfo.Current.StartsWith("[Game] init challenge")))
	{
		var loadmap = vars.GameInfo.Current.Replace("[Game] init challenge", "LoadMap");
		if (loadmap == vars.GetFirstMap())
			return true;
			
		// Auto reset for unofficial maps, started map should be saved since auto start
		if ((settings["SmartSplit"]) && (loadmap == vars.StartedMap))
		{
			vars.StartedMap = string.Empty;
			return true;
		}
	}
	return false;
}

split
{
	// Map change
	if ((settings["SplitOnMapChange"]) && (vars.LoadMap.Old != vars.LoadMap.Current))
		return true;
		
	// Finish line
	if ((vars.RaceState.Old == 1) && (vars.RaceState.Current == 2) && (!vars.LoadingState.Current))
	{
		print("[ASL] Detected Finish!");
		// End of nadeo map
		if (settings[vars.LoadMap.Current])
			return true;
		else if (settings["SmartSplit"])
			return true;

		// End of category
		switch (vars.GetCategory() as string)
		{
			case "White":
				return vars.LoadMap.Current == "LoadMap '$fff$sA15'";
			case "Green":
				return vars.LoadMap.Current == "LoadMap '$fff$sB15'";
			case "Blue":
				return vars.LoadMap.Current == "LoadMap '$fff$sC15'";
			case "Red":
				return vars.LoadMap.Current == "LoadMap '$fff$sD15'";
			case "Black":
			case "All Flags":
				return vars.LoadMap.Current == "LoadMap '$fff$sE05'";
		}
	}
	return false;
}

exit
{
	timer.IsGameTimePaused = true;
	vars.GameRestart = true;
	print("[ASL] Paused GameTime!");
}