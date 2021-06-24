#!/usr/bin/bash
cam_91_dir="/media/nfs/camera/lpk"
sec_now=$(date +%s)
sec_tomorrow=$(date -d "next day 00:00:00" +%s)
sec_duration=$((sec_tomorrow-sec_now))
filename=$cam_91_dir/cam_lpk.$(date +%Y.%m.%d).mjpeg
echo "Record to $filename"
ffmpeg -nostdin -nostats -t $sec_duration -i rtsp://user:password@10.101.0.91/stream1 -codec copy $filename
