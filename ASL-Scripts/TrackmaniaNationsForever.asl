state("TmForever")
{
	// 2011-01-28 07:10:12 PM
	// SoI: 0xA2B000
	// https://github.com/NeKzor
}

startup
{
	vars.Maps = new Dictionary<string, Tuple<string, uint>>()
	{
		{ "0:24.54", new Tuple<string, uint>("A01-Race", 3) },
		{ "0:16.25", new Tuple<string, uint>("A02-Race", 2) },
		{ "0:18.75", new Tuple<string, uint>("A03-Race", 2) },
		{ "0:05.95", new Tuple<string, uint>("A04-Acrobatic", 1) },
		{ "0:16.91", new Tuple<string, uint>("A05-Race", 3) },
		{ "0:28.58", new Tuple<string, uint>("A06-Obstacle", 3) },
		{ "0:29.14", new Tuple<string, uint>("A07-Race", 2) },
		{ "1:04.48", new Tuple<string, uint>("A08-Endurance", 6) },
		{ "0:25.98", new Tuple<string, uint>("A09-Race", 3) },
		{ "0:09.64", new Tuple<string, uint>("A10-Acrobatic", 1) },
		{ "0:19.32", new Tuple<string, uint>("A11-Race", 2) },
		{ "0:19.09", new Tuple<string, uint>("A12-Speed", 2) },
		{ "0:31.70", new Tuple<string, uint>("A13-Race", 2) },
		{ "0:22.17", new Tuple<string, uint>("A14-Race", 2) },
		{ "0:25.33", new Tuple<string, uint>("A15-Speed", 2) },
		{ "0:26.20", new Tuple<string, uint>("B01-Race", 3) },
		{ "0:27.41", new Tuple<string, uint>("B02-Race", 3) },
		{ "0:27.11", new Tuple<string, uint>("B03-Race", 4) },
		{ "0:13.02", new Tuple<string, uint>("B04-Acrobatic", 1) },
		{ "0:26.28", new Tuple<string, uint>("B05-Race", 3) },
		{ "0:27.46", new Tuple<string, uint>("B06-Obstacle", 2) },
		{ "0:30.36", new Tuple<string, uint>("B07-Race", 5) },
		{ "1:42.50", new Tuple<string, uint>("B08-Endurance", 10) },
		{ "0:13.99", new Tuple<string, uint>("B09-Acrobatic", 1) },
		{ "0:37.82", new Tuple<string, uint>("B10-Speed", 5) },
		{ "0:31.44", new Tuple<string, uint>("B11-Race", 6) },
		{ "0:45.50", new Tuple<string, uint>("B12-Race", 4) },
		{ "0:25.65", new Tuple<string, uint>("B13-Obstacle", 4) },
		{ "0:32.98", new Tuple<string, uint>("B14-Speed", 4) },
		{ "0:41.19", new Tuple<string, uint>("B15-Race", 7) },
		{ "0:29.58", new Tuple<string, uint>("C01-Race", 3) },
		{ "0:42.47", new Tuple<string, uint>("C02-Race", 5) },
		{ "0:13.90", new Tuple<string, uint>("C03-Acrobatic", 1) },
		{ "0:39.80", new Tuple<string, uint>("C04-Race", 5) },
		{ "1:56.39", new Tuple<string, uint>("C05-Endurance", 14) },
		{ "0:55.59", new Tuple<string, uint>("C06-Speed", 5) },
		{ "0:40.34", new Tuple<string, uint>("C07-Race", 4) },
		{ "0:27.72", new Tuple<string, uint>("C08-Obstacle", 3) },
		{ "0:50.12", new Tuple<string, uint>("C09-Race", 4) },
		{ "0:15.03", new Tuple<string, uint>("C10-Acrobatic", 1) },
		{ "0:50.04", new Tuple<string, uint>("C11-Race", 4) },
		{ "0:34.68", new Tuple<string, uint>("C12-Obstacle", 4) },
		{ "0:44.87", new Tuple<string, uint>("C13-Race", 6) },
		{ "1:56.91", new Tuple<string, uint>("C14-Endurance", 9) },
		{ "0:50.34", new Tuple<string, uint>("C15-Speed", 7) },
		{ "2:33.26", new Tuple<string, uint>("D01-Endurance", 20) },
		{ "0:52.63", new Tuple<string, uint>("D02-Race", 5) },
		{ "0:15.94", new Tuple<string, uint>("D03-Acrobatic", 1) },
		{ "0:52.86", new Tuple<string, uint>("D04-Race", 5) },
		{ "1:11.43", new Tuple<string, uint>("D05-Race", 9) },
		{ "1:10.53", new Tuple<string, uint>("D06-Obstacle", 6) },
		{ "1:00.37", new Tuple<string, uint>("D07-Race", 6) },
		{ "0:52.44", new Tuple<string, uint>("D08-Speed", 10) },
		{ "0:46.47", new Tuple<string, uint>("D09-Obstacle", 9) },
		{ "0:57.62", new Tuple<string, uint>("D10-Race", 8) },
		{ "0:14.65", new Tuple<string, uint>("D11-Acrobatic", 2) },
		{ "0:42.79", new Tuple<string, uint>("D12-Speed", 8) },
		{ "1:11.21", new Tuple<string, uint>("D13-Race", 9) },
		{ "2:57.09", new Tuple<string, uint>("D14-Endurance", 18) },
		{ "7:50.66", new Tuple<string, uint>("D15-Endurance", 70) },
		{ "0:45.56", new Tuple<string, uint>("E01-Obstacle", 7) },
		{ "4:37.48", new Tuple<string, uint>("E02-Endurance", 26) },
		{ "5:29.78", new Tuple<string, uint>("E03-Endurance", 39) },
		{ "2:01.06", new Tuple<string, uint>("E04-Obstacle", 19) },
		{ "1:00:05.94", new Tuple<string, uint>("E05-Endurance", 480) }
	};

	settings.Add("SplitOnMapChange", false, "Auto split on map change.");
	settings.Add("SplitOnMapFinish", true, "Auto split when finishing a map.");
	foreach (var map in vars.Maps)
		settings.Add(map.Value.Item1, true, map.Value.Item1, "SplitOnMapFinish");

	vars.CategoryName = timer.Run.CategoryName;
	vars.CurrentMap = default(Tuple<string, uint>);
	vars.OldMapName = string.Empty;
	vars.CurrentMapName = string.Empty;
	vars.Watchers = new MemoryWatcherList();
	vars.LoadingState = new MemoryWatcher<bool>(IntPtr.Zero);
	vars.Time = new StringWatcher(IntPtr.Zero, ReadStringType.ASCII, 10);
	vars.CpCounter = new MemoryWatcher<int>(IntPtr.Zero);
	vars.TryInit = (Func<Process, ProcessModuleWow64Safe, bool>)((gameProc, module) =>
	{
		var LoadingTarget = new SigScanTarget(1, "00 90 ?? ?? ?? ??",		// add [eax+0C033D28],dl
												 "00 00",					// add [eax],al
												 "00 D0",					// add al,dl
												 "E0 ??",					// loopne TmForever.exe+977E93
												 "?? 00");					// add al,00

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
				if (proc.ReadPointer(ptr + 0x98, out ptr))
					if (proc.ReadPointer(ptr + 0xEC, out ptr))
						if (proc.ReadPointer(ptr + 0x198, out ptr))
							if (proc.ReadPointer(ptr + 0x40, out ptr))
								return ptr + 0x4F8;
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

		var Scanner = new SignatureScanner(gameProc, module.BaseAddress, module.ModuleMemorySize);
		var LoadingAdr = (IntPtr)Scanner.Scan(LoadingTarget);
		var TimeAdr = (IntPtr)Scanner.Scan(TimeTarget);
		var CpsAdr = (IntPtr)Scanner.Scan(CpsTarget);

		if ((LoadingAdr != IntPtr.Zero) && (TimeAdr != IntPtr.Zero) && (CpsAdr != IntPtr.Zero))
		{
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
			vars.Watchers.UpdateAll(gameProc);
			return true;
		}
		return false;
	});
	vars.GetMap = (Func<string, Tuple<string, uint>>)((time) =>
	{
		var map = default(Tuple<string, uint>);
		if (vars.Maps.TryGetValue(time, out map))
			return map;
		return vars.CurrentMap;
	});
	vars.TimePattern = new System.Text.RegularExpressions.Regex("(-|[0-9]+:)?[0-9]+:[0-9][0-9]\\.[0-9][0-9]");
	vars.TryParseTime = (Func<string, bool>)((time) => vars.TimePattern.IsMatch(time));
}

