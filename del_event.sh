#!/bin/bash
#Usage
#./del_event.sh '2020-04-01 00:00' '2020-04-02 15:10:30'
ts_1=$(($(date -d "$1" +%s)*1000))
ts_2=$(($(date -d "$2" +%s)*1000))
echo "Deleting events after $1 and before $2"
psql -U thingsboard -d thingsboard -h localhost -c "DELETE FROM event WHERE uuid_tstz(event_uid)>=$ts_1 AND uuid_tstz(event_uid)<$ts_2);" 
#psql -U thingsboard -h localhost -d thingsboard -W --output /media/nfs/devices.out -c "\copy device TO /media/nfs/devices.csv WITH DELIMITER ';' CSV HEADER"
