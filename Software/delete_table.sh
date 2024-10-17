#!/usr/bin/bash



echo "---------- Select from the menu ---------------"

# Store the list of tables in an array
array=($(ls))

# Use select to let the user choose a table
select choice in "${array[@]}"; do
    if [[ -z "$choice" ]]; then
        echo "------- Try again: $REPLY is not in the menu -------"
        continue
    else 
        # Remove the selected table
        rm "$choice"
        echo "$choice has been removed successfully."
        break
    fi 
done
