#!/bin/bash

dir="/home/tms/DevOps_TMS/$1"
filename1="*.sh"
filename2="*.png"

find_filename1=`find $dir -type f -iname "$filename1"`
find_filename2=`find $dir -type f -iname "$filename2"`
find_all=`find $dir` 

echo "Print all $filename1 under $dir"; tput setaf 5
echo $find_filename1; tput setaf 7
echo "Print all $filename2 under $dir"; tput setaf 2
echo $find_filename2; tput setaf 7
echo "Print all files and folders under $dir" ; tput setaf 3
echo $find_all