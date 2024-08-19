#!/bin/bash

# Usage: ./count_elements.sh <filename> <column_number>

# File to be processed
FILE=$1

# Column to be analyzed (1-based index)
COLUMN=$2

# Total number of rows
TOTAL=$(awk -v col=$COLUMN '{print $col}' $FILE | tail -n +1 | wc -l)

# Check if file and column are provided
if [ -z "$FILE" ] || [ -z "$COLUMN" ]; then
    echo "Usage: ./count_elements.sh <filename> <column_number>"
    exit 1
fi

# Print header
echo -e "Element\tCount\tTotal\tPercentage"

# Process the file

awk -v col=$COLUMN '{print $col}' $FILE | tail -n +2 | sort | uniq -c | while read COUNT ELEMENT; do
    PERCENTAGE=$(echo "scale=6; ($COUNT/$TOTAL)*100" | bc)
    echo "$ELEMENT\t$COUNT\t$TOTAL\t$PERCENTAGE"
done
