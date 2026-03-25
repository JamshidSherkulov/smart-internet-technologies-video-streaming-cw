#!/bin/bash
# SCTP iPerf3 setup

# Load SCTP module
sudo modprobe sctp

# Run server
./src/iperf3 -s

# Run client (replace IP)
./src/iperf3 -c <server-ip> --sctp -t 10
