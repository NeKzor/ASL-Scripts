// TODO:
//	- Find and fix actual loading value
//	- Implement complete splitting logic
//	- Implement game restart/crash logic
//	- Collect number of cps of each track
//	- Remove debug stuff

state("TmForever")	// 01/28/2011 07:10:12 PM (SoI: 0xA2B000)
{
}

startup
{
	settings.Add("Categories", true, "Auto start and reset for category:");
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

	vars.Maps = new Dictionary<string, Tuple<string, uint>>()
	{
		{ "0:24.54", new Tuple<string, uint>("A01-Race", 3) },
		{ "0:16.25", new Tuple<string, uint>("A02-Race", 999) },
		{ "0:18.75", new Tuple<string, uint>("A03-Race", 999) },
		{ "0:05.95", new Tuple<string, uint>("A04-Acrobatic", 999) },
		{ "0:16.91", new Tuple<string, uint>("A05-Race", 999) },
		{ "0:28.58", new Tuple<string, uint>("A06-Obstacle", 999) },
		{ "0:29.14", new Tuple<string, uint>("A07-Race", 999) },
		{ "1:04.48", new Tuple<string, uint>("A08-Endurance", 999) },
		{ "0:25.98", new Tuple<string, uint>("A09-Race", 999) },
		{ "0:09.64", new Tuple<string, uint>("A10-Acrobatic", 999) },
		{ "0:19.32", new Tuple<string, uint>("A11-Race", 999) },
		{ "0:19.09", new Tuple<string, uint>("A12-Speed", 999) },
		{ "0:31.70", new Tuple<string, uint>("A13-Race", 999) },
		{ "0:22.17", new Tuple<string, uint>("A14-Race", 999) },
		{ "0:25.33", new Tuple<string, uint>("A15-Speed", 999) },
		{ "0:26.20", new Tuple<string, uint>("B01-Race", 999) },
		{ "0:27.41", new Tuple<string, uint>("B02-Race", 999) },
		{ "0:27.11", new Tuple<string, uint>("B03-Race", 999) },
		{ "0:13.02", new Tuple<string, uint>("B04-Acrobatic", 999) },
		{ "0:26.28", new Tuple<string, uint>("B05-Race", 999) },
		{ "0:27.46", new Tuple<string, uint>("B06-Obstacle", 999) },
		{ "0:30.36", new Tuple<string, uint>("B07-Race", 999) },
		{ "1:42.50", new Tuple<string, uint>("B08-Endurance", 999) },
		{ "0:13.99", new Tuple<string, uint>("B09-Acrobatic", 999) },
		{ "0:37.82", new Tuple<string, uint>("B10-Speed", 999) },
		{ "0:31.44", new Tuple<string, uint>("B11-Race", 999) },
		{ "0:45.50", new Tuple<string, uint>("B12-Race", 999) },
		{ "0:25.65", new Tuple<string, uint>("B13-Obstacle", 999) },
		{ "0:32.98", new Tuple<string, uint>("B14-Speed", 999) },
		{ "0:41.19", new Tuple<string, uint>("B15-Race", 999) },
		{ "0:29.58", new Tuple<string, uint>("C01-Race", 999) },
		{ "0:42.47", new Tuple<string, uint>("C02-Race", 999) },
		{ "0:13.90", new Tuple<string, uint>("C03-Acrobatic", 999) },
		{ "0:39.80", new Tuple<string, uint>("C04-Race", 999) },
		{ "1:56.39", new Tuple<string, uint>("C05-Endurance", 999) },
		{ "0:55.59", new Tuple<string, uint>("C06-Speed", 999) },
		{ "0:40.34", new Tuple<string, uint>("C07-Race", 999) },
		{ "0:27.72", new Tuple<string, uint>("C08-Obstacle", 999) },
		{ "0:50.12", new Tuple<string, uint>("C09-Race", 999) },
		{ "0:15.03", new Tuple<string, uint>("C10-Acrobatic", 999) },
		{ "0:50.04", new Tuple<string, uint>("C11-Race", 999) },
		{ "0:34.68", new Tuple<string, uint>("C12-Obstacle", 999) },
		{ "0:44.87", new Tuple<string, uint>("C13-Race", 999) },
		{ "1:56.91", new Tuple<string, uint>("C14-Endurance", 999) },
		{ "0:50.34", new Tuple<string, uint>("C15-Speed", 999) },
		{ "2:33.26", new Tuple<string, uint>("D01-Endurance", 999) },
		{ "0:52.63", new Tuple<string, uint>("D02-Race", 999) },
		{ "0:15.94", new Tuple<string, uint>("D03-Acrobatic", 999) },
		{ "0:52.86", new Tuple<string, uint>("D04-Race", 999) },
		{ "1:11.43", new Tuple<string, uint>("D05-Race", 999) },
		{ "1:10.53", new Tuple<string, uint>("D06-Obstacle", 999) },
		{ "1:00.37", new Tuple<string, uint>("D07-Race", 999) },
		{ "0:52.44", new Tuple<string, uint>("D08-Speed", 999) },
		{ "0:46.47", new Tuple<string, uint>("D09-Obstacle", 999) },
		{ "0:57.62", new Tuple<string, uint>("D10-Race", 999) },
		{ "0:14.65", new Tuple<string, uint>("D11-Acrobatic", 999) },
		{ "0:42.79", new Tuple<string, uint>("D12-Speed", 999) },
		{ "1:11.21", new Tuple<string, uint>("D13-Race", 999) },
		{ "2:57.09", new Tuple<string, uint>("D14-Endurance", 999) },
		{ "7:50.66", new Tuple<string, uint>("D15-Endurance", 999) },
		{ "0:45.56", new Tuple<string, uint>("E01-Obstacle", 999) },
		{ "4:37.48", new Tuple<string, uint>("E02-Endurance", 999) },
		{ "5:29.78", new Tuple<string, uint>("E03-Endurance", 999) },
		{ "2:01.06", new Tuple<string, uint>("E04-Obstacle", 999) },
		{ "1:00:05.94", new Tuple<string, uint>("E05-Endurance", 999) }
	};

	settings.Add("SplitOnMapFinish", true, "Auto split when finishing a map.");
	foreach (var map in vars.Maps)
		settings.Add(map.Value.Item1, true, map.Value.Item1, "SplitOnMapFinish");

	vars.CurrentMap = default(Tuple<string, uint>);
	vars.OldMapName = string.Empty;
	vars.CurrentMapName = string.Empty;
	vars.Watchers = new MemoryWatcherList();
	vars.LoadingState = new MemoryWatcher<bool>(IntPtr.Zero);
	vars.Time = new StringWatcher(IntPtr.Zero, ReadStringType.ASCII, 10);
	vars.CpCounter = new MemoryWatcher<int>(IntPtr.Zero);
	vars.TryInit = (Func<Process, ProcessModuleWow64Safe, bool>)((gameproc, module) =>
	{
		var LoadingTarget = new SigScanTarget(4, "90",						// nop 
												 "B0 5E",					// mov al,5E
												 "00 B0 ?? ?? ?? ??",		// add [eax+0002D923],dh
												 "00 00",					// add [eax],al
												 "00 6C 54 D5");			// add [esp+edx*2-2B],ch

		var TimeTarget = new SigScanTarget(0, "F0 9A ?? ?? ?? ?? BB00",		// lock call 00BB:
											  "DC 14 D7",					// fcom qword ptr [edi+edx*8]
											  "00 00",						// add [eax],al
											  "00 00",						// add [eax],al
											  "00 D4");						// add ah,dl

		var CpsTarget = new SigScanTarget(4, "90",							// nop 
											 "B0 5E",						// mov al,5E
											 "00 B0 ?? ?? ?? ??",			// add [eax+0002D923],dh
											 "00 00",						// add [eax],al
											 "00 6C 54 D5");				// add [esp+edx*2-2B],ch

		LoadingTarget.OnFound = (proc, _, ptr) =>
		{
			if (proc.ReadPointer(ptr, out ptr))
				if (proc.ReadPointer(ptr + 0x70, out ptr))
					if (proc.ReadPointer(ptr + 0x24, out ptr))
						if (proc.ReadPointer(ptr + 0x6C, out ptr))
							return ptr + 0x120;
			return IntPtr.Zero;
		};
		TimeTarget.OnFound = (proc, _, ptr) =>
		{
			if (proc.ReadPointer(ptr, out ptr))
				if (proc.ReadPointer(ptr + 0x4, out ptr))
					return ptr + 0x88;
			return IntPtr.Zero;
		};
		CpsTarget.OnFound = (proc, _, ptr) =>
		{
			if (proc.ReadPointer(ptr, out ptr))
				if (proc.ReadPointer(ptr + 0x12C, out ptr))
					if (proc.ReadPointer(ptr + 0x300, out ptr))
						if (proc.ReadPointer(ptr + 0x0, out ptr))
							return ptr + 0x334;
			return IntPtr.Zero;
		};

		print("[ASL] : SCANNING");
		var Scanner = new SignatureScanner(gameproc, module.BaseAddress, module.ModuleMemorySize);
		var LoadingAdr = Scanner.Scan(LoadingTarget);
		var TimeAdr = Scanner.Scan(TimeTarget);
		var CpsAdr = Scanner.Scan(CpsTarget);

		print("[ASL] : LoadingAdr = 0x" + ((IntPtr)LoadingAdr).ToString("X"));
		print("[ASL] : TimeAdr = 0x" + ((IntPtr)TimeAdr).ToString("X"));
		print("[ASL] : CpsAdr = 0x" + ((IntPtr)CpsAdr).ToString("X"));

		if ((LoadingAdr != IntPtr.Zero) && (TimeAdr != IntPtr.Zero) && (CpsAdr != IntPtr.Zero))
		{
			print("[ASL] : ALL FOUND");
			vars.LoadingState = new MemoryWatcher<bool>(LoadingAdr);
			vars.Time = new StringWatcher(TimeAdr, ReadStringType.ASCII, 10);
			vars.CpCounter = new MemoryWatcher<int>(CpsAdr);

			vars.Watchers.Clear();
			vars.Watchers.AddRange(new MemoryWatcher[]
			{
				vars.LoadingState,
				vars.Time,
				vars.CpCounter
			});
			vars.Watchers.UpdateAll(gameproc);
			return true;
		}
		return false;
	});
	vars.UpdateMap = (Func<Dictionary<string, Tuple<string, uint>>, string, Tuple<string, uint>>)((maps, time) =>
	{
		var map = default(Tuple<string, uint>);
		if (maps.TryGetValue(time, out map))
			return map;
		return vars.CurrentMap;
	});
	vars.TimePattern = new System.Text.RegularExpressions.Regex("(-|[0-9]+:)?[0-9]+:[0-9][0-9]\.[0-9][0-9]");
	vars.TryParseTime = (Func<string, bool>)((time) => vars.TimePattern.IsMatch(time));
}

