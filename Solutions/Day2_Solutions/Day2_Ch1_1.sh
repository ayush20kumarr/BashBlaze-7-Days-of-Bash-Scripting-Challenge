#!/bin/bash

echo "Part 2 of the Challenge !!"

echo


while true
do
	read -r -p "Enter a line of text (Press Enter without txt to exit): " line

	#Exit condition: empty input

	if [ -z "$line" ]; then
		echo "Exiting the explorer...... Tata!!"
		break
	fi

	# Count characters in the line
	#
	char_count=${#line}

	echo "Character Count: $char_count"
done
