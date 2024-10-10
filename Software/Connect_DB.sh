#!/usr/bin/bash
cd ../DATA
echo
PS3=">>>>>>  Type your DB number to connect with: "
echo
echo "================= Select The Data Base ================="
echo
array=(`ls -F | grep / | tr / ' '`)
select choice in ${array[*]}
do
if [ $REPLY -gt ${#array[*]} ]
then 
    echo "============== it is not in the menue ============="
    continue
else 
    cd ${array[${REPLY}-1]}
    echo
    echo " ----You are Connected to ${array[${REPLY}-1]} Suceesfully----"
    echo
    break
fi
done

select choice in Create_Table List_Tables Drop_Table Insert_in_Table Select_From_Table Delete_From_Table Update_Table
do 
    case $choice in 
    Create_Table )
        echo "Creating Table"
        ../../Software/create_table.sh
        ;;
    List_Tables )
        echo "Listing The Tables"
        ../../Software/list_tables.sh
        ;;
    Drop_Table )
        echo "Deleteing Table"
        ../../Software/delete_table.sh
        ;;
    Insert_in_Table )
        echo "Inserting in Table"
        ../../Software/insert_table.sh
        ;;
    Select_From_Table )
        echo "Selecting from Table"
        ../../Software/select_table.sh
        ;;
    Delete_From_Table )
        echo "Delete From Table"
        ../../Software/delete.sh
        ;;
    Update_Table )
        echo "Updating Table"
        ../../Software/update_table.sh
        ;;
    * )
        echo "Invalid input Please Try Again"
    continue
    ;;
    esac
done
cd - &> ~/../../dev/null