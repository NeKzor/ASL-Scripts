state("ManiaPlanet")	// 05/11/2017 03:39:55 PM (SoI: 0x198C000)
{
}

startup
{
	settings.Add("SplitOnMapChange", true, "Auto split on map change:");
	settings.Add("SplitOnMapExit", true, "When leaving a map.", "SplitOnMapChange");
	settings.Add("SplitOnMapLoad", false, "When entering a map.", "SplitOnMapChange");
	settings.Add("Categories", true, "Auto start, reset and end for category:");
	settings.Add("AllFlags", true, "All Flags", "Categories");
	settings.Add("WhiteFlag", false, "White Flag", "Categories");
	settings.Add("GreenFlag", false, "Green Flag", "Categories");
	settings.Add("BlueFlag", false, "Blue Flag", "Categories");
	settings.Add("RedFlag", false, "Red Flag.", "Categories");
	settings.Add("BlackFlag", false, "Black Flag", "Categories");
	settings.SetToolTip("AllFlags", "Timing starts after loading A01 and ends when finishing all laps on E05.");
	settings.SetToolTip("WhiteFlag", "Timing starts after loading A01 and ends when finishing all laps on A15.");
	settings.SetToolTip("GreenFlag", "Timing starts after loading B01 and ends when finishing all laps on B15.");
	settings.SetToolTip("BlueFlag", "Timing starts after loading C01 and ends when finishing all laps on C15.");
	settings.SetToolTip("RedFlag", "Timing starts after loading D01 and ends when finishing all laps on D15.");
	settings.SetToolTip("BlackFlag", "Timing starts after loading E01 and ends when finishing all laps on E05.");
	
	vars.Maps = new Dictionary<string, uint>()
	{
		{ "[Game] init challenge '$fff$sA01'", 6 },
		{ "[Game] init challenge '$fff$sA02'", 5 },
		{ "[Game] init challenge '$fff$sA03'", 3 },
		{ "[Game] init challenge '$fff$sA04'", 6 },
		{ "[Game] init challenge '$fff$sA05'", 12 },
		{ "[Game] init challenge '$fff$sA06'", 5 },
		{ "[Game] init challenge '$fff$sA07'", 5 },
		{ "[Game] init challenge '$fff$sA08'", 1 },
		{ "[Game] init challenge '$fff$sA09'", 6 },
		{ "[Game] init challenge '$fff$sA10'", 18 },
		{ "[Game] init challenge '$fff$sA11'", 5 },
		{ "[Game] init challenge '$fff$sA12'", 6 },
		{ "[Game] init challenge '$fff$sA13'", 2 },
		{ "[Game] init challenge '$fff$sA14'", 4 },
		{ "[Game] init challenge '$fff$sA15'", 21 },
		{ "[Game] init challenge '$fff$sB01'", 7 },
		{ "[Game] init challenge '$fff$sB02'", 5 },
		{ "[Game] init challenge '$fff$sB03'", 3 },
		{ "[Game] init challenge '$fff$sB04'", 6 },
		{ "[Game] init challenge '$fff$sB05'", 21 },
		{ "[Game] init challenge '$fff$sB06'", 9 },
		{ "[Game] init challenge '$fff$sB07'", 6 },
		{ "[Game] init challenge '$fff$sB08'", 5 },
		{ "[Game] init challenge '$fff$sB09'", 6 },
		{ "[Game] init challenge '$fff$sB10'", 18 },
		{ "[Game] init challenge '$fff$sB11'", 6 },
		{ "[Game] init challenge '$fff$sB12'", 8 },
		{ "[Game] init challenge '$fff$sB13'", 4 },
		{ "[Game] init challenge '$fff$sB14'", 7 },
		{ "[Game] init challenge '$fff$sB15'", 15 },
		{ "[Game] init challenge '$fff$sC01'", 10 },
		{ "[Game] init challenge '$fff$sC02'", 13 },
		{ "[Game] init challenge '$fff$sC03'", 3 },
		{ "[Game] init challenge '$fff$sC04'", 8 },
		{ "[Game] init challenge '$fff$sC05'", 21 },
		{ "[Game] init challenge '$fff$sC06'", 7 },
		{ "[Game] init challenge '$fff$sC07'", 6 },
		{ "[Game] init challenge '$fff$sC08'", 4 },
		{ "[Game] init challenge '$fff$sC09'", 9 },
		{ "[Game] init challenge '$fff$sC10'", 24 },
		{ "[Game] init challenge '$fff$sC11'", 8 },
		{ "[Game] init challenge '$fff$sC12'", 9 },
		{ "[Game] init challenge '$fff$sC13'", 12 },
		{ "[Game] init challenge '$fff$sC14'", 7 },
		{ "[Game] init challenge '$fff$sC15'", 24 },
		{ "[Game] init challenge '$fff$sD01'", 7 },
		{ "[Game] init challenge '$fff$sD02'", 6 },
		{ "[Game] init challenge '$fff$sD03'", 6 },
		{ "[Game] init challenge '$fff$sD04'", 7 },
		{ "[Game] init challenge '$fff$sD05'", 18 },
		{ "[Game] init challenge '$fff$sD06'", 10 },
		{ "[Game] init challenge '$fff$sD07'", 11 },
		{ "[Game] init challenge '$fff$sD08'", 3 },
		{ "[Game] init challenge '$fff$sD09'", 8 },
		{ "[Game] init challenge '$fff$sD10'", 30 },
		{ "[Game] init challenge '$fff$sD11'", 12 },
		{ "[Game] init challenge '$fff$sD12'", 12 },
		{ "[Game] init challenge '$fff$sD13'", 4 },
		{ "[Game] init challenge '$fff$sD14'", 13 },
		{ "[Game] init challenge '$fff$sD15'", 90 },
		{ "[Game] init challenge '$fff$sE01'", 11 },
		{ "[Game] init challenge '$fff$sE02'", 16 },
		{ "[Game] init challenge '$fff$sE03'", 25 },
		{ "[Game] init challenge '$fff$sE04'", 25 },
		{ "[Game] init challenge '$fff$sE05'", 150 }
	};

	settings.Add("SplitOnMapFinish", false, "Auto split when finishing a map.");
	foreach (var map in vars.Maps)
		settings.Add(map.Key, true, map.Key.Substring(29, 3), "SplitOnMapFinish");
}

