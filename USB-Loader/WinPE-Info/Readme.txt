
cd %userprofile%\downloads
adksetup /quiet /layout c:\temp\ADKoffline
adksetup.exe /quiet /installpath c:\ADK /features OptionId.DeploymentTools

Packages:
https://learn.microsoft.com/ru-ru/windows-hardware/manufacture/desktop/winpe-add-packages--optional-components-reference?view=windows-11

Packages directory for WinPE:
C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\



copype amd64 C:\WinPEx64
Dism /Get-WimInfo /WimFile:C:\WinPEx64\media\sources\boot.wim
Dism /Mount-Image /ImageFile:"C:\WinPEx64\media\sources\boot.wim" /index:1 /MountDir:"C:\WinPEx64\mount"
Dism /Unmount-Image /MountDir:"C:\WinPEx64\mount" /commit
dism /get-mountedwiminfo
Dism /cleanup-wim
MakeWinPEMedia /UFD C:\WinPEx64 F:
MakeWinPEMedia /ISO C:\WinPEx64 D:\vbox\WinPEx64.iso

HKLM\SOFTWARE\Microsoft\WIMMount\Mounting Images


dism /Remount-Image /MountDir:C:\mount
dism /Unmount-Image /MountDir:C:\mount /discard
dism /Cleanup-Mountpoints



DISM.exe /Image:"<Mount_folder_path>" /Add-Driver /Driver:"<Driver_INF_source_path>\<driver>.inf"
DISM.exe /Image:"C:\WinPEx64\mount" /Add-Driver /Driver:"D:\vbox\DriverStore" /Recurse

Dism /Image:”D:\WDS Images\YourMountFolder” /Get-Drivers

Dism /Add-Driver /Image:"C:\WinPE_amd64\mount" /Driver:"C:\SampleDriver\driver.inf"
DISM.exe /Image:"C:\Mount" /Add-Driver /Driver:"C:\Drivers\driver.inf"
DISM.exe /Image:"C:\Mount" /Add-Driver /Driver:"C:\Drivers" /Recurse

DISM.exe /Image:"<Mount_folder_path>" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\<Component>.cab" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\<Component2>.cab"
DISM.exe /Image:"C:\Mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-Scripting.cab" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-WMI.cab" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-WDS-Tools.cab" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-SecureStartup.cab"

DISM.exe /Image:"<Mount_folder_path>" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\<Component>_en-us.cab" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\<Component2>_en-us.cab"
DISM.exe /Image:"C:\Mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-Scripting_en-us.cab" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-WMI_en-us.cab" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-WDS-Tools_en-us.cab" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-SecureStartup_en-us.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-HTA.cab"  

Dism /Add-Package /Image:"C:\WinPE_amd64\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-HTA_en-us.cab"

C:\WinPE_amd64\mount\Windows\System32\Startnet.cmd

Dism /Set-ScratchSpace:256 /Image:"C:\WinPE_amd64\mount"



Dism /Add-Package /Image:"C:\WinPE_amd64\mount" /PackagePath:"E:\windows10.0-kbxxxxx.msu"
or
md C:\temp
Dism /Cleanup-Image /Image:C:\WinPE_amd64\mount /Startcomponentcleanup /Resetbase /ScratchDir:C:\temp


Скрипты/WinPE-Scripting	WinPE-Scripting.cab	Отсутствует	Поддерживает выполнение сценариев, отличных от PowerShell, в WinPE	Да	Да
Network/WinPE-WDS-Tools	WinPE-WDS-Tools.cab	Отсутствует	Поддерживает WDS в WinPE, включая запись изображений и многоадресную рассылку	Да	Нет
Скрипты/WinPE-WMI	WinPE-WMI.cab	Отсутствует	Поддержка сценариев WMI и WMI в WinPE	Да	Да
Startup/WinPE-SecureStartup	WinPE-SecureStartup.cab	Скрипты/WinPE-WMI	Поддерживает управление BitLocker и TPM в WinPE	Да	Да
Управление файлами/WinPE-FMAPI	WinPE-FMAPI.cab	Отсутствует	Поддерживает доступ к API управления файлами Среды предустановки Windows	Нет	Да
Windows PowerShell/WinPE-PowerShell	WinPE-PowerShell.cab	Скрипты/WinPE-Scripting
Скрипты/WinPE-WMI
Microsoft .NET/WinPE-NetFx	Поддерживает выполнение команд и сценариев PowerShell в WinPE	Нет	Нет
Microsoft .NET/WinPE-NetFx	WinPE-NetFx.cab	Скрипты/WinPE-WMI	Поддержка приложений .NET в WinPE	Нет	Нет
Network/WinPE-Dot3Svc	WinPE-Dot3Svc.cab	Отсутствует	Поддерживает сетевой протокол 802.1X в WinPE	Нет	Нет
HTML/WinPE-HTA	WinPE-HTA.cab	Скрипты/WinPE-WMI	Поддержка запуска html-приложений в WinPE	Нет	Нет
Database/WinPE-MDAC	WinPE-MDAC.cab	Отсутствует	Поддерживает подключение к базам данных в WinPE	Нет


