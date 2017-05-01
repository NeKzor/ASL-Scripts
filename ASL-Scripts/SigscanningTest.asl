state("ManiaPlanet")	// 1.3.3.0
{
	string11 MapName	: "ManiaPlanet.exe", 0x00133972C, 0x1C;
}

init
{
	var module = modules.First();
	print("[ASL] : ModuleMemorySize = " + module.ModuleMemorySize.ToString("X"));
	print("[ASL] : ModuleName = " + module.ModuleName.ToString());

	var target = new SigScanTarget(7, "50",						// push eax
									  "E8 ?? ?? ?? ??",			// call ManiaPlanet.exe+9EC0
									  "A1 ?? ?? ?? ??",			// mov eax,[ManiaPlanet.exe+133972C]
									  "89 44 24 10",			// mov [esp+10],eax
									  "A1 ?? ?? ?? ??",			// mov eax,[ManiaPlanet.exe+1339728]
									  "89 44 24 14",			// mov [esp+14],eax
									  "8D 44 24 10",			// lea eax,[esp+10]
									  "50");					// push eax
	target.OnFound = (proc, _, ptr) => proc.ReadPointer(ptr, out ptr) ? ptr : IntPtr.Zero;
	var pointer = scanner.Scan(new SignatureScanner(game, module.BaseAddress, module.ModuleMemorySize));
	var address = game.ReadValue<int>(pointer);
	var value = game.ReadString((IntPtr)address + 0x1C, 11);	// "[GameCtnApp] init challenge "
	print("[ASL] : Pointer = 0x" + pointer.ToString("X"));
	print("[ASL] : Address = 0x" + address.ToString("X"));
	print("[ASL] : Value = " + value);
	if (current.MapName != value)
		System.Windows.Forms.MessageBox.Show("YOU IDOIT!", "ASL");
}