#!/bin/bash

# Change to the directory where databases are stored
cd ../../DATA || { echo "Failed to change directory to ../../DATA"; exit 1; }

read -p "-------- Enter the name of the DB --------------: " db_name

# Check if the specified database exists
if [ ! -d "$db_name" ]; then
    echo "The specified database '$db_name' does not exist."
    exit 1
fi

# Change to the specified database directory
cd "$db_name" || { echo "Failed to change directory to $db_name"; exit 1; }

echo "----------- The Existing Tables in $db_name -----------"

# List the tables and capture the output
tables=$(ls)

# Check if the output of ls is empty
if [ -z "$tables" ]; then
    echo "There are no tables in this DB."
else
    echo "$tables"
fi
