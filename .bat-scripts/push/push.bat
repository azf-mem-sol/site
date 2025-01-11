:: /--------------------------------------------------------------------------\
:: |                                                                          |
:: |      This script commits any changes to the working directory, and       |
:: |   force-pushes these changes to the remote (GitHub). Because this is a   |
:: |  dangerous operation (any changes become live immediately after push),   |
:: |  an appropriate warning message is displayed and the user must confirm   |
:: |                              their choice.                               |
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
set /p confirm=" > "
:: If it is not provided, go-to the cancellation and exit script.
if /i "%confirm%" neq "oui" ( goto :push-cancelled )
:: If it is provided, go-to the stage / commit / push script.
goto :push-confirmed

:push-cancelled
:: Push cancelled - output cancellation message and exit program.
cls
type msgs\4-cancelled.txt
:: Pause to allow user to read the message before exiting.
pause > nul
:: Go-to the end of the script.
goto :exit

:push-confirmed
:: Tell the user they will now need to provide a commit message.
cls
type msgs\2-commit.txt

:: Prompt for a commit message.
set /p message=" > "
:: Navigate to the repository’s root directory to run git commands.
cd ..\.. > nul
:: Add all files to the staging area.
git add . > nul
:: Commit the changes.
git commit -m "%message%" > nul
:: Force-push the changes to the remote repository.
git push -f origin main > nul
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