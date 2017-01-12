color a
::START
echo %projName%
echo Port %port%

:mainmenu
echo.
echo ...............................................
echo Main menu
echo ...............................................
echo.
echo 1 - QUICK START
echo 2 - Visual Studio
echo 3 - Chrome
echo 4 - Firefox
echo 5 - IE
echo 6 - Edge
echo 7 - File explorer
echo 8 - Time tracking
echo 9 - Joke
echo 0 - EXIT
echo.
set /P mm=Select number from menu and press ENTER: 
if %mm% == 1 goto quickstart
if %mm% == 2 goto vs
if %mm% == 3 goto chrome
if %mm% == 4 goto firefox
if %mm% == 5 goto ie
if %mm% == 6 goto edge
if %mm% == 7 goto folder
if %mm% == 8 goto timetracker
if %mm% == 9 goto funtajm
if %mm% == 0 exit


:quickstart
echo.
echo ## Quick start ##
start "" %slnPath%
echo Running %projName% Visual Studio Solution (trunk)
explorer %folderPath%
cd %chromePath%
start chrome.exe %webAddress%
echo Running %projName% in Chrome
goto localTimeTracker

:vs
echo.
echo ## Visual Studio ##
start "" %slnPath%
echo Running %projName% Visual Studio Solution (trunk)
goto mainmenu

:chrome
echo.
echo ## Chrome ##
cd %chromePath%
start chrome.exe %webAddress%
echo Running %projName% in Chrome
goto mainmenu

:firefox
echo.
echo ## Firefox ##
cd %firefoxPath%
start firefox.exe %webAddress%
echo Running %projName% in Firefox
goto mainmenu

:ie
echo.
echo ## Internet Explorer ##
cd %iePath%
start iexplore %webAddress%
echo Running %projName% in IE
goto mainmenu

:edge
echo.
echo ## Microsoft Edge ##
start microsoft-edge:%webAddress%
echo Running %projName% in Edge
goto mainmenu

:folder
echo.
echo ## File explorer ##
explorer %folderPath%
echo Opening %projName% in file explorer
goto mainmenu

:timetracker
echo.
echo ## Time tracker ##
set /P ttm=Run in separate window [Y/N]?
if /I "%ttm%" EQU "N" goto localTimeTracker
if /I "%ttm%" EQU "Y" echo Opening timetracker.bat window. . . && start call _timetracker.bat
goto mainmenu

:localTimeTracker
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
echo %date%
)
echo.
echo START: %time%
echo Start: %time% >> "_timelog.txt"
echo.
timeout /t 2 /nobreak > nul
pause > nul | set/p=Press any key to end session... & echo(
echo.
echo END: %time%
@(echo End: %time%
) >> "_timelog.txt"
echo.
timeout /t 1 /nobreak > nul
set /P info=Session info (leave EMPTY for previous message): 
@(echo Message: %info%  && echo.
) >> "_timelog.txt"
echo.
echo.
set /P tm=End session [Y/N]?
if /I "%tm%" EQU "N" echo Fika is over. && goto localTimeTracker
if /I "%tm%" EQU "Y" goto mainmenu

:funtajm
echo.
echo ## Funny joke ##
echo.
timeout /t 1 /nobreak > nul
echo What's Whitney Houston's favorite type of coordination?
timeout /t 3 /nobreak > nul
echo.
pause > nul | set/p=Press key to get joke (hihi). . . & echo(
echo.
echo.
echo.
echo HAAAAAAAAAAAAAAAAAND EEEEEEEEEEEEEEEEEYEEEEEEEEE!
timeout /t 3 /nobreak > nul
echo.
echo.
echo.
echo hahahahahahahahhahah! 
timeout /t 2 /nobreak > nul
echo bwahahahahaahahhahahahahahahahahhahah! 
echo.
timeout /t 1 /nobreak > nul
pause > nul | set/p=That was so punny! Press key if you can't take it anymore. . . & echo(
goto mainmenu