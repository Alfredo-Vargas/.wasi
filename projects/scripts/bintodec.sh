#!/bin/bash

# changes a bin string value to a decimal string

E_WRONG_ARGS=85
N_EXPECTED_ARGS=1 # 0 (filename + input)

if [ $# -ne $N_EXPECTED_ARGS ]; then
	echo "Expected $N_EXPECTED_ARGS arguments, but $# found."
	exit $E_WRONG_ARGS
fi

bin_value=$1
size=${#bin_value}

output=0
for ((i = 0; i < size; i++)); do
	if [ "${bin_value:$i:1}" -eq "1" ]; then
		exponent=$((size - i - 1))
		val=$((2 ** exponent))
	else
		val=0
	fi
	output=$((val + output))
done

echo $output
