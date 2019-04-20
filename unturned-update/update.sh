#!/bin/bash

rm -f ~/Steam/appcache/appinfo.vdf

appinfo=$(/opt/steamcmd/steamcmd.sh +login anonymous +app_info_update 1 +app_info_print "304930" +quit)
buildid=$(echo $appinfo | pcregrep -o1 '\"public\"[\sa-z\"0-9{}]*\"timeupdated\"[\s]*\"([0-9]*)\"')

echo $buildid > /var/www/html/timeupdated

/opt/steamcmd/steamcmd.sh +login $USERNAME $PASSWORD +force_install_dir /unturned +app_update 304930 +exit
