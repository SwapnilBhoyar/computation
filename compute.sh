#! /bin/bash
declare -A result
declare -a result_array
read -p "Enter a:" a
read -p "Enter b:" b
read -p "Enter c:" c
operation1=$(( (a+b)*c ))
operation2=$(( a*b+c ))
operation3=$(( a+b/c ))
operation4=$(( a%b+c ))
result=(["1"]=$operation1 ["2"]=$operation2 ["3"]=$operation3 ["4"]=$operation4)
for value in ${!result[@]}
do
	result_array[$value]=${result[$value]}
done

for (( outer=1; outer<=4; outer++ ))
do
	for (( inner=1; inner<=4-1 ; inner++ ))
	do
		myinner=$(( inner+1 ))
		if [[ ${result_array[inner]} -lt ${result_array[myinner]} ]]
		then
			temp=${result_array[inner]}
			result_array[$inner]=${result_array[myinner]}
			result_array[$myinner]=$temp
		fi
	done
done
echo "array in Descending Order:" ${result_array[@]}
for (( outer=1; outer<=4; outer++ ))
do
        for (( inner=1; inner<=4-1 ; inner++ ))
        do
                myinner=$(( inner+1 ))
                if [[ ${result_array[inner]} -gt ${result_array[myinner]} ]]
                then
                        temp=${result_array[inner]}
                        result_array[$inner]=${result_array[myinner]}
                        result_array[$myinner]=$temp
                fi
        done
done
echo "array in Ascending Order:" ${result_array[@]}
