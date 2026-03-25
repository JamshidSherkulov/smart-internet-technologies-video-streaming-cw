# Setup and Deployment Instructions

## Smart Internet Technologies Coursework

------------------------------------------------------------------------

## 1. Environment Overview

This project uses two virtual machines:

-   **Server VM (Ubuntu-Prometheus)**\
    Hosts DASH content and Apache web server

-   **Client VM (Ubuntu Client)**\
    Plays video using VLC and generates network traffic

------------------------------------------------------------------------

## 2. Server VM Setup

### Update system

``` bash
sudo apt update
sudo apt upgrade -y
```

### Install required packages

``` bash
sudo apt install ffmpeg apache2 iproute2 net-tools git -y
```

------------------------------------------------------------------------

## 3. Video Preparation

### Place original videos

``` bash
mkdir -p ~/Documents/SIT/videos-original
```

### Transcode videos

Example:

``` bash
ffmpeg -i car.mp4 -b:v 1500k car_1500k.mp4
ffmpeg -i car.mp4 -b:v 2000k car_2000k.mp4
ffmpeg -i car.mp4 -b:v 4000k car_4000k.mp4
```

------------------------------------------------------------------------

## 4. DASH Packaging

``` bash
ffmpeg -i car_1500k.mp4 -i car_2000k.mp4 -i car_4000k.mp4 \
-map 0:v -map 1:v -map 2:v -c:v copy \
-f dash manifest.mpd
```

------------------------------------------------------------------------

## 5. Apache Hosting

### Create directories

``` bash
sudo mkdir -p /var/www/html/dash/car
```

### Copy files

``` bash
sudo cp -r dash-output/* /var/www/html/dash/car/
```

### Start Apache

``` bash
sudo systemctl start apache2
```

------------------------------------------------------------------------

## 6. Client VM Setup

### Install VLC

``` bash
sudo apt update
sudo apt install vlc -y
```

### Test connectivity

``` bash
ping <server-ip>
```

------------------------------------------------------------------------

## 7. Video Playback

In VLC: - Media → Open Network Stream\
- Enter:

``` text
http://<server-ip>/dash/car/manifest.mpd
```

------------------------------------------------------------------------

## 8. SCTP Traffic Generation

### Enable SCTP

``` bash
sudo modprobe sctp
```

### Build iPerf3

``` bash
git clone https://github.com/esnet/iperf.git
cd iperf
./configure
make
```

### Run server

``` bash
./src/iperf3 -s
```

### Run client

``` bash
./src/iperf3 -c <server-ip> --sctp -t 10
```

------------------------------------------------------------------------

## 9. Traffic Control

### TBF

``` bash
sudo tc qdisc add dev <interface> root tbf rate 2.5mbit burst 20k latency 50ms
```

### HTB

``` bash
sudo tc qdisc add dev <interface> root handle 1: htb
sudo tc class add dev <interface> parent 1: classid 1:10 htb rate 2.5mbit ceil 5mbit
```

### Policing

``` bash
sudo tc qdisc add dev <interface> handle ffff: ingress
sudo tc filter add dev <interface> parent ffff: protocol ip prio 1 u32 match u32 0 0 police rate 3.5mbit drop
```

------------------------------------------------------------------------

## 10. MOS Evaluation

Evaluate video based on: - Startup delay - Buffering - Smoothness -
Visual quality

MOS scale: - 5 = Excellent - 1 = Bad

------------------------------------------------------------------------

## Notes

-   Replace `<server-ip>` with your actual IP
-   Replace `<interface>` with your network interface (e.g., enp0s8)

------------------------------------------------------------------------

## Conclusion

Following these steps allows full replication of the DASH streaming
experiment, including setup, deployment, testing, and evaluation.
