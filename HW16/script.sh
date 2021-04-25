#!/bin/bash
 
A=$1
B=$2
C=$3

function compare {
    if (( $1 == $2 )); then
        echo "$1 = $2"
    elif (( $1 > $2 )); then
        echo "$1 > $2"
    elif (( $1 < $2 )); then
        echo "$1 < $2"
    fi
}

if [ -z $A ] || [ -z $B ] || [ -z $C ] || [[ ! $A == ?(-)+([0-9]) ]] || [[ ! $B == ?(-)+([0-9]) ]] || [[ ! $C == ?(-)+([0-9]) ]]; then
    echo "The value of A, B, or C is empty or is not a number"
    exit
fi

AB=$(compare $A $B)
BC=$(compare $B $C)
AC=$(compare $A $C)

echo "$AB, $BC, $AC"
