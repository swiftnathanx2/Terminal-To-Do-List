#!/bin/bash
TO_DO=$1

case $TO_DO in
    add)
        echo " "$2" $(date +%Y-%m-%d_%H:%M:%S)" >> tasks.txt
        ;;
    list)
        cat -n tasks.txt
        ;;
    *)
        echo "error"
        ;;
esac
