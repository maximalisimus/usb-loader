

1) Flash Card - format FAT32
2) EFI-Grub4Dos-SysLinux-Full
	[boot]
	[boot-info]
	[EFI]
	grldr
	menu.lst
	plpbt.bin
	syslinux.cfg
	usbdrive.tag
3) 
	[boot]
	[efi]
	[support]
	autorun.inf
	bootmgr
	bootmgr.efi
3-2) Copy
	/efi/boot/*.efi /efi/microsoft/boot/
	/efi/microsoft/boot/*.efi /efi/boot/
	/boot/en-us /efi/microsoft/boot/
	/boot/ru-ru /efi/microsoft/boot/
	/boot/fonts /efi/microsoft/boot/
	
	/autorun.inf
		[Autorun]
		icon=setup.exe,0
	or
		[Autorun]
		icon=boot\compact.ico,0
4) Grub4DOS -> Bootice-x86 - MBR
	https://maximalisimus.github.io/usb-loader/USB-Loader/MultiBootUSB/uefi-bios/Multiboot_ReedMe.htm
	https://maximalisimus.github.io/usb-loader/USB-Loader/MultiBootUSB/uefi-bios/Multiboot_ReedMe.pdf
5) SysLinux -> Bootice-x86 - PBR
	https://maximalisimus.github.io/usb-loader/USB-Loader/MultiBootUSB/uefi-bios/Multiboot_ReedMe.htm
	https://maximalisimus.github.io/usb-loader/USB-Loader/MultiBootUSB/uefi-bios/Multiboot_ReedMe.pdf
6) 
	[WinDists]
	|- [Win_7_x86]
	|- [Win_7_x64]
	|- [Win_8.1_x86]
	|- [Win_8.1_x64]
	|- [Win_10_x86]
	|- [Win_10_x64]
7) copy [sources] to [WinDists]
8) Bootice-x86 -> BCD BIOS and BCD UEFI
	<Letter_FlashCard>:\WinDists\Win_10_x64\boot.wim
	<Letter_FlashCard>:\WinDists\Win_10_x64\boot.sdi

9) mkdir C:\mnt

10) Please, edit at GImageX mount to C:\mnt\ on boot wim-files.
	Example:
		<Letter_FlashCard>:\WinDists\Win_7_x86-64\boot.wim
		<Letter_FlashCard>:\WinDists\Win_7_x86-64\boot64.wim
		<Letter_FlashCard>:\WinDists\Win_10_x86\boot.wim
		<Letter_FlashCard>:\WinDists\Win_10_x64\boot.wim

	copy winpeshl.ini C:\mnt\Windows\System32\
	copy runsetup.cmd C:\mnt\Windows\System32\

	Save wim file and umount.

11) ei.cfg
	Example:
		copy ei.cfg WinDists\Win_7_86-64\
		copy ei.cfg WinDists\Win_10_x64\
		copy ei.cfg WinDists\Win_10_x86\










