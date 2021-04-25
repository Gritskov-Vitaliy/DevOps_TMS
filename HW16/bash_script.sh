#!/bin/bash
 
A=$1
B=$2
C=$3
array=({-1000000..1000000} "one" "two" 'three')

if [[ ! " ${array[*]} " =~ " $A " ]]; then
    echo "The value A is out of range"
fi
if [[ ! " ${array[*]} " =~ " $B " ]]; then
    echo "The value B is out of range"
fi
if [[ ! " ${array[*]} " =~ " $C " ]]; then
    echo "The value C is out of range"
fi
