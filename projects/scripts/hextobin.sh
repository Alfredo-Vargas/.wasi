#!/bin/bash

# changes a hex string value to a binary string

E_WRONG_ARGS=85
N_EXPECTED_ARGS=1 # 0 (filename + input)

if [ $# -ne $N_EXPECTED_ARGS ]; then
	echo "Expected $N_EXPECTED_ARGS arguments, but $# found."
	exit $E_WRONG_ARGS
fi

pre_processed=${1^^}

# echo "You passed $pre_processed"

# Declare an associative array ()
declare -A rules
rules=(["0"]="0000" ["1"]="0001" ["2"]="0010" ["3"]="0011" ["4"]="0100"
	["5"]="0101" ["6"]="0110" ["7"]="0111" ["8"]="1000"
	["9"]="1001" ["A"]="1010" ["B"]="1011" ["C"]="1100"
	["D"]="1101" ["E"]="1110" ["F"]="1111")

output=""
for ((i = 0; i < ${#pre_processed}; i++)); do
	key=${pre_processed:$i:1}
	# echo "$key"
	output=$output${rules[$key]}
	# echo $output
done

echo $output
