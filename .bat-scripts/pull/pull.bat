:: /--------------------------------------------------------------------------\
:: |                                                                          |
:: |   This script pulls the latest commit (version) of the repository from   |
:: |    the remote (GitHub), and hard-resets the working directory to that    |
:: |                                 version.                                 |
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

:: Navigate to the repository’s root directory to run git commands.
cd ..\.. > nul
:: Fetch latest changes to remote repository.
git fetch origin > nul
:: Hard-reset to the current version of the remote repository.
git reset --hard origin/main > nul
:: Clean any files and directories which are not part of the commit.
git clean -fdq > nul
:: Navigate back to this script’s directory.
cd "%~dp0" > nul

:: Let user know that the operation was successful and tell them they can now edit the repository.
cls
type msgs\1-success.txt
:: Pause to allow user to read the message before exiting.
pause > nul

:: Navigate to the repository’s root directory.
cd ..\.. > nul
:: Exit the script.
exit /b