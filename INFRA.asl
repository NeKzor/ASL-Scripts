state("infra")
{
	// 6905
	// 2017-10-02 02:26:10 PM
	// 0x6C000
	// https://github.com/NeKzor
}

startup
{
	// Memory stuff, mostly stolen from https://github.com/fatalis/SourceSplit
	vars.EngineDll = new MemoryWatcherList();
	vars.MapName = new StringWatcher(IntPtr.Zero, ReadStringType.ASCII, 64);
	vars.Ticks = new MemoryWatcher<int>(IntPtr.Zero);
	vars.Tps = new MemoryWatcher<int>(IntPtr.Zero);
	vars.Host = new MemoryWatcher<int>(IntPtr.Zero);
	vars.Server = new MemoryWatcher<int>(IntPtr.Zero);
	vars.SignOn = new MemoryWatcher<int>(IntPtr.Zero);
	vars.TryInitEngine = (Func<Process, ProcessModuleWow64Safe, bool>)((gameProc, module) =>
	{
		// CBaseServer::m_State
		// \x83\xF8\x01\x0F\x8C\x00\x00\x00\x00\x3D\x00\x02\x00\x00\x0F\x8F\x00\x00\x00\x00\x83\x3d\x00\x00\x00\x00\x02\x7D xxxxx??xxxxxxxxx??xxxx????xx
		var StateTarget = new SigScanTarget(22, "83 F8 01 0F 8C ?? ?? 00 00 3D 00 02 00 00 0F 8F ?? ?? 00 00 83 3d ?? ?? ?? ?? 02 7D");
		
		// CGlobalVarsBase::curtime
		// \x89\x96\xC4\x00\x00\x00\x8B\x86\xC8\x00\x00\x00\x8B\xCE\xA3\x00\x00\x00\x00\xE8\x00\x00\x00\x00\xD9\x1D\x00\x00\x00\x00\x8B\xCE\xE8\x00\x00\x00\x00\xD9\x1D xxxxxxxxxxxxxxx????x????xx????xxx????xx
		var TimeTarget = new SigScanTarget(26, "89 96 C4 00 00 00 8B 86 C8 00 00 00 8B CE A3 ?? ?? ?? ?? E8 ?? ?? ?? ?? D9 1D ?? ?? ?? ?? 8B CE E8 ?? ?? ?? ?? D9 1D");

		// CBaseClientState::m_nSignOnState
		// \x74\x00\x8B\x74\x87\x04\x83\x7E\x18\x00\x74\x2D\x8B\x0D\x00\x00\x00\x00\x8B\x49\x18 x?xxxxxxxxxxxx????xxx
		var SignOnStateTarget = new SigScanTarget(14, "74 ?? 8B 74 87 04 83 7E 18 00 74 2D 8B 0D ?? ?? ?? ?? 8B 49 18");
		
		// CBaseServer::m_szMapname[64]
		// \x76\x50\x80\x3D\x00\x00\x00\x00\x00\xB8\x00\x00\x00\x00 xxxx?????x????
		var MapnameTarget = new SigScanTarget(10, "76 50 80 3D ?? ?? ?? ?? ?? B8 ?? ?? ?? ??");
		// \xD9\x00\x2C\xD9\xC9\xDF\xF1\xDD\xD8\x76\x00\x80\x00\x00\x00\x00\x00\x00 x?xxxxxxxx?x?????x
		MapnameTarget.AddSignature(13, "D9 ?? 2C D9 C9 DF F1 DD D8 76 ?? 80 ?? ?? ?? ?? ?? 00");

		// CHostState::m_currentState
		// \xC7\x05\x00\x00\x00\x00\x07\x00\x00\x00\xC3 xx????xxxxx
		var CurrentStateTarget = new SigScanTarget(2, "C7 05 ?? ?? ?? ?? 07 00 00 00 C3");
		
		StateTarget.OnFound = (proc, _, ptr) =>
		{
			print("[ASL] StateTarget = 0x" + ptr.ToString("X"));
			return proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
		};
		TimeTarget.OnFound = (proc, _, ptr) =>
		{
			print("[ASL] TimeTarget = 0x" + ptr.ToString("X"));
			return proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
		};
		SignOnStateTarget.OnFound = (proc, _, ptr) =>
		{
			print("[ASL] SignOnStateTarget = 0x" + ptr.ToString("X"));
			return proc.ReadPointer(ptr, out ptr) ? proc.ReadPointer(ptr, out ptr) ? ptr + 0x70 : IntPtr.Zero : IntPtr.Zero;
		};
		MapnameTarget.OnFound = (proc, _, ptr) =>
		{
			print("[ASL] MapnameTarget = 0x" + ptr.ToString("X"));
			return proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
		};
		CurrentStateTarget.OnFound = (proc, _, ptr) =>
		{
			print("[ASL] CurrentStateTarget = 0x" + ptr.ToString("X"));
			return proc.ReadPointer(ptr, out ptr) ? ptr - 4 : IntPtr.Zero;
		};
		
		var Scanner = new SignatureScanner(gameProc, module.BaseAddress, module.ModuleMemorySize);
		var StateAddr = Scanner.Scan(StateTarget);
		var TimeAddr = Scanner.Scan(TimeTarget);
		var SignOnStateAddr = Scanner.Scan(SignOnStateTarget);
		var MapnameAddr = Scanner.Scan(MapnameTarget);
		var CurrentStateAddr = Scanner.Scan(CurrentStateTarget);
		
		print("[ASL] StateAddr = 0x" + StateAddr.ToString("X"));
		print("[ASL] TimeAddr = 0x" + TimeAddr.ToString("X"));
		print("[ASL] SignOnStateAddr = 0x" + SignOnStateAddr.ToString("X"));
		print("[ASL] MapnameAddr = 0x" + MapnameAddr.ToString("X"));
		print("[ASL] CurrentStateAddr = 0x" + CurrentStateAddr.ToString("X"));
		
		if ((StateAddr != IntPtr.Zero)
			&& (TimeAddr != IntPtr.Zero)
			&& (MapnameAddr != IntPtr.Zero)
			&& (SignOnStateAddr != IntPtr.Zero)
			&& (CurrentStateAddr != IntPtr.Zero))
		{
			print("[ASL] Engine Scan Completed!");
			
			vars.Ticks = new MemoryWatcher<int>(TimeAddr + 12);		// tickcount
			vars.Tps = new MemoryWatcher<float>(TimeAddr + 12 + 4);	// interval_per_tick
			vars.SignOn = new MemoryWatcher<int>(SignOnStateAddr);
			vars.Host = new MemoryWatcher<int>(CurrentStateAddr);
			vars.Server = new MemoryWatcher<int>(StateAddr);
			vars.MapName = new StringWatcher(MapnameAddr, ReadStringType.ASCII, 64);
			
			vars.EngineDll.Clear();
			vars.EngineDll.AddRange(new MemoryWatcher[]
			{
				vars.Ticks,			// Timing logic
				vars.Tps,			// Timing logic
				vars.SignOn,		// Timing and splitting logic
				vars.Host,			// Timing and splitting logic
				vars.Server,		// Timing logic (unused)
				vars.MapName		// Splitting logic
			});
			vars.EngineDll.UpdateAll(gameProc);
			return true;
		}
		print("[ASL] Engine Scan Failed!");
		return false;
	});
	vars.ServerDll = new MemoryWatcherList();
	vars.CEntInfoSize = 4 * 6;
	vars.Entities = IntPtr.Zero;
	vars.TargetNameOffset = -1;
	vars.FlagsOffset = -1;
	vars.AbsOriginOffset = -1;
	vars.ViewEntityOffset = -1;
	vars.ParentEntityOffset = -1;
	vars.Flags = new MemoryWatcher<int>(IntPtr.Zero);
	vars.Position = new MemoryWatcher<int>(IntPtr.Zero);
	vars.ViewEntity = new MemoryWatcher<int>(IntPtr.Zero);
	vars.ParentEntity = new MemoryWatcher<int>(IntPtr.Zero);
	vars.TryInitServer = (Func<Process, ProcessModuleWow64Safe, bool>)((gameProc, module) =>
	{
		// CBaseEntityList::m_EntPtrArray[4096]
		// \x6A\x00\x6A\x00\x50\x6A\x00\xB9\x00\x00\x00\x00\xE8 xxxxxxxx????x
		var EntitiesTarget = new SigScanTarget(8, "6A 00 6A 00 50 6A 00 B9 ?? ?? ?? ?? E8");
		
		EntitiesTarget.OnFound = (proc, _, ptr) =>
		{
			print("[ASL] EntitiesTarget = 0x" + ptr.ToString("X"));
			return proc.ReadPointer(ptr, out ptr) ? ptr + 4 : IntPtr.Zero;
		};
		
		var Scanner = new SignatureScanner(gameProc, module.BaseAddress, module.ModuleMemorySize);
		var EntitiesAddr = Scanner.Scan(EntitiesTarget);
		print("[ASL] EntitiesAddr = 0x" + EntitiesAddr.ToString("X"));
		
		if (EntitiesAddr != IntPtr.Zero)
		{
			var Serial = 0;
			gameProc.ReadValue(EntitiesAddr + 4 * 7, out Serial);
			vars.CEntInfoSize = ((Serial > 0) && (Serial < 0x7FFF))	// SERIAL_MASK
				? 4 * 6		// portal2
				: 4 * 4;	// hl2
			
			// Offsets
			vars.TargetNameOffset = vars.GetBaseEntityMemberOffset("m_iName", gameProc, Scanner);
			vars.FlagsOffset = vars.GetBaseEntityMemberOffset("m_fFlags", gameProc, Scanner);
			vars.AbsOriginOffset = vars.GetBaseEntityMemberOffset("m_vecAbsOrigin", gameProc, Scanner);
			vars.ViewEntityOffset = vars.GetBaseEntityMemberOffset("m_hViewEntity", gameProc, Scanner);
			vars.ParentEntityOffset = vars.GetBaseEntityMemberOffset("m_nTransmitStateOwnedCounter", gameProc, Scanner);
			if (vars.ParentEntityOffset < 0)
				vars.ParentEntityOffset = vars.GetBaseEntityMemberOffset("m_iParentAttachment", gameProc, Scanner) - 4;
			vars.ParentEntityOffset -= 4;
			
			print("[ASL] CEntInfoSize = " + vars.CEntInfoSize);
			print("[ASL] TargetNameOffset = " + vars.TargetNameOffset);
			print("[ASL] FlagsOffset = " + vars.FlagsOffset);
			print("[ASL] AbsOriginOffset = " + vars.AbsOriginOffset);
			print("[ASL] ViewEntityOffset = " + vars.ViewEntityOffset);
			print("[ASL] ParentEntityOffset = " + vars.ParentEntityOffset);
			
			if ((vars.TargetNameOffset > -1)
				&& (vars.FlagsOffset > -1)
				&& (vars.AbsOriginOffset > -1)
				&& (vars.ViewEntityOffset > -1)
				&& (vars.ParentEntityOffset > -1))
			{
				print("[ASL] Server Scan Completed!");
				vars.Entities = EntitiesAddr;
				
				if ((vars.SignOn.Current == vars.SignOnStates["Full"]) && (vars.TryUpdatePlayer(gameProc)))
					vars.ServerDll.UpdateAll(gameProc);
				return true;
			}
		}
		print("[ASL] Server Scan Failed!");
		return false;
	});
	// Called when player has spawned
	vars.TryUpdatePlayer = (Func<Process, bool>)((gameProc) =>
	{
		var PlayerAddr = vars.GetEntityByIndex(1, gameProc);
		print("[ASL] PlayerAddr = 0x" + PlayerAddr.ToString("X"));
		
		if (PlayerAddr != IntPtr.Zero)
		{
			print("[ASL] Player Update Completed!");
			vars.Flags = new MemoryWatcher<int>((IntPtr)(PlayerAddr + vars.FlagsOffset));
			vars.Position = new MemoryWatcher<int>((IntPtr)(PlayerAddr + vars.AbsOriginOffset));
			vars.ViewEntity = new MemoryWatcher<int>((IntPtr)(PlayerAddr + vars.ViewEntityOffset));
			vars.ParentEntity = new MemoryWatcher<int>((IntPtr)(PlayerAddr + vars.ParentEntityOffset));
			
			vars.ServerDll.Clear();
			vars.ServerDll.AddRange(new MemoryWatcher[]
			{
				vars.Flags,			// Splitting logic
				vars.Position,		// Splitting logic
				vars.ViewEntity,	// Splitting logic
				vars.ParentEntity	// Splitting logic
			});
			return true;
		}
		print("[ASL] Update Player Failed!");
		return false;
	});
	// Get offset of member entity by name. Usage: var Offset = vars.GetBaseEntityMemberOffset("m_EntityName", gameProcess, serverDllSigscanner);
	vars.GetBaseEntityMemberOffset = (Func<string, Process, SignatureScanner, int>)((member, gameProc, sigScanner) =>
	{
		var StringPtr = sigScanner.Scan(new SigScanTarget(0, Encoding.ASCII.GetBytes(member)));
		if (StringPtr != IntPtr.Zero)
		{
			var Bytes = BitConverter.GetBytes(StringPtr.ToInt32());
			var Target = new SigScanTarget(10, string.Format("C7 05 ?? ?? ?? ?? {0:X02} {1:X02} {2:X02} {3:X02}", Bytes[0], Bytes[1], Bytes[2], Bytes[3]));
			Target.OnFound = (proc, _, ptr) =>
			{
				var temp = new SignatureScanner(proc, ptr, 256);
				return temp.Scan(new SigScanTarget(6, "C7 05 ?? ?? ?? ?? ?? ?? 00 00"));
			};
			
			var Addr = sigScanner.Scan(Target);
			if (Addr == IntPtr.Zero)
			{
				Target = new SigScanTarget(1, string.Format("68 ?? ?? ?? ?? 68 {0:X02} {1:X02} {2:X02} {3:X02}", Bytes[0], Bytes[1], Bytes[2], Bytes[3]));
				Addr = sigScanner.Scan(Target);
				if (Addr == IntPtr.Zero)
					return -1;
			}
			var Offset = -1;
			if (gameProc.ReadValue(Addr, out Offset))
				return Offset;
		}
		return -1;
	});
	// "magical code" - fatalis
	// Get *m_pEntity in m_EntPtrArray by index. Usage: var PlayerPtr = vars.GetEntityByIndex(1, game);
	vars.GetEntityByIndex = (Func<int, Process, IntPtr>)((index, gameProc) =>
	{
		var Entity = IntPtr.Zero;
		gameProc.ReadPointer((IntPtr)(vars.Entities + vars.CEntInfoSize * index), false, out Entity);
		return Entity;
	});
	// Get *m_pEntity in m_EntPtrArray by name. Usage: var VehiclePtr = vars.GetEntityByName("ending_vehicle", game);
	vars.GetEntityByName = (Func<string, Process, IntPtr>)((entityName, gameProc) =>
	{
		var EntityPtr = IntPtr.Zero;
		for (int index = 0; index < 4096; index++)	// NUM_ENT_ENTRIES
		{
			EntityPtr = vars.GetEntityByIndex(index, gameProc);
			if (EntityPtr == IntPtr.Zero)
				continue;
			
			var NamePtr = IntPtr.Zero;
			gameProc.ReadPointer((IntPtr)(EntityPtr + vars.TargetNameOffset), false, out NamePtr);
			if (NamePtr == IntPtr.Zero)
				continue;
			
			var NameMatch = string.Empty;
			gameProc.ReadString(NamePtr, ReadStringType.ASCII, 32, out NameMatch);
			if (NameMatch == entityName)
				continue;
			print("[ASL] " + entityName + " = 0x" + EntityPtr.ToString("X") + " (Entities[" + index + "])");
			break;
		}
		return EntityPtr;
	});
	
	// Category stuff
	vars.GetCategory = (Func<string>)(() =>
	{
		// From Splits Editor
		switch (timer.Run.CategoryName)
		{
			case "Any%":
			case "Beat Part 1":
			case "Beat Part 2":
			case "Beat Part 3":
				return timer.Run.CategoryName;
			default:
				return "Any%";
		}
	});
	vars.GetFirstMap = (Func<string>)(() =>
	{
		switch (vars.GetCategory() as string)
		{
			case "Any%":
			case "Beat Part 1":
				return "infra_c1_m1_office";
			case "Beat Part 2":
				return "infra_c6_m1_sewer3";
			case "Beat Part 3":
				return "infra_c8_m1_powerstation2";
			default:
				return "infra_c1_m1_office";
		}
	});
	vars.GetLastMap = (Func<string>)(() =>
	{
		switch (vars.GetCategory() as string)
		{
			case "Beat Part 1":
				return "infra_c5_m2b_sewer2";
			case "Beat Part 2":
				return "infra_c7_m5_powerstation";
			case "Any%":
			case "Beat Part 3":
				return "infra_c11_ending_1";
			default:
				return "infra_c11_ending_1";
		}
	});
	
	// Source Engine stuff
	// In protocol.h
	vars.SignOnStates = new Dictionary<string, int>()
	{
		{ "None",			0 },
		{ "Challenge",		1 },
		{ "Connected",		2 },
		{ "New",			3 },
		{ "PreSpawn",		4 },
		{ "Spawn",			5 },
		{ "Full",			6 },
		{ "ChangeLevel",	7 }
	};
	// HOSTSTATES
	vars.HostStates = new Dictionary<string, int>()
	{
		{ "NewGame", 				0 },
		{ "LoadGame",				1 },
		{ "LoadGameWithoutRestart",	2 },	// NEW
		{ "ChangeLevelSp",			3 },
		{ "ChangeLevelMp",			4 },
		{ "Run",					5 },
		{ "GameShutdown",			6 },
		{ "Shutdown",				7 },
		{ "Restart",				8 },
		{ "RestartWithoutRestart",	9 }		// NEW
	};
	// server_state_t
	vars.ServerStates = new Dictionary<string, int>()
	{
		{ "Dead",		0 },
		{ "Loading",	1 },
		{ "Active",		2 },
		{ "Paused",		3 }
	};
	
	// Timer stuff
	vars.TotalTicks = 0;		// Total amount of in-game ticks
	vars.BaseTick = 0;			// First tick when player spawned
	vars.SessionTicks = 0;		// Current in-game tick
	vars.OffsetTick = 0;		// First tick when timer started
	vars.StartedManually = true;
	
	// Settings
	settings.Add("SplitOptions", true, "Advanced split options:");
	settings.Add("SplitOnMapChange", true, "Auto split on map change.", "SplitOptions");
	settings.Add("SplitOnMenu", true, "Auto split on menu.", "SplitOptions");
	settings.Add("StartOptions", false, "Advanced start options:");
	settings.Add("StartOnUnfrozen", false, "Auto start when player unfrozen.", "StartOptions");
	settings.Add("StartOnViewEntityChanged", false, "Auto start when player view entity changed.", "StartOptions");
	settings.Add("StartOnParentEntityChanged", false, "Auto start when player parent entity changed.", "StartOptions");
	settings.Add("SmartSplit", false, "Allow to auto start on any map.", "StartOptions");
}

