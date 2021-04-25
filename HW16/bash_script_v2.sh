#!/bin/bash

A=$1
B=$2
C=$3

if [[ ! $A =~ one|two|three ]]; then
    if [[ ! $A == ?(-)+([0-9]) ]] || (( $A < -1000000 )) || (( $A > 1000000 )); then
    echo "The value A is out of range"
    fi
fi
if [[ ! $B =~ one|two|three ]]; then
    if [[ ! $B == ?(-)+([0-9]) ]] || (( $B < -1000000 )) || (( $B > 1000000 )); then
    echo "The value B is out of range"
    fi
fi
if [[ ! $C =~ one|two|three ]]; then
    if [[ ! $C == ?(-)+([0-9]) ]] || (( $C < -1000000 )) || (( $C > 1000000 )); then
    echo "The value C is out of range"
    fi
fi

