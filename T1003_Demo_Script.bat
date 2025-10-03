ECHO OFF
CLS
:MENU
CLS
ECHO.
ECHO .......................................................
ECHO This demo script is designed to let users experience 
ECHO Trend Micro Vision One features.
ECHO The script contains commands that demonstrate and 
ECHO simulate attack techniques.
ECHO All commands are validated and safe to run in a normal
ECHO environment.
REM ECHO PRESS 1, 2 to select your task or X to EXIT.
ECHO .......................................................
ECHO.
ECHO T1003 - OS Credential Dumping
ECHO.
ECHO Execute procedure 1, 2, or both in succession, and then 
ECHO go to the apps with the expected results.
ECHO Note: Trend Micro Vision One may take a few minutes to provide results.
ECHO.
ECHO 1 - Dump the SAM hive from the Windows Registry
ECHO 2 - Copy the NTDS file
ECHO X - EXIT
ECHO.
SET /P M=Type 1, 2, or X, and press ENTER:
IF %M%==1 GOTO REG-DUMP
IF %M%==2 GOTO NTDS-COPY
IF %M%==X GOTO EOF
IF %M%==x GOTO EOF
GOTO MENU

:REG-DUMP
ECHO.
ECHO The command [reg.exe save hklm\sam C:\trend-micro-test\trend-micro-test.hive]
ECHO is executed to dump the Security Account Manager (SAM) hive from the Windows Registry to a file.
ECHO The SAM is a database file that contains the hashed credentials of an endpoint.
ECHO In this demo, the command is not actually executed so no file is created.
ECHO The echo command is used to demonstrate and simulate the attempt and 
ECHO is enough to trigger a detection in Trend Micro Vision One.
ECHO.
cmd.exe /c echo "reg.exe save hklm\sam C:\trend-micro-test\trend-micro-test.hive"
ECHO.
pause
GOTO MENU

:NTDS-COPY
ECHO.
ECHO The command [copy C:\Windows\NTDS\ntds.dit C:\trend-micro-test\ntds.dit]
ECHO is executed to create a copy of the Active Directory domain database file (ntds.dit).
ECHO The ntds.dit file contains the hashed credentials of domain users.
ECHO In this demo, the command is not actually executed so no file is created.
ECHO The echo command is used to demonstrate and simulate the attempt and 
ECHO is enough to trigger a detection in Trend Micro Vision One.
ECHO.
cmd.exe /c echo "copy C:\Windows\NTDS\ntds.dit C:\trend-micro-test\ntds.dit"
ECHO.
pause
GOTO MENU

:EOF