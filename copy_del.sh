#!/bin/bash
ts_1=$(($(date -d "$1" +%s)*1000))
ts_2=$(($(date -d "$2" +%s)*1000))
#echo "Copying telemetry after $1 and before $2 to $3"
echo "BEGIN;
\copy (SELECT * FROM ts_kv WHERE ts>=$ts_1 AND ts<$ts_2) TO PROGRAM 'gzip >$3' WITH DELIMITER ';' CSV
DELETE FROM ts_kv WHERE ts>=$ts_1 AND ts<$ts_2;
COMMIT;" |psql -U thingsboard -d thingsboard -h localhost 
#-c "" 
#psql -U thingsboard -h localhost -d thingsboard -W --output /media/nfs/devices.out -c "\copy device TO /media/nfs/devices.csv WITH DELIMITER ';' CSV HEADER"
