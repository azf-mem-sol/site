:: /--------------------------------------------------------------------------\
:: |                                                                          |
:: |  This script undoes the last commit, i.e. reverts the “main” branch to   |
:: |    the commit before last. Because this is a dangerous operation (it     |
:: |      deletes work permanently), an appropriate warning is displayed      |
:: |                 and the user must confirm their choice.                  |
:: |                                                                          |
:: |     Please DO NOT change this file — it is crucial to the simplified     |
:: |            workflow created for the users of this repository.            |
:: |                                                                          |
:: \--------------------------------------------------------------------------/

:: Prevent default prompt output.
@echo off
:: Set script code to UTF-8.
chcp 65001 > nul
:: Navigate to this script’s directory.
cd "%~dp0" > nul

:: Remind user of what they are doing, warn them of the danger, and ask if they are ready to proceed.
cls
type msgs\1-warn.txt

:: Prompt for user consent.
set /p confirm1=" > "
:: If it is not provided, go-to the cancellation and exit script.
if /i "%confirm1%" neq "oui" ( goto :reset-cancelled )

:: Print second warning message, only proceed if user is 100% sure they want to take this action — this shouldn’t be doable by accident.
cls
type msgs\2-warn.txt

:: Prompt for user consent.
set /p confirm2=" > "
:: If it is not provided, go-to the cancellation and exit script.
if /i "%confirm2%" neq "supprimer" ( goto :reset-cancelled )
:: If it is provided, go-to the hard-reset script.
goto :reset-confirmed

:reset-cancelled
:: Reset cancelled - output cancellation message and exit program.
cls
type msgs\4-cancelled.txt
:: Pause to allow user to read the message before exiting.
pause > nul
:: Go-to the end of the script.
goto :exit

:reset-confirmed
:: Navigate to the repository’s root directory to run git commands.
cd ..\.. > nul
:: Fetch latest changes to remote repository.
git fetch origin > nul
:: Hard-reset to the current version of the remote repository.
git reset --hard origin/main > nul
:: Hard-reset to the commit before last.
git reset --hard HEAD~1 > nul
:: Clean any files and directories which are not part of the commit.
git clean -fdq > nul
:: Navigate back to this script’s directory.
cd "%~dp0" > nul

:: Tell the user that the changes have been saved and published.
cls
type msgs\3-success.txt
:: Pause to allow user to read the message before exiting.
pause > nul

:exit
:: Navigate to the repository’s root directory.
cd ..\.. > nul
:: Exit the script.
exit /b