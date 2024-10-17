#!/usr/bin/bash

PS3=">>>>>> Please select an option: "
select choice in Create-DB list-DB Connect-DB Drop-DB; do 
    case $choice in 
        Create-DB )
            if [[ -f create_DB.sh ]]; then
                source create_DB.sh
            else
                echo "Error: create_DB.sh not found."
            fi
            ;;
        
        list-DB )
            echo "The available databases are:"
            if [[ -f list_DB.sh ]]; then
                source list_DB.sh
            else
                echo "Error: list_DB.sh not found."
            fi
            ;;
        
        Connect-DB )
            echo "Connecting to the selected database..."
            if [[ -f Connect_DB.sh ]]; then
                source Connect_DB.sh
            else
                echo "Error: Connect_DB.sh not found."
            fi
            ;;
        
        Drop-DB )
            echo "Removing the selected database..."
            if [[ -f Drop_DB.sh ]]; then
                source Drop_DB.sh
            else
                echo "Error: Drop_DB.sh not found."
            fi
            ;;
        
        * )
            echo "Invalid option. Please try again."
            ;;
    esac
done
