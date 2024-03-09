@echo off
Title TishSerg Windows Setup Bootstrapper v1.0
color 9f

ver
echo.
echo [%time%] Initializing Windows PE...
Wpeinit

echo.
Wpeutil UpdateBootInfo > nul
for /f "tokens=3" %%a in (
    'reg query "HKLM\System\CurrentControlSet\Control" /v PEBootRamdiskSourceDrive'
) do set RamdiskSourceDrive=%%a
echo [%time%] Detected setup media: %RamdiskSourceDrive%

echo.
:: Windows dist path Affix
set WinDistAfx=WinDists\Win

:: Find Windows arch Affix
if "%PROCESSOR_ARCHITECTURE%" == "x86" (
    set WinArchAfx=x86
) else (
    set WinArchAfx=x64
)

:: Find Windows version Affix
for /f "tokens=3" %%b in (
    'reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuildNumber'
) do set /a CurrentBuildNumber=%%b
if %CurrentBuildNumber% lss 6100 (
    :: Build < 6100 is Vista
    set WinVerAfx=Vista
    echo [%time%] Determined version of Windows: Vista (build %CurrentBuildNumber%^) %PROCESSOR_ARCHITECTURE%
) else if %CurrentBuildNumber% lss 7700 (
    :: Build < 7700 is 7
    set WinVerAfx=7
    echo [%time%] Determined version of Windows: 7 (build %CurrentBuildNumber%^) %PROCESSOR_ARCHITECTURE%
) else if %CurrentBuildNumber% lss 9300 (
    :: Build < 9300 is 8
    set WinVerAfx=8
    echo [%time%] Determined version of Windows: 8 (build %CurrentBuildNumber%^) %PROCESSOR_ARCHITECTURE%
) else if %CurrentBuildNumber% lss 9700 (
    :: Build < 9700 is 8.1
    set WinVerAfx=8.1
    echo [%time%] Determined version of Windows: 8.1 (build %CurrentBuildNumber%^) %PROCESSOR_ARCHITECTURE%
) else (
    :: Build > 9700 is 10
    set WinVerAfx=10
    echo [%time%] Determined version of Windows: 10 (build %CurrentBuildNumber%^) %PROCESSOR_ARCHITECTURE%
)

echo.
echo [%time%] Launching Windows Setup (%RamdiskSourceDrive%\%WinDistAfx%_%WinVerAfx%_%WinArchAfx%\setup.exe^)
%RamdiskSourceDrive%\%WinDistAfx%_%WinVerAfx%_%WinArchAfx%\setup.exe

:: When closed Windows Setup
color 2e
echo.
echo [%time%] Windows Setup closed
echo WScript.Quit MsgBox("You have closed Windows Setup."+vbCrlf+"Run 'System restore' instead? Or reboot?"+vbCrlf+vbCrlf+"Yes - Run 'System restore'"+vbCrlf+"No - Reboot"+vbCrlf+"Cancel - 'Just give me a Command line!'", vbQuestion+vbYesNoCancel, "Setup cancelled") > msgdlg.vbs
cscript msgdlg.vbs > nul
if %errorLevel% == 6 (
    echo [%time%] Here is Task Manager for you :^)
    start taskmgr
    echo [%time%] Run 'System restore' (%SystemDrive%\Sources\recovery\RecEnv.exe^)
    %SystemDrive%\Sources\recovery\RecEnv.exe
) else if %errorLevel% == 7 (
    echo [%time%] Will reboot now...
    Wpeutil Reboot
)
