@echo off
chcp 1252

:time
echo.
echo STARTTIME
echo %time%
echo.
pause > nul | set/p=Press any key to pause session. . . & echo(
echo.
echo ENDTIME
echo %time%
echo.
set /P tm=End session [Y/N]?
if /I "%tm%" EQU "N" echo Fika is over. && goto time
if /I "%tm%" EQU "Y" exit