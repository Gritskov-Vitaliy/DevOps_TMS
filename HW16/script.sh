#!/bin/bash
 
A=$1
B=$2
C=$3

if [ -z $A ] || [ -z $B ] || [ -z $C ] || [[ ! $A == ?(-)+([0-9]) ]] || [[ ! $B == ?(-)+([0-9]) ]] || [[ ! $C == ?(-)+([0-9]) ]]; then
    echo "The value of A, B, or C is empty or is not a number" 
elif (( $A == $B )); then
    if (( $B == $C )); then
        echo "A = B = C"
    elif (( $B > $C )); then
        echo "A = B > C"
    elif (( $B < $C )); then
        echo "A = B < C"
    fi
elif (( $A > $B )); then
    if (( $B == $C )); then
        echo "A > B = C"
    elif (( $B > $C )); then
        echo "A > B > C"
    elif (( $B < $C )); then
        if (( $A == $C )); then
            echo "B < A = C"
        elif (( $A > $C )); then
            echo "B < C < A"
        elif (( $A > $B )); then
            echo "B < A < C"
        fi
    fi
elif (( $A < $B )); then
    if (( $B == $C )); then
        echo "A < B = C"
    elif (( $B > $C )); then
        if (( $A == $C )); then
            echo "B > A = C"
        elif (( $A < $C )); then
            echo "A < C < B"
        elif (( $A < $B )); then
            echo "B > A > C"
        fi
    elif (( $B < $C )); then
        echo "A < B < C"
    fi
fi
