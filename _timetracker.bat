@echo off
chcp 1252 > nul
color 0b
:time
set date = %date%
set time = %time%
set findtext=%date%
set findfile="_timelog.txt"
set /a COUNT=0
for /f %%i in ('findstr %findtext% %findfile%') do (
  set /a COUNT=COUNT + 1
)
if %COUNT% LSS 1 (
echo %date% >> "_timelog.txt"
)
echo.
echo STARTTIME
echo %time%
echo Start: %time% >> "_timelog.txt"
echo.
pause > nul | set/p=Press any key to pause session. . . & echo(
echo.
echo ENDTIME
echo %time%
@(echo End: %time%  && echo.
) >> "_timelog.txt"
echo.
set /P tm=End session [Y/N]?
if /I "%tm%" EQU "N" echo Fika is over. && goto time
if /I "%tm%" EQU "Y" goto exit