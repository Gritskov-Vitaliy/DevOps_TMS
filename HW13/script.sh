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

function check_C {
    if [ -z $C ]; then
        tput setaf 2; echo "The value of C is empty"; tput setaf 7
    elif [[ ! $C == ?(-)+([0-9]) ]]; then
        if [[ ! " ${array[@]} " =~ " $C " ]]; then
            tput setaf 2; echo "The text value of C is out of range or unknown value"; tput setaf 7
        else
            compare
        fi
    else
        compare
    fi
}

function enter_C {
    tput setaf 4; echo "Enter the number C"; tput setaf 7 
    read C
    if [[ $C == "exit" ]] || [[ $C == "e" ]]; then
        tput setaf 1; echo "Exit"; tput setaf 7 
        exit
    else
        C=$(echo $C | awk '{print tolower($0)}')
        check_C
    fi
}

function enter_B {
    tput setaf 4; echo "Enter the number B"; tput setaf 7 
    read B
    if [[ $B == "exit" ]] || [[ $B == "e" ]]; then
        tput setaf 1; echo "Exit"; tput setaf 7 
        exit
    else
        B=$(echo $B | awk '{print tolower($0)}')
        check_B
    fi
}

function check_B {
    if [ -z $B ]; then
        tput setaf 2; echo "The value of B is empty"; tput setaf 7
    elif [[ ! $B == ?(-)+([0-9]) ]]; then
        if [[ ! " ${array[@]} " =~ " $B " ]]; then
            tput setaf 2; echo "The text value of B is out of range or unknown value"; tput setaf 7
        else
            enter_C
        fi
    else
        enter_C
    fi
}

function check_A {
    if [ -z $A ]; then
        tput setaf 2; echo "The value of A is empty"; tput setaf 7
    elif [[ ! $A == ?(-)+([0-9]) ]]; then
        if [[ ! " ${array[@]} " =~ " $A " ]]; then
            tput setaf 2; echo "The text value of A is out of range or unknown value"; tput setaf 7
        else
            enter_B
        fi
    else
        enter_B
    fi
}

tput setaf 4; echo "Enter the number A"; tput setaf 7 
read A
if [[ $A == "exit" ]] || [[ $A == "e" ]]; then
    tput setaf 1; echo "Exit"; tput setaf 7 
    exit
else
    A=$(echo $A | awk '{print tolower($0)}')
    check_A
fi

done
