state("ManiaPlanet")	// 1.3.3.0
{
	bool LoadingState	: "ManiaPlanet.exe", 0x001323D34, 0x44, 0x228, 0x4B0, 0x4D8, 0x758;
	string11 MapName	: "ManiaPlanet.exe", 0x00133972C, 0x1C;
	int CpCounterLap	: "ManiaPlanet.exe", 0x0012F0D84, 0x20C, 0xA4, 0x1C, 0x384, 0x68;
	int CpCounterTotal	: "ManiaPlanet.exe", 0x001307A4C, 0x34, 0x50, 0x3A0, 0x384, 0x9C;
	// For offline mode
	//bool LoadingState	: "ManiaPlanet.exe", 0x00133A740, 0x14;
}

startup
{
	settings.Add("SplitOnMenu", true, "Auto split when leaving a map.");
	settings.Add("SplitOnMap", false, "Auto split before loading screen.");
}

init
{
	vars.FirstMap = "'$fff$sA01'";
	vars.LastMap = "'$fff$sE05'";
}

start
{
	return (current.MapName == vars.FirstMap)
		&& !(current.LoadingState);
}

reset
{
	return (old.MapName != current.MapName)
		&& (current.MapName == vars.FirstMap);
}

isLoading
{
	return current.LoadingState;
}

split
{
	// Split when finishing all 15 laps on the very last map
	if (current.MapName == vars.LastMap)
	{
		if ((current.CpCounterTotal == (10 * 15) - 1)	// Last check point
		&& (old.CpCounterLap == 9)						// Transition to finish line
		&& (current.CpCounterLap == 0))
			return true;
	}
	// Split on map change
	if (old.MapName != current.MapName)
	{
		if ((settings["SplitOnMenu"])
		&& (current.MapName == "'Unnamed', "))
			return true;
		if ((settings["SplitOnMap"])
		&& (old.MapName == "'Unnamed', "))
			return true;
	}
	return false;
}