init
{
	timer.IsGameTimePaused = false;

	var LoadingTarget = new SigScanTarget(9, "83 3D ?? ?? ?? ?? 00",	// cmp dword ptr [ManiaPlanet.exe+17B4220],00
											 "8B 0D ?? ?? ?? ??",		// mov ecx,[ManiaPlanet.exe+17B4224]
											 "75 08",					// jne ManiaPlanet.exe+7E7B77
											 "85 C9");					// test ecx,ecx

	var MapTarget = new SigScanTarget(5, "FF 75 38",					// push [ebp+38]
										 "FF 35 ?? ?? ?? ??",			// push [ManiaPlanet.exe+1771598]
										 "E8 ?? ?? ?? ??",				// call ManiaPlanet.exe+BFD4D0
										 "83 C4 0C",					// add esp,0C
										 "8D 4D 38");					// lea ecx,[ebp+38]

	var CpsTarget = new SigScanTarget(12, "89 41 04",					// mov [ecx+04],eax
										  "C7 41 08 ?? ?? ?? ??",		// mov [ecx+08],00000000
										  "8B 0D ?? ?? ?? ??",			// mov ecx,[ManiaPlanet.exe+17B3E40]
										  "E8 ?? ?? ?? ??",				// call ManiaPlanet.exe+7D5F40
										  "85 DB");						// test ebx,ebx

	LoadingTarget.OnFound = (proc, _, ptr) => proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
	MapTarget.OnFound = (proc, _, ptr) => proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
	CpsTarget.OnFound = (proc, _, ptr) => proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;

	var Module = modules.First();
	var Scanner = new SignatureScanner(game, Module.BaseAddress, Module.ModuleMemorySize);

	var LoadingPtr = Scanner.Scan(LoadingTarget);
	var MapPtr = Scanner.Scan(MapTarget);
	var CpsPtr = Scanner.Scan(CpsTarget);

	var LoadingAdr = (IntPtr)LoadingPtr;
	var MapAdr = (IntPtr)game.ReadValue<int>((IntPtr)MapPtr) + 0x0;
	var CpsAdr = (IntPtr)game.ReadValue<int>((IntPtr)game.ReadValue<int>((IntPtr)CpsPtr) + 0x14) + 0xAC;

	vars.LoadingState = new MemoryWatcher<bool>(LoadingAdr);
	vars.MapName = new StringWatcher(MapAdr, ReadStringType.ASCII, 33);
	vars.CpCounter = new MemoryWatcher<int>(CpsAdr);

	vars.Watchers = new MemoryWatcherList();
	vars.Watchers.AddRange(new MemoryWatcher[]
	{
		vars.LoadingState,
		vars.MapName,
		vars.CpCounter
	});
}

