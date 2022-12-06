@echo off
rem Planning Mod for Prison Architect Quick Install
:menu
support\Wselect support\InstallMenu.txt "Install Menu" "$item">nul "Planning Mod Installation^Version Undead DLC" /fc=#FFFFFF /bg=#191919 /ontop /ps=1 /menu /hc=#CC0000 /fs=10
  if %errorlevel%==0 goto :eof
  if %errorlevel%==1 goto install
  if %errorlevel%==2 goto :eof
  if %errorlevel%==3 goto :About
  if %errorlevel%==4 goto :eof
  if %errorlevel%==4 goto :eof
:about
support\Wprompt.exe "About" "This program will install the planning mod to the PA mods directory." Ok i
goto menu
:install 
support\Wprompt.exe "Planning Mod Install" "Prison Architect Planning Mod Quick Install^Version 1.6 Undead^^Install the mod?" YesNo 1:0 ?
if errorlevel 2 (
        echo Install aborted
		goto abort
)

rem Create vars
setlocal
set dlc1=psych ward
set dlc2=going green
set dlc3=second chances
set dlc4=perfect storm
set dlc5=gangs
set dlc6=undead

rem Create temp folder and copy all folders to new temp folder
start support\Wbusy "Install" "Copying files to a temporary directory" /count /marquee /noclose
mkdir "temp\base"
mkdir "temp\%dlc1%"
mkdir "temp\%dlc2%"
mkdir "temp\%dlc3%"
mkdir "temp\%dlc4%"
mkdir "temp\%dlc5%"
mkdir "temp\%dlc6%"
xcopy base\*.* temp\base /Y /S
xcopy "%dlc1%\*.*" "temp\%dlc1%\" /Y /S 
xcopy "%dlc2%\*.*" "temp\%dlc2%\" /Y /S
xcopy "%dlc3%\*.*" "temp\%dlc3%\" /Y /S
xcopy "%dlc4%\*.*" "temp\%dlc4%\" /Y /S
xcopy "%dlc5%\*.*" "temp\%dlc5%\" /Y /S
xcopy "%dlc5%\*.*" "temp\%dlc6%\" /Y /S
rem support\wait 3 -1
support\Wbusy "Install" /stop
rem Copy and replace temp folder contents to the game mod folder
start support\Wbusy "Install" "Copying files to the game directory" /count /marquee
xcopy temp\*.* "%appdata%\..\Local\Introversion\Prison Architect\mods\" /S /F /Y
rem Cleanup temp folder
start support\Wbusy "Install" "Removing temporary files." /count /marquee
rmdir /s /q temp\
support\Wbusy "Install" "All operations complete." /stop 
support\Wprompt "Install" "Install complete." Ok i
goto :eof
:abort
support\Wprompt "Install" "Installation aborted. Your files have not^been touched." Ok x
:end