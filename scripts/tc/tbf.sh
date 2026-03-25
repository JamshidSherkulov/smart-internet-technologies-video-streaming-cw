#!/bin/bash
# TBF configuration

INTERFACE=enp0s8

sudo tc qdisc add dev $INTERFACE root tbf rate 2.5mbit burst 20k latency 50ms
