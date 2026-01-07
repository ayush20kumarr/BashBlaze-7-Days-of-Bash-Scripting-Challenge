#!/bin/bash

if [ -z "$1" ]; then
        echo " Usage : $0 <process_name> empty hai"
        exit 1
fi

echo "Process to monitor is: $1"

# --- Define functions first ---
check_process() {
        ps -C "$1" > /dev/null
}

restart_process() {
        local process_name="$1"
        local max_attempts=3

        for (( attempt=1; attempt<=max_attempts; attempt++ )); do
                echo "Attempting to restart $process_name (Attempt $attempt)...."

                $process_name &

                sleep 3

                if check_process "$process_name"; then
                        echo "Process is running now."
                        return 0
                fi
        done

        echo "Failed to restart $process_name after $max_attempts attempts."
        return 1
}

# --- Now call them ---
if check_process "$1"; then
        echo "Process is already running."
else
        echo "Not running."
        restart_process "$1"
fi

