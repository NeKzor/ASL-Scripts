state("TrackmaniaTurbo")	// 11/07/2016 03:15:45 PM (SoI: 0x19BA000)
{
}

startup
{
	settings.Add("SplitOnMapChange", true, "Auto split on map change:");
	settings.Add("SplitOnMapExit", true, "When leaving a map.", "SplitOnMapChange");
	settings.Add("SplitOnMapLoad", false, "When entering a map.", "SplitOnMapChange");
	settings.Add("Categories", true, "Auto start, reset and end for category:");
	settings.Add("AllEnvironments", true, "All Environments", "Categories");
	settings.Add("AllFlagsAllEnvironments", true, "All Flags", "AllEnvironments");
	settings.Add("WhiteFlagAllEnvironments", false, "White Flags", "AllEnvironments");
	settings.Add("GreenFlagAllEnvironments", false, "Green Flags", "AllEnvironments");
	settings.Add("BlueFlagAllEnvironments", false, "Blue Flags", "AllEnvironments");
	settings.Add("RedFlagAllEnvironments", false, "Red Flags", "AllEnvironments");
	settings.Add("BlackFlagAllEnvironments", false, "Black Flags", "AllEnvironments");
	settings.Add("RollercoasterLagoon", false, "Rollercoaster Lagoon", "Categories");
	settings.Add("AllFlagsRollercoasterLagoon", false, "All Flags", "RollercoasterLagoon");
	settings.Add("WhiteFlagRollercoasterLagoon", false, "White Flag", "RollercoasterLagoon");
	settings.Add("GreenFlagRollercoasterLagoon", false, "Green Flag", "RollercoasterLagoon");
	settings.Add("BlueFlagRollercoasterLagoon", false, "Blue Flag", "RollercoasterLagoon");
	settings.Add("RedFlagRollercoasterLagoon", false, "Red Flag", "RollercoasterLagoon");
	settings.Add("BlackFlagRollercoasterLagoon", false, "Black Flag", "RollercoasterLagoon");
	settings.Add("InternationalStadium", false, "International Stadium", "Categories");
	settings.Add("AllFlagsInternationalStadium", false, "All Flags", "InternationalStadium");
	settings.Add("WhiteFlagInternationalStadium", false, "White Flag", "InternationalStadium");
	settings.Add("GreenFlagInternationalStadium", false, "Green Flag", "InternationalStadium");
	settings.Add("BlueFlagInternationalStadium", false, "Blue Flag", "InternationalStadium");
	settings.Add("RedFlagInternationalStadium", false, "Red Flag", "InternationalStadium");
	settings.Add("BlackFlagInternationalStadium", false, "Black Flag", "InternationalStadium");
	settings.Add("CanyonGrandDrift", false, "Canyon Grand Drift", "Categories");
	settings.Add("AllFlagsCanyonGrandDrift", false, "All Flags", "CanyonGrandDrift");
	settings.Add("WhiteFlagCanyonGrandDrift", false, "White Flag", "CanyonGrandDrift");
	settings.Add("GreenFlagCanyonGrandDrift", false, "Green Flag", "CanyonGrandDrift");
	settings.Add("BlueFlagCanyonGrandDrift", false, "Blue Flag", "CanyonGrandDrift");
	settings.Add("RedFlagCanyonGrandDrift", false, "Red Flag", "CanyonGrandDrift");
	settings.Add("BlackFlagCanyonGrandDrift", false, "Black Flag", "CanyonGrandDrift");
	settings.Add("ValleyDownAndDirty", false, "Valley Down & Dirty", "Categories");
	settings.Add("AllFlagsValleyDownAndDirty", false, "All Flags", "ValleyDownAndDirty");
	settings.Add("WhiteFlagValleyDownAndDirty", false, "White Flag", "ValleyDownAndDirty");
	settings.Add("GreenFlagValleyDownAndDirty", false, "Green Flag", "ValleyDownAndDirty");
	settings.Add("BlueFlagValleyDownAndDirty", false, "Blue Flag", "ValleyDownAndDirty");
	settings.Add("RedFlagValleyDownAndDirty", false, "Red Flag", "ValleyDownAndDirty");
	settings.Add("BlackFlagValleyDownAndDirty", false, "Black Flag", "ValleyDownAndDirty");

	vars.Maps = new Dictionary<string, uint>()
	{
		{ "[Game] init challenge '001'", 4 },
		{ "[Game] init challenge '002'", 5 },
		{ "[Game] init challenge '003'", 5 },
		{ "[Game] init challenge '004'", 4 },
		{ "[Game] init challenge '005'", 12 },
		{ "[Game] init challenge '006'", 4 },
		{ "[Game] init challenge '007'", 5 },
		{ "[Game] init challenge '008'", 2 },
		{ "[Game] init challenge '009'", 5 },
		{ "[Game] init challenge '010'", 12 },
		{ "[Game] init challenge '011'", 5 },
		{ "[Game] init challenge '012'", 5 },
		{ "[Game] init challenge '013'", 5 },
		{ "[Game] init challenge '014'", 5 },
		{ "[Game] init challenge '015'", 18 },
		{ "[Game] init challenge '016'", 5 },
		{ "[Game] init challenge '017'", 4 },
		{ "[Game] init challenge '018'", 5 },
		{ "[Game] init challenge '019'", 5 },
		{ "[Game] init challenge '020'", 12 },
		{ "[Game] init challenge '021'", 6 },
		{ "[Game] init challenge '022'", 6 },
		{ "[Game] init challenge '023'", 5 },
		{ "[Game] init challenge '024'", 4 },
		{ "[Game] init challenge '025'", 18 },
		{ "[Game] init challenge '026'", 4 },
		{ "[Game] init challenge '027'", 7 },
		{ "[Game] init challenge '028'", 8 },
		{ "[Game] init challenge '029'", 6 },
		{ "[Game] init challenge '030'", 21 },
		{ "[Game] init challenge '031'", 5 },
		{ "[Game] init challenge '032'", 5 },
		{ "[Game] init challenge '033'", 3 },
		{ "[Game] init challenge '034'", 6 },
		{ "[Game] init challenge '035'", 9 },
		{ "[Game] init challenge '036'", 6 },
		{ "[Game] init challenge '037'", 6 },
		{ "[Game] init challenge '038'", 4 },
		{ "[Game] init challenge '039'", 5 },
		{ "[Game] init challenge '040'", 21 },
		{ "[Game] init challenge '041'", 5 },
		{ "[Game] init challenge '042'", 7 },
		{ "[Game] init challenge '043'", 6 },
		{ "[Game] init challenge '044'", 6 },
		{ "[Game] init challenge '045'", 21 },
		{ "[Game] init challenge '046'", 4 },
		{ "[Game] init challenge '047'", 4 },
		{ "[Game] init challenge '048'", 4 },
		{ "[Game] init challenge '049'", 6 },
		{ "[Game] init challenge '050'", 21 },
		{ "[Game] init challenge '051'", 5 },
		{ "[Game] init challenge '052'", 5 },
		{ "[Game] init challenge '053'", 6 },
		{ "[Game] init challenge '054'", 6 },
		{ "[Game] init challenge '055'", 24 },
		{ "[Game] init challenge '056'", 5 },
		{ "[Game] init challenge '057'", 8 },
		{ "[Game] init challenge '058'", 5 },
		{ "[Game] init challenge '059'", 7 },
		{ "[Game] init challenge '060'", 30 },
		{ "[Game] init challenge '061'", 6 },
		{ "[Game] init challenge '062'", 7 },
		{ "[Game] init challenge '063'", 10 },
		{ "[Game] init challenge '064'", 7 },
		{ "[Game] init challenge '065'", 21 },
		{ "[Game] init challenge '066'", 7 },
		{ "[Game] init challenge '067'", 7 },
		{ "[Game] init challenge '068'", 7 },
		{ "[Game] init challenge '069'", 6 },
		{ "[Game] init challenge '070'", 24 },
		{ "[Game] init challenge '071'", 7 },
		{ "[Game] init challenge '072'", 6 },
		{ "[Game] init challenge '073'", 6 },
		{ "[Game] init challenge '074'", 9 },
		{ "[Game] init challenge '075'", 21 },
		{ "[Game] init challenge '076'", 7 },
		{ "[Game] init challenge '077'", 6 },
		{ "[Game] init challenge '078'", 9 },
		{ "[Game] init challenge '079'", 7 },
		{ "[Game] init challenge '080'", 24 },
		{ "[Game] init challenge '081'", 6 },
		{ "[Game] init challenge '082'", 8 },
		{ "[Game] init challenge '083'", 8 },
		{ "[Game] init challenge '084'", 8 },
		{ "[Game] init challenge '085'", 21 },
		{ "[Game] init challenge '086'", 8 },
		{ "[Game] init challenge '087'", 9 },
		{ "[Game] init challenge '088'", 6 },
		{ "[Game] init challenge '089'", 10 },
		{ "[Game] init challenge '090'", 33 },
		{ "[Game] init challenge '091'", 8 },
		{ "[Game] init challenge '092'", 8 },
		{ "[Game] init challenge '093'", 6 },
		{ "[Game] init challenge '094'", 8 },
		{ "[Game] init challenge '095'", 21 },
		{ "[Game] init challenge '096'", 9 },
		{ "[Game] init challenge '097'", 7 },
		{ "[Game] init challenge '098'", 9 },
		{ "[Game] init challenge '099'", 9 },
		{ "[Game] init challenge '100'", 33 },
		{ "[Game] init challenge '101'", 8 },
		{ "[Game] init challenge '102'", 7 },
		{ "[Game] init challenge '103'", 8 },
		{ "[Game] init challenge '104'", 10 },
		{ "[Game] init challenge '105'", 27 },
		{ "[Game] init challenge '106'", 13 },
		{ "[Game] init challenge '107'", 10 },
		{ "[Game] init challenge '108'", 7 },
		{ "[Game] init challenge '109'", 8 },
		{ "[Game] init challenge '110'", 39 },
		{ "[Game] init challenge '111'", 9 },
		{ "[Game] init challenge '112'", 10 },
		{ "[Game] init challenge '113'", 6 },
		{ "[Game] init challenge '114'", 11 },
		{ "[Game] init challenge '115'", 30 },
		{ "[Game] init challenge '116'", 10 },
		{ "[Game] init challenge '117'", 8 },
		{ "[Game] init challenge '118'", 18 },
		{ "[Game] init challenge '119'", 8 },
		{ "[Game] init challenge '120'", 24 },
		{ "[Game] init challenge '121'", 9 },
		{ "[Game] init challenge '122'", 8 },
		{ "[Game] init challenge '123'", 8 },
		{ "[Game] init challenge '124'", 8 },
		{ "[Game] init challenge '125'", 27 },
		{ "[Game] init challenge '126'", 10 },
		{ "[Game] init challenge '127'", 7 },
		{ "[Game] init challenge '128'", 10 },
		{ "[Game] init challenge '129'", 10 },
		{ "[Game] init challenge '130'", 27 },
		{ "[Game] init challenge '131'", 13 },
		{ "[Game] init challenge '132'", 9 },
		{ "[Game] init challenge '133'", 9 },
		{ "[Game] init challenge '134'", 7 },
		{ "[Game] init challenge '135'", 36 },
		{ "[Game] init challenge '136'", 8 },
		{ "[Game] init challenge '137'", 9 },
		{ "[Game] init challenge '138'", 6 },
		{ "[Game] init challenge '139'", 9 },
		{ "[Game] init challenge '140'", 30 },
		{ "[Game] init challenge '141'", 9 },
		{ "[Game] init challenge '142'", 9 },
		{ "[Game] init challenge '143'", 12 },
		{ "[Game] init challenge '144'", 13 },
		{ "[Game] init challenge '145'", 30 },
		{ "[Game] init challenge '146'", 12 },
		{ "[Game] init challenge '147'", 10 },
		{ "[Game] init challenge '148'", 8 },
		{ "[Game] init challenge '149'", 7 },
		{ "[Game] init challenge '150'", 24 },
		{ "[Game] init challenge '151'", 10 },
		{ "[Game] init challenge '152'", 10 },
		{ "[Game] init challenge '153'", 14 },
		{ "[Game] init challenge '154'", 8 },
		{ "[Game] init challenge '155'", 21 },
		{ "[Game] init challenge '156'", 7 },
		{ "[Game] init challenge '157'", 9 },
		{ "[Game] init challenge '158'", 7 },
		{ "[Game] init challenge '159'", 12 },
		{ "[Game] init challenge '160'", 33 },
		{ "[Game] init challenge '161'", 11 },
		{ "[Game] init challenge '162'", 12 },
		{ "[Game] init challenge '163'", 7 },
		{ "[Game] init challenge '164'", 9 },
		{ "[Game] init challenge '165'", 33 },
		{ "[Game] init challenge '166'", 10 },
		{ "[Game] init challenge '167'", 10 },
		{ "[Game] init challenge '168'", 13 },
		{ "[Game] init challenge '169'", 12 },
		{ "[Game] init challenge '170'", 17 },
		{ "[Game] init challenge '171'", 10 },
		{ "[Game] init challenge '172'", 9 },
		{ "[Game] init challenge '173'", 12 },
		{ "[Game] init challenge '174'", 6 },
		{ "[Game] init challenge '175'", 36 },
		{ "[Game] init challenge '176'", 15 },
		{ "[Game] init challenge '177'", 10 },
		{ "[Game] init challenge '178'", 10 },
		{ "[Game] init challenge '179'", 16 },
		{ "[Game] init challenge '180'", 12 },
		{ "[Game] init challenge '181'", 13 },
		{ "[Game] init challenge '182'", 9 },
		{ "[Game] init challenge '183'", 11 },
		{ "[Game] init challenge '184'", 9 },
		{ "[Game] init challenge '185'", 45 },
		{ "[Game] init challenge '186'", 18 },
		{ "[Game] init challenge '187'", 10 },
		{ "[Game] init challenge '188'", 22 },
		{ "[Game] init challenge '189'", 13 },
		{ "[Game] init challenge '190'", 18 },
		{ "[Game] init challenge '191'", 13 },
		{ "[Game] init challenge '192'", 11 },
		{ "[Game] init challenge '193'", 13 },
		{ "[Game] init challenge '194'", 17 },
		{ "[Game] init challenge '195'", 57 },
		{ "[Game] init challenge '196'", 11 },
		{ "[Game] init challenge '197'", 13 },
		{ "[Game] init challenge '198'", 9 },
		{ "[Game] init challenge '199'", 18 },
		{ "[Game] init challenge '200'", 17 }
	};

	settings.Add("SplitOnMapFinish", false, "Auto split when finishing a map.");
	foreach (var map in vars.Maps)
		settings.Add(map.Key, true, map.Key.Substring(23, 3), "SplitOnMapFinish");

	vars.Init = false;
	vars.Watchers = new MemoryWatcherList();
	vars.LoadingState = new MemoryWatcher<bool>(IntPtr.Zero);
	vars.MapName = new StringWatcher(IntPtr.Zero, ReadStringType.ASCII, 27);
	vars.CpCounter = new MemoryWatcher<int>(IntPtr.Zero);
	vars.TryInit = (Func<Process, ProcessModuleWow64Safe, bool>)((gameproc, module) =>
	{
		var LoadingTarget = new SigScanTarget(6, "8B 54 24 04",				// mov edx,[esp+04]
												 "89 15 ?? ?? ?? ??",		// mov [TrackmaniaTurbo.exe+181BB14],edx
												 "85 C0",					// test eax,eax
												 "75 04");					// jne TrackmaniaTurbo.exe+7C92BC

		var MapTarget = new SigScanTarget(6, "E8 ?? ?? ?? ??",				// call TrackmaniaTurbo.exe+30B0
											 "A1 ?? ?? ?? ??",				// mov eax,[TrackmaniaTurbo.exe+17DAED8]
											 "C6 04 38 ??",					// mov byte ptr [eax+edi],00
											 "89 3D ?? ?? ?? ??");			// mov [TrackmaniaTurbo.exe+17DAEDC],edi

		var CpsTarget = new SigScanTarget(12, "89 41 04",					// mov [ecx+04],eax
											  "C7 41 08 ?? ?? ?? ??",		// mov [ecx+08],00000000
											  "8B 0D ?? ?? ?? ??",			// mov ecx,[TrackmaniaTurbo.exe+181B818]
											  "E8 ?? ?? ?? ??",				// call TrackmaniaTurbo.exe+7BF8D0
											  "8B 5C 24 1C");				// mov ebx,[esp+1C]

		LoadingTarget.OnFound = (proc, _, ptr) => proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
		MapTarget.OnFound = (proc, _, ptr) => proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
		CpsTarget.OnFound = (proc, _, ptr) => proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;

		var Scanner = new SignatureScanner(gameproc, module.BaseAddress, module.ModuleMemorySize);
		var LoadingPtr = Scanner.Scan(LoadingTarget);
		var MapPtr = Scanner.Scan(MapTarget);
		var CpsPtr = Scanner.Scan(CpsTarget);

		var LoadingAdr = (IntPtr)LoadingPtr;
		var MapAdr = (IntPtr)gameproc.ReadValue<int>((IntPtr)MapPtr) + 0x0;
		var CpsAdr = (IntPtr)gameproc.ReadValue<int>((IntPtr)gameproc.ReadValue<int>((IntPtr)CpsPtr) + 0x14) + 0x1DC;

		if ((LoadingAdr != IntPtr.Zero) && (MapAdr != IntPtr.Zero) && (CpsAdr != IntPtr.Zero))
		{
			vars.LoadingState = new MemoryWatcher<bool>(LoadingAdr);
			vars.MapName = new StringWatcher(MapAdr, ReadStringType.ASCII, 27);
			vars.CpCounter = new MemoryWatcher<int>(CpsAdr);

			vars.Watchers.Clear();
			vars.Watchers.AddRange(new MemoryWatcher[]
			{
				vars.LoadingState,
				vars.MapName,
				vars.CpCounter
			});
			vars.Watchers.UpdateAll(gameproc);
			return true;
		}
		return false;
	});
}

