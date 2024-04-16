@cd/d "%~dp0"
@echo off

Dism /Mount-Wim /WimFile:C:\WinPEx86\media\sources\boot.wim /index:1 /MountDir:C:\WinPEx86\mount

pause
