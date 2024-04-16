@cd/d "%~dp0"
@echo off

cd "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\"

call DandISetEnv.bat

Dism /Mount-Wim /WimFile:C:\WinPEx86\media\sources\boot.wim /index:1 /MountDir:C:\WinPEx86\mount

Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-MDAC.cab"
echo Fine 2.7%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-FMAPI.cab"
echo 5.4%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-Fonts-Legacy.cab"
echo Fine 8.1%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-WMI.cab"
echo Fine 10.8%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-NetFx.cab"
echo Fine 13.5%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-Dot3Svc.cab"
echo Fine 16.2%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-Scripting.cab"
echo Fine 18.9%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-HTA.cab"
echo Fine 21.6%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-PPPoE.cab"
echo Fine 24.3%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-RNDIS.cab"
echo Fine 27%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-PlatformId.cab"
echo Fine 29.7%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-PowerShell.cab"
echo Fine 32.4%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-DismCmdlets.cab"
echo Fine 35.1%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-EnhancedStorage.cab"
37.8%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-StorageWMI.cab"
echo Fine 40.5%

Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-MDAC_ru-ru.cab"
echo Fine 43.2%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-WMI_ru-ru.cab"
echo Fine 45.9%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-NetFx_ru-ru.cab"
echo Fine 48.6%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-Dot3Svc_ru-ru.cab"
echo Fine 51.3%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-Scripting_ru-ru.cab"
echo Fine 54%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-HTA_ru-ru.cab"
echo Fine 56.7%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-PPPoE_ru-ru.cab"
echo Fine 59.4%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-RNDIS_ru-ru.cab"
echo Fine 62.1%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-PowerShell_ru-ru.cab"
echo Fine 64.8%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-DismCmdlets_ru-ru.cab"
echo Fine 67.5%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-EnhancedStorage_ru-ru.cab"
echo Fine 70.2%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\ru-ru\WinPE-StorageWMI_ru-ru.cab"
echo Fine 72.9%

Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-MDAC_en-us.cab"
echo Fine 75.6%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-WMI_en-us.cab"
echo Fine 78.3%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-NetFx_en-us.cab"
echo Fine 81%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-Dot3Svc_en-us.cab"
echo Fine 83.7%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-HTA_en-us.cab"
echo Fine 86.4%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-PPPoE_en-us.cab"
echo Fine 89.1%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-RNDIS_en-us.cab"
echo Fine 91.8%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-PowerShell_en-us.cab"
echo Fine 94.5%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-DismCmdlets_en-us.cab"
echo Fine 97.2%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-EnhancedStorage_en-us.cab"
echo Fine 99.9%
Dism /Image:"C:\WinPEx86\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\en-us\WinPE-StorageWMI_en-us.cab"
echo Fine 100%

Dism /Unmount-Wim /MountDir:"C:\WinPEx86\mount" /commit

pause
