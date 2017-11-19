#!/bin/bash

rm -f /root/Steam/appcache/appinfo.vdf

appinfo=$(/root/steamcmd.sh +login anonymous +app_info_update 1 +app_info_print "304930" +quit)
buildid=$(echo $appinfo | pcregrep -o1 '\"public\"[\sa-z\"0-9{}]*\"timeupdated\"[\s]*\"([0-9]*)\"')

echo $buildid > /var/www/html/index.html
echo $buildid > /var/www/html/timeupdated