init
{
	vars.Init = false;
	
	vars.TotalTicks += vars.SessionTicks - vars.OffsetTick;
	vars.SessionTicks = 0;
	vars.OffsetTick = 0;
	vars.BaseTick = 0;
	
	vars.CurrentMap = string.Empty;
	vars.PreviousMap = string.Empty;
	vars.SkipBaseTick = false;
	
	// Throw automatically until modules have loaded
	vars.EngineModule = modules.First(m => m.ModuleName == "engine.dll");
	vars.ServerModule = modules.First(m => m.ModuleName == "server.dll");
	print("[ASL] EngineModule = " + vars.EngineModule.ModuleName);
	print("[ASL] ServerModule = " + vars.ServerModule.ModuleName);
}

update
{
	if (vars.Init)
	{
		// We use gameTime
		timer.IsGameTimePaused = true;
		
		if (timer.CurrentPhase == TimerPhase.NotRunning)
		{
			vars.TotalTicks = 0;
			vars.SessionTicks = 0;
			vars.OffsetTick = 0;
			vars.BaseTick = 0;
		}
		
		vars.EngineDll.UpdateAll(game);
		if (vars.Host.Changed) print("[ASL] Host = " + (vars.HostStates as Dictionary<string, int>).First(x => x.Value == vars.Host.Current).Key);
		if (vars.Server.Changed) print("[ASL] Server = " + (vars.ServerStates as Dictionary<string, int>).First(x => x.Value == vars.Server.Current).Key);
		if (vars.SignOn.Changed) print("[ASL] SignOn = " + (vars.SignOnStates as Dictionary<string, int>).First(x => x.Value == vars.SignOn.Current).Key);
		//if (vars.Ticks.Changed) print("[ASL] Ticks = " + vars.Ticks.Current);
		if (vars.Tps.Changed) print("[ASL] Tps = " + vars.Tps.Current);
		
		vars.PreviousMap = vars.CurrentMap;
		if ((vars.MapName.Changed) && (vars.MapName.Current != string.Empty))
		{
			print("[ASL] MapName = " + vars.MapName.Current);
			vars.CurrentMap = vars.MapName.Current;
		}
		
		// When loaded
		if ((vars.SignOn.Current == vars.SignOnStates["Full"]) && (vars.Host.Current == vars.HostStates["Run"]))
		{
			// When spawning
			if (vars.SignOn.Changed)
			{
				print("[ASL] Player Spawned! (" + vars.Ticks.Current + ")");
				vars.BaseTick = vars.Ticks.Current;
				vars.TryUpdatePlayer(game);
			}
			else if ((vars.Host.Changed) && (vars.Host.Old == vars.HostStates["LoadGameWithoutRestart"]))
			{
				print("[ASL] Player Re-Spawned! (" + vars.Ticks.Current + ")");
				vars.BaseTick = vars.Ticks.Current;
			}
			
			// INFRA devs make me cry >:(
			if (vars.Ticks.Current - vars.BaseTick < 0)
				vars.BaseTick = vars.Ticks.Current;
			else
				vars.SessionTicks = vars.Ticks.Current - vars.BaseTick;
			
			vars.ServerDll.UpdateAll(game);
			//if (vars.Flags.Changed) print("[ASL] Flags = " + vars.Flags.Current);
			//if (vars.Position.Changed) print("[ASL] Position = " + vars.Position.Current);
			//if (vars.ViewEntity.Changed) print("[ASL] ViewEntity = " + vars.ViewEntity.Current);
			//if (vars.ParentEntity.Changed) print("[ASL] ParentEntity = " + vars.ParentEntity.Current);
			
			// INFRA doesn't use pauses
			//if (vars.Server.Changed)
			//{
			//	if (vars.Server.Current == vars.ServerStates["Paused"])
			//		print("[ASL] Server Paused!");
			//	else if (vars.Server.Current == vars.ServerStates["Active"])
			//		print("[ASL] Server Unpaused!");
			//}
		}
		
		// When loading
		if ((vars.Host.Changed) && (vars.Host.Old == vars.HostStates["Run"]))
		{
			print("[ASL] Player Destroyed! (from " + vars.BaseTick + " to " + vars.Ticks.Current + " is " + vars.SessionTicks + " ticks)");
			vars.TotalTicks += vars.SessionTicks - vars.OffsetTick;
			vars.SessionTicks = 0;
			vars.OffsetTick = 0;
			vars.BaseTick = 0;
		}
	}
	else
	{
		return vars.Init = vars.TryInitEngine(game, vars.EngineModule) && vars.TryInitServer(game, vars.ServerModule);
	}
}

