#!/bin/bash

echo "----------- The Existing Tables -----------"
tables=$(ls -s)

# Check if the output of ls is empty
if [ -z "$tables" ]; then
    echo "There are no tables in this DB."
else
    echo "$tables"
fi
