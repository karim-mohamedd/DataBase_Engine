#!/usr/bin/bash

# Change to the DATA directory
cd ../DATA || { echo "Failed to change directory to ../DATA"; exit 1; }

echo "================ Select The Database You Want to Remove ================"

# Store the list of databases in an array
array=($(ls -F | grep '/$' | tr -d '/'))

PS3=">>>>>> Type the DB number to Delete: "
select choice in "${array[@]}"; do
    if [[ -z "$choice" ]]; then
        echo "============== That is not a valid option ============="
        continue
    else 
        rm -r "$choice"
        echo "---- The selected database has been removed successfully ----"
        cd ../Software || { echo "Failed to change directory to ../Software"; exit 1; }
        ./DataBase.sh
        break
    fi
done

# Return to the previous directory
cd - &> /dev/null
