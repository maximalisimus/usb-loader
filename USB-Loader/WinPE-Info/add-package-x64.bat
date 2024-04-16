@cd/d "%~dp0"
@echo off

cd "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\"

call DandISetEnv.bat

Dism /Mount-Wim /WimFile:C:\WinPEx64\media\sources\boot.wim /index:1 /MountDir:C:\WinPEx64\mount

Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-MDAC.cab"
echo Fine 2.86%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-FMAPI.cab"
echo Fine 5.72%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-Fonts-Legacy.cab"
echo Fine 8.58%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-WMI.cab"
echo Fine 11.44%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-NetFx.cab"
echo Fine 14.3%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-Dot3Svc.cab"
echo Fine 17.16%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-Scripting.cab"
echo Fine 20.02%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-HTA.cab"
echo Fine 22.88%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-PPPoE.cab"
echo Fine 25.74%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-RNDIS.cab"
echo Fine 28.6%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-PlatformId.cab"
echo Fine 31.46%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-PowerShell.cab"
echo Fine 34.32%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-DismCmdlets.cab"
echo Fine 37.18%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-EnhancedStorage.cab"
echo Fine 40.04%

Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-MDAC_ru-ru.cab"
echo Fine 42.09%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-WMI_ru-ru.cab"
echo Fine 45.76%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-NetFx_ru-ru.cab"
echo Fine 48.62%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-Dot3Svc_ru-ru.cab"
echo Fine 51.48%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-Scripting_ru-ru.cab"
echo Fine 54.34%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-HTA_ru-ru.cab"
echo Fine 57.2%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-PPPoE_ru-ru.cab"
echo Fine 60.06%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-RNDIS_ru-ru.cab"
echo Fine 62.92%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-PowerShell_ru-ru.cab"
echo Fine 65.78%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-DismCmdlets_ru-ru.cab"
echo Fine 68.64%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-EnhancedStorage_ru-ru.cab"
echo Fine 71.5%

Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-MDAC_en-us.cab"
echo Fine 74.36%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-WMI_en-us.cab"
echo Fine 77.22%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-NetFx_en-us.cab"
echo Fine 80.08%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-Dot3Svc_en-us.cab"
echo Fine 82.94%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-HTA_en-us.cab"
echo Fine 85.8%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-PPPoE_en-us.cab"
echo Fine 88.66%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-RNDIS_en-us.cab"
echo Fine 91.52%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-PowerShell_en-us.cab"
echo Fine 94.38%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-DismCmdlets_en-us.cab"
echo Fine 97.24%
Dism /Image:"C:\WinPEx64\mount" /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\ru-ru\WinPE-EnhancedStorage_en-us.cab"
echo Fine 100%

Dism /Unmount-Wim /MountDir:"C:\WinPEx64\mount" /commit

pause
