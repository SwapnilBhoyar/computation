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
