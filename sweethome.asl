
/*
+++ RAM Map +++
https://github.com/periwinkle9/smb-autosplitter for the base address.
screen     0x50 // 0x0300 = rename, 0x0101 = title/clear(need clear flag)
clear1     0x309
clear2     0x3FF
*/

state("fceux", "2.2.3") 
{
    short screen: 0x3B1388, 0x50;
    byte clear1:  0x3B1388, 0x309;
    byte clear2:  0x3B1388, 0x3FF;
}

state("fceux", "2.3.0")
{
    short screen: 0x44962C, 0x50;
    byte clear1:  0x44962C, 0x309;
    byte clear2:  0x44962C, 0x3FF;
}

state("fceux", "2.4.0")
{
    short screen: 0x44DCD8, 0x50;
    byte clear1:  0x44DCD8, 0x309;
    byte clear2:  0x44DCD8, 0x3FF;
}

state("fceux", "2.5.0/2.6.3/2.6.4")
{
    short screen: 0x3DA4EC, 0x50;
    byte clear1:  0x3DA4EC, 0x309;
    byte clear2:  0x3DA4EC, 0x3FF;
}

state("fceux", "2.6.1/2.6.2")
{
    short screen: 0x3DA4DC, 0x50;
    byte clear1:  0x3DA4DC, 0x309;
    byte clear2:  0x3DA4DC, 0x3FF;
}

state("fceux", "2.6.5")
{
    short screen: 0x4378A4, 0x50;
    byte clear1:  0x4378A4, 0x309;
    byte clear2:  0x4378A4, 0x3FF;
}

state("fceux64", "2.6.5")
{
    short screen: 0x4D5150, 0x50;
    byte clear1:  0x4D5150, 0x309;
    byte clear2:  0x4D5150, 0x3FF;
}

state("qfceux", "2.6.1")
{
    short screen: 0x30DD70, 0x50;
    byte clear1:  0x30DD70, 0x309;
    byte clear2:  0x30DD70, 0x3FF;
}

state("qfceux", "2.6.2")
{
    short screen: 0x30ED70, 0x50;
    byte clear1:  0x30ED70, 0x309;
    byte clear2:  0x30ED70, 0x3FF;
}

state("qfceux", "2.6.3")
{
    short screen: 0x318330, 0x50;
    byte clear1:  0x318330, 0x309;
    byte clear2:  0x318330, 0x3FF;
}

state("qfceux", "2.6.4")
{
    short screen: 0x318340, 0x50;
    byte clear1:  0x318340, 0x309;
    byte clear2:  0x318340, 0x3FF;
}

state("qfceux", "2.6.5")
{
    short screen: 0x32E718, 0x50;
    byte clear1:  0x32E718, 0x309;
    byte clear2:  0x32E718, 0x3FF;
}
/*
state("nestopia", "1.40")
{
    // base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
	// just add your fceux offset to 0x68 to get the final nestopia offset
    short screen: "nestopia.exe", 0x1B2BCC, 0, 8, 0xc, 0xc, 0xB8;
    byte clear1:  "nestopia.exe", 0x1B2BCC, 0, 8, 0xc, 0xc, 0x371;
    byte clear2:  "nestopia.exe", 0x1B2BCC, 0, 8, 0xc, 0xc, 0x467;
}

state("nestopia", "1.50")
{
	// base 0x0000 address of ROM: "nestopia.exe", 0x1788EC, 0, 0x70
    short screen: "nestopia.exe", 0x1788EC, 0, 0xC0;
    byte clear1:  "nestopia.exe", 0x1788EC, 0, 0x379;
    byte clear2:  "nestopia.exe", 0x1788EC, 0, 0x46F;
}

state("nestopia", "1.51")
{
	// base 0x0000 address of ROM: "nestopia.exe", 0x1798EC, 0, 0x70
    short screen: "nestopia.exe", 0x1798EC, 0, 0xC0;
    byte clear1:  "nestopia.exe", 0x1798EC, 0, 0x379;
    byte clear2:  "nestopia.exe", 0x1798EC, 0, 0x46F;
}
*/
// Nestopia UE 1.51.1 and 1.52.0 have the same base RAM address
state("nestopia", "1.51.1/1.52.0")
{
	// base 0x0000 address of ROM: "nestopia.exe", 0x17A8EC, 0, 0x70
    short screen: "nestopia.exe", 0x17A8EC, 0, 0xC0;
    byte clear1:  "nestopia.exe", 0x17A8EC, 0, 0x379;
    byte clear2:  "nestopia.exe", 0x17A8EC, 0, 0x46F;
}

state("mesen", "0.9.8.0")
{
    short screen: "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x50;
    byte clear1:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x309;
    byte clear2:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x3FF;
}

state("mesen", "0.9.9.0")
{
    short screen: "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x50;
    byte clear1:  "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x309;
    byte clear2:  "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x3FF;
}

init
{
    version = modules.First().FileVersionInfo.FileVersion;
}

reset
{
	//return (current.menu == 0x0 && old.menu == 0x0306);
	return (current.screen == 0x0300 && old.screen == 0x0200);
	
}

split
{
	//if (current.clear == 1 && old.clear != 1) return true;
	if (current.screen == 0x0101 && current.clear1 == 1 && current.clear2 == 1)
	return true;
}

start
{
    //if (current.screen == 3 && old.screen == 2) return true;
	if (current.screen == 0x0300 && old.screen == 0x0200) return true;
}