init
{
	vars.Init = false;
	vars.Module = modules.First();
	print("[ASL] : ModuleName = " + vars.Module.ModuleName.ToString());
	print("[ASL] : ModuleMemorySize = 0x" + vars.Module.ModuleMemorySize.ToString("X"));
	print("[ASL] : BaseAddress = 0x" + vars.Module.BaseAddress.ToString("X"));
}

update
{
	vars.Watchers.UpdateAll(game);
	if (vars.Init)
	{
		vars.OldMapName = vars.CurrentMapName;
		if (vars.Time.Old != vars.Time.Current)
		{
			print("[ASL] : TIME : " + vars.Time.Old + " -> " + vars.Time.Current);
			if (!vars.TryParseTime(vars.Time.Old))
			{
				if (vars.TryParseTime(vars.Time.Current))
				{
					vars.CurrentMap = vars.UpdateMap(vars.Maps, vars.Time.Current);
					vars.CurrentMapName = vars.CurrentMap.Item1;
				}
			}
		}
		if (vars.OldMapName != vars.CurrentMapName)
			print("[ASL] : MapName : " + vars.OldMapName + " -> " + vars.CurrentMapName);
		if (vars.LoadingState.Current != vars.LoadingState.Old)
			print("[ASL] : LoadingState : " + vars.LoadingState.Current.ToString());
	}
	else
		vars.Init = vars.TryInit(game, vars.Module);
}

