#!/bin/bash
# Traffic policing configuration

INTERFACE=enp0s8

sudo tc qdisc add dev $INTERFACE handle ffff: ingress
sudo tc filter add dev $INTERFACE parent ffff: protocol ip prio 1 u32 match u32 0 0 police rate 3.5mbit burst 20k drop
