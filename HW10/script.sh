#!/bin/bash

dir="/home/tms/DevOps_TMS/$1"
filename1="*.sh"
filename2="*.png"

find_filename=`find $dir -type f -iname "$filename1" -o -iname "$filename2"`
find_all=`find $dir -not -name ".*"` 

echo "Print all $filename1 and $filename2 under $dir"; tput setaf 5
echo $find_filename; tput setaf 7
echo "Print all files and folders under $dir" ; tput setaf 3
echo $find_all