gameTime
{
	return TimeSpan.FromSeconds((vars.TotalTicks + vars.SessionTicks - vars.OffsetTick) * vars.Tps.Current);
}

start
{
	// Not loaded yet
	if ((vars.SignOn.Current != vars.SignOnStates["Full"]) || (vars.Host.Current != vars.HostStates["Run"]))
		return false;
	
	// Not on first map
	if ((!settings["SmartSplit"]) && (vars.CurrentMap != vars.GetFirstMap()))
		return false;
	
	// Custom start
	if ((settings["StartOnUnfrozen"]) || (settings["StartOnUnfrozen"]) || (settings["StartOnUnfrozen"]))
	{
		if ((settings["StartOnUnfrozen"])
			&& (vars.ParentEntity.Changed)
			&& ((vars.Flags.Current & (1 << 5)) != 0)	// FL_FROZEN
			&& ((vars.Flags.Old & (1 << 5)) == 0))
		{
			print("[ASL] Timer Started: Player's Flags Removed FL_FROZEN!");
			vars.OffsetTick = vars.SessionTicks;
			return true;
		}
		if ((settings["StartOnViewEntityChanged"])
			&& (vars.ViewEntity.Changed)
			&& (((vars.ViewEntity.Current == -1) ? 1 : vars.ViewEntity.Current & 0x7FF) == 1)
			&& (((vars.ViewEntity.Old == -1) ? 1 : vars.ViewEntity.Old & 0x7FF) != 1))
		{
			print("[ASL] Timer Started: Player's ViewEntity Changed!");
			vars.OffsetTick = vars.SessionTicks;
			return true;
		}
		if ((settings["StartOnParentEntityChanged"])
			&& (vars.ParentEntity.Changed)
			&& (vars.ParentEntity.Current == -1)
			&& (vars.ParentEntity.Old != -1))
		{
			print("[ASL] Timer Started: Player's ParentEntity Changed!");
			vars.OffsetTick = vars.SessionTicks;
			return true;
		}
	}
	// Default
	else
	{
		// load, reload, changelevel, restart_level, map etc.
		if ((vars.SignOn.Changed)
			&& (vars.SignOn.Current == vars.SignOnStates["Full"])
			&& (vars.Host.Current == vars.HostStates["Run"]))
		{
			print("[ASL] Timer Started: Map Load!");
			vars.OffsetTick = vars.SessionTicks;
			return true;
		}
		// reload_fast
		else if ((vars.Host.Changed) && (vars.Host.Old == vars.HostStates["LoadGameWithoutRestart"]))
		{
			print("[ASL] Timer Started: Map Re-Load!");
			vars.OffsetTick = vars.SessionTicks;
			return true;
		}
	}
	
	// TODO: Start of category
	return false;
}

split
{
	// Map change
	if ((settings["SplitOnMapChange"]) && (vars.CurrentMap != vars.PreviousMap))
	{
		if ((vars.MapName.Current == "main_menu") && (!settings["SplitOnMenu"]))
		{
			print("[ASL] Menu Split Prevented!");
		}
		else
		{
			print("[ASL] Map Change Split!");
			return true;
		}
	}
	
	// TODO: End of category
	if (vars.CurrentMap != vars.GetLastMap())
		return false;
	
	switch (vars.CurrentMap as string)
	{
		default:
			break;
	}
	return false;
}