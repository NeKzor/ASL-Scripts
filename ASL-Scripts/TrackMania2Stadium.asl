state("ManiaPlanet")	// 05/11/2017 08:47:58 AM (0x198C000)
{
	bool LoadingState	: "ManiaPlanet.exe", 0x0017B4224;
	string33 MapName	: "ManiaPlanet.exe", 0x001771550, 0x0;
	int CpCounter		: "ManiaPlanet.exe", 0x0017B3E40, 0x14, 0xAC;
}

startup
{
	settings.Add("SplitOnMenu", true, "Auto split when leaving a map.");
	settings.Add("SplitOnMap", false, "Auto split before loading screen.");
}

init
{
	timer.IsGameTimePaused = false;
	// Change these variables for other categories
	vars.FirstMap = "[Game] init challenge '$fff$sA01'";
	vars.LastMap = "[Game] init challenge '$fff$sE05'";
	vars.TotalCps = 10 * 15;
}

start
{
	return (current.MapName == vars.FirstMap) && !(current.LoadingState);
}

reset
{
	return (old.MapName != current.MapName) && (current.MapName == vars.FirstMap);
}

isLoading
{
	return current.LoadingState;
}


split
{
	// Split when finishing all laps on the very last map
	if ((current.MapName == vars.LastMap) && (old.CpCounter == vars.TotalCps - 1) && (current.CpCounter == vars.TotalCps))
		return true;
	// Split on map change
	if (old.MapName != current.MapName)
	{
		if ((settings["SplitOnMenu"]) && (current.MapName.StartsWith("[Game] main menu")) && (old.MapName.StartsWith("[Game] init challenge")))
			return true;
		if ((settings["SplitOnMap"]) && (old.MapName.StartsWith("[Game] main menu")) && (current.MapName.StartsWith("[Game] init challenge")))
			return true;
	}
	return false;
}

exit
{
	timer.IsGameTimePaused = true;
}