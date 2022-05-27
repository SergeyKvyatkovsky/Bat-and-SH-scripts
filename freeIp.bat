@echo off

chcp 65001
chcp
set /P var1="Enter first acted your subnet without dot : "
set /P var2="Enter second acted your subnet without dot : "
set /P var3="Enter third acted your subnet without dot : "
echo #####################################################################
echo ###############It is Starting to find free IP adresses###############
echo #####################################################################
echo Threre are free Ips: >> logFreeIp.txt
echo Your subnet is : %var1%.%var2%.%var3%.XX


for /l %%a in (1,1,255) do (
    echo It is checking now %var1%.%var2%.%var3%.%%a
	for /F "tokens=*" %%g in ('ping %var1%.%var2%.%var3%.%%a -n 1') do (
		IF "%%g"=="Request timed out." echo %var1%.%var2%.%var3%.%%a >> logFreeIp.txt
	)
    ping %var1%.%var2%.%var3%.%%a -n 1 >> logWritingAllActions.txt
    )
echo #####################################################################
echo ####Operation is finish , you could find free ip in logFreeIp.txt####
echo #####################################################################
pause