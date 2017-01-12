@echo off
chcp 1252 > nul
cls

::settings for coloration
color 0b

SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

goto time

:color
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof


:time
set date = %date%
set time = %time%
set findtext=%date%
set findfile="_timelog.txt"
set /a COUNT=0
for /f %%i in ('findstr %findtext% %findfile%') do (
  set /a COUNT=COUNT + 1
)
echo  .........................
echo  .........................
if %COUNT% LSS 1 (
echo %date% >> "_timelog.txt"
cls
echo %date%
)
echo.
call :color b0 " START " & echo %time%
echo Start: %time% >> "_timelog.txt"
echo.
timeout /t 2 /nobreak > nul
pause > nul | set/p=Press any key to end session... & echo(
echo.
call :color b0 " END " & echo %time%
@(echo End: %time%
) >> "_timelog.txt"
echo.
timeout /t 1 /nobreak > nul
set /P info=Session info (leave EMPTY for previous message): 
@(echo Message: %info%  && echo.
) >> "_timelog.txt"
echo.
echo.
pause > nul | set/p=Press any key to start new session... & echo( & goto time