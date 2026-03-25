#!/bin/bash
# Transcoding videos into 3 bitrates

ffmpeg -i car.mp4 -c:v libx264 -b:v 1500k car_1500k.mp4
ffmpeg -i car.mp4 -c:v libx264 -b:v 2000k car_2000k.mp4
ffmpeg -i car.mp4 -c:v libx264 -b:v 4000k car_4000k.mp4

ffmpeg -i city.mp4 -c:v libx264 -b:v 1500k city_1500k.mp4
ffmpeg -i city.mp4 -c:v libx264 -b:v 2000k city_2000k.mp4
ffmpeg -i city.mp4 -c:v libx264 -b:v 4000k city_4000k.mp4
