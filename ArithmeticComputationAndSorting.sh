#!/bin/bash -x
declare -A ResultDictionary
read -p "Enter the value of a: " a
read -p "Enter the value of b: " b
read -p "Enter the value of c: " c

operation1=`echo "$a+$b*$c" | bc`
operation2=`echo "$a*$b+$c" | bc`
operation3=`echo "scale=2;$c+$a/$b" | bc`
operation4=`echo "$a%$b+$c" | bc`

ResultDictionary[operation1]=$operation1
ResultDictionary[operation2]=$operation2
ResultDictionary[operation3]=$operation3
ResultDictionary[operation4]=$operation4

for((counter=1; counter<=${#ResultDictionary[@]}; counter++))
do
	ResultArray[$counter]=${ResultDictionary[operation"$((counter))"]}
done

echo ${ResultArray[@]}

function DescendingOrder ()
{
	for((i=1;i<4;i++))
	do
		for((j=i+1;j<5;j++))
		do
			if [[ ${ResultArray[i]%.*} -lt ${ResultArray[j]%.*} ]]
			then
				temporary=${ResultArray[i]}
				ResultArray[i]=${ResultArray[j]}
				ResultArray[j]=$temporary
			fi
		done
	done
	echo ${ResultArray[@]}
}
function AscendingOrder ()
{
	for((i=1;i<4;i++))
	do
		for((j=i+1;j<5;j++))
		do
			if [[ ${ResultArray[i]%.*} -gt ${ResultArray[j]%.*} ]]
			then
				temporary=${ResultArray[i]}
				ResultArray[i]=${ResultArray[j]}
				ResultArray[j]=$temporary
			fi
		done
	done
	echo ${ResultArray[@]}
}
#Function Call
DescendingOrder
AscendingOrder
