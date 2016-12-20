@echo off
chcp 1252
cls 

::basic setup
set proj=Proj Name

set trunk="C:\Path\To\trunk\solution.sln"
set trunkExplorer="C:\Project\Path"

set trunkWeb="http://project.local/"

set projPort=1337

call _main-browser.bat

::main stuff
call _main.bat