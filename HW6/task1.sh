#!/bin/bash

log_file="/var/log/custom_daemon.log"

while :;
do
DATA=`date +"%S:%M:%H %d-%m-%Y"`
MEM=`free -hm | grep Mem | awk '{print $1, $2, $4}'`
HDD="HDD: `df -h | awk '{if ($6 == "/") { print $2, $4 }}' | head -1`"
CPU="CPU: `cat /proc/cpuinfo | grep "model name" -m1 | cut -c14-`"
Load_average=`uptime | awk '{print $6, $7, $8, $9, $10}'`
echo "$DATA, $MEM, $HDD, $CPU, $Load_average" >> $log_file
echo "----------------------------------" >> $log_file
sleep 30
done