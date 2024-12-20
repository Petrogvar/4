#!/bin/bash
samtools flagstat $1 > flagstat.txt
mapped_percentage=$(grep "mapped" flagstat.txt | head -n 1 | awk '{print $5}' | tr -d '%')

if (( $(echo "$mapped_percentage > 90" | bc -l) )); then
    echo "OK"
else
    echo "Not OK"
fi
