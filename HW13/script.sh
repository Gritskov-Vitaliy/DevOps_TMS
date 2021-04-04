#!/bin/bash

tput setaf 5; echo "Hello. This is a script for comparing three numbers."
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
fi

tput setaf 4; echo "Enter the number C"; tput setaf 7 
read C
if [[ $C == "exit" ]] || [[ $C == "e" ]]; then
    tput setaf 1; echo "Exit"; tput setaf 7 
    exit
fi

declare -i zero=0
declare -i one=1
declare -i two=2
declare -i three=3
declare -i four=4
declare -i five=5
declare -i Zero=0
declare -i One=1
declare -i Two=2
declare -i Three=3
declare -i Four=4
declare -i Five=5

if [ -z $A ] || [ -z $B ] || [ -z $C ]; then
    tput setaf 2; echo "The value of A, B, or C is empty"; tput setaf 7 
elif (( $A == $B )); then
    if (( $B == $C )); then
        tput setaf 2; echo "A = B = C"; tput setaf 7
    elif (( $B > $C )); then
        tput setaf 2; echo "A = B > C"; tput setaf 7
    elif (( $B < $C )); then
        tput setaf 2; echo "A = B < C"; tput setaf 7
    fi
elif (( $A > $B )); then
    if (( $B == $C )); then
        tput setaf 2; echo "A > B = C"; tput setaf 7
    elif (( $B > $C )); then
        tput setaf 2; echo "A > B > C"; tput setaf 7
    elif (( $B < $C )); then
        if (( $A == $C )); then
            tput setaf 2; echo "B < A = C"; tput setaf 7
        elif (( $A > $C )); then
            tput setaf 2; echo "B < C < A"; tput setaf 7
        elif (( $A > $B )); then
            tput setaf 2; echo "B < A < C"; tput setaf 7
        fi
    fi
elif (( $A < $B )); then
    if (( $B == $C )); then
        tput setaf 2; echo "A < B = C"; tput setaf 7
    elif (( $B > $C )); then
        if (( $A == $C )); then
            tput setaf 2; echo "B > A = C"; tput setaf 7
        elif (( $A < $C )); then
            tput setaf 2; echo "A < C < B"; tput setaf 7
        elif (( $A < $B )); then
            tput setaf 2; echo "B > A > C"; tput setaf 7
        fi
    elif (( $B < $C )); then
        tput setaf 2; echo "A < B < C"; tput setaf 7
    fi
fi
done