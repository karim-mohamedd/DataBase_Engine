#!/bin/bash

echo "----------- Already Existing Tables -----------"
ls -s

while true; do 
    read -p ">>>>>> Enter table name to create: " table_name

    case $table_name in 
        '' )
            echo "------ The table name cannot be empty. Try again --------"
            continue
            ;;
        *[[:space:]]* )
            echo "----------- The table name cannot contain spaces ----------"   
            continue
            ;; 
        [0-9]* )
            echo "------------- The table name cannot start with numbers ----------"
            continue
            ;;
        * )
            if [ -e "$table_name" ]; then
                echo "----- This table already exists. Try another name -----"
                continue
            else
                touch "$table_name"
                echo "------------ You created the table successfully ------------"
                break
            fi
            ;;
    esac
done

# Read the number of fields
while true; do 
    read -p "Enter the number of fields: " table_fields

    case $table_fields in 
        '' | *[!0-9]* )
            echo "Invalid input. Please enter a valid number."
            continue
            ;;
        * )
            if [ "$table_fields" -lt 1 ]; then
                echo "Invalid input. The table must have at least one field."
                continue
            fi
            echo "Your table will have $table_fields fields."
            break 
            ;;
    esac
done

# Read the metadata
echo "------------- Insert Your Meta Data to $table_name -------------"

row_name=""
for ((i=1; i<=table_fields; i++)); do
    while true; do 
        read -p "Enter your column $i name: " col_name

        case $col_name in 
            '' )
                echo "------ The column name cannot be empty. Try again --------"
                continue
                ;;
            *[[:space:]]* )
                echo "----------- The column name cannot contain spaces ----------"   
                continue
                ;; 
            [0-9]* )
                echo "------------- The column name cannot start with numbers ----------"
                continue
                ;;
            * )
                if grep -q "^$col_name:" "$table_name"; then
                    echo "----- This column already exists. Try another name -----"
                    continue
                else
                    if [ "$i" -eq 1 ]; then
                        row_name+="id:$col_name:"
                    else
                        row_name+="$col_name:"
                    fi
                    break
                fi
                ;;
        esac
    done
done

echo "$row_name" >> "$table_name"

# Insert the column types
echo "------------ Insert the columns' types ------------"

row_type=""
for ((i=1; i<=table_fields; i++)); do
    while true; do
        echo ">>>>>> What is the type of data for column $i?"
        select choice in string integer; do
            case $choice in
                string )
                    echo "You selected string."
                    if [ "$i" -eq 1 ]; then
                        row_type+="string:"
                    else
                        row_type+="string:"
                    fi
                    break
                    ;;
                integer )
                    echo "You selected integer."
                    if [ "$i" -eq 1 ]; then
                        row_type+="integer:"
                    else
                        row_type+="integer:"
                    fi
                    break
                    ;;
                * )
                    echo "Invalid option. Please try again."
                    continue
                    ;;
            esac
        done
        break  # Break the while loop after selecting the type
    done
done

echo "$row_type" >> "$table_name"

echo "------------ Your table metadata is: -------------"
echo "Row Names: $row_name"
echo "Row Types: $row_type"
