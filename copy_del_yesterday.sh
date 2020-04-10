d1=$(date -d "yesterday" +"%Y-%m-%d 00:00:00")
ts_1=`date -d "$d1" +%s`
date -d "@$(($ts_1-60*60*24*30))"
