state("infra", "1.1.1")	// 16:37:16 Feb 13 2016 (6307) 
{
	bool LoadingState	: "engine.dll", 0x0047CCD4;
	string64 MapName	: "engine.dll", 0x00663E10;
	int EndingButton	: "engine.dll", 0x00452320, 0xCC, 0x20, 0x21C, 0x54;
}

state("infra", "2.3.3")	// 17:32:41 Feb 15 2017 (6675) 
{
	bool LoadingState	: "engine.dll", 0x00458C04;
	string64 MapName	: "engine.dll", 0x0063FB68;
	int EndingButton	: "server.dll", 0x00789DC8, 0x140;
}

init
{
	vars.FirstMap = "infra_c1_m1_office";
	vars.LatestMap = string.Empty;
	switch (modules.First(module => string.Equals(module.ModuleName, "engine.dll", StringComparison.CurrentCultureIgnoreCase)).ModuleMemorySize.ToString("X"))
	{
		case "757000":
			version = "1.1.1";
			vars.LastMap = "infra_c5_m2b_sewer2";
			break;
		case "73D000":
			version = "2.3.3";
			vars.LastMap = "infra_c7_m5_powerstation";
			break;
	}
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
	// Split on last button press
	if (version == "1.1.1")
	{
		if ((current.MapName == vars.LastMap)
		&& (old.EndingButton == 1)
		&& (current.EndingButton == 0)
		&& !(current.LoadingState))
			return true;
	}
	else if (version == "2.3.3")
	{
		if ((current.MapName == vars.LastMap)
		&& (old.EndingButton == 0)
		&& (current.EndingButton == 1))
			return true;
	}
	// Split on map change
	vars.LatestMap = (vars.LatestMap == string.Empty) ? old.MapName : vars.LatestMap;
	if (old.MapName != current.MapName)
	{
		if (current.MapName == string.Empty)
			vars.LatestMap = old.MapName;
		else if (vars.LatestMap != current.MapName)
			return true;
	}
	return false;
}