update
{
	vars.Watchers.UpdateAll(game);
}

isLoading
{
	return vars.LoadingState.Current;
}

start
{
	if (vars.LoadingState.Current)
		return false;
	if ((settings["AllFlags"]) || (settings["WhiteFlag"]))
		return (vars.MapName.Current = "[Game] init challenge '$fff$sA01'");
	if (settings["GreenFlag"])
		return (vars.MapName.Current == "[Game] init challenge '$fff$sB01'");
	if (settings["BlueFlag"])
		return (vars.MapName.Current == "[Game] init challenge '$fff$sC01'");
	if (settings["RedFlag"])
		return (vars.MapName.Current == "[Game] init challenge '$fff$sD01'");
	if (settings["BlackFlag"])
		return (vars.MapName.Current == "[Game] init challenge '$fff$sE01'");
	return false;
}

reset
{
	if (vars.MapName.Old != vars.MapName.Current)
		return false;
	if ((settings["AllFlags"]) || (settings["WhiteFlag"]))
		return (vars.MapName.Current == "[Game] init challenge '$fff$sA01'");
	if (settings["GreenFlag"])
		return (vars.MapName.Current == "[Game] init challenge '$fff$sB01'");
	if (settings["BlueFlag"])
		return (vars.MapName.Current == "[Game] init challenge '$fff$sC01'");
	if (settings["RedFlag"])
		return (vars.MapName.Current == "[Game] init challenge '$fff$sD01'");
	if (settings["BlackFlag"])
		return (vars.MapName.Current == "[Game] init challenge '$fff$sE01'");
	return false;
}

split
{
	// Map change, doesn't split on game crash or game restart
	if ((settings["SplitOnMapExit"]) && (vars.MapName.Current.StartsWith("[Game] main menu")) && (vars.MapName.Old.StartsWith("[Game] init challenge")))
		return true;
	if ((settings["SplitOnMapLoad"]) && (vars.MapName.Old.StartsWith("[Game] main menu")) && (vars.MapName.Current.StartsWith("[Game] init challenge")))
		return true;
	// Map completion, finish line
	if (vars.CpCounter.Current != vars.CpCounter.Old)
	{
		// Finish any map
		if (settings[vars.MapName.Current])
			if (vars.CpCounter.Current == vars.Maps[vars.MapName.Current])
				return true;
		// Finish the last map of a category
		if (settings["WhiteFlag"])
			return (vars.MapName.Current = "[Game] init challenge '$fff$sA15'") && (vars.CpCounter.Current == 21);
		if (settings["GreenFlag"])
			return (vars.MapName.Current == "[Game] init challenge '$fff$sB15'") && (vars.CpCounter.Current == 15);
		if (settings["BlueFlag"])
			return (vars.MapName.Current == "[Game] init challenge '$fff$sC15'") && (vars.CpCounter.Current == 24);
		if (settings["RedFlag"])
			return (vars.MapName.Current == "[Game] init challenge '$fff$sD15'") && (vars.CpCounter.Current == 90);
		if ((settings["BlackFlag"]) || (settings["AllFlags"]))
			return (vars.MapName.Current == "[Game] init challenge '$fff$sE05'") && (vars.CpCounter.Current == 150);
	}
	return false;
}

exit
{
	timer.IsGameTimePaused = true;
}