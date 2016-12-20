color a
::START
echo %proj%
echo Port %projPort%

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
start "" %trunk%
echo Running %proj% Visual Studio Solution
explorer %trunkExplorer%
cd %chromePath%
start chrome.exe %trunkWeb%
echo Running %proj% in Chrome
goto localTimeTracker

:vs
echo.
echo ## Visual Studio ##
start "" %trunk%
echo Running %proj% Visual Studio Solution
goto mainmenu

:chrome
echo.
echo ## Chrome ##
cd %chromePath%
start chrome.exe %trunkWeb%
echo Running %proj% in Chrome
goto mainmenu

:firefox
echo.
echo ## Firefox ##
cd %firefoxPath%
start firefox.exe %trunkWeb%
echo Running %proj% in Firefox
goto mainmenu

:ie
echo.
echo ## Internet Explorer ##
cd %iePath%
start iexplore %trunkWeb%
echo Running %proj% in IE
goto mainmenu

:edge
echo.
echo ## Microsoft Edge ##
start microsoft-edge:%trunkWeb%
echo Running %proj% in Edge
goto mainmenu

:folder
echo.
echo ## File explorer ##
explorer %trunkExplorer%
echo Opening %proj% in file explorer
goto mainmenu

:timetracker
echo.
echo ## Time tracker ##
set /P ttm=Run in separate window [Y/N]?
if /I "%ttm%" EQU "N" goto localTimeTracker
if /I "%ttm%" EQU "Y" echo Opening timetracker.bat window. . . && start call _timetracker.bat
goto mainmenu

:localTimeTracker
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
if /I "%tm%" EQU "N" echo Fika is over. && goto localTimeTracker
if /I "%tm%" EQU "Y" goto mainmenu

:funtajm
echo.
echo ## Funny joke ##
echo What's Whitney Houston's favorite type of coordination?
echo.
pause > nul | set/p=Press key to get joke (hihi). . . & echo(
echo.
echo.
echo.
echo HAAAAAAAAAAAAAAAAAND EEEEEEEEEEEEEEEEEYEEEEEEEEE!
echo.
echo.
echo.
echo hahahahahahahahhahah! 
echo.
pause > nul | set/p=That was so punny! Press key if you can't take it anymore. . . & echo(
goto mainmenu