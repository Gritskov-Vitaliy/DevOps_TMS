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

if [ -z $A ] || [ -z $B ] || [ -z $C ]; then
    tput setaf 2; echo "The value A, B or C is empty"; tput setaf 7
fi

if [[ $A == "Zero" ]] || [[ $A == "zero" ]]; then
    A=0
elif [[ $A == "One" ]] || [[ $A == "one" ]]; then
    A=1
elif [[ $A == "Two" ]] || [[ $A == "two" ]]; then
    A=2
elif [[ $A == "Three" ]] || [[ $A == "three" ]]; then
    A=3
elif [[ $A == "Four" ]] || [[ $A == "four" ]]; then
    A=4
elif [[ $A == "Five" ]] || [[ $A == "five" ]]; then
    A=5
fi

if [[ $B == "Zero" ]] || [[ $B == "zero" ]]; then
    B=0
elif [[ $B == "One" ]] || [[ $B == "one" ]]; then
    B=1
elif [[ $B == "Two" ]] || [[ $B == "two" ]]; then
    B=2
elif [[ $B == "Three" ]] || [[ $B == "three" ]]; then
    B=3
elif [[ $B == "Four" ]] || [[ $B == "four" ]]; then
    B=4
elif [[ $B == "Five" ]] || [[ $B == "five" ]]; then
    B=5
fi

if [[ $C == "Zero" ]] || [[ $C == "zero" ]]; then
    C=0
elif [[ $C == "One" ]] || [[ $C == "one" ]]; then
    C=1
elif [[ $C == "Two" ]] || [[ $C == "two" ]]; then
    C=2
elif [[ $C == "Three" ]] || [[ $C == "three" ]]; then
    C=3
elif [[ $C == "Four" ]] || [[ $C == "four" ]]; then
    C=4
elif [[ $C == "Five" ]] || [[ $C == "five" ]]; then
    C=5
fi

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
        else
            tput setaf 2; echo "A > B < C"; tput setaf 7
        fi
    fi
elif (( $A < $B )); then
    if (( $B == $C )); then
        tput setaf 2; echo "A < B = C"; tput setaf 7
    elif (( $B > $C )); then
        if (( $A == $C )); then
            tput setaf 2; echo "B > A = C"; tput setaf 7
        else
            tput setaf 2; echo "A < B > C"; tput setaf 7
        fi
    elif (( $B < $C )); then
        tput setaf 2; echo "A < B < C"; tput setaf 7
    fi
fi
done