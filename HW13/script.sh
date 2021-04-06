#!/bin/bash

declare -i zero=0
declare -i one=1
declare -i two=2
declare -i three=3
declare -i four=4
declare -i five=5

array=("zero" "one" "two" "three" "four" "five")

tput setaf 5; echo "Hello. This is a script for comparing three numbers."
echo "Enter exit(e) to exit"; tput setaf 7 

while :; do

function compare {
    if (( $A == $B )); then
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
}

function check {
    num=$1
    if [[ $num == "exit" ]] || [[ $num == "e" ]]; then
        tput setaf 1; echo "Exit"; tput setaf 7 
        exit
    elif [ -z $num ]; then
        tput setaf 2; echo "The value is empty"; tput setaf 7
        trigger=1
        return $trigger
    elif [[ ! $num == ?(-)+([0-9]) ]] && [[ ! " ${array[@]} " =~ " $num " ]]; then        
        tput setaf 2; echo "The text value is out of range (zero..five) or unknown value"; tput setaf 7
        trigger=1
        return $trigger
    else
        trigger=0
        return $trigger
    fi
}

tput setaf 4; echo "Enter the number A"; tput setaf 7 
read A
A=$(echo $A | awk '{print tolower($0)}')
check "$A"
if [[ $trigger == "1" ]]; then
    continue
else
    tput setaf 4; echo "Enter the number B"; tput setaf 7 
    read B
    B=$(echo $B | awk '{print tolower($0)}')
    check "$B"
fi

if [[ $trigger == "1" ]]; then
    continue
else
    tput setaf 4; echo "Enter the number C"; tput setaf 7 
    read C
    C=$(echo $C | awk '{print tolower($0)}')
    check "$C"
    compare
fi

done
