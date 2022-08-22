#!/bin/sh
echo "====================== Start deploy ==========================="
cp -p -v resources/dev/xs-app.json approuter
cp -p -v resources/dev/xs-security.json .
cat approuter/xs-app.json
cat xs-security.json
read -p "Enter your login (SAP email) cf : " login
read -p "Enter your password cf : " password
#echo $login
#echo $password
cf login -a https://api.cf.eu10.hana.ondemand.com -o learininghub3_dev -u $login -p $password -s stay_current
cf target -o learininghub3_dev -s stay_current
cf push --vars-file vars_DEV.yml