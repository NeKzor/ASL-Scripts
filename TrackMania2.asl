state("ManiaPlanet")
{
    // https://github.com/NeKzor/ASL-Scripts/issues
}

startup
{
    // Memory stuff
    vars.Watchers = new MemoryWatcherList();
    vars.LoadingState = new MemoryWatcher<bool>(IntPtr.Zero);
    vars.RaceState = new MemoryWatcher<int>(IntPtr.Zero);
    vars.LoadMap = new StringWatcher(IntPtr.Zero, ReadStringType.ASCII, 128);
    vars.GameInfo = new StringWatcher(IntPtr.Zero, ReadStringType.ASCII, 128);

    vars.TryInit = (Func<Process, ProcessModuleWow64Safe, bool>)((gameProc, module) =>
    {
        // \x83\x3D\x00\x00\x00\x00\x00\x8B\x0D\x00\x00\x00\x00\x75\x08\x85\xC9 xx????xxx????xxxx
        var LoadingTarget = new SigScanTarget(9, "83 3D ?? ?? ?? ?? 00 8B 0D ?? ?? ?? ?? 75 08 85 C9");

        // \x56\x8B\xF1\xE8\x00\x00\x00\x00\x8B\x8E\x00\x00\x00\x00\x85\xC9\x74\x36 xxxx????xx????xxxx
        var RaceStateTarget = new SigScanTarget(38, "56 8B F1 E8 ?? ?? ?? ?? 8B 8E ?? ?? ?? ?? 85 C9 74 36");

        // \x6A\xFF\x68\x00\x00\x00\x00\x64\xA1\x00\x00\x00\x00\x50\x56\xA1\x00\x00\x00\x00\x33\xC4\x50\x8D\x44\x24\x08\x64\xA3\x00\x00\x00\x00\x8B\xF1\xA1\x00\x00\x00\x00\xA8\x01\x75\x3E xxx????xx????xxx????xxxxxxxxx????xxx????xxxx
        var LoadMapTarget = new SigScanTarget(62, "6A FF 68 ?? ?? ?? ?? 64 A1 ?? ?? ?? ?? 50 56 A1 ?? ?? ?? ?? 33 C4 50 8D 44 24 08 64 A3 ?? ?? ?? ?? 8B F1 A1 ?? ?? ?? ?? A8 01 75 3E");

        // \xB9\x00\x00\x00\x00\xC7\x05\x00\x00\x00\x00\x00\x00\x00\x00\xE8\x00\x00\x00\x00\xC6\x44\x24\x00\x00\xC7\x44\x24\x00\x00\x00\x00\x00\xC7\x05\x00\x00\x00\x00\x00\x00\x00\x00 x????xx????????x????xxx??xxx?????xx????????
        var GameInfoTarget = new SigScanTarget(1, "B9 ?? ?? ?? ?? C7 05 ?? ?? ?? ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? C6 44 24 ?? ?? C7 44 24 ?? ?? ?? ?? ?? C7 05 ?? ?? ?? ?? ?? ?? ?? ??");

        LoadingTarget.OnFound = (proc, _, ptr) =>
        {
            print("[ASL] LoadingTarget = 0x" + ptr.ToString("X"));
            return proc.ReadPointer(ptr, out ptr)
                ? ptr
                : IntPtr.Zero;
        };
        RaceStateTarget.OnFound = (proc, _, ptr) =>
        {
            print("[ASL] RaceStateTarget = 0x" + ptr.ToString("X"));
            return proc.ReadPointer(ptr, out ptr)
                ? proc.ReadPointer(ptr, out ptr)
                    ? proc.ReadPointer(ptr + 0x14, out ptr)
                        ? ptr + 0xB4
                        : IntPtr.Zero
                    : IntPtr.Zero
                : IntPtr.Zero;
        };
        LoadMapTarget.OnFound = (proc, _, ptr) =>
        {
            print("[ASL] LoadMapTarget = 0x" + ptr.ToString("X"));
            return proc.ReadPointer(ptr, out ptr)
                ? ptr
                : IntPtr.Zero;
        };
        GameInfoTarget.OnFound = (proc, _, ptr) =>
        {
            print("[ASL] GameInfoTarget = 0x" + ptr.ToString("X"));
            return proc.ReadPointer(ptr, out ptr)
                ? proc.ReadPointer(ptr, out ptr)
                    ? ptr
                    : IntPtr.Zero
                : IntPtr.Zero;
        };

        var Scanner = new SignatureScanner(gameProc, module.BaseAddress, module.ModuleMemorySize);
        var LoadingAddr = Scanner.Scan(LoadingTarget);
        var RaceStateAddr = Scanner.Scan(RaceStateTarget);
        var LoadMapAddr = Scanner.Scan(LoadMapTarget);
        var GameInfoAddr = Scanner.Scan(GameInfoTarget);

        print("[ASL] LoadingAddr = 0x" + LoadingAddr.ToString("X"));
        print("[ASL] RaceStateAddr = 0x" + RaceStateAddr.ToString("X"));
        print("[ASL] LoadMapAddr = 0x" + LoadMapAddr.ToString("X"));
        print("[ASL] GameInfoAddr = 0x" + GameInfoAddr.ToString("X"));

        if ((LoadingAddr != IntPtr.Zero)
            && (RaceStateAddr != IntPtr.Zero)
            && (LoadMapAddr != IntPtr.Zero)
            && (GameInfoAddr != IntPtr.Zero))
        {
            print("[ASL] Scan Completed!");
            vars.LoadingState = new MemoryWatcher<bool>(LoadingAddr);
            vars.RaceState = new MemoryWatcher<int>(RaceStateAddr);
            vars.LoadMap = new StringWatcher(new DeepPointer(module.ModuleName, (int)LoadMapAddr - (int)module.BaseAddress, 0x0), ReadStringType.ASCII, 128);
            vars.GameInfo = new StringWatcher(GameInfoAddr, ReadStringType.ASCII, 128);

            vars.Watchers.Clear();
            vars.Watchers.AddRange(new MemoryWatcher[]
            {
                vars.LoadingState,
                vars.RaceState,
                vars.LoadMap,
                vars.GameInfo
            });
            vars.Watchers.UpdateAll(gameProc);
            //print("[ASL] LoadingState = " + vars.LoadingState.Current);
            //print("[ASL] RaceState = " + vars.ERaceState[vars.RaceState.Current]);
            //print("[ASL] LoadMap = " + vars.LoadMap.Current);
            //print("[ASL] GameInfo = " + vars.GameInfo.Current);
            return true;
        }
        print("[ASL] Scan Failed!"); 
        return false;
    });
    vars.ERaceState = new Dictionary<int, string>()
    {
        { 0, "BeforeStart" },
        { 1, "Running" },
        { 2, "Finished" },
        { 3, "Eliminated" },
    };

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
    settings.Add("SmartSplit", false, "Auto split detection for unofficial maps.");
    settings.Add("SplitOnMapFinish", true, "Auto split when finishing a map.");

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
    vars.Module = modules.First(module => module.ModuleName == "ManiaPlanet.exe");
}

