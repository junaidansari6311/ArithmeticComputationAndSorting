#!/bin/bash -x
declare -A resultDictionary
read -p "Enter the value of a: " a
read -p "Enter the value of b: " b
read -p "Enter the value of c: " c

operation1=`echo "$a+$b*$c" | bc`
operation2=`echo "$a*$b+$c" | bc`
operation3=`echo "scale=2;$c+$a/$b" | bc`
operation4=`echo "$a%$b+$c" | bc`

resultDictionary[operation1]=$operation1
resultDictionary[operation2]=$operation2
resultDictionary[operation3]=$operation3
resultDictionary[operation4]=$operation4

for((counter=1; counter<=${#resultDictionary[@]}; counter++))
do
	resultArray[$counter]=${resultDictionary[operation"$((counter))"]}
done

echo ${resultArray[@]}

function DescendingOrder ()
{
	for((i=1;i<4;i++))
	do
		for((j=i+1;j<5;j++))
		do
			if [[ ${resultArray[i]%.*} -lt ${resultArray[j]%.*} ]]
			then
				temporary=${resultArray[i]}
				resultArray[i]=${resultArray[j]}
				resultArray[j]=$temporary
			fi
		done
	done
	echo ${resultArray[@]}
}
function AscendingOrder ()
{
	for((i=1;i<4;i++))
	do
		for((j=i+1;j<5;j++))
		do
			if [[ ${resultArray[i]%.*} -gt ${resultArray[j]%.*} ]]
			then
				temporary=${resultArray[i]}
				resultArray[i]=${resultArray[j]}
				resultArray[j]=$temporary
			fi
		done
	done
	echo ${resultArray[@]}
}
#Function Call
DescendingOrder
AscendingOrder