DISM.exe /Image:"<Mount_folder_path>" /Add-Package /PackagePath:"<Path_to_CU_MSU_update>\<CU>.msu"
DISM.exe /Image:"C:\Mount" /Add-Package /PackagePath:"C:\Updates\windows11.0-kb5029263-x64_4f5fe19bbec786f5e445d3e71bcdf234fe2cbbec.msu"




copy "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\bootmgr.efi" "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\bootmgr.bak.efi"

copy "<Mount_folder_path>\Windows\Boot\EFI\bootmgr.efi" "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\bootmgr.efi"

copy "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\EFI\Boot\bootx64.efi" "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\EFI\Boot\bootx64.bak.efi"

copy "<Mount_folder_path>\Windows\Boot\EFI\bootmgfw.efi" "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\EFI\Boot\bootx64.efi"



copy "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\bootmgr.efi" "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\bootmgr.bak.efi"

copy "C:\Mount\Windows\Boot\EFI\bootmgr.efi" "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\bootmgr.efi"

copy "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\EFI\Boot\bootx64.efi" "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\EFI\Boot\bootx64.bak.efi"

copy "C:\Mount\Windows\Boot\EFI\bootmgfw.efi" "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\EFI\Boot\bootx64.efi"




DISM.exe /Image:"<Mount_folder_path>" /Cleanup-image /StartComponentCleanup /Resetbase /Defer

DISM.exe /Image:"<Mount_folder_path>" /Cleanup-image /StartComponentCleanup /Resetbase



DISM.exe /Image:"C:\Mount" /Cleanup-image /StartComponentCleanup /Resetbase /Defer

DISM.exe /Image:"C:\Mount" /Cleanup-image /StartComponentCleanup /Resetbase



DISM.exe /Image:"<Mount_folder_path>" /Get-Packages

DISM.exe /Image:"C:\Mount" /Get-Packages


DISM.exe /Unmount-Image /MountDir:"<Mount_folder_path>" /Commit

DISM.exe /Unmount-Image /MountDir:"C:\Mount" /Commit



DISM.exe /Export-Image /SourceImageFile:"<Boot_image_path>\<boot_image>.wim" /SourceIndex:1 /DestinationImageFile:"<Boot_image_path>\<boot_image>-export.wim"

DISM.exe /Export-Image /SourceImageFile:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\en-us\winpe.wim" /SourceIndex:1 /DestinationImageFile:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\en-us\winpe-export.wim"






Example:
mklink %SystemDrive%\Users\%UserName%\Desktop\wget %SystemDrive%\WSL-Win-7\wget-1.11.4-1-bin\bin\wget.exe


Default Directoryes:

C:\Program Files
%ProgramFiles%

C:\Users\utv2\AppData\Local\Temp
%Temp%

C:\Users\utv2\AppData\Roaming
%AppData%

C:\Windows
%Systemroot%

C:\
%SystemDrive%

C:\Users\utv2
%USERPROFILE%

utv2
%USERNAME%

C:\Users\utv2\AppData\Local\Temp
%temp%

prefetch



# regedit /s имя_файла. reg

# sc config "ServiceName" start= auto​
# sc start "ServiceName"
# sc config "Name of Service" start= disabled
# sc stop "Name of Service"
# SC CONFIG "<nameservice>" START= ( BOOT, or SYSTEM, or AUTO, or DEMAND, or DISABLED, or DELAYED-AUTO )
# sc query "ServiceName" | find "RUNNING"


# Control.exe desk.cpl,Web,0
# %SystemRoot%\explorer.exe Shell:RecycleBinFolder



REM Description
powershell -Command "& {Get-AppxPackage ** | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove  AppxPackage Error=%MYERROR%
echo Remove  AppxPackage Error=%MYERROR% >> log.txt



Default Start-Menu:
%Systemroot%\ProgramData\Microsoft\Windows\Start Menu\Programs\
or
%SystemDrive%\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs



%SystemDrive%\Programs\background.jpg
%Systemroot%\


winpeshl.ini

[LaunchApps]
%SystemDrive%\Programs\WinXShell-X64\WinXShell.exe -winpe
cmd.exe, "/k runsetup.cmd"


runsetup.cmd

@echo off
Title TishSerg Windows Setup Bootstrapper v1.0
color 9f
ver
echo.
echo [%time%] Initializing Windows PE...
wpeinit
powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
REM Use My background:
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d  "%SystemDrive%\Programs\background.jpg" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters





imagex.cmd on %SystemDrive%\Programs\ImageX\:

%SystemDrive%\Programs\ImageX\imagex.exe %* 





wmic nic get NetConnectionID
wmic cdrom get drive

mkdir x:\drivers
expand –r h:\LANdriver.cab –f:* x:\drivers

Cd C:\drv\drivers\Program Files\VMware\VMware Tools\Drivers\vmxnet3\ndis6
drvload vmxnet3ndis6.inf

wmic nic get NetConnectionID

