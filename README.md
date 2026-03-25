# Smart Internet Technologies Coursework

## DASH Video Streaming with QoE Evaluation

### Student Information

-   Student ID: 4223542
-   Module: Smart Internet Technologies

------------------------------------------------------------------------

## Project Overview

This project implements an end-to-end MPEG-DASH video streaming system
using two Linux virtual machines (Server and Client). The system
evaluates how network conditions affect Quality of Experience (QoE).

------------------------------------------------------------------------

## Features

-   Video transcoding using FFmpeg
-   DASH packaging (MPD + segments)
-   Apache web server hosting
-   VLC-based client playback
-   SCTP traffic generation using iPerf3
-   Network simulation using Linux Traffic Control:
    -   TBF
    -   HTB
    -   Traffic Policing
-   MOS (Mean Opinion Score) evaluation

------------------------------------------------------------------------

## Project Structure

    docs/        → notes and explanations
    scripts/     → commands used (ffmpeg, dash, tc, iperf)
    results/     → experiment results and MOS
    screenshots/ → evidence images

------------------------------------------------------------------------

## Installation & Deployment

### Server VM

    sudo apt update
    sudo apt install ffmpeg apache2 iproute2 net-tools git -y

### Client VM

    sudo apt update
    sudo apt install vlc -y

------------------------------------------------------------------------

## Streaming Setup

-   DASH files stored in:

```{=html}
<!-- -->
```
    /var/www/html/dash/

Example URLs:

    http://192.168.56.101/dash/car/manifest.mpd
    http://192.168.56.101/dash/city/manifest.mpd

------------------------------------------------------------------------

## Playback

-   Open VLC
-   Media → Open Network Stream
-   Enter MPD URL
-   Play video

------------------------------------------------------------------------

## Traffic Generation (SCTP)

    ./src/iperf3 -s
    ./src/iperf3 -c 192.168.56.101 --sctp -t 10

------------------------------------------------------------------------

## Traffic Control Scenarios

-   TBF: 2.5 Mbps
-   HTB: 2.5--5 Mbps
-   Policing: drop at 3.5 Mbps

------------------------------------------------------------------------

## MOS Evaluation

MOS was calculated based on: - Startup delay - Buffering - Smoothness -
Visual quality

Scale: - 5 = Excellent - 1 = Bad

------------------------------------------------------------------------

## Key Findings

-   High-motion video is more sensitive to network issues
-   Traffic policing causes the worst QoE
-   HTB performs better than strict TBF

------------------------------------------------------------------------

## Videos

Videos are not included due to size.

To reproduce:
1. Download sample videos from:
   https://www.pexels.com/search/videos/HD/
2. Place them in /videos folder
3. Run:
   ./transcode_commands.sh
------------------------------------------------------------------------

## Conclusion

This project demonstrates how adaptive streaming behaves under different
network conditions and how QoE can be measured using MOS.
