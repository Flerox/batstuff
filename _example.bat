@echo off
chcp 1252
cls 

::basic setup
set projName=Proj Name

set slnPath="C:\Path\To\trunk\solution.sln"
set folderPath="C:\Project\Path"

set webAddress="http://project.local/"

set port=1337

call _main-browser.bat

::main stuff
call _main.bat