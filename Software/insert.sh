#!/usr/bin/bash

cd ../../DATA || exit
read -p "Enter database name: " db_name
cd "$db_name" || { echo "Database not found."; exit 1; }

read -p "Enter table name: " table_name

if [[ ! -f "$table_name" ]]; then
    echo "Table not found."
    exit 1
fi

read -p "Enter record (comma-separated values): " record
echo "$record" >> "$table_name"
echo "Record inserted successfully."
