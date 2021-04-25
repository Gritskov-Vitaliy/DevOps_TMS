#!/bin/bash
 
A=$1
B=$2
C=$3

function A_compare_B {
    if (( $A == $B )); then
        echo "A = B"
    elif (( $A > $B )); then
        echo "A > B"
    elif (( $A < $B )); then
        echo "A < B"
    fi
}

function B_compare_C {
    if (( $B == $C )); then
        echo "B = C"
    elif (( $B > $C )); then
        echo "B > C"
    elif (( $B < $C )); then
        echo "B < C"
    fi
}

function A_compare_C {
    if (( $A == $C )); then
        echo "A = C"
    elif (( $A > $C )); then
        echo "A > C"
    elif (( $A < $C )); then
        echo "A < C"
    fi
}

if [ -z $A ] || [ -z $B ] || [ -z $C ] || [[ ! $A == ?(-)+([0-9]) ]] || [[ ! $B == ?(-)+([0-9]) ]] || [[ ! $C == ?(-)+([0-9]) ]]; then
    echo "The value of A, B, or C is empty or is not a number"
    exit
fi

AB=$(A_compare_B)
BC=$(B_compare_C)
AC=$(A_compare_C)

echo "$AB, $BC, $AC"
