#!/usr/bin/bash

select choice in Create-DB list-DB Connect-DB Drop-DB
do 
case $choice in 
Create-DB )
    . create_DB.sh
    echo "Data Base is Created Sucessfully...."
    ;;

list-DB )
    echo "The available Data Bases are : "
    ./list_DB.sh
    ;;
Connect-DB )
    echo "Connecting to the selected Data Base "
    ./Connect_DB.sh
    ;;

Drop-DB )
    echo "Removing The Selected Data Base"
    ./Drop_DB.sh
    ;;
    esac
done


