@echo off

chcp 65001
chcp
echo #####################################################################
echo ###############It is Starting to find free IP adresses###############
echo #####################################################################
echo Threre are free Ips: >> logFreeIp.txt
for /l %%a in (1,1,255) do (
    echo It is checking now 10.169.61.%%a
	for /F "tokens=*" %%g in ('ping 10.169.61.%%a -n 1') do (
		IF "%%g"=="Request timed out." echo 10.169.61.%%a >> logFreeIp.txt
	)
    ping 10.169.61.%%a -n 1 >> logWritingAllActions.txt
    )
echo #####################################################################
echo ####Operation is finish , you could find free ip in logFreeIp.txt####
echo #####################################################################
pause