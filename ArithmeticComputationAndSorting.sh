#!/bin/bash -x

read -p "Enter the value of a: " a
read -p "Enter the value of b: " b
read -p "Enter the value of c: " c

operation1=`echo "$a+$b*$c" | bc`
operation2=`echo "$a*$b+$c" | bc`
operation3=`echo "scale=2;$c+$a/$b" | bc`
operation4=`echo "$a%$b+$c" | bc`

