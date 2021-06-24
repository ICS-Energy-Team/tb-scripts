#!/bin/bash
year=2021
month=1
last_day=31
echo "Copy ts_kv for $year-$month"
d=1
folder="/media/nfs/arxiv/$year/$month"
if [ ! -d "$folder"]; then
  mkdir "$folder"
fi
#for d in {1..5};
while [ "$d" -lt "$last_day" ];
do
  d_next=$(($d+1))
  filename="$folder/ts_kv_$year-$month-$d.csv.gz"
  echo "Copying to $filename"
  copy_del.sh "$year-$month-$d 00:00:00" "$year-$month-$d_next 00:00:00" $filename >~/log/batch_copy_del.log 2>~/log/batch_copy_del.log 
  d=$d_next
done
#Copy last day
filename="$folder/ts_kv_$year-$month-$last_day.csv.gz"
next_month=$(($month+1))
echo "Copying to $filename"
copy_del.sh "$year-$month-$last_day 00:00:00" "$year-$next_month-1 00:00:00" $filename
