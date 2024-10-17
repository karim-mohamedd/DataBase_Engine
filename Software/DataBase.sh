#!/usr/bin/bash

PS3=">>>>>> Please select an option: "
select choice in Create-DB list-DB Connect-DB Drop-DB; do 
    case $choice in 
        Create-DB )
            ./create_DB.sh
            ;;
        
        list-DB )
            echo "The available databases are:"
            ./list_DB.sh
            ;;
        
        Connect-DB )
            echo "Connecting to the selected database..."
            ./Connect_DB.sh
            ;;
        
        Drop-DB )
            echo "Removing the selected database..."
            ./Drop_DB.sh
            ;;
        
        * )
            echo "Invalid option. Please try again."
            ;;
    esac
done
