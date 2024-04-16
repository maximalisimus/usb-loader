

http://mistyprojects.co.uk/documents/winpe_tweaks/readme.files/WoW6432Node.htm

Assuming an .iso file is used, you will need to extract the SOFTWARE hive from \Sources\install.wim and then complete a number of tasks. These are detailed below.
1. Extract the SOFTWARE hive. 7-zip can be used for this purpose - use the 7-zip file manager and open the .iso file > then browse to \Sources\install.wim > use the open inside option > Select an image if multiple images are present > browse to \Windows\System32\config > extract SOFTWARE (e.g. to C:\Install_Wim_Files\software).
2. Mount the Software hive extracted in step 1. E.g.
reg.exe load HKLM\_WinPE_SOFTWARE C:\Install_Wim_Files\software
3. Export the Wow6432Node key from the Software hive mounted in step 2. E.g.
reg.exe export HKEY_LOCAL_MACHINE\_WinPE_SOFTWARE\Wow6432Node C:\Wow6432Node.reg
4. Export the Classes\Wow6432Node key from the Software hive mounted in step 2. E.g.
reg.exe export HKEY_LOCAL_MACHINE\_WinPE_SOFTWARE\Classes\Wow6432Node C:\Classes_Wow6432Node.reg
5. Open the .reg files exported in steps 3 and 4 and replace all references to C:\ and D:\ with X:\. Notepad.exe can be used for this task. Alternatively use gsar if you want to automate this from the command line. E.g.
gsar.exe -o -i -sC:x00:::x00\ -rX:x00:::x00\ C:\Wow6432Node.reg
gsar.exe -o -i -sD:x00:::x00\ -rX:x00:::x00\ C:\Wow6432Node.reg
gsar.exe -o -i -sC:x00:::x00\ -rX:x00:::x00\ C:\Classes_Wow6432Node.reg
gsar.exe -o -i -sD:x00:::x00\ -rX:x00:::x00\ C:\Classes_Wow6432Node.reg
6. Unload the mounted Software hive. E.g.
reg.exe unload HKLM\_WinPE_SOFTWARE
7. Mount the WinPE software hive using the same command syntax as in step 2, but changing the path as required. Ensure that you use the same key name as that used in step 2. E.g.
reg.exe load HKLM\_WinPE_SOFTWARE C:\WinPE_Wim_Files\software
8. Import the .reg file created in step 3. E.g.
reg.exe import C:\Wow6432Node.reg
9. Import the .reg file created in step 4. E.g.
reg.exe import C:\Classes_Wow6432Node.reg
10. Delete the Wow6432Node\Microsoft\Active Setup\Installed Components key. E.g.
reg.exe delete "HKLM\_WinPE_SOFTWARE\Wow6432Node\Microsoft\Active Setup\Installed Components" /f
11. Unload the mounted Software hive. E.g.
reg.exe unload HKLM\_WinPE_SOFTWARE



Adding WoW64 to WinPE 10 for 32-bit app support - V2

\Windows\WinSxS
\Windows\System32\Catroot
\Windows\SysWOW64

\Windows\System32\wow64.dll
\Windows\System32\wow64cpu.dll
\Windows\System32\wow64win.dll
\Windows\System32\loadWOW64.exe


HKLM\system\controlset001\control\session manager\BootExecute\
HKLM\software\microsoft\windows\currentversion\sidebyside\
HKLM\software\wow6432node\
HKLM\software\classes\wow6432node\
HKLM\software\Microsoft\Windows\CurrentVersion\SMI\WinSxS Settings\


HKLM\system\currentcontrolset001\control\session manager\BootExecute\



Edit C:\SysWOW64.reg replacing all instances of HKEY_LOCAL_MACHINE\SOFTWARE.
E.g. with HKEY_LOCAL_MACHINE\_WinPE SOFTWARE

Mount the WinPE Software hive. E.g. -
reg.exe load HKLM\_WinPE_SOFTWARE C:\PATH\software

reg.exe import C:\SysWOW64.reg

Unload the mounted Software hive. E.g. -
reg.exe unload HKLM\_WinPE_SOFTWARE


Additional File Dependencies

\Windows\SysWOW64\quartz.dll 
\Windows\SysWOW64\wdi.dll
\Windows\SysWOW64\wer.dll
\Windows\SysWOW64\hid.dll



reg.exe ADD "HKLM\SYSTEM\ControlSet001\Control\Session Manager" /v "BootExecute" /t REG_MULTI_SZ /d "loadWoW64.exe\0" /f

And add loadWoW64.exe to the \Windows\System32\ directory.

