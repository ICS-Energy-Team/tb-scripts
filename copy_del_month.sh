#!/bin/bash
d_first=$(date -d "1 month ago 1 day ago" +"%Y-%m-%d 00:00:00")
d_second=$(date -d "month ago" +"%Y-%m-%d 00:00:00")
month=$(date -d "1 month ago 1 day ago" +%m)
day=$(date -d "1 month ago 1 day ago" +%d)
year=$(date -d "1 month ago 1 day ago" +%Y)
filename="/media/nfs/arxiv/ts_kv_$year-$month-$day.csv.gz"
echo $d_first
echo $d_second
echo "$year $month $day"
echo $filename
copy_del.sh "$d_first" "$d_second" $filename >>~/log/batch.log 2>>~/log/batch.log 