wpeinit
netsh interface ipv4 set address name=”Ethernet” source=dhcp
ipconfig






MMC:

(1) Copy these registry settings from a full install.wim to pe boot.wim:

 

"hklm\pe_soft\classes\mscfile"
"hklm\pe_soft\classes\.msc"
"hklm\pe_soft\microsoft\internet explorer"
"hklm\pe_soft\microsoft\internet explorer\activex compatibility"
"hklm\pe_soft\microsoft\MMC"

 

(2) Copy these files from full install.wim to to boot.wim:

\windows\system32\devmgmt.msc
\windows\system32\devmgr.dll
\windows\system32\diskmgmt.msc
\windows\system32\dmdlgs.dll
\windows\system32\dmdskmgr.dll
\windows\system32\dmdskres.dll
\windows\system32\dmdskres2.dll
\windows\system32\dmintf.dll
\windows\system32\dmocx.dll
\windows\system32\dmutil.dll
\windows\system32\dmvdsitf.dll
\windows\system32\dmview.ocx
\windows\system32\mmc.exe
\windows\system32\mmcbase.dll
\windows\system32\mmcndmgr.dll
\windows\system32\mmcshext.dll

\Windows\SystemResources\mmcbase.dll.mun
\Windows\SystemResources\mmcndmgr.dll.mun
\Windows\SystemResources\dmdskres.dll.mun

\windows\system32\en-US\devmgmt.msc
\windows\system32\en-US\devmgr.dll.mui
\windows\system32\en-US\diskmgmt.msc
\windows\system32\en-US\dmdskres.dll.mui
\windows\system32\en-US\dmdskres2.dll.mui
\windows\system32\en-US\dmocx.dll.mui
\windows\system32\en-US\dmutil.dll.mui
\windows\system32\en-US\mmc.exe.mui
\windows\system32\en-US\mmcbase.dll.mui
\windows\system32\en-US\mmcndmgr.dll.mui
\windows\system32\en-US\mmcshext.dll.mui





Explorer on Google search:

Explorer.exe%systemroot% 
Shell32.dll%systemroot%/system32 
SHELL.dll%systemroot%/system32 
Shellstyle.dll%systemroot%/system32 
Nslookup 
Nslookup.exe%systemroot%/system32 
Fc,diskcomp,diskcopy 
Fc.exe%systemroot%/system32 
Diskcomp.exe%systemroot%/system32 
Diskcopy.dll%systemroot%/system32 
Diskcopy.exe%systemroot%/system32 
Клиент RDC 
Mstsc.exe%systemroot%/system32 
Mstscax.dll%systemroot%/system32 
Msacm32.dll%systemroot%/system32 
d3d10core.dll%systemroot%/system32 
d3d10.dll%systemroot%/system32 
Dxgi.dll%systemroot%/system32 
mcm32.dll.mui%systemroot%/system32/ru-ru 
mstscax.dll.mui%systemroot%/system32/ru-ru 
mstsc.exe.mui%systemroot%/system32/ru-ru 





C:\BuildPE\AddFiles\x32\Windows\System32:

en-US\shellstyle.dll.mui
ru-RU\explorerframe.dll.mui
ru-RU\ole32.dll.mui
ru-RU\oledlg.dll.mui
ru-RU\shell32.dll.mui
ru-RU\taskkill.exe.mui
ru-RU\twinapi.appcore.dll.mui
ru-RU\twinapi.dll.mui
ru-RU\twinui.appcore.dll.mui
ru-RU\twinui.dll.mui
actxprxy.dll
chartv.dll
d3d11.dll
DataExchange.dll
dcomp.dll
ddraw.dll
DXCore.dll (этого файла нет в версии 1507, но его можно взять из свежих версий Windows 10, например 21H2)
dxgi.dll
ExplorerFrame.dll
glu32.dll
ksuser.dll
oledlg.dll
opengl32.dll
pdh.dll
pdhui.dll
shellstyle.dll
shfolder.dll
taskkill.exe
thumbcache.dll
timeout.exe
twinapi.appcore.dll
twinapi.dll
twinui.appcore.dll
twinui.dll


C:\BuildPE\AddFiles\x64\Windows\System32:

en-US\shellstyle.dll.mui
ru-RU\explorerframe.dll.mui
ru-RU\ole32.dll.mui
ru-RU\oledlg.dll.mui
ru-RU\shell32.dll.mui
ru-RU\taskkill.exe.mui
ru-RU\twinapi.appcore.dll.mui
ru-RU\twinapi.dll.mui
ru-RU\twinui.appcore.dll.mui
ru-RU\twinui.dll.mui
actxprxy.dll
chartv.dll
d3d11.dll
DataExchange.dll
dcomp.dll
dxgi.dll
ExplorerFrame.dll
glu32.dll
ksuser.dll
oledlg.dll
OneCoreUAPCommonProxyStub.dll
opengl32.dll
pdh.dll
pdhui.dll
shellstyle.dll
shfolder.dll
taskkill.exe
thumbcache.dll
timeout.exe
twinapi.appcore.dll
twinapi.dll
twinui.appcore.dll
twinui.dll



