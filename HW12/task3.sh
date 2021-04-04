#!/bin/bash

tput setaf 5; echo "Hello. This is a script for comparing two numbers."
echo "Enter exit(e) to exit"; tput setaf 7 

while :; do
tput setaf 4; echo "Enter the number A"; tput setaf 7 
read A
if [[ $A == "exit" ]] || [[ $A == "e" ]]; then
    tput setaf 1; echo "Exit"; tput setaf 7 
    exit
fi
tput setaf 4; echo "Enter the number B"; tput setaf 7 
read B
if [[ $B == "exit" ]] || [[ $B == "e" ]]; then
    tput setaf 1; echo "Exit"; tput setaf 7 
    exit
elif [ -z $A ] || [ -z $B ]; then
    tput setaf 2; echo "The value A or B is empty"; tput setaf 7 
elif (( $A > $B )); then
    tput setaf 2; echo "A > B"; tput setaf 7 
elif (( $A == $B )); then
    tput setaf 2; echo "A = B"; tput setaf 7 
elif (( $A < $B )); then
    tput setaf 2; echo "A < B"; tput setaf 7 
fi
done