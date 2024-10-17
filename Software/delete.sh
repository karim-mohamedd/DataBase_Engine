#!/usr/bin/bash

echo "---------- Select from the menu ---------------"

# Store the list of files in an array
array=($(ls))

# Use select to let the user choose a file
select choice in "${array[@]}"; do
    if [[ -z "$choice" ]]; then
        echo "------- Try again: $REPLY is not in the menu -------"
        continue
    else 
        echo "You selected $choice Table"
        table_name="$choice"
        break
    fi 
done

# Second menu for deletion options
select choice in Delete_all Delete_Row; do
    case $choice in
        Delete_all)
            > "$table_name"  # Empty the table
            echo "The Table has been deleted successfully."
            break
            ;;
        
        Delete_Row)
            while true; do 
                read -p ">>>>>> Input the primary key of the Row: " pk
                row=$(awk -F':' -v key="$pk" '$1 == key {print}' "$table_name")

                if [[ -n "$row" ]]; then
                 
