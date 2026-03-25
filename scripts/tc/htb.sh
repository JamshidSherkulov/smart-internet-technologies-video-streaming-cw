#!/bin/bash
# HTB configuration

INTERFACE=enp0s8

sudo tc qdisc add dev $INTERFACE root handle 1: htb default 10
sudo tc class add dev $INTERFACE parent 1: classid 1:10 htb rate 2.5mbit ceil 5mbit burst 20k
