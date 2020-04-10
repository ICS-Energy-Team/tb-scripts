#!/bin/bash
file=$1
header="date;table;total_size;index_size;table_size"
date_str=$(date -d "now" "+%Y-%m-%d %H:%M:%S")
command="\copy (SELECT '$date_str','ts_kv',pg_size_pretty(pg_total_relation_size('ts_kv')),pg_size_pretty(pg_indexes_size('ts_kv')),pg_size_pretty(pg_relation_size('ts_kv'))) TO PROGRAM 'tee -a $file' WITH DELIMITER ';' CSV"
if [ ! -f $file ]; then
	echo "Creating new file ..."
	echo $header > $file
fi
#echo $command
psql -U thingsboard -d thingsboard -h localhost -c "$command" 