init
{
	vars.Init = false;
	vars.Module = modules.First();
}

update
{
	if (vars.Init)
		vars.Watchers.UpdateAll(game);
	else if (modules.Length == 136)
		vars.Init = vars.TryInit(game, vars.Module);
}

isLoading
{
	return vars.LoadingState.Current && vars.Init;
}

start
{
	if (vars.LoadingState.Current)
		return false;
	if (settings["AllEnvironments"])
	{
		if ((settings["AllFlagsAllEnvironments"]) || (settings["WhiteFlagAllEnvironments"]))
			return (vars.MapName.Current == "[Game] init challenge '001'");
		if (settings["GreenFlagAllEnvironments"])
			return (vars.MapName.Current == "[Game] init challenge '041'");
		if (settings["BlueFlagAllEnvironments"])
			return (vars.MapName.Current == "[Game] init challenge '081'");
		if (settings["RedFlagAllEnvironments"])
			return (vars.MapName.Current == "[Game] init challenge '121'");
		if (settings["BlackFlagAllEnvironments"])
			return (vars.MapName.Current == "[Game] init challenge '161'");
	}
	if (settings["RollercoasterLagoon"])
	{
		if ((settings["AllFlagsRollercoasterLagoon"]) || (settings["WhiteFlagRollercoasterLagoon"]))
			return (vars.MapName.Current == "[Game] init challenge '021'");
		if (settings["GreenFlagRollercoasterLagoon"])
			return (vars.MapName.Current == "[Game] init challenge '061'");
		if (settings["BlueFlagRollercoasterLagoon"])
			return (vars.MapName.Current == "[Game] init challenge '101'");
		if (settings["RedFlagRollercoasterLagoon"])
			return (vars.MapName.Current == "[Game] init challenge '141'");
		if (settings["BlackFlagRollercoasterLagoon"])
			return (vars.MapName.Current == "[Game] init challenge '181'");
	}
	if (settings["InternationalStadium"])
	{
		if ((settings["AllFlagsInternationalStadium"]) || (settings["WhiteFlagInternationalStadium"]))
			return (vars.MapName.Current == "[Game] init challenge '031'");
		if (settings["GreenFlagInternationalStadium"])
			return (vars.MapName.Current == "[Game] init challenge '071'");
		if (settings["BlueFlagInternationalStadium"])
			return (vars.MapName.Current == "[Game] init challenge '111'");
		if (settings["RedFlagInternationalStadium"])
			return (vars.MapName.Current == "[Game] init challenge '151'");
		if (settings["BlackFlagInternationalStadium"])
			return (vars.MapName.Current == "[Game] init challenge '191'");
	}
	if (settings["CanyonGrandDrift"])
	{
		if ((settings["AllFlagsCanyonGrandDrift"]) || (settings["WhiteFlagCanyonGrandDrift"]))
			return (vars.MapName.Current == "[Game] init challenge '001'");
		if (settings["GreenFlagCanyonGrandDrift"])
			return (vars.MapName.Current == "[Game] init challenge '041'");
		if (settings["BlueFlagCanyonGrandDrift"])
			return (vars.MapName.Current == "[Game] init challenge '081'");
		if (settings["RedFlagCanyonGrandDrift"])
			return (vars.MapName.Current == "[Game] init challenge '121'");
		if (settings["BlackFlagCanyonGrandDrift"])
			return (vars.MapName.Current == "[Game] init challenge '161'");
	}
	if (settings["ValleyDownAndDirty"])
	{
		if ((settings["AllFlagsValleyDownAndDirty"]) || (settings["WhiteFlagValleyDownAndDirty"]))
			return (vars.MapName.Current == "[Game] init challenge '011'");
		if (settings["GreenFlagValleyDownAndDirty"])
			return (vars.MapName.Current == "[Game] init challenge '051'");
		if (settings["BlueFlagValleyDownAndDirty"])
			return (vars.MapName.Current == "[Game] init challenge '091'");
		if (settings["RedFlagValleyDownAndDirty"])
			return (vars.MapName.Current == "[Game] init challenge '131'");
		if (settings["BlackFlagValleyDownAndDirty"])
			return (vars.MapName.Current == "[Game] init challenge '171'");
	}
	return false;
}

