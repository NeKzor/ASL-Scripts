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
	settings.Add("WhiteFlagAllEnvironments", false, "White Flag", "AllEnvironments");
	settings.Add("GreenFlagAllEnvironments", false, "Green Flag", "AllEnvironments");
	settings.Add("BlueFlagAllEnvironments", false, "Blue Flag", "AllEnvironments");
	settings.Add("RedFlagAllEnvironments", false, "Red Flag.", "AllEnvironments");
	settings.Add("BlackFlagAllEnvironments", false, "Black Flag", "AllEnvironments");
	settings.Add("RollercoasterLagoon", false, "Rollercoaster Lagoon", "Categories");
	settings.Add("AllFlagsRollercoasterLagoon", false, "All Flags", "RollercoasterLagoon");
	settings.Add("WhiteFlagRollercoasterLagoon", false, "White Flag", "RollercoasterLagoon");
	settings.Add("GreenFlagRollercoasterLagoon", false, "Green Flag", "RollercoasterLagoon");
	settings.Add("BlueFlagRollercoasterLagoon", false, "Blue Flag", "RollercoasterLagoon");
	settings.Add("RedFlagRollercoasterLagoon", false, "Red Flag.", "RollercoasterLagoon");
	settings.Add("BlackFlagRollercoasterLagoon", false, "Black Flag", "RollercoasterLagoon");
	settings.Add("InternationalStadium", false, "International Stadium", "Categories");
	settings.Add("AllFlagsInternationalStadium", false, "All Flags", "InternationalStadium");
	settings.Add("WhiteFlagInternationalStadium", false, "White Flag", "InternationalStadium");
	settings.Add("GreenFlagInternationalStadium", false, "Green Flag", "InternationalStadium");
	settings.Add("BlueFlagInternationalStadium", false, "Blue Flag", "InternationalStadium");
	settings.Add("RedFlagInternationalStadium", false, "Red Flag.", "InternationalStadium");
	settings.Add("BlackFlagInternationalStadium", false, "Black Flag", "InternationalStadium");
	settings.Add("CanyonGrandDrift", false, "Canyon Grand Drift", "Categories");
	settings.Add("AllFlagsCanyonGrandDrift", false, "All Flags", "CanyonGrandDrift");
	settings.Add("WhiteFlagCanyonGrandDrift", false, "White Flag", "CanyonGrandDrift");
	settings.Add("GreenFlagCanyonGrandDrift", false, "Green Flag", "CanyonGrandDrift");
	settings.Add("BlueFlagCanyonGrandDrift", false, "Blue Flag", "CanyonGrandDrift");
	settings.Add("RedFlagCanyonGrandDrift", false, "Red Flag.", "CanyonGrandDrift");
	settings.Add("BlackFlagCanyonGrandDrift", false, "Black Flag", "CanyonGrandDrift");
	settings.Add("ValleyDownAndDirty", false, "Valley Down & Dirty", "Categories");
	settings.Add("AllFlagsValleyDownAndDirty", false, "All Flags", "ValleyDownAndDirty");
	settings.Add("WhiteFlagValleyDownAndDirty", false, "White Flag", "ValleyDownAndDirty");
	settings.Add("GreenFlagValleyDownAndDirty", false, "Green Flag", "ValleyDownAndDirty");
	settings.Add("BlueFlagValleyDownAndDirty", false, "Blue Flag", "ValleyDownAndDirty");
	settings.Add("RedFlagValleyDownAndDirty", false, "Red Flag.", "ValleyDownAndDirty");
	settings.Add("BlackFlagValleyDownAndDirty", false, "Black Flag", "ValleyDownAndDirty");

	vars.Maps = new Dictionary<string, uint>()
	{
		{ "[Game] init challenge '001'", 999 },
		{ "[Game] init challenge '002'", 999 },
		{ "[Game] init challenge '003'", 999 },
		{ "[Game] init challenge '004'", 999 },
		{ "[Game] init challenge '005'", 999 },
		{ "[Game] init challenge '006'", 999 },
		{ "[Game] init challenge '007'", 999 },
		{ "[Game] init challenge '008'", 999 },
		{ "[Game] init challenge '009'", 999 },
		{ "[Game] init challenge '010'", 999 },
		{ "[Game] init challenge '011'", 999 },
		{ "[Game] init challenge '012'", 999 },
		{ "[Game] init challenge '013'", 999 },
		{ "[Game] init challenge '014'", 999 },
		{ "[Game] init challenge '015'", 999 },
		{ "[Game] init challenge '016'", 999 },
		{ "[Game] init challenge '017'", 999 },
		{ "[Game] init challenge '018'", 999 },
		{ "[Game] init challenge '019'", 999 },
		{ "[Game] init challenge '020'", 999 },
		{ "[Game] init challenge '021'", 999 },
		{ "[Game] init challenge '022'", 999 },
		{ "[Game] init challenge '023'", 999 },
		{ "[Game] init challenge '024'", 999 },
		{ "[Game] init challenge '025'", 999 },
		{ "[Game] init challenge '026'", 999 },
		{ "[Game] init challenge '027'", 999 },
		{ "[Game] init challenge '028'", 999 },
		{ "[Game] init challenge '029'", 999 },
		{ "[Game] init challenge '030'", 999 },
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
		{ "[Game] init challenge '041'", 999 },
		{ "[Game] init challenge '042'", 999 },
		{ "[Game] init challenge '043'", 999 },
		{ "[Game] init challenge '044'", 999 },
		{ "[Game] init challenge '045'", 999 },
		{ "[Game] init challenge '046'", 999 },
		{ "[Game] init challenge '047'", 999 },
		{ "[Game] init challenge '048'", 999 },
		{ "[Game] init challenge '049'", 999 },
		{ "[Game] init challenge '050'", 999 },
		{ "[Game] init challenge '051'", 999 },
		{ "[Game] init challenge '052'", 999 },
		{ "[Game] init challenge '053'", 999 },
		{ "[Game] init challenge '054'", 999 },
		{ "[Game] init challenge '055'", 999 },
		{ "[Game] init challenge '056'", 999 },
		{ "[Game] init challenge '057'", 999 },
		{ "[Game] init challenge '058'", 999 },
		{ "[Game] init challenge '059'", 999 },
		{ "[Game] init challenge '060'", 999 },
		{ "[Game] init challenge '061'", 999 },
		{ "[Game] init challenge '062'", 999 },
		{ "[Game] init challenge '063'", 999 },
		{ "[Game] init challenge '064'", 999 },
		{ "[Game] init challenge '065'", 999 },
		{ "[Game] init challenge '066'", 999 },
		{ "[Game] init challenge '067'", 999 },
		{ "[Game] init challenge '068'", 999 },
		{ "[Game] init challenge '069'", 999 },
		{ "[Game] init challenge '070'", 999 },
		{ "[Game] init challenge '071'", 999 },
		{ "[Game] init challenge '072'", 999 },
		{ "[Game] init challenge '073'", 999 },
		{ "[Game] init challenge '074'", 999 },
		{ "[Game] init challenge '075'", 999 },
		{ "[Game] init challenge '076'", 999 },
		{ "[Game] init challenge '077'", 999 },
		{ "[Game] init challenge '078'", 999 },
		{ "[Game] init challenge '079'", 999 },
		{ "[Game] init challenge '080'", 999 },
		{ "[Game] init challenge '081'", 999 },
		{ "[Game] init challenge '082'", 999 },
		{ "[Game] init challenge '083'", 999 },
		{ "[Game] init challenge '084'", 999 },
		{ "[Game] init challenge '085'", 999 },
		{ "[Game] init challenge '086'", 999 },
		{ "[Game] init challenge '087'", 999 },
		{ "[Game] init challenge '088'", 999 },
		{ "[Game] init challenge '089'", 999 },
		{ "[Game] init challenge '090'", 999 },
		{ "[Game] init challenge '091'", 999 },
		{ "[Game] init challenge '092'", 999 },
		{ "[Game] init challenge '093'", 999 },
		{ "[Game] init challenge '094'", 999 },
		{ "[Game] init challenge '095'", 999 },
		{ "[Game] init challenge '096'", 999 },
		{ "[Game] init challenge '097'", 999 },
		{ "[Game] init challenge '098'", 999 },
		{ "[Game] init challenge '099'", 999 },
		{ "[Game] init challenge '100'", 999 },
		{ "[Game] init challenge '101'", 999 },
		{ "[Game] init challenge '102'", 999 },
		{ "[Game] init challenge '103'", 999 },
		{ "[Game] init challenge '104'", 999 },
		{ "[Game] init challenge '105'", 999 },
		{ "[Game] init challenge '106'", 999 },
		{ "[Game] init challenge '107'", 999 },
		{ "[Game] init challenge '108'", 999 },
		{ "[Game] init challenge '109'", 999 },
		{ "[Game] init challenge '110'", 999 },
		{ "[Game] init challenge '111'", 999 },
		{ "[Game] init challenge '112'", 999 },
		{ "[Game] init challenge '113'", 999 },
		{ "[Game] init challenge '114'", 999 },
		{ "[Game] init challenge '115'", 999 },
		{ "[Game] init challenge '116'", 999 },
		{ "[Game] init challenge '117'", 999 },
		{ "[Game] init challenge '118'", 999 },
		{ "[Game] init challenge '119'", 999 },
		{ "[Game] init challenge '120'", 999 },
		{ "[Game] init challenge '121'", 999 },
		{ "[Game] init challenge '122'", 999 },
		{ "[Game] init challenge '123'", 999 },
		{ "[Game] init challenge '124'", 999 },
		{ "[Game] init challenge '125'", 999 },
		{ "[Game] init challenge '126'", 999 },
		{ "[Game] init challenge '127'", 999 },
		{ "[Game] init challenge '128'", 999 },
		{ "[Game] init challenge '129'", 999 },
		{ "[Game] init challenge '130'", 999 },
		{ "[Game] init challenge '131'", 999 },
		{ "[Game] init challenge '132'", 999 },
		{ "[Game] init challenge '133'", 999 },
		{ "[Game] init challenge '134'", 999 },
		{ "[Game] init challenge '135'", 999 },
		{ "[Game] init challenge '136'", 999 },
		{ "[Game] init challenge '137'", 999 },
		{ "[Game] init challenge '138'", 999 },
		{ "[Game] init challenge '139'", 999 },
		{ "[Game] init challenge '140'", 999 },
		{ "[Game] init challenge '141'", 999 },
		{ "[Game] init challenge '142'", 999 },
		{ "[Game] init challenge '143'", 999 },
		{ "[Game] init challenge '144'", 999 },
		{ "[Game] init challenge '145'", 999 },
		{ "[Game] init challenge '146'", 999 },
		{ "[Game] init challenge '147'", 999 },
		{ "[Game] init challenge '148'", 999 },
		{ "[Game] init challenge '149'", 999 },
		{ "[Game] init challenge '150'", 999 },
		{ "[Game] init challenge '151'", 999 },
		{ "[Game] init challenge '152'", 999 },
		{ "[Game] init challenge '153'", 999 },
		{ "[Game] init challenge '154'", 999 },
		{ "[Game] init challenge '155'", 999 },
		{ "[Game] init challenge '156'", 999 },
		{ "[Game] init challenge '157'", 999 },
		{ "[Game] init challenge '158'", 999 },
		{ "[Game] init challenge '159'", 999 },
		{ "[Game] init challenge '160'", 999 },
		{ "[Game] init challenge '161'", 999 },
		{ "[Game] init challenge '162'", 999 },
		{ "[Game] init challenge '163'", 999 },
		{ "[Game] init challenge '164'", 999 },
		{ "[Game] init challenge '165'", 999 },
		{ "[Game] init challenge '166'", 999 },
		{ "[Game] init challenge '167'", 999 },
		{ "[Game] init challenge '168'", 999 },
		{ "[Game] init challenge '169'", 999 },
		{ "[Game] init challenge '170'", 999 },
		{ "[Game] init challenge '171'", 999 },
		{ "[Game] init challenge '172'", 999 },
		{ "[Game] init challenge '173'", 999 },
		{ "[Game] init challenge '174'", 999 },
		{ "[Game] init challenge '175'", 999 },
		{ "[Game] init challenge '176'", 999 },
		{ "[Game] init challenge '177'", 999 },
		{ "[Game] init challenge '178'", 999 },
		{ "[Game] init challenge '179'", 999 },
		{ "[Game] init challenge '180'", 12 },
		{ "[Game] init challenge '181'", 999 },
		{ "[Game] init challenge '182'", 999 },
		{ "[Game] init challenge '183'", 999 },
		{ "[Game] init challenge '184'", 999 },
		{ "[Game] init challenge '185'", 999 },
		{ "[Game] init challenge '186'", 999 },
		{ "[Game] init challenge '187'", 999 },
		{ "[Game] init challenge '188'", 999 },
		{ "[Game] init challenge '189'", 999 },
		{ "[Game] init challenge '190'", 999 },
		{ "[Game] init challenge '191'", 999 },
		{ "[Game] init challenge '192'", 999 },
		{ "[Game] init challenge '193'", 999 },
		{ "[Game] init challenge '194'", 999 },
		{ "[Game] init challenge '195'", 999 },
		{ "[Game] init challenge '196'", 999 },
		{ "[Game] init challenge '197'", 999 },
		{ "[Game] init challenge '198'", 999 },
		{ "[Game] init challenge '199'", 999 },
		{ "[Game] init challenge '200'", 17 }
	};

	settings.Add("SplitOnMapFinish", false, "Auto split when finishing a map.");
	foreach (var map in vars.Maps)
		settings.Add(map.Key, true, map.Key.Substring(23, 3), "SplitOnMapFinish");
}

