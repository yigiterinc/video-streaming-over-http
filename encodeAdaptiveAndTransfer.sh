#!/bin/bash

# Change this with your ffmpeg's path
ffmpeg_path=/Users/erinc/Downloads/ffmpeg

# Ip adress of broadcast server
server_ip=your_ip

# TCP Port where broadcast server is listening for stream
rtmp_port=1935

# This is the name of stream application endpoint in your server's nginx configuration file
application_name=show

$ffmpeg_path -f avfoundation -framerate 30 -i "0:0" \
-c:v libx264 -c:a aac -b:v 1024k -b:a 128k -vf "scale=720:trunc(ow/a/2)*2" -tune zerolatency -preset veryfast -crf 23 -f flv rtmp://$server_ip:$rtmp_port/$application_name/stream_hd720 \
-c:v libx264 -c:a aac -b:v 512k -b:a 64k -vf "scale=480:trunc(ow/a/2)*2" -tune zerolatency -preset veryfast -crf 23 -f flv rtmp://$server_ip:$rtmp_port/$application_name/stream_mid \
-c:v libx264 -c:a aac -b:v 128k -b:a 32k -vf "scale=360:trunc(ow/a/2)*2" -tune zerolatency -preset veryfast -crf 23 -f flv rtmp://$server_ip:$rtmp_port/$application_name/stream_low