loadWoW64.exe
setWOW64.exe





%windir%\system32\catroot
%windir%\system32\drivers\etc
%windir%\system32\catroot2
%windir%\system32\logfiles
%windir%\system32\driverstore
%windir%\system32\spool



Ntdll.dll
Kernel32.dll
Kernel32.dll, Advapi32.dll, User32.dll, Gdi32.dll
Ntoskrnl.exe - Executive and kernel
Hal.dll - HAL
Win32k.sys - kernel-mode part of the windows subsystem (GUI)
Hvix64.exe - Intel Hypervisor
Hvax64.exe - AMD Hypervisor
.sys files in \systeRoot\System32\Drivers core driver files, such as DirectX, VolumeManager, TCP\IP, TPM, and ACPI support.





\Windows\System32\catroot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Client-Drivers-Package-net~*.cat
\Windows\System32\catroot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Client-Drivers-WOW64-Package~*.cat
\Windows\System32\catroot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Client-Features-WOW64-Package-AutoMerged-base~*.cat
\Windows\System32\catroot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Client-Features-WOW64-Package-AutoMerged-drivers~*.cat
\Windows\System32\catroot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Client-Features-WOW64-Package-AutoMerged-net~*.cat
\Windows\System32\catroot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Network-Security-Core-WOW64-Package~*.cat
\Windows\System32\wow64.dll
\Windows\System32\wow64cpu.dll
\Windows\System32\wow64win.dll
\Windows\SysWOW64\*.nls
\Windows\SysWOW64\activeds.dll 
\Windows\SysWOW64\actxprxy.dll 
\Windows\SysWOW64\adsldp.dll 
\Windows\SysWOW64\adsldpc.dll 
\Windows\SysWOW64\advapi32.dll 
\Windows\SysWOW64\api-ms-win*.dll
\Windows\SysWOW64\apphelp.dll 
\Windows\SysWOW64\asycfilt.dll 
\Windows\SysWOW64\atl.dll 
\Windows\SysWOW64\AudioSes.dll 
\Windows\SysWOW64\authz.dll
\Windows\SysWOW64\avifil32.dll 
\Windows\SysWOW64\avrt.dll 
\Windows\SysWOW64\bcd.dll
\Windows\SysWOW64\bcrypt.dll
\Windows\SysWOW64\browcli.dll
\Windows\SysWOW64\browseui.dll 
\Windows\SysWOW64\cfgmgr32.dll 
\Windows\SysWOW64\clbcatq.dll 
\Windows\SysWOW64\clusapi.dll 
\Windows\SysWOW64\cmd.exe 
\Windows\SysWOW64\cmdext.dll
\Windows\SysWOW64\combase.dll
\Windows\SysWOW64\comctl32.dll 
\Windows\SysWOW64\comdlg32.dll 
\Windows\SysWOW64\coml2.dll
\Windows\SysWOW64\credssp.dll 
\Windows\SysWOW64\credui.dll 
\Windows\SysWOW64\crtdll.dll 
\Windows\SysWOW64\crypt32.dll 
\Windows\SysWOW64\cryptbase.dll
\Windows\SysWOW64\cryptdll.dll 
\Windows\SysWOW64\cryptsp.dll
\Windows\SysWOW64\cscapi.dll 
\Windows\SysWOW64\d3d11.dll
\Windows\SysWOW64\DataExchange.dll
\Windows\SysWOW64\davhlpr.dll
\Windows\SysWOW64\dbgcore.dll 
\Windows\SysWOW64\dbghelp.dll 
\Windows\SysWOW64\dcomp.dll
\Windows\SysWOW64\devobj.dll
\Windows\SysWOW64\dhcpcsvc.dll 
\Windows\SysWOW64\dhcpcsvc6.dll 
\Windows\SysWOW64\dllhost.exe 
\Windows\SysWOW64\dnsapi.dll 
\Windows\SysWOW64\downlevel
\Windows\SysWOW64\drvstore.dll 
\Windows\SysWOW64\dsound.dll 
\Windows\SysWOW64\dui70.dll
\Windows\SysWOW64\duser.dll 
\Windows\SysWOW64\dwmapi.dll 
\Windows\SysWOW64\dxgi.dll
\Windows\SysWOW64\edputil.dll
\Windows\SysWOW64\esent.dll 
\Windows\SysWOW64\ExplorerFrame.dll 
\Windows\SysWOW64\FirewallAPI.dll
\Windows\SysWOW64\fwbase.dll
\Windows\SysWOW64\FWPUCLNT.DLL 
\Windows\SysWOW64\gdi32.dll 
\Windows\SysWOW64\gdi32full.dll
\Windows\SysWOW64\iertutil.dll 
\Windows\SysWOW64\imagehlp.dll 
\Windows\SysWOW64\imageres.dll 
\Windows\SysWOW64\imm32.dll 
\Windows\SysWOW64\iphlpapi.dll 
\Windows\SysWOW64\kerberos.dll
\Windows\SysWOW64\kernel.appcore.dll
\Windows\SysWOW64\kernel32.dll 
\Windows\SysWOW64\kernelbase.dll
\Windows\SysWOW64\ksuser.dll 
\Windows\SysWOW64\logoncli.dll
\Windows\SysWOW64\lpk.dll 
\Windows\SysWOW64\lz32.dll 
\Windows\SysWOW64\mlang.dat 
\Windows\SysWOW64\mlang.dll 
\Windows\SysWOW64\MMDevAPI.dll 
\Windows\SysWOW64\mpr.dll 
\Windows\SysWOW64\mprapi.dll 
\Windows\SysWOW64\mprext.dll
\Windows\SysWOW64\msacm32.dll 
\Windows\SysWOW64\msacm32.drv 
\Windows\SysWOW64\msasn1.dll 
\Windows\SysWOW64\mscms.dll 
\Windows\SysWOW64\msctf.dll 
\Windows\SysWOW64\msi.dll 
\Windows\SysWOW64\msimg32.dll 
\Windows\SysWOW64\msls31.dll 
\Windows\SysWOW64\msvcirt.dll 
\Windows\SysWOW64\msvcp_win.dll
\Windows\SysWOW64\msvcp110_win.dll
\Windows\SysWOW64\msvcp60.dll 
\Windows\SysWOW64\msvcrt.dll 
\Windows\SysWOW64\msvcrt40.dll 
\Windows\SysWOW64\msvfw32.dll 
\Windows\SysWOW64\mswsock.dll 
\Windows\SysWOW64\msxml3.dll 
\Windows\SysWOW64\netapi32.dll 
\Windows\SysWOW64\netutils.dll
\Windows\SysWOW64\networkexplorer.dll 
\Windows\SysWOW64\normaliz.dll 
\Windows\SysWOW64\nsi.dll 
\Windows\SysWOW64\ntdll.dll 
\Windows\SysWOW64\ntdsapi.dll 
\Windows\SysWOW64\ntmarta.dll 
\Windows\SysWOW64\ntshrui.dll 
\Windows\SysWOW64\ntvdm64.dll 
\Windows\SysWOW64\odbc32.dll 
\Windows\SysWOW64\odbcint.dll 
\Windows\SysWOW64\ole32.dll 
\Windows\SysWOW64\oleacc.dll 
\Windows\SysWOW64\oleaccrc.dll 
\Windows\SysWOW64\oleaut32.dll 
\Windows\SysWOW64\oledlg.dll 
\Windows\SysWOW64\olepro32.dll 
\Windows\SysWOW64\powrprof.dll 
\Windows\SysWOW64\profapi.dll
\Windows\SysWOW64\propsys.dll 
\Windows\SysWOW64\psapi.dll 
\Windows\SysWOW64\reg.exe 
\Windows\SysWOW64\regapi.dll 
\Windows\SysWOW64\regsvr32.exe 
\Windows\SysWOW64\resutils.dll 
\Windows\SysWOW64\riched20.dll 
\Windows\SysWOW64\riched32.dll 
\Windows\SysWOW64\rpcrt4.dll 
\Windows\SysWOW64\rpcrtremote.dll
\Windows\SysWOW64\rsaenh.dll 
\Windows\SysWOW64\rtutils.dll 
\Windows\SysWOW64\rundll32.exe 
\Windows\SysWOW64\samcli.dll
\Windows\SysWOW64\samlib.dll 
\Windows\SysWOW64\schannel.dll 
\Windows\SysWOW64\sechost.dll
\Windows\SysWOW64\secur32.dll 
\Windows\SysWOW64\sensapi.dll 
\Windows\SysWOW64\setupapi.dll 
\Windows\SysWOW64\SHCore.dll
\Windows\SysWOW64\shell32.dll 
\Windows\SysWOW64\shellstyle.dll 
\Windows\SysWOW64\shfolder.dll 
\Windows\SysWOW64\shlwapi.dll 
\Windows\SysWOW64\slc.dll 
\Windows\SysWOW64\slcext.dll
\Windows\SysWOW64\srvcli.dll
\Windows\SysWOW64\sspicli.dll
\Windows\SysWOW64\stdole2.tlb 
\Windows\SysWOW64\stdole32.tlb 
\Windows\SysWOW64\StructuredQuery.dll
\Windows\SysWOW64\svchost.exe 
\Windows\SysWOW64\sxs.dll 
\Windows\SysWOW64\sxsstore.dll 
\Windows\SysWOW64\sxstrace.exe 
\Windows\SysWOW64\syssetup.dll 
\Windows\SysWOW64\tzres.dll 
\Windows\SysWOW64\ucrtbase.dll
\Windows\SysWOW64\urlmon.dll 
\Windows\SysWOW64\user32.dll 
\Windows\SysWOW64\userenv.dll 
\Windows\SysWOW64\usp10.dll 
\Windows\SysWOW64\uxtheme.dll 
\Windows\SysWOW64\vds_ps.dll 
\Windows\SysWOW64\version.dll 
\Windows\SysWOW64\wbem
\Windows\SysWOW64\wbemcomn.dll 
\Windows\SysWOW64\wdmaud.drv 
\Windows\SysWOW64\webio.dll
\Windows\SysWOW64\winbrand.dll 
\Windows\SysWOW64\windows.storage.dll
\Windows\SysWOW64\windowscodecs.dll 
\Windows\SysWOW64\windowscodecsext.dll 
\Windows\SysWOW64\winhttp.dll 
\Windows\SysWOW64\wininet.dll 
\Windows\SysWOW64\winmm.dll 
\Windows\SysWOW64\winmmbase.dll
\Windows\SysWOW64\winnsi.dll 
\Windows\SysWOW64\winspool.drv 
\Windows\SysWOW64\wintrust.dll 
\Windows\SysWOW64\wkscli.dll
\Windows\SysWOW64\wldap32.dll 
\Windows\SysWOW64\wow32.dll 
\Windows\SysWOW64\ws2_32.dll 
\Windows\SysWOW64\ws2help.dll 
\Windows\SysWOW64\wship6.dll 
\Windows\SysWOW64\wshtcpip.dll 
\Windows\SysWOW64\wsock32.dll 
\Windows\SysWOW64\wtsapi32.dll
\Windows\SysWOW64\xmllite.dll 
\Windows\WinSxS\manifests\x86_microsoft-windows-m..tion-isolationlayer_*
\Windows\WinSxS\manifests\x86_microsoft.windows.common-controls_*
\Windows\WinSxS\manifests\x86_microsoft.windows.gdiplus_6595b64144ccf1df*.*
\Windows\WinSxS\manifests\x86_microsoft.windows.i..utomation.proxystub_*
\Windows\WinSxS\manifests\x86_microsoft.windows.isolationautomation_*
\Windows\WinSxS\manifests\x86_microsoft.windows.systemcompatible_*
\Windows\WinSxS\x86_microsoft.windows.common-controls_*
\Windows\WinSxS\x86_microsoft.windows.gdiplus*
\Windows\WinSxS\x86_microsoft.windows.isolationautomation_*








