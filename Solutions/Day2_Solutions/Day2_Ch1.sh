#!/bin/bash

echo " ============================ " 

echo " Welcome to Day 2 Challenge !!"

echo " ============================= "

echo " Let's do File & Directory Explorer "

echo " ============================== "

while true
do
	echo
	echo "Listing files and directories in: $(pwd)"
	echo "----------------------------------------"

	# List all files and directories with Human-readable size"
	
	ls -lhA

	echo

	read -p "Press [ENTER] to refresh or type 'q' to quit: " choice

	if [[ "$choice" == "q" || "$choice" == "Q" ]]; then
		echo "Exiting File Explorer."
		break
	fi
done


