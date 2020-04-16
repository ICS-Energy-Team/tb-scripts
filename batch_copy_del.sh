#!/bin/bash
month=3
last_day=31
echo "Copy ts_kv for month=$month"
d=1
#for d in {1..5};
while [ "$d" -lt "$last_day" ];
do
  d_next=$(($d+1))
  filename="/media/nfs/arxiv/ts_kv_2020-$month-$d.csv.gz"
  echo "Copying to $filename"
  copy_del.sh "2020-$month-$d 00:00:00" "2020-$month-$d_next 00:00:00" $filename >~/log/batch.log 2>~/log/batch.log 
  d=$d_next
done
#Copy last day
filename="/media/nfs/arxiv/ts_kv_2020-$month-$last_day.csv.gz"
next_month=$(($month+1))
echo "Copying to $filename"
copy_del.sh "2020-$month-$last_day 00:00:00" "2020-$next_month-1 00:00:00" $filename