isLoading
{
	return (vars.LoadingState.Current) || (!vars.Init);
}

start
{
	if (vars.LoadingState.Current)
		return false;
	if ((settings["AllFlags"]) || (settings["WhiteFlag"]))
		return (vars.CurrentMapName == "A01-Race");
	if (settings["GreenFlag"])
		return (vars.CurrentMapName == "B01-Race");
	if (settings["BlueFlag"])
		return (vars.CurrentMapName == "C01-Race");
	if (settings["RedFlag"])
		return (vars.CurrentMapName == "D01-Endurance");
	if (settings["BlackFlag"])
		return (vars.CurrentMapName == "E01-Obstacle");
	return false;
}

reset
{
	if (vars.OldMapName == vars.CurrentMapName)
		return false;
	if ((settings["AllFlags"]) || (settings["WhiteFlag"]))
		return (vars.CurrentMapName == "A01-Race");
	if (settings["GreenFlag"])
		return (vars.CurrentMapName == "B01-Race");
	if (settings["BlueFlag"])
		return (vars.CurrentMapName == "C01-Race");
	if (settings["RedFlag"])
		return (vars.CurrentMapName == "D01-Endurance");
	if (settings["BlackFlag"])
		return (vars.CurrentMapName == "E01-Obstacle");
	return false;
}

split
{
	// Map completion, finish line
	if (vars.CpCounter.Current != vars.CpCounter.Old)
		if (settings[vars.CurrentMapName])
			if (vars.CpCounter.Current == vars.CurrentMap.Item2)
				return true;
	return false;
}

exit
{
	timer.IsGameTimePaused = true;
}