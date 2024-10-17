#!/usr/bin/bash
cd ../DATA || { echo "Failed to change directory to ../DATA"; exit 1; }

while true; do
    echo "=================== Enter The Database Name: ====================="
    read -r db_name

    case $db_name in 
        '' )
            echo "----- Invalid input: The database name cannot be empty -----"
            continue
            ;;
        *[[:space:]]* )
            echo "----- Invalid input: The database name cannot have spaces -----" 
            continue
            ;;
        [0-9]* )
            echo "----- Invalid input: The database name cannot start with a number -----"
            continue
            ;;
        * )
            # Check if the database already exists
            if [[ -d "$db_name" ]]; then
                echo "----- This database already exists. Try another name -----"
                continue
            else
                mkdir "$db_name"
                echo "---------------> The database was created successfully...."
                echo "========================================================="
                cd ../Software || { echo "Failed to change directory to ../Software"; exit 1; }
                ./DataBase.sh
                break  # Exit the loop after successful creation
            fi
            ;; 
    esac
done

cd - &> /dev/null
