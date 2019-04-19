// Report issues here: https://github.com/NeKzor/ASL-Scripts/issues

state("TmForever")
{
    bool LoadingState: "TmForever.exe", 0x00968C44, 0x70, 0x1C, 0x120;
    int RaceState : "TmForever.exe", 0x009560CC, 0x0, 0x1C, 0x314;
    string27 GameInfo : "TmForever.exe", 0x00971CA8, 0x0;
}

startup
{
    vars.Maps = new Dictionary<string, string>()
    {
        { "BeySZdnfuSh4nHY5xztiXLmlrXe", "A01-Race" },
        { "JwKdDsOUh4L9_eYyRsdiA2o1fW1", "A02-Race" },
        { "mWxQhvvPOoNfPaq18j3dokLqyO7", "A03-Race" },
        { "SEHmwPJVBl3NpHS56w6Sirac2Ic", "A04-Acrobatic" },
        { "I7rI7jAga6C4tGAe5OTDoyLF2fh", "A05-Race" },
        { "syko1DvAxleoVlqMsc1sJzqbt66", "A06-Obstacle" },
        { "KzeBzLOI62lxu3haZCPFn_4BfD6", "A07-Race" },
        { "KDBPTuNkrZG6jMxuRqmDBbLjfp6", "A08-Endurance" },
        { "TteOqSjrhVsdjZYAaLuGBWX2a4c", "A09-Race" },
        { "jH8X3qPtpn6pj3dLAaq08pyDdp1", "A10-Acrobatic" },
        { "N0CpLabOm8Kk6Lsf0kwelgHiMQm", "A11-Race" },
        { "zwAbNlFSDcXjRBk0YSMyxc5kJJ8", "A12-Speed" },
        { "K27AW3HYV47qqqXentunIoUERu8", "A13-Race" },
        { "6ktPCqLADXXuy5LaOLTzktaGlKf", "A14-Race" },
        { "dJQvN8hB18o3SXNl897MOShzZQ5", "A15-Speed" },
        { "8oDWqaNMXpyFg6e_QUb07Wzpkk3", "B01-Race" },
        { "b4ubJL0Aayrg7aqhe0RwI4jBQR1", "B02-Race" },
        { "HIH70OwdsvC7ZX_oKOWhwqDITx2", "B03-Race" },
        { "OfPhGxBSu5zHgl3GsndJGGens8k", "B04-Acrobatic" },
        { "R2W9o_MsXRP2PNp46stzmMWkgHb", "B05-Race" },
        { "SZHG1tFsmJLJInUsruGgREWsFq1", "B06-Obstacle" },
        { "NdajMtuuXvuxhfGkye4Om8wUXYi", "B07-Race" },
        { "u8RcNHvafbeKfHcNvgye0uq_jpb", "B08-Endurance" },
        { "t6kPFNQiJTm3rFqjGRGHBxwZOkd", "B09-Acrobatic" },
        { "o7StLUfi3bsutUxdOjQgsOO6p_m", "B10-Speed" },
        { "RVEoquUninLI8FqVo_ZCo4lr5X9", "B11-Race" },
        { "p4PhXsVTp7NhVmhSLZXeJjrFahe", "B12-Race" },
        { "NxUOXF2VDOHaOyrYlD9p81Gnfp3", "B13-Obstacle" },
        { "bx9QX_lcEZ0IIGKXeYOw3lWqBXh", "B14-Speed" },
        { "X_uZrnyHg_3HuqP9oWEkg2pNh5c", "B15-Race" },
        { "eDgWjoKe2dT3GfoTCGCmI_qMvfk", "C01-Race" },
        { "hlRjJEZGm0yr1sT91CtdIwmqsti", "C02-Race" },
        { "c4oQLgleEPkNtehypwdYXTkmVvi", "C03-Acrobatic" },
        { "yWy7ROt2lgk2zL44HKdBgUjuthi", "C04-Race" },
        { "UR7xWwTkMeFB2kqVLVVOGDBCKFb", "C05-Endurance" },
        { "fwj7Gn1nSQ_8qx6MPUtzAfHngTj", "C06-Speed" },
        { "PLVn84D8NoVGjidP1pLafZP8qA8", "C07-Race" },
        { "Hb_oIOr6Y4_I3aoMogsTPufz8hl", "C08-Obstacle" },
        { "9MOwoNkpYZhw8e99cxFI3hVZrvi", "C09-Race" },
        { "XYiTfAdultrTWVJpjl_Bdnf7x4l", "C10-Acrobatic" },
        { "npRjhClGPZMs_YK_T5yUrnWY0q9", "C11-Race" },
        { "znbgMZayw8uBByLWqc6kYsEfG6l", "C12-Obstacle" },
        { "qxHe8iBNC2soNhkOoOvEKDkxZ58", "C13-Race" },
        { "uuGCAivChymPBU6TAHp6qIKSoR4", "C14-Endurance" },
        { "n4QZfCzSzwMxsY2ILHFUEEipjtg", "C15-Speed" },
        { "E0ZXX6DbQ1wZXMiLYW77zgjFcB9", "D01-endurance" },
        { "r7OqCgR3yODNwmJcPGyUafJKRAh", "D02-Race" },
        { "KvPlXufFJaLjDGSRP1rcregOaX3", "D03-Acrobatic" },
        { "h1doGRJ46hAGF3AeCJPsPHE_Vb2", "D04-Race" },
        { "iDnUBYbFhfD0QIPmIyRvy1UIw_0", "D05-Race" },
        { "Twnk9iISEER4KYGY8bfPffK5BU5", "D06-Obstacle" },
        { "bRZJ7Wn3QyftteDpbnIYlrcEqp9", "D07-Race" },
        { "RgXELEylfSWdjQG_XiiTFVkYi99", "D08-Speed" },
        { "ka5WLGb0IrqZ1L7fVb6dXHNTWF0", "D09-obstacle" },
        { "icDiiqPi3EljXk49VJ6WUl0LQzb", "D10-Race" },
        { "yQULZVxaNxr7tFlNXr9SdOVA6l3", "D11-Acrobatic" },
        { "DceckSvMpluYYGHaEeALei6A4tf", "D12-Speed" },
        { "vKf7eiC82A343d7TpKyMS52Ddyc", "D13-Race" },
        { "vIIX52BcNOt86BJ1NrZq6_bJir5", "D14-Endurance" },
        { "q9ETZ0R5yClf_9wDxsPI41gO6V6", "D15-Endurance" },
        { "tURAqsuKtDsCV7B0bWEszBV78Re", "E01-Obstacle" },
        { "FW0uBAWV9d_9K9Dl2ZTYMn6iJHd", "E02-Endurance" },
        { "DTq2M5w_EKfxPgXLRJ29kHndMYj", "E03-Endurance" },
        { "xedOkArRfmIHfm9VFnKrLsOQ4hd", "E04-Obstacle" },
        { "eMBnCjky7WmlP9G0R9xOrNFQV7c", "E05-Endurance" }
    };

    settings.Add("SplitOnMapFinish", true, "Auto split on map finish.");
    foreach (var map in vars.Maps.Values)
    {
        settings.Add(map, true, map, "SplitOnMapFinish");
    }
}