reset
{
	if (vars.MapName.Old == vars.MapName.Current)
		return false;
	if (settings["AllEnvironments"])
	{
		if ((settings["AllFlagsAllEnvironments"]) || (settings["WhiteFlagAllEnvironments"]))
			return (vars.MapName.Current == "[Game] init challenge '001'");
		if (settings["GreenFlagAllEnvironments"])
			return (vars.MapName.Current == "[Game] init challenge '041'");
		if (settings["BlueFlagAllEnvironments"])
			return (vars.MapName.Current == "[Game] init challenge '081'");
		if (settings["RedFlagAllEnvironments"])
			return (vars.MapName.Current == "[Game] init challenge '121'");
		if (settings["BlackFlagAllEnvironments"])
			return (vars.MapName.Current == "[Game] init challenge '161'");
	}
	if (settings["RollercoasterLagoon"])
	{
		if ((settings["AllFlagsRollercoasterLagoon"]) || (settings["WhiteFlagRollercoasterLagoon"]))
			return (vars.MapName.Current == "[Game] init challenge '021'");
		if (settings["GreenFlagRollercoasterLagoon"])
			return (vars.MapName.Current == "[Game] init challenge '061'");
		if (settings["BlueFlagRollercoasterLagoon"])
			return (vars.MapName.Current == "[Game] init challenge '101'");
		if (settings["RedFlagRollercoasterLagoon"])
			return (vars.MapName.Current == "[Game] init challenge '141'");
		if (settings["BlackFlagRollercoasterLagoon"])
			return (vars.MapName.Current == "[Game] init challenge '181'");
	}
	if (settings["InternationalStadium"])
	{
		if ((settings["AllFlagsInternationalStadium"]) || (settings["WhiteFlagInternationalStadium"]))
			return (vars.MapName.Current == "[Game] init challenge '031'");
		if (settings["GreenFlagInternationalStadium"])
			return (vars.MapName.Current == "[Game] init challenge '071'");
		if (settings["BlueFlagInternationalStadium"])
			return (vars.MapName.Current == "[Game] init challenge '111'");
		if (settings["RedFlagInternationalStadium"])
			return (vars.MapName.Current == "[Game] init challenge '151'");
		if (settings["BlackFlagInternationalStadium"])
			return (vars.MapName.Current == "[Game] init challenge '191'");
	}
	if (settings["CanyonGrandDrift"])
	{
		if ((settings["AllFlagsCanyonGrandDrift"]) || (settings["WhiteFlagCanyonGrandDrift"]))
			return (vars.MapName.Current == "[Game] init challenge '001'");
		if (settings["GreenFlagCanyonGrandDrift"])
			return (vars.MapName.Current == "[Game] init challenge '041'");
		if (settings["BlueFlagCanyonGrandDrift"])
			return (vars.MapName.Current == "[Game] init challenge '081'");
		if (settings["RedFlagCanyonGrandDrift"])
			return (vars.MapName.Current == "[Game] init challenge '121'");
		if (settings["BlackFlagCanyonGrandDrift"])
			return (vars.MapName.Current == "[Game] init challenge '161'");
	}
	if (settings["ValleyDownAndDirty"])
	{
		if ((settings["AllFlagsValleyDownAndDirty"]) || (settings["WhiteFlagValleyDownAndDirty"]))
			return (vars.MapName.Current == "[Game] init challenge '011'");
		if (settings["GreenFlagValleyDownAndDirty"])
			return (vars.MapName.Current == "[Game] init challenge '051'");
		if (settings["BlueFlagValleyDownAndDirty"])
			return (vars.MapName.Current == "[Game] init challenge '091'");
		if (settings["RedFlagValleyDownAndDirty"])
			return (vars.MapName.Current == "[Game] init challenge '131'");
		if (settings["BlackFlagValleyDownAndDirty"])
			return (vars.MapName.Current == "[Game] init challenge '171'");
	}
	return false;
}

