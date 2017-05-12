state("ManiaPlanet")	// 05/11/2017 03:39:55 PM (SoI: 0x198C000)
{
}

startup
{
	settings.Add("SplitOnMenu", true, "Auto split when leaving a map.");
	settings.Add("SplitOnMap", false, "Auto split before loading screen.");
}

init
{
	timer.IsGameTimePaused = false;
	vars.FirstMap = "[Game] init challenge '$fff$sA01'";
	vars.LastMap = "[Game] init challenge '$fff$sE05'";
	vars.TotalCps = 10 * 15;

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

start
{
	return (vars.MapName.Current == vars.FirstMap) && !(vars.LoadingState.Current);
}

reset
{
	return (vars.MapName.Old != vars.MapName.Current) && (vars.MapName.Current == vars.FirstMap);
}

isLoading
{
	return vars.LoadingState.Current;
}

split
{
	// Split when finishing all laps on the very last map
	if ((vars.MapName.Current == vars.LastMap) && (vars.CpCounter.Old == vars.TotalCps - 1) && (vars.CpCounter.Current == vars.TotalCps))
		return true;
	// Split on map change
	if (vars.MapName.Old != vars.MapName.Current)
	{
		if ((settings["SplitOnMenu"]) && (vars.MapName.Current.StartsWith("[Game] main menu")) && (vars.MapName.Old.StartsWith("[Game] init challenge")))
			return true;
		if ((settings["SplitOnMap"]) && (vars.MapName.Old.StartsWith("[Game] main menu")) && (vars.MapName.Current.StartsWith("[Game] init challenge")))
			return true;
	}
	return false;
}

exit
{
	timer.IsGameTimePaused = true;
}