установка msc в winpe:


\Windows\SystemResources\mmcbase.dll.mun
\Windows\SystemResources\mmcndmgr.dll.mun
\Windows\SystemResources\dmdskres.dll.mun


\windows\system32\apphelp.dll
\windows\system32\dwwin.exe
\windows\system32\diskmgmt.msc
\windows\system32\mmc.exe
\windows\system32\mmcbase.dll
\windows\system32\mmcndmgr.dll
\windows\system32\mmcshext.dll
\windows\system32\dmdlgs.dll
\windows\system32\dmdskmgr.dll
\windows\system32\dmdskres.dll
\windows\system32\dmdskres2.dll
\windows\system32\dmintf.dll
\windows\system32\dmocx.dll
\windows\system32\dmutil.dll
\windows\system32\dmvdsitf.dll
\windows\system32\dmview.ocx
\windows\system32\hhsetup.dll
\windows\system32\en-us\dmdskres.dll.mui 
\windows\system32\en-us\dmdskres2.dll.mui 
\windows\system32\en-us\mmc.exe.mui 
\windows\system32\en-us\mmcbase.dll.mui 
\windows\system32\en-us\mmcndmgr.dll.mui 
\windows\system32\en-us\mmcshext.dll.mui 
\Windows\SystemResources\mmcbase.dll.mun
\Windows\SystemResources\mmcndmgr.dll.mun
\Windows\SystemResources\dmdskres.dll.mun





установка compmgmt.msc

HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Manage\command
\Windows\system32\CompMgmtLauncher.exe
\Windows\system32\compmgmt.msc
\Windows\system32\Mycomput.dll









C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs

WinPE-MDAC.cab
WinPE-FMAPI.cab
WinPE-Fonts-Legacy.cab
WinPE-WMI.cab
WinPE-NetFx.cab
WinPE-Dot3Svc.cab
WinPE-Scripting.cab
WinPE-HTA.cab
WinPE-PPPoE.cab
WinPE-RNDIS.cab
WinPE-PlatformId.cab
WinPE-PowerShell.cab
WinPE-DismCmdlets.cab
WinPE-EnhancedStorage.cab

ru-ru\

WinPE-MDAC_ru-ru.cab
WinPE-WMI_ru-ru.cab
WinPE-NetFx_ru-ru.cab
WinPE-Dot3Svc_ru-ru.cab
WinPE-Scripting_ru-ru.cab
WinPE-HTA_ru-ru.cab
WinPE-PPPoE_ru-ru.cab
WinPE-RNDIS_ru-ru.cab
WinPE-PowerShell_ru-ru.cab
WinPE-DismCmdlets_ru-ru.cab
WinPE-EnhancedStorage_ru-ru.cab

en-us\

WinPE-MDAC_en-us.cab
WinPE-WMI_en-us.cab
WinPE-NetFx_en-us.cab
WinPE-Dot3Svc_en-us.cab
WinPE-HTA_en-us.cab
WinPE-PPPoE_en-us.cab
WinPE-RNDIS_en-us.cab
WinPE-PowerShell_en-us.cab
WinPE-DismCmdlets_en-us.cab
WinPE-EnhancedStorage_en-us.cab

C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs

WinPE-MDAC.cab
WinPE-FMAPI.cab
WinPE-Fonts-Legacy.cab
WinPE-WMI.cab
WinPE-NetFx.cab
WinPE-Dot3Svc.cab
WinPE-Scripting.cab
WinPE-HTA.cab
WinPE-PPPoE.cab
WinPE-RNDIS.cab
WinPE-PlatformId.cab
WinPE-PowerShell.cab
WinPE-DismCmdlets.cab
WinPE-EnhancedStorage.cab
WinPE-StorageWMI.cab

ru-ru\

WinPE-MDAC_ru-ru.cab
WinPE-WMI_ru-ru.cab
WinPE-NetFx_ru-ru.cab
WinPE-Dot3Svc_ru-ru.cab
WinPE-Scripting_ru-ru.cab
WinPE-HTA_ru-ru.cab
WinPE-PPPoE_ru-ru.cab
WinPE-RNDIS_ru-ru.cab
WinPE-PowerShell_ru-ru.cab
WinPE-DismCmdlets_ru-ru.cab
WinPE-EnhancedStorage_ru-ru.cab
WinPE-StorageWMI_ru-ru.cab

en-us\

WinPE-MDAC_en-us.cab
WinPE-WMI_en-us.cab
WinPE-NetFx_en-us.cab
WinPE-Dot3Svc_en-us.cab
WinPE-HTA_en-us.cab
WinPE-PPPoE_en-us.cab
WinPE-RNDIS_en-us.cab
WinPE-PowerShell_en-us.cab
WinPE-DismCmdlets_en-us.cab
WinPE-EnhancedStorage_en-us.cab
WinPE-StorageWMI_en-us.cab







