#!/bin/bash
while :;
do
log_file="/var/log/custom_daemon.log"
date +"%S:%M:%H %d-%m-%Y" >> $log_file
echo '     total free' >> $log_file
free -hm | grep Mem | awk '{print $1, $2, $4}' >> $log_file
echo HDD: `df -h | awk '{if ($6 == "/") { print $2, $4 }}' | head -1` >> $log_file
echo CPU: `cat /proc/cpuinfo | grep "model name" -m1 | cut -c14-` >> $log_file
uptime | awk '{print $6, $7, $8, $9, $10}' >> $log_file
echo "----------------------------------" >> $log_file
sleep 30
done
