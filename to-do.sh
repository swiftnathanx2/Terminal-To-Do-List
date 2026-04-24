#!/bin/bash
TO_DO=$1
Arg2=$2

if [[ $# -lt 1 ]]; then
    echo "Error! this script requires 1 or 2 arguments to run"
    sleep 2
    echo "Usage: $0 <arg 1> <arg 2> "
    echo "Example: to-do.sh add "Milk" "
    exit 1
fi 

case $TO_DO in
    add)
        if grep -q "$Arg2" tasks.txt; then
            echo "Task already exists!"
        else
            echo " "$Arg2" $(date +%Y-%m-%d_%H:%M:%S)" >> tasks.txt
        fi
        ;;
    list)
        echo -e "\n======================TO-DO-LIST==================="
        nl -w5 -n rn tasks.txt
        echo -e "\n===================================================="
        ;;
    del)
        if [[ "$Arg2" > $(wc -l < tasks.txt) ]]; then
            echo "Line number $Arg2 not found!"
        else
            sed -i "${Arg2}d" tasks.txt
        fi
        ;;
    clear)
        read -r -p "Press Enter to Clear List"
        clear > tasks.txt
        echo "List Cleared"
        ;;
    *)
        echo "Invalid command"
        ;;
esac