init
{
	vars.Init = false;
	vars.Module = modules.First();
}

update
{
	vars.Watchers.UpdateAll(game);
	// Get category from Splits Editor
	if (timer.CurrentPhase == TimerPhase.NotRunning)
		vars.CategoryName = timer.Run.CategoryName;
	if (vars.Init)
	{
		vars.OldMapName = vars.CurrentMapName;
		if (vars.Time.Old != vars.Time.Current)
		{
			if (!vars.TryParseTime(vars.Time.Old))
			{
				if (vars.TryParseTime(vars.Time.Current))
				{
					vars.CurrentMap = vars.GetMap(vars.Time.Current);
					if (vars.CurrentMap != null)
						vars.CurrentMapName = vars.CurrentMap.Item1;
				}
			}
		}
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
	switch (vars.CategoryName as string)
	{
		case "All Flags":
		case "White":
			return (vars.CurrentMapName == "A01-Race");
		case "Green":
			return (vars.CurrentMapName == "B01-Race");
		case "Blue":
			return (vars.CurrentMapName == "C01-Race");
		case "Red":
			return (vars.CurrentMapName == "D01-Endurance");
		case "Black":
			return (vars.CurrentMapName == "E01-Obstacle");
	}
	return false;
}

reset
{
	if (vars.OldMapName == vars.CurrentMapName)
		return false;
	switch (vars.CategoryName as string)
	{
		case "All Flags":
		case "White":
			return (vars.CurrentMapName == "A01-Race");
		case "Green":
			return (vars.CurrentMapName == "B01-Race");
		case "Blue":
			return (vars.CurrentMapName == "C01-Race");
		case "Red":
			return (vars.CurrentMapName == "D01-Endurance");
		case "Black":
			return (vars.CurrentMapName == "E01-Obstacle");
	}
	return false;
}

split
{
	// Map change
	if ((settings["SplitOnMapChange"]) && (vars.OldMapName != vars.CurrentMapName))
		return true;
	// Finish line
	if (vars.CpCounter.Current != vars.CpCounter.Old)
	{
		if (vars.CpCounter.Current == vars.CurrentMap.Item2)
		{
			// End of any map
			if (settings[vars.CurrentMapName])
				return true;
			// End of category
			switch (vars.CategoryName as string)
			{
				case "White":
					return (vars.CurrentMapName == "A15-Speed'");
				case "Green":
					return (vars.CurrentMapName == "B15-Race");
				case "Blue":
					return (vars.CurrentMapName == "C15-Speed");
				case "Red":
					return (vars.CurrentMapName == "D15-Endurance");
				case "Black":
				case "All Flags":
					return (vars.CurrentMapName == "E05-Endurance");
			}
		}
	}
	return false;
}

exit
{
	timer.IsGameTimePaused = true;
}