База данных/WinPE-MDAC	WinPE-MDAC поддерживает microsoft Open Database Подключение ivity (ODBC), OLE DB и объекты данных Microsoft ActiveX (ADO). Этот набор технологий предоставляет доступ к различным источникам данных, таким как Microsoft SQL Server. Например, этот доступ позволяет запрашивать установки Microsoft SQL Server, содержащие объекты ADO. Вы можете создать динамический файл ответов из уникальных системных сведений. Аналогичным образом можно создавать клиентские или серверные приложения на основе данных, которые интегрируют информацию из различных источников данных, реляционных (SQL Server) и нереляционных.
Управление файлами/WinPE-FMAPI	WinPE-FMAPI предоставляет доступ к API управления файлами Windows PE (FMAPI) для обнаружения и восстановления удаленных файлов из незашифрованных томов. FMAPI также предоставляет возможность использовать файл ключа пароля или восстановления для обнаружения и восстановления удаленных файлов из зашифрованных томов шифрования дисков Windows BitLocker.
Шрифты/WinPE-Fonts-Legacy	WinPE-Fonts-Legacy содержит 32 файла шрифтов для различных языков и скриптов записи. Некоторые из этих шрифтов больше не используются в качестве шрифтов пользовательского интерфейса. Например, скрипты, такие как Bangla, Devanagari, Gujarati, Gurmukhi, Kannada, Малаялам, Одия, Тамил, Телугу и Синхале, были охвачены Mangal, Latha, Vrinda, Gautami, Kalinga, artika, Raavi, Shruti и Tunga, но в Windows 8, они были все унифицированы под пользовательский интерфейс Nirmala, единый, пан-индийский шрифт. В следующем списке показаны шрифты и языки, включенные в этот необязательный компонент:
estre.ttf Estrangelo Эдесса (Сирия)
mvboli.ttf MV Boli (Thaana)
Пользовательский интерфейс ХмерИ.ttf (пользовательский интерфейс Кхмера)
KhmerUIB.ttf Пользовательский интерфейс Полужирный (пользовательский интерфейс Кхмера)
Лауи.ttf Лаосский пользовательский интерфейс (Лаос)
Laouib.ttf Лаосский пользовательский полужирный (Лаос)
daunpenh.ttf DaunPenh (Кхмер)
moolbor.ttf MoolBoran (Кхмер)
dokchamp.ttf DokChampa (Лаос)
Гималая.ttf Microsoft Гималая (тибетская)
monbaiti.ttf Монголия Baiti (Монголия)
MSYI.ttf Microsoft Yi Baiti (Yi Syllables)
nyala.ttf Nyala (Ethiopic)
sylfaen.ttf Sylfaen (армянский и грузинский)
euphemia.ttf Euphemia (Унифицированный канадский абориген Сильлабик)
plantc.ttf Plantagenet Cherokee (Cherokee)
Fonts/WinPE-Font Support-JA-JP	WinPE-Font Support-JA-JP содержит два японских семейства шрифтов, которые упаковываются в виде файлов коллекции TrueType (TTC). MS Gothic — это шрифт пользовательского интерфейса Windows в версиях Windows до Windows Vista. MS Готика содержит большой набор символов и внедренные растровые изображения, чтобы обеспечить удобочитаемую отрисовку при небольших размерах. Meiryo, шрифт, представленный в Windows Vista, предназначен специально для использования в среде отрисовки Microsoft ClearType. Meiryo не включает внедренные растровые изображения. Вместо этого Meiryo полагается на указание инструкций для создания удобочитаемых символов на небольших размерах. Кроме того, модуль содержит два шрифта растрового изображения, App932.fon и Vga932.fon. Модуль также содержит шрифт TrueType, доступный только для растрового изображения, Jpn_font.ttf. Этот шрифт используется на загрузочных экранах.
Шрифты/Поддержка шрифтов WinPE-KO-KR	WinPE-Font Support-KO-KR содержит три основных корейских семейства шрифтов: Gulim, Batang и Malgun Готика. Gulim — это устаревший шрифт пользовательского интерфейса, а в виде TTC-файла содержит Gulim, GulimChe, Dotum и DotumChe. Batang — это устаревший текстовый шрифт, а также TTC-файл, содержащий Batang, BatangChe, GungSuh и GungSuhChe. Malgun Gothic, шрифт, представленный в Windows Vista, предназначен специально для использования в среде отрисовки ClearType. Malgun Готика не включает внедренные растровые карты и вместо этого полагается на указания инструкций для создания удобочитаемых символов на небольших размерах.
Fonts/WinPE-Font Support-ZH-CN	WinPE-Font Support-ZH-CN содержит два китайских семейства шрифтов, которые упаковываются в виде TTC-файлов. Simsun — это шрифт упрощенного китайского пользовательского интерфейса в версиях Windows до Windows Vista. Simsun содержит внедренные растровые изображения, чтобы обеспечить удобочитаемую отрисовку при небольших размерах. Другой шрифт TTC — MingLiu. MingLiu имеет внедренные растровые изображения и обеспечивает поддержку дополнительного набора символов Гонконга (HKSCS). YaHei, шрифт, представленный в Windows Vista, предназначен специально для использования в среде отрисовки ClearType. YaHei не включает внедренные растровые изображения. YaHei полагается на указания инструкций для создания удобочитаемых символов на небольших размерах. Кроме того, модуль содержит один шрифт TrueType только для растрового изображения, Chs_boot.ttf. Этот шрифт используется на загрузочных экранах.
Шрифты/WinPE-Font Support-ZH-HK
и