init
{
	timer.IsGameTimePaused = false;

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

	var Module = modules.First();
	var Scanner = new SignatureScanner(game, Module.BaseAddress, Module.ModuleMemorySize);

	var LoadingPtr = Scanner.Scan(LoadingTarget);
	var MapPtr = Scanner.Scan(MapTarget);
	var CpsPtr = Scanner.Scan(CpsTarget);

	var LoadingAdr = (IntPtr)LoadingPtr;
	var MapAdr = (IntPtr)game.ReadValue<int>((IntPtr)MapPtr) + 0x0;
	var CpsAdr = (IntPtr)game.ReadValue<int>((IntPtr)game.ReadValue<int>((IntPtr)CpsPtr) + 0x14) + 0x1DC;

	vars.LoadingState = new MemoryWatcher<bool>(LoadingAdr);
	vars.MapName = new StringWatcher(MapAdr, ReadStringType.ASCII, 27);
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
		if (settings["AllEnvironments"])
		{
			if (settings["WhiteFlagAllEnvironments"])
				return (vars.MapName.Current == "[Game] init challenge '040'") && (vars.CpCounter.Current == 999);
			if (settings["GreenFlagAllEnvironments"])
				return (vars.MapName.Current == "[Game] init challenge '080'") && (vars.CpCounter.Current == 999);
			if (settings["BlueFlagAllEnvironments"])
				return (vars.MapName.Current == "[Game] init challenge '120'") && (vars.CpCounter.Current == 999);
			if (settings["RedFlagAllEnvironments"])
				return (vars.MapName.Current == "[Game] init challenge '160'") && (vars.CpCounter.Current == 999);
			if ((settings["BlackFlagAllEnvironments"]) || (settings["AllFlagsAllEnvironments"]))
				return (vars.MapName.Current == "[Game] init challenge '200'") && (vars.CpCounter.Current == 999);
		}
		if (settings["RollercoasterLagoon"])
		{
			if (settings["WhiteFlagRollercoasterLagoon"])
				return (vars.MapName.Current == "[Game] init challenge '030'") && (vars.CpCounter.Current == 999);
			if (settings["GreenFlagRollercoasterLagoon"])
				return (vars.MapName.Current == "[Game] init challenge '070'") && (vars.CpCounter.Current == 999);
			if (settings["BlueFlagRollercoasterLagoon"])
				return (vars.MapName.Current == "[Game] init challenge '110'") && (vars.CpCounter.Current == 999);
			if (settings["RedFlagRollercoasterLagoon"])
				return (vars.MapName.Current == "[Game] init challenge '150'") && (vars.CpCounter.Current == 999);
			if ((settings["BlackFlagRollercoasterLagoon"]) || (settings["AllFlagsRollercoasterLagoon"]))
				return (vars.MapName.Current == "[Game] init challenge '190'") && (vars.CpCounter.Current == 999);
		}
		if (settings["InternationalStadium"])
		{
			if (settings["WhiteFlagInternationalStadium"])
				return (vars.MapName.Current == "[Game] init challenge '040'") && (vars.CpCounter.Current == 999);
			if (settings["GreenFlagInternationalStadium"])
				return (vars.MapName.Current == "[Game] init challenge '080'") && (vars.CpCounter.Current == 999);
			if (settings["BlueFlagInternationalStadium"])
				return (vars.MapName.Current == "[Game] init challenge '120'") && (vars.CpCounter.Current == 999);
			if (settings["RedFlagInternationalStadium"])
				return (vars.MapName.Current == "[Game] init challenge '160'") && (vars.CpCounter.Current == 999);
			if ((settings["BlackFlagInternationalStadium"]) || (settings["AllFlagsInternationalStadium"]))
				return (vars.MapName.Current == "[Game] init challenge '200'") && (vars.CpCounter.Current == 999);
		}
		if (settings["CanyonGrandDrift"])
		{
			if (settings["WhiteFlagCanyonGrandDrift"])
				return (vars.MapName.Current == "[Game] init challenge '010'") && (vars.CpCounter.Current == 999);
			if (settings["GreenFlagCanyonGrandDrift"])
				return (vars.MapName.Current == "[Game] init challenge '050'") && (vars.CpCounter.Current == 999);
			if (settings["BlueFlagCanyonGrandDrift"])
				return (vars.MapName.Current == "[Game] init challenge '090'") && (vars.CpCounter.Current == 999);
			if (settings["RedFlagCanyonGrandDrift"])
				return (vars.MapName.Current == "[Game] init challenge '130'") && (vars.CpCounter.Current == 999);
			if ((settings["BlackFlagCanyonGrandDrift"]) || (settings["AllFlagsCanyonGrandDrift"]))
				return (vars.MapName.Current == "[Game] init challenge '170'") && (vars.CpCounter.Current == 999);
		}
		if (settings["ValleyDownAndDirty"])
		{
			if (settings["WhiteFlagValleyDownAndDirty"])
				return (vars.MapName.Current == "[Game] init challenge '020'") && (vars.CpCounter.Current == 999);
			if (settings["GreenFlagValleyDownAndDirty"])
				return (vars.MapName.Current == "[Game] init challenge '060'") && (vars.CpCounter.Current == 999);
			if (settings["BlueFlagValleyDownAndDirty"])
				return (vars.MapName.Current == "[Game] init challenge '100'") && (vars.CpCounter.Current == 999);
			if (settings["RedFlagValleyDownAndDirty"])
				return (vars.MapName.Current == "[Game] init challenge '140'") && (vars.CpCounter.Current == 999);
			if ((settings["BlackFlagValleyDownAndDirty"]) || (settings["AllFlagsValleyDownAndDirty"]))
				return (vars.MapName.Current == "[Game] init challenge '180'") && (vars.CpCounter.Current == 999);
		}
	}
	return false;
}

exit
{
	timer.IsGameTimePaused = true;
}