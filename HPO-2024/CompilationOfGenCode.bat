@ECHO OFF
cd /d C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build
call vcvarsall.bat x86
cd /d C:\Users\user\OneDrive\Рабочий стол\HPO-2024\HPO-2024
ml /c /coff /Zi asm.asm
link /OPT:NOREF /DEBUG /SUBSYSTEM:CONSOLE asm.obj 
call asm.exe
pause
exit