Поддержка шрифтов WinPE-ZH-TW

Необязательные компоненты Гонконга и Тайваня содержат два китайских семейства шрифтов, которые упаковываются в виде TTC-файлов. Simsun — это шрифт упрощенного китайского пользовательского интерфейса в версиях Windows до Windows Vista. Simsun содержит внедренные растровые изображения, чтобы обеспечить удобочитаемую отрисовку при небольших размерах. MingLiu имеет внедренные растровые изображения и обеспечивает поддержку HKSCS. JhengHei, шрифт, представленный в Windows Vista, предназначен специально для использования в среде отрисовки ClearType. JhengHei не включает внедренные растровые карты. JhengHei полагается на указания инструкций для создания удобочитаемых символов на небольших размерах. Кроме того, модуль содержит один шрифт TrueType только для растрового изображения, Cht_boot.ttf. Этот шрифт используется на загрузочных экранах.
HTML/WinPE-HTA	WinPE-HTA предоставляет поддержку HTML-приложения (HTA) для создания приложений графического интерфейса с помощью подсистемы сценариев Windows Обозреватель и служб HTML. Эти приложения являются доверенными и отображают только создаваемые вами меню, значки, панели инструментов и сведения о заголовке.

Этот необязательный компонент доступен только для архитектуры Amd64.

Зависимости: установите WinPE-Scripting перед установкойWinPE-HTA.
Input/WinPE-GamingPeripherals	WinPE-GamingPeripherals добавляет поддержку беспроводных контроллеров Xbox в WinPE.
Microsoft .NET/WinPE-NetFx	WinPE-NetFx содержит подмножество платформа .NET Framework 4.5, предназначенное для клиентских приложений.
Не все двоичные файлы Windows присутствуют в windows PE, поэтому не все API Windows присутствуют или доступны для использования. Из-за ограниченного набора API следующие платформа .NET Framework функции не имеют или не ограничивают функциональные возможности в Windows PE:

Windows Presentation Foundation (WPF) (не поддерживается)
Среда выполнения Windows
API платформа .NET Framework Fusion
Ведение журнала событий библиотеки элементов управления Windows
взаимодействие платформа .NET Framework COM
Модель криптографии .NET Framework
Зависимости:

Установите WinPE-WMI перед установкой WinPE-NetFX.
Network/WinPE-Dot3Svc	Добавляет поддержку протокола проверки подлинности IEEE 802.1X в проводных сетях. Дополнительные сведения см. в статье "Сетевые драйверы WinPE: инициализация и добавление драйверов".
Network/WinPE-PPPoE	WinPE-PPPoE позволяет использовать протокол "точка — точка" через Ethernet (PPPoE) для создания, подключения, отключения и удаления подключений PPPoE из Windows PE. PPPoE — это сетевой протокол для инкапсулирования кадров протокола "точка — точка — точка" (PPP) внутри кадров Ethernet. PPPoE позволяет пользователям Windows удаленно подключать свои компьютеры к Интернету. С помощью PPPoE пользователи могут виртуально подключиться с одного компьютера к другому через сеть Ethernet, чтобы установить подключение между компьютерами через точку. Компьютеры могут использовать это подключение типа "точка — точка" для передачи пакетов данных.
Network/WinPE-RNDIS	WinPE-RNDIS содержит поддержку спецификации интерфейса удаленного сетевого драйвера (Remote NDIS). WinPE-RNDIS обеспечивает поддержку сети для устройств, реализующих спецификацию Remote NDIS через USB. Remote NDIS определяет набор сообщений, независимых от шины, и описание того, как этот набор сообщений работает над различными автобусами ввода-вывода. Поэтому поставщикам оборудования не нужно писать драйвер мини-порта NDIS. Так как этот интерфейс удаленной NDIS стандартизирован, один набор драйверов узлов может поддерживать любое количество подключенных к шине сетевых устройств.
Network/WinPE-WDS-Tools	WinPE-WDS-Tools включает API для включения средства записи изображений и сценария многоадресной рассылки, который включает в себя настраиваемый клиент служб развертывания Windows. Его необходимо установить, если планируется запустить клиент служб развертывания Windows на пользовательском образе среды предустановки Windows.
Пакет Network/WinPE-WiFi-Package	WinPE-WiFi-Package используется средой восстановления Windows (Windows RE) для встроенных функций восстановления. Этот пакет включается в базовый файл winre.wim и недоступен отдельно в надстройке Windows PE для комплекта средств оценки и развертывания Windows.