init
{
    vars.MapChanged = false;
    vars.CurrentMap = string.Empty;
    vars.StartedMap = string.Empty;
}

update
{
    timer.IsGameTimePaused = false;
    vars.MapChanged = false;

    if (timer.CurrentPhase == TimerPhase.NotRunning)
    {
        vars.StartedMap = string.Empty;
    }

    if (!current.LoadingState && current.GameInfo != old.GameInfo)
    {
        var map = default(string);
        if (vars.Maps.TryGetValue(current.GameInfo, out map))
        {
            vars.MapChanged = !vars.CurrentMap.StartsWith(map);
            vars.CurrentMap = map;
        }
    }

    if (current.LoadingState != old.LoadingState) print("[ASL] LoadingState: " + current.LoadingState.ToString());
    if (current.RaceState != old.RaceState) print("[ASL] RaceState: " + current.RaceState.ToString());
    if (current.GameInfo != old.GameInfo) print("[ASL] GameInfo: " + current.GameInfo.ToString());
    if (vars.MapChanged) print("[ASL] CurrentMap: " + vars.CurrentMap);
}

isLoading
{
    return current.LoadingState;
}

start
{
    if (old.LoadingState && !current.LoadingState)
    {
        vars.StartedMap = vars.CurrentMap;
        return true;
    }
    return false;
}

reset
{
    return vars.MapChanged
        && vars.CurrentMap.StartsWith(vars.StartedMap);
}

split
{
    return old.RaceState == 1
        && current.RaceState == 2
        && !current.LoadingState
        && settings[vars.CurrentMap];
}

exit
{
    if (timer.CurrentPhase == TimerPhase.Running || timer.CurrentPhase == TimerPhase.Paused)
    {
        timer.IsGameTimePaused = true;
    }
}