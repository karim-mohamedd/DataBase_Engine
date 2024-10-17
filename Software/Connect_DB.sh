#!/usr/bin/bash

cd ../DATA || { echo "Failed to change directory to ../DATA"; exit 1; }


echo
echo "================= Select The Data Base ================="
echo

# Get a list of directories (databases) and store them in an array
array=($(ls -F | grep '/$' | tr -d '/'))

# Use select to allow the user to choose a database
select choice in "${array[@]}"; do
    if [ -z "$choice" ]; then
        echo "============== It is not in the menu ============="
        continue
    else
        cd "$choice" || { echo "Failed to enter database $choice"; exit 1; }
        echo
        echo "---- You are connected to $choice successfully ----"
        echo
        break
    fi
done

# Main menu for table operations
while true; do
    echo "================= Table Operations ================="
    select choice in Create_Table List_Tables Drop_Table Insert_in_Table Select_From_Table Delete_From_Table Update_Table; do 
        case $choice in 
            Create_Table )
                echo "Creating Table..."
                source ../../Software/create_table.sh
                break
                ;;
            List_Tables )
                echo "Listing The Tables..."
                source ../../Software/list_tables.sh
                break
                ;;
            Drop_Table )
                echo "Deleting Table..."
                source ../../Software/delete_table.sh
                break
                ;;
            Delete_From_Table )
                echo "Deleting From Table..."
                source ../../Software/delete.sh
                break
                ;;
            * )
                echo "Invalid input. Please try again."
                continue
                ;;
        esac
        # Source the DataBase.sh after each operation, if needed
        source ../../Software/DataBase.sh
    done
done

# Return to the previous directory
cd - &> /dev/null
