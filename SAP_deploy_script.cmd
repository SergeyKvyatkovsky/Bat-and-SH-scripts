@echo off

set /P var1="Enter name git repositary : "
cd ..
cd ..
echo "Wait for a few time ... "
for /f "tokens=*" %%i in ('dir /s xs-security.json ^| find "%var1%\resources\dev"') do set a1=%%i
set str=%a1:Directory of C:\=%
set strr=%str:\resources\dev=%
cd %strr%
echo %cd%
xcopy /Y resources\dev\xs-app.json approuter
xcopy /Y resources\dev\xs-security.json .
echo "============ Checking for copied files ==============="
dir | find "xs-security.json"
dir approuter | find "xs-app.json"

pause

set /P var1="Enter your login (SAP email) cf : "
set /P var2="Enter your password cf : "

REM login in your space
call cf login -u %var1% -p %var2% 

REM choose environment and space
call cf target -o learininghub3_dev -s stay_current

REM deploy app
call cf push --strategy rolling --vars-file vars_DEV.yml
pause
