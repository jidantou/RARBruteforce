@echo off
set /p filePath=Please input file path:
set /p startNum=Please input minimum password to try:
set /p maxNum=Please input maximum passord to try:
set /p outputPath=Please input output dir path:
set num=%startNum%

rem echo %num% %startNum% %maxNum% %filePath% %outputPath%
:start

set /a temp=%num% %% 100
if %temp% equ 0 echo %num%

if %num% gtr %maxNum% (
    echo Not Find from %startNum% to %maxNum%
    echo %DATE% %TIME% : tried from %startNum% to %maxNum% of %filePath%, but not find>Output.log
    exit
)

rem echo 7z x -p%num% %filePath% -o%outputPath% -y
7z x -p%num% %filePath% -o%outputPath% -y 1>nul 2>nul

rem echo %errorlevel%
if %errorlevel% equ 0 (
    echo succeed! The password of %filePath% is %num%
    echo %DATE% %TIME% : the password of %filePath% is %num%>Output.log
    exit
) ELSE (
    set /a num+=1
    rem echo %num%
    goto start
)