update
{
    if (timer.CurrentPhase == TimerPhase.NotRunning)
    {
        vars.GameRestart = false;
        vars.StartedMap = string.Empty;
    }

    if (vars.Init)
    {    
        vars.Watchers.UpdateAll(game);

        // Rescan when titlepack is loading
        if ((string.IsNullOrEmpty(vars.GameInfo.Current))
            || (vars.GameInfo.Current.StartsWith("[Maniaplanet]"))
            || (vars.GameInfo.Current.StartsWith("[Game] exec MenuResult: 58"))
            || (vars.GameInfo.Current.Contains("loading title")))
        {
            print("[ASL] TP Rescan!");
            vars.TryInit(game, vars.Module);
        }

        // Unpause timer when titlepack has loaded
        if ((vars.GameRestart)
            && (vars.GameInfo.Current.StartsWith("[Game] main menu"))
            && (vars.GameInfo.Old.StartsWith("[Game] Loading title")))
        {
            print("[ASL] Unpaused GameTime!");
            timer.IsGameTimePaused = false;
            vars.GameRestart = false;
        }

        // Some debug info :^)
        if (vars.LoadingState.Changed)  print("[ASL] LoadingState Changed! (" + vars.LoadingState.Current + ")");
        if (vars.LoadMap.Changed)       print("[ASL] LoadMap Changed! (" + vars.LoadMap.Current + ")");
        if (vars.RaceState.Changed)     print("[ASL] RaceState Changed! (" + vars.ERaceState[vars.RaceState.Current] + ")");
        if (vars.GameInfo.Changed)      print("[ASL] GameInfo Changed! (" + vars.GameInfo.Current + ")");
    }
    else
    {
        print("[ASL] Default Scan!");
        return vars.Init = vars.TryInit(game, vars.Module);
    }
}

isLoading
{
    return (vars.LoadingState.Current) || (vars.GameRestart);
}

start
{
    if ((vars.LoadingState.Old) && (!vars.LoadingState.Current))
    {
        if ((vars.LoadMap.Current == vars.GetFirstMap()) && (!settings["SmartSplit"]))
            return true;

        // Used for SmartSplit auto reset
        if (settings["SmartSplit"])
        {
            print("[ASL] StartedMap = " + vars.LoadMap.Current);
            vars.StartedMap = vars.LoadMap.Current;
            return true;
        }
    }
    return false;
}

reset
{
    if ((vars.GameInfo.Old != vars.GameInfo.Current) && (vars.GameInfo.Current.StartsWith("[Game] init challenge")))
    {
        var loadmap = vars.GameInfo.Current.Replace("[Game] init challenge", "LoadMap");
        if ((loadmap.StartsWith(vars.GetFirstMap())) && (!settings["SmartSplit"]))
            return true;

        // Auto reset for unofficial maps, started map should be saved since auto start
        if ((settings["SmartSplit"]) && (loadmap.StartsWith(vars.StartedMap)))
            return true;
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
    if ((timer.CurrentPhase == TimerPhase.Running) || (timer.CurrentPhase == TimerPhase.Paused))
    {
        print("[ASL] Paused GameTime!");
        timer.IsGameTimePaused = true;
        vars.GameRestart = true;
    }
}