Примечание. Windows PE и Windows RE не поддерживают общие функции беспроводной сети.
Windows PowerShell/WinPE-PlatformID	WinPE-PlatformID содержит командлеты Windows PowerShell для получения идентификатора платформы физического компьютера.

Зависимости: установите WinPE-WMI и WinPE-SecureStartup перед установкой WinPE-PlatformID.
Чтобы использовать командлет Windows PowerShell для получения идентификатора платформы, потребуется установить пакет WinPE-PowerShell .

Windows PowerShell/WinPE-PowerShell	WinPE-PowerShell содержит диагностика на основе Windows PowerShell, упрощающих использование инструментария управления Windows (WMI) для запроса оборудования во время производства. Вы можете создавать средства развертывания на основе Windows PowerShell и административных средств windows PE. Помимо развертывания, можно использовать Windows PowerShell для сценариев восстановления. Клиенты могут загружаться в Windows RE, а затем использовать скрипты Windows PowerShell для устранения проблем. Клиенты не ограничиваются наборами инструментов, которые выполняются в Windows PE. Аналогичным образом можно создавать сценарии автономных решений для восстановления некоторых компьютеров из сценариев без загрузки.

WinPE-PowerShell имеет следующие известные ограничения:
Удаленное взаимодействие Windows PowerShell не поддерживается. Все командлеты, имеющие функции удаленного взаимодействия, возвращают ошибку.
Интегрированная среда сценариев Windows PowerShell (ISE) не поддерживается.
Windows PowerShell 2.0 не поддерживается.
Зависимости. Установите WinPE-WMI>WinPE-NetFX>WinPE-Scripting перед установкой WinPE-PowerShell.

Windows PowerShell/WinPE-DismCmdlets	WinPE-DismCmdlets содержит модуль DISM PowerShell, который включает командлеты, используемые для управления и обслуживания образов Windows.

Дополнительные сведения см. в разделе Командлеты управления обслуживанием образов развертывания (DISM) в Windows PowerShell.
Зависимости. Установите WinPE-WMI>WinPE-NetFX>WinPE-Scripting WinPE-PowerShell перед установкой> WinPE-DismCmdlets.

Windows PowerShell/WinPE-SecureBootCmdlets	WinPE-SecureBootCmdlets содержит командлеты PowerShell для управления переменными среды UEFI (унифицированный интерфейс расширяемого встроенного ПО) для безопасной загрузки.

Зависимости. Установите WinPE-WMI>WinPE-NetFX>WinPE-Scripting WinPE-PowerShell перед установкой> WinPE-SecureBootCmdlets.
Windows PowerShell/WinPE-служба хранилища WMI	WinPE-служба хранилища WMI содержит командлеты PowerShell для управления хранилищем. Эти командлеты используют API управления windows служба хранилища (SMAPI) для управления локальным хранилищем, такими как диск, секции и объекты томов. Кроме того, эти командлеты используют Windows SMAPI вместе с управлением хранилищем массивов с помощью поставщика управления хранилищем. WinPE-служба хранилища WMI также содержит командлеты инициатора Интернета (iSCSI) для подключения хост-компьютера или сервера к виртуальным дискам на внешних массивах хранилища на основе iSCSI через сетевой адаптер Ethernet или адаптер шины узла iSCSI (HBA).

Зависимости. Установите WinPE-WMI>WinPE-NetFX>WinPE-Scripting WinPE-PowerShell перед установкой> WinPE-служба хранилища WMI.
Recovery/WinPE-Rejuv	WinPE-Rejuv используется средой восстановления Windows (Windows RE). Этот пакет включен в базовый файл winre.wim и недоступен отдельно в надстройках Windows PE для комплекта средств оценки и развертывания Windows.
Восстановление/WinPE-SRT	WinPE-SRT используется Windows RE. Этот пакет включен в базовый файл winre.wim и недоступен отдельно в надстройках Windows PE для комплекта средств оценки и развертывания Windows.
Восстановление/WinPE-WinReCfg	WinPE-WinReCfg содержит средство Winrecfg.exe и включает следующие сценарии:
Загрузка из среды предустановки Windows на основе x86 для настройки параметров Windows RE в автономном образе операционной системы на основе x64.
Загрузка с windows PE на основе x64 для настройки параметров Windows RE в автономном образе операционной системы на основе x86.
Скриптирование и скрипты WinPE	WinPE-Scripting содержит среду сценариев с несколькими языками, которая идеально подходит для автоматизации задач администрирования системы, таких как пакетная обработка файлов. Скрипты, выполняемые в среде узла сценариев Windows (WSH), могут вызывать объекты WSH и другие технологии COM, поддерживающие автоматизацию, например WMI, для управления подсистемами Windows, которые являются центральными для многих задач администрирования системы.

