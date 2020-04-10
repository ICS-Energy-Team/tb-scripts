#!/bin/bash
for d in {7..28}
do
  d_next=$(($d+1))
  filename="/media/nfs/arxiv/ts_kv_2020-02-$d.csv.gz"
  copy_del.sh "2020-02-$d 00:00:00" "2020-02-$d_next 00:00:00" $filename >~/log/batch.log 2>~/log/batch.log 
done
#Copy 29-th Feb
filename="/media/nfs/arxiv/ts_kv_2020-02-29.csv.gz"
copy_del.sh "2020-02-29 00:00:00" "2020-03-1 00:00:00" $filename
