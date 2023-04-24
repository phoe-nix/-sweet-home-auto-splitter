function readcpu(addr)
  return emu.read(addr, emu.memType.nesDebug, false)
end

function main()
  emu.clearScreen();
  local kazuo_hp = readcpu(0x6194)+1
  local akiko_hp = readcpu(0x6195)+1
  local emi_hp = readcpu(0x6198)+1
  local kazuo_lv = readcpu(0x61a8)+1
  local akiko_lv = readcpu(0x61a9)+1
  local emi_lv = readcpu(0x61ac)+1
	local emi_item1 = readcpu(0x625e)
	local emi_item2 = readcpu(0x6263)
	local emi_noem = readcpu(0x629a)
  local ec = readcpu(0x617D)
  local emhp1 = readcpu(0x6252)
  local emhp2 = readcpu(0x6250)
  local emhp = emhp1+(emhp2*256)
  local mc = readcpu(0x62b1)
  local door1flag = readcpu(0x62d7)
  if emhp2 == 0xff and emhp1 > 0x7f then emhp = 0 
  elseif emhp2 == 0xff and emhp1 < 0x80 then emhp = emhp1 end
	emu.drawString(0,0,string.format("Enemy:%i HP:%i Menu:%X Door1:0x%X NOEM:0x%X",ec,emhp,mc,door1flag,emi_noem),0xffffff,0x9f0000ff)
	emu.drawString(0,232,string.format("Kazuo LV:%4i   Akiko LV:%4i   Emi LV:%4i",kazuo_lv, akiko_lv,emi_lv),0xffffff,0x9f0000ff)
	--emu.drawString(0,232,string.format("Kazuo HP:%4i   Akiko HP:%4i   Emi HP:%4i",kazuo_hp, akiko_hp,emi_hp),0xffffff,0x9f0000ff)
--emu.drawString(0, 1, "enemy count: "..ec, 0xFFFFFF, 0xFF000000);

-- init
    bgColor = 0x302060FF
    fgColor = 0x30FF4040
--emu.drawRectangle(8, 8, 128, 24, bgColor, true, 1)
  --Get the emulation state

--if emi_item1 == 0x0D then emi_item1= "hammer" end
-- emu.drawString(12, 21, "emi:".. emi_item1, 0xFFFFFF, 0xFF000000)
end
emu.addEventCallback(main, emu.eventType.startFrame)