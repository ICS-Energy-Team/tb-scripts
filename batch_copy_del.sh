#!/bin/bash
#The script doesn't handle December!
month="10"
last_day=31
year=2021
base_folder="/mnt/nfs/arxiv"
folder=$base_folder/$year.$month
logfile="/home/collective/log/batch_copy-$year-$month.log"
exec > $logfile
exec 2>&1
echo "Copy ts_kv for month=$month, year=$year to $folder"
if [ ! -d $folder ]; then
        echo "Create new folder: $folder"
        mkdir $folder
fi
d=1
#for d in {1..5};
touch $logfile
while [ "$d" -lt "$last_day" ];
do
  d_next=$(($d+1))
  filename="$folder/ts_kv_$year-$month-$d.csv.gz"
  echo "Copying to $filename"
  copy_ts.sh "$year-$month-$d 00:00:00" "$year-$month-$d_next 00:00:00" $filename
  #copy_del.sh "$year-$month-$d 00:00:00" "$year-$month-$d_next 00:00:00" $filename 
  d=$d_next
done
#Copy last day
filename="$folder/ts_kv_$year-$month-$last_day.csv.gz"
next_month=$(($month+1))
echo "Copying to $filename"
copy_ts.sh "$year-$month-$last_day 00:00:00" "$year-$next_month-1 00:00:00" $filename
#copy_del.sh "$year-$month-$last_day 00:00:00" "$year-$next_month-01 00:00:00" $filename
#Copy devices
now_date=$(date -d "now" +"%Y-%m-%d")
file_device="$folder/devices.csv"
get_devices.sh $file_device
file_keys="$folder/ts_kv_dictionary.csv
get_keys.sh $file_keys
