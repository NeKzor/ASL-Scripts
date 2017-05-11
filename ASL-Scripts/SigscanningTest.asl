state("ManiaPlanet")	// 05/11/2017 08:47:58 AM (0x198C000)
{
}

init
{
	var Module = modules.First();
	print("[ASL] : ModuleName = " + Module.ModuleName.ToString());
	print("[ASL] : ModuleMemorySize = 0x" + Module.ModuleMemorySize.ToString("X"));
	print("[ASL] : BaseAddress = 0x" + Module.BaseAddress.ToString("X"));

	var LoadingTarget = new SigScanTarget(9, "83 3D ?? ?? ?? ?? 00",	// cmp dword ptr [ManiaPlanet.exe+17B4220],00
											 "8B 0D ?? ?? ?? ??",		// mov ecx,[ManiaPlanet.exe+17B4224]
											 "75 08",					// jne ManiaPlanet.exe+7E7B77
											 "85 C9");					// test ecx,ecx

	var MapTarget = new SigScanTarget(5, "FF 75 38",					// push [ebp+38]
										 "FF 35 ?? ?? ?? ??",			// push [ManiaPlanet.exe+1771598]
										 "E8 ?? ?? ?? ??",				// call ManiaPlanet.exe+BFD4D0
										 "83 C4 0C",					// add esp,0C
										 "8D 4D 38");					// lea ecx,[ebp+38]

	var CpsTarget = new SigScanTarget(12, "89 41 04",					// mov [ecx+04],eax
										  "C7 41 08 ?? ?? ?? ??",		// mov [ecx+08],00000000
										  "8B 0D ?? ?? ?? ??",			// mov ecx,[ManiaPlanet.exe+17B3E40]
										  "E8 ?? ?? ?? ??",				// call ManiaPlanet.exe+7D5F40
										  "85 DB");						// test ebx,ebx

	LoadingTarget.OnFound = (proc, _, ptr) => proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
	MapTarget.OnFound = (proc, _, ptr) => proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
	CpsTarget.OnFound = (proc, _, ptr) => proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;

	var Scanner = new SignatureScanner(game, Module.BaseAddress, Module.ModuleMemorySize);
	var LoadingPtr = Scanner.Scan(LoadingTarget);
	var MapPtr = Scanner.Scan(MapTarget);
	var CpsPtr = Scanner.Scan(CpsTarget);
	print("[ASL] : LoadingPtr = " + LoadingPtr.ToString("X"));
	print("[ASL] : MapPtr = " + MapPtr.ToString("X"));
	print("[ASL] : CpsPtr = " + CpsPtr.ToString("X"));

	var Loading = game.ReadValue<int>((IntPtr)LoadingPtr);
	var Map = game.ReadString((IntPtr)game.ReadValue<int>((IntPtr)MapPtr) + 0x0, 33);
	var Cps = game.ReadValue<int>((IntPtr)game.ReadValue<int>((IntPtr)CpsPtr + 0x14) + 0xAC);
	print("[ASL] : Loading = " + Loading.ToString());
	print("[ASL] : Map = " + Map);
	print("[ASL] : Cps = " + Cps.ToString());
}