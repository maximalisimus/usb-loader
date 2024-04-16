@cd/d "%~dp0"
@echo off

Dism /Mount-Wim /WimFile:C:\WinPEx64\media\sources\boot.wim /index:1 /MountDir:C:\WinPEx64\mount

pause