\windows\winsxs\x86_microsoft.windows.c..-controls.resources_*_en-US*
\windows\winsxs\manifests\x86_microsoft.windows.c..-controls.resources_*_en-US*



\Windows\SysWOW64\en-US\activeds.dll.mui, \Windows\SysWOW64\en-GB\activeds.dll.mui




\Windows\SysWOW64\*\activeds.dll.mui
\Windows\SysWOW64\*\adsldp.dll.mui
\Windows\SysWOW64\*\adsldpc.dll.mui
\Windows\SysWOW64\*\advapi32.dll.mui
\Windows\SysWOW64\*\apphelp.dll.mui
\Windows\SysWOW64\*\atl.dll.mui
\Windows\SysWOW64\*\AudioSes.dll.mui
\Windows\SysWOW64\*\avifil32.dll.mui
\Windows\SysWOW64\*\bcrypt.dll.mui
\Windows\SysWOW64\*\clusapi.dll.mui
\Windows\SysWOW64\*\cmd.exe.mui
\Windows\SysWOW64\*\combase.dll.mui
\Windows\SysWOW64\*\comctl32.dll.mui
\Windows\SysWOW64\*\comdlg32.dll.mui
\Windows\SysWOW64\*\crypt32.dll.mui
\Windows\SysWOW64\*\dcomp.dll.mui
\Windows\SysWOW64\*\dhcpcsvc.dll.mui
\Windows\SysWOW64\*\dhcpcsvc6.dll.mui
\Windows\SysWOW64\*\dnsapi.dll.mui
\Windows\SysWOW64\*\dsound.dll.mui
\Windows\SysWOW64\*\dui70.dll.mui
\Windows\SysWOW64\*\duser.dll.mui
\Windows\SysWOW64\*\dwmapi.dll.mui
\Windows\SysWOW64\*\edputil.dll.mui
\Windows\SysWOW64\*\ESENT.dll.mui
\Windows\SysWOW64\*\explorerframe.dll.mui
\Windows\SysWOW64\*\FirewallAPI.dll.mui
\Windows\SysWOW64\*\fwpuclnt.dll.mui
\Windows\SysWOW64\*\iertutil.dll.mui
\Windows\SysWOW64\*\imageres.dll.mui
\Windows\SysWOW64\*\iphlpapi.dll.mui
\Windows\SysWOW64\*\kerberos.dll.mui
\Windows\SysWOW64\*\kernel32.dll.mui
\Windows\SysWOW64\*\KernelBase.dll.mui
\Windows\SysWOW64\*\mlang.dll.mui
\Windows\SysWOW64\*\MMDevAPI.dll.mui
\Windows\SysWOW64\*\mpr.dll.mui
\Windows\SysWOW64\*\mprext.dll.mui
\Windows\SysWOW64\*\msacm32.dll.mui
\Windows\SysWOW64\*\msacm32.drv.mui
\Windows\SysWOW64\*\mscms.dll.mui
\Windows\SysWOW64\*\msctf.dll.mui
\Windows\SysWOW64\*\msvfw32.dll.mui
\Windows\SysWOW64\*\mswsock.dll.mui
\Windows\SysWOW64\*\NetworkExplorer.dll.mui
\Windows\SysWOW64\*\ntdll.dll.mui
\Windows\SysWOW64\*\ntmarta.dll.mui
\Windows\SysWOW64\*\ntshrui.dll.mui
\Windows\SysWOW64\*\ntvdm64.dll.mui
\Windows\SysWOW64\*\odbcint.dll.mui
\Windows\SysWOW64\*\ole32.dll.mui
\Windows\SysWOW64\*\oleaccrc.dll.mui
\Windows\SysWOW64\*\oledlg.dll.mui
\Windows\SysWOW64\*\powrprof.dll.mui
\Windows\SysWOW64\*\propsys.dll.mui
\Windows\SysWOW64\*\reg.exe.mui
\Windows\SysWOW64\*\regsvr32.exe.mui
\Windows\SysWOW64\*\resutils.dll.mui
\Windows\SysWOW64\*\rpcrt4.dll.mui
\Windows\SysWOW64\*\rsaenh.dll.mui
\Windows\SysWOW64\*\rtutils.dll.mui
\Windows\SysWOW64\*\rundll32.exe.mui
\Windows\SysWOW64\*\schannel.dll.mui
\Windows\SysWOW64\*\sechost.dll.mui
\Windows\SysWOW64\*\setupapi.dll.mui
\Windows\SysWOW64\*\SHCore.dll.mui
\Windows\SysWOW64\*\shell32.dll.mui
\Windows\SysWOW64\*\shellstyle.dll.mui
\Windows\SysWOW64\*\shlwapi.dll.mui
\Windows\SysWOW64\*\slc.dll.mui
\Windows\SysWOW64\*\slcext.dll.mui
\Windows\SysWOW64\*\svchost.exe.mui
\Windows\SysWOW64\*\sxs.dll.mui
\Windows\SysWOW64\*\sxstrace.exe.mui
\Windows\SysWOW64\*\tzres.dll.mui
\Windows\SysWOW64\*\urlmon.dll.mui
\Windows\SysWOW64\*\user32.dll.mui
\Windows\SysWOW64\*\userenv.dll.mui
\Windows\SysWOW64\*\uxtheme.dll.mui
\Windows\SysWOW64\*\wdmaud.drv.mui
\Windows\SysWOW64\*\webio.dll.mui
\Windows\SysWOW64\*\windows.storage.dll.mui
\Windows\SysWOW64\*\winhttp.dll.mui
\Windows\SysWOW64\*\wininet.dll.mui
\Windows\SysWOW64\*\winmm.dll.mui
\Windows\SysWOW64\*\winmmbase.dll.mui
\Windows\SysWOW64\*\winspool.drv.mui
\Windows\SysWOW64\*\wldap32.dll.mui
\Windows\SysWOW64\*\ws2_32.dll.mui
\Windows\SysWOW64\*\wship6.dll.mui
\Windows\SysWOW64\*\wshtcpip.dll.mui
\Windows\SysWOW64\*\wsock32.dll.mui