Зависимости. Установите WinPE-Scripting, чтобы убедиться, что при использовании WinPE-NetFX и WinPE-HTA доступны все функции сценариев. Порядок установки не имеет значения.
Скрипты/WinPE-WMI	WinPE-WMI содержит подмножество поставщиков инструментария управления Windows (WMI), которые обеспечивают минимальные системные диагностика. WMI — это инфраструктура для управления данными и операциями в операционных системах под управлением Windows. Скрипты или приложения WMI можно написать для автоматизации административных задач на удаленных компьютерах. Кроме того, WMI предоставляет данные управления другим частям операционной системы и продуктов.
Setup/Winpe-LegacySetup	Winpe-LegacySetup содержит все файлы установки из папки \Sources на носителе Windows. Добавьте этот необязательный компонент при настройке службы или папке \Sources на носителе Windows. Этот необязательный компонент необходимо добавить вместе с необязательным компонентом для компонента установки. Чтобы добавить новый файл Boot.wim на носитель, добавьте родительский файл WinPE-Setup, дочерние компоненты (WinPE-Setup-Client или WinPE-Setup-Server), а также дополнительные компоненты мультимедиа. Настройка мультимедиа необходима для поддержки установки Windows Server 2008 R2.
Настройка и установка WinPE-Setup	WinPE-Setup — это родитель WinPE-Setup-Client и WinPE-Setup-Server. Он содержит все файлы установки из папки \Sources, которые являются общими для клиента и сервера.
Setup/WinPE-Setup-Client	WinPE-Setup-Client содержит файлы фирменной символики клиента для родительского дополнительного компонента WinPE-Setup.

Зависимости: установите WinPE-Setup перед установкой WinPE-Setup-Client.
Setup/WinPE-Setup-Server	WinPE-Setup-Server включает файлы фирменной символики сервера для родительского дополнительного компонента WinPE-Setup.

Зависимости: установите WinPE-Setup перед установкой WinPE-Setup-Server.
Startup/WinPE-HSP-Driver	Доступно начиная с Windows 11 версии 22H2. WinPE-HSP-Driver добавляет поддержку обработчика безопасности Microsoft Pluton в WinPE.

Этот необязательный компонент доступен только для архитектуры Amd64.
Startup/WinPE-SecureStartup	WinPE-SecureStartup обеспечивает подготовку и управление BitLocker и доверенным платформенным модулем (TPM). Она включает средства командной строки BitLocker, библиотеки управления WMI BitLocker, драйвер TPM, базовые службы TPM (ТБ S), класс Win32_TPM, мастер разблокировки BitLocker и библиотеки пользовательского интерфейса BitLocker. Драйвер доверенного платформенного модуля обеспечивает лучшую поддержку BitLocker и доверенного платформенного модуля в этой предварительной среде.

Зависимости: установите WinPE-WMI перед установкой WinPE-SecureStartup.
служба хранилища/WinPE-Enhanced служба хранилища	WinPE-Enhanced служба хранилища позволяет Windows обнаруживать дополнительные функциональные возможности для устройств хранения, таких как зашифрованные диски, и реализации, которые объединяют доверенные вычислительные группы (TCG) и IEEE 1667 ("Стандартный протокол проверки подлинности в вложениях временных служба хранилища устройств") спецификации. Этот необязательный компонент позволяет Windows управлять этими устройствами хранения в собственном коде с помощью BitLocker.
Архитектура/поддержка WinPE-x64-Support	WinPE-x64-Support обеспечивает поддержку эмуляции x64 в Arm64 WinPE. Подробные сведения см. в разделе Arm64EC для приложений Windows 11.


WinPE-Enhanced служба хранилища
WinPE-Rejuv
WinPE-Scripting
WinPE-SecureStartup
WinPE-Setup
WinPE-SRT
WinPE-WDS-Tools
WinPE-WMI





Languages:


На подключенном изображении выведите список необязательных компонентов в образе Windows PE:
Dism /Get-Packages /Image:"C:\WinPE_amd64\mount"

Просмотрите результирующий список пакетов и добавьте соответствующие языковые пакеты для каждого пакета в образе, включая базовый языковой пакет windows PE.
Dism /Add-Package /Image:"C:\WinPE_amd64\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\lp.cab"
где …WinPE_OCs\fr-fr\lp.cab представляет базовый языковой пакет windows PE.

Если вы добавляете языковые пакеты для языка, требующего дополнительных пакетов шрифтов, добавьте пакеты шрифтов для этих языков. Ниже приведен пример для Японии:
Dism /Add-Package /Image:"C:\WinPE_amd64\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-HTA_fr-fr.cab"

Убедитесь, что языковые пакеты являются частью образа:
Dism /Add-Package /Image:"C:\WinPE_amd64\mount" /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-Font Support-JA-JP.cab"

Просмотрите результирующий список пакетов и убедитесь, что для каждого необязательного компонента, включая базовый образ windows PE, есть связанный языковой пакет.
Dism /Get-Packages /Image:"C:\WinPE_amd64\mount"

Измените региональные параметры на язык, который вы хотите использовать:
Dism /Set-AllIntl:en-US /Image:"C:\WinPE_amd64\mount"

Чтобы переключить языки во время windows PE, используйте wpeutil setmuilanguage. Дополнительные сведения см . в параметрах командной строки Wpeutil.










