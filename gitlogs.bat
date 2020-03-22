:: GitHub.bat
:: Written by DirtySanchez 
:: For ^The Community^ presented by DonkeyPunch Community Gaming
:: Discord: https://discord.me/eXpoch
:: Free to use this file and modify it for your needs

@echo off

:: *********************** General Settings *************************
SET DEBUG=4

SET DRIVE=D
SET PARENTFOLDER=DayZServers
SET MAP=enoch
SET COMMUNITYNAME=TheCommunity

SET LIVESERVERFOLDER=%COMMUNITYNAME%_%MAP%
SET LIVEPROFILE=TheEnochServer

SET TESTSERVERFOLDER=%COMMUNITYNAME%_%MAP%Test
SET TESTSERVEREXENAME=EnochTestServer_x64
SET TESTPROFILE=TheEnochTestServer

:: ***************************** GITHUB *****************************
SET GITEMAIL=donkeypunch.info@gmail.com
SET GITNAME=DirtySanchez
SET GITACCTNAME=ravmustang
SET REPONAME=TheCommunity-EnochTestLogs
SET REPOLINK=https://github.com/%GITACCTNAME%/%REPONAME%.git


:: ********************************************************************************
:: **Do not change anything below this comment unless you know what you are doing**
:: ********************************************************************************
setlocal EnableDelayedExpansion
SET MYPATH=%~dp0

if "%MYPATH:~0,-1%" == "%DRIVE%:\%PARENTFOLDER%\%LIVESERVERFOLDER%" ( SET SERVERFOLDER=%LIVESERVERFOLDER% )
if "%MYPATH:~0,-1%" == "%DRIVE%:\%PARENTFOLDER%\%TESTSERVERFOLDER%" ( SET SERVERFOLDER=%TESTSERVERFOLDER% )
SET DAYZSA=%MYPATH:~0,-1%

:: *************************** GitHub Repo ****************************
call git config --global user.email "%GITEMAIL%"
call git config --global user.name "%GITNAME%"


cd /d %DAYZSA%
echo %DAYZSA%
:: Pull Changes
echo Remote Repo is being checked for changes.... please hold tight
call git pull
timeout %DEBUG%

:: Commit Logs
echo Test Instance is being checked for new logs.... please hold tight
call git add .
call git commit -m "Server Logs Commit-%TIME%"
call git push

echo All logs have been sent to repo
timeout %DEBUG%

@exit