split
{
	// Map change, doesn't split on game crash or game restart
	if ((settings["SplitOnMapExit"]) && (vars.MapName.Current.StartsWith("[Game] main menu")) && (vars.MapName.Old.StartsWith("[Game] init challenge")))
		return true;
	if ((settings["SplitOnMapLoad"]) && (vars.MapName.Old.StartsWith("[Game] exec MenuResult: 6")) && (vars.MapName.Current.StartsWith("[Game] init challenge")))
		return true;
	// Map completion, finish line
	if (vars.CpCounter.Current != vars.CpCounter.Old)
	{
		// Finish any map
		if (settings[vars.MapName.Current])
			if (vars.CpCounter.Current == vars.Maps[vars.MapName.Current])
				return true;
		// Finish the last map of a category
		if (settings["AllEnvironments"])
		{
			if (settings["WhiteFlagAllEnvironments"])
				return (vars.MapName.Current == "[Game] init challenge '040'") && (vars.CpCounter.Current == 21);
			if (settings["GreenFlagAllEnvironments"])
				return (vars.MapName.Current == "[Game] init challenge '080'") && (vars.CpCounter.Current == 24);
			if (settings["BlueFlagAllEnvironments"])
				return (vars.MapName.Current == "[Game] init challenge '120'") && (vars.CpCounter.Current == 24);
			if (settings["RedFlagAllEnvironments"])
				return (vars.MapName.Current == "[Game] init challenge '160'") && (vars.CpCounter.Current == 33);
			if ((settings["BlackFlagAllEnvironments"]) || (settings["AllFlagsAllEnvironments"]))
				return (vars.MapName.Current == "[Game] init challenge '200'") && (vars.CpCounter.Current == 17);
		}
		if (settings["RollercoasterLagoon"])
		{
			if (settings["WhiteFlagRollercoasterLagoon"])
				return (vars.MapName.Current == "[Game] init challenge '030'") && (vars.CpCounter.Current == 21);
			if (settings["GreenFlagRollercoasterLagoon"])
				return (vars.MapName.Current == "[Game] init challenge '070'") && (vars.CpCounter.Current == 24);
			if (settings["BlueFlagRollercoasterLagoon"])
				return (vars.MapName.Current == "[Game] init challenge '110'") && (vars.CpCounter.Current == 39);
			if (settings["RedFlagRollercoasterLagoon"])
				return (vars.MapName.Current == "[Game] init challenge '150'") && (vars.CpCounter.Current == 24);
			if ((settings["BlackFlagRollercoasterLagoon"]) || (settings["AllFlagsRollercoasterLagoon"]))
				return (vars.MapName.Current == "[Game] init challenge '190'") && (vars.CpCounter.Current == 18);
		}
		if (settings["InternationalStadium"])
		{
			if (settings["WhiteFlagInternationalStadium"])
				return (vars.MapName.Current == "[Game] init challenge '040'") && (vars.CpCounter.Current == 21);
			if (settings["GreenFlagInternationalStadium"])
				return (vars.MapName.Current == "[Game] init challenge '080'") && (vars.CpCounter.Current == 24);
			if (settings["BlueFlagInternationalStadium"])
				return (vars.MapName.Current == "[Game] init challenge '120'") && (vars.CpCounter.Current == 24);
			if (settings["RedFlagInternationalStadium"])
				return (vars.MapName.Current == "[Game] init challenge '160'") && (vars.CpCounter.Current == 33);
			if ((settings["BlackFlagInternationalStadium"]) || (settings["AllFlagsInternationalStadium"]))
				return (vars.MapName.Current == "[Game] init challenge '200'") && (vars.CpCounter.Current == 17);
		}
		if (settings["CanyonGrandDrift"])
		{
			if (settings["WhiteFlagCanyonGrandDrift"])
				return (vars.MapName.Current == "[Game] init challenge '010'") && (vars.CpCounter.Current == 12);
			if (settings["GreenFlagCanyonGrandDrift"])
				return (vars.MapName.Current == "[Game] init challenge '050'") && (vars.CpCounter.Current == 21);
			if (settings["BlueFlagCanyonGrandDrift"])
				return (vars.MapName.Current == "[Game] init challenge '090'") && (vars.CpCounter.Current == 33);
			if (settings["RedFlagCanyonGrandDrift"])
				return (vars.MapName.Current == "[Game] init challenge '130'") && (vars.CpCounter.Current == 27);
			if ((settings["BlackFlagCanyonGrandDrift"]) || (settings["AllFlagsCanyonGrandDrift"]))
				return (vars.MapName.Current == "[Game] init challenge '170'") && (vars.CpCounter.Current == 17);
		}
		if (settings["ValleyDownAndDirty"])
		{
			if (settings["WhiteFlagValleyDownAndDirty"])
				return (vars.MapName.Current == "[Game] init challenge '020'") && (vars.CpCounter.Current == 12);
			if (settings["GreenFlagValleyDownAndDirty"])
				return (vars.MapName.Current == "[Game] init challenge '060'") && (vars.CpCounter.Current == 30);
			if (settings["BlueFlagValleyDownAndDirty"])
				return (vars.MapName.Current == "[Game] init challenge '100'") && (vars.CpCounter.Current == 33);
			if (settings["RedFlagValleyDownAndDirty"])
				return (vars.MapName.Current == "[Game] init challenge '140'") && (vars.CpCounter.Current == 30);
			if ((settings["BlackFlagValleyDownAndDirty"]) || (settings["AllFlagsValleyDownAndDirty"]))
				return (vars.MapName.Current == "[Game] init challenge '180'") && (vars.CpCounter.Current == 12);
		}
	}
	return false;
}

exit
{
	timer.IsGameTimePaused = true;
}