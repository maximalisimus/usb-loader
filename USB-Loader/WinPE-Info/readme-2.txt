
mkdir C:\BuildPE\Mount\Windows\System32\config\systemprofile\Desktop


offlinereg-win64 C:\BuildPE\Mount\Windows\System32\config\SOFTWARE " " run C:\BuildPE\util\regexportX64.txt

Copy on SOFT and else File System OS:
xcopy /y /o /e "C:\BuildPE\AddFiles\x64\*.*" "C:\BuildPE\Mount\*.*"

Delete on logs:

CD /D C:\BuildPE\Mount\Windows\System32\config
DEL *.LOG1 /A /S /Q /F
DEL *.LOG2 /A /S /Q /F
DEL *.BLF /A /S /Q /F
DEL *.REGTRANS-MS /A /S /Q /F
CD /D C:\BuildPE\Mount\Windows\System32\SMI\Store\Machine\
DEL *.LOG1 /A /S /Q /F
DEL *.LOG2 /A /S /Q /F
DEL *.BLF /A /S /Q /F
DEL *.REGTRANS-MS /A /S /Q /F
CD /D C:\BuildPE\Mount\Users\Default
DEL *.LOG1 /A /S /Q /F
DEL *.LOG2 /A /S /Q /F
DEL *.BLF /A /S /Q /F
DEL *.REGTRANS-MS /A /S /Q /F



