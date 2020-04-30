#!/bin/bash
base_folder="/media/nfs/pg_backup"
Y_m=$(date +%Y.%m)
folder=$base_folder/$Y_m
if [ ! -d $folder ]; then
	echo "Create new folder: $folder"
	mkdir $folder
fi
filename=tb_$(date +'%Y.%m.%d').dump 
filename=$folder/$filename
echo "Dump to $filename"
pg_dump -U thingsboard --no-password -F c -f $filename -h localhost -d thingsboard
