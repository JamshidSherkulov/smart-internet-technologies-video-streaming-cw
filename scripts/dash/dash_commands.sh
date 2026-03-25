#!/bin/bash
# Create DASH manifest and segments

ffmpeg -i car_1500k.mp4 -i car_2000k.mp4 -i car_4000k.mp4 \
-map 0:v -map 1:v -map 2:v -c:v copy \
-f dash car_manifest.mpd

ffmpeg -i city_1500k.mp4 -i city_2000k.mp4 -i city_4000k.mp4 \
-map 0:v -map 1:v -map 2:v -c:v copy \
-f dash city_manifest.mpd
