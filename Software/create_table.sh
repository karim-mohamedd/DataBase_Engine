#!/bin/bash

echo "----------- Already Existing Tables -----------"
ls -s 

while true
do 
read -p ">>>>>> enter table name to create: "
table_name=$REPLY

case $table_name in 
' ' )
    echo "------ The table name can not be empty try again --------"
    continue
    ;;
*[[:space:]] | *[[:space:]]* | [[:space:]]* )
    echo " ----------- The Table can not contain spaces ---------- "   
    continue
    ;; 
[0-9]* )
    echo "-------------the table name can not start with numbers----------"
    continue
    ;;
*[a-zA-Z_]*[a-zA-Z_] | *[a-zA-Z_] )
if (find $table_name `ls -F ` &> ~/../../dev/null) 
then
    echo "-----This Table Already Exists, try another name-----"
    continue
       
else
    touch $table_name 
    echo "------------ you created the table successfully ------------"
    break
fi
    ;;
* )
    echo "Not Valid Please Try again"
    continue
    ;;
esac
done

# read the number of fields
while true 
do 

read -p "Your table fields are : $table_fields"

case $table_fields in 
*[0] )
    echo "Invaild imput , The table can not be empty"
    continue
    ;;
*[1-9] | *[1-9]*[0-9] )
    echo "Your table fields are $table_fields "
    break 
    ;;
* )
    echo "Invalid input please try again"
    continue
    ;;
esac

done

# read the meta data

let table_fields=$table_fields
echo "Insert Your meta Data to $table_name>>>>"

for((i=2,i<=$table_fields,i++))
do

while true
do 
read -p "enter your column $i name: "
col_name=$REPLY

case $col_name in 
' ' )
    echo "------ The Column name can not be empty try again --------"
    continue
    ;;
*[[:space:]] | *[[:space:]]* | [[:space:]]* )
    echo " ----------- The Coulmn can not contain spaces ---------- "   
    continue
    ;; 
[0-9]* )
    echo "-------------the Column can not start with numbers----------"
    continue
    ;;
*[a-zA-Z_]*[a-zA-Z_] | *[a-zA-Z_] )
if (find $col_name `head-1` $table_name &> ~/../../dev/null) 
then
    echo "-----This column Already Exists, try another name-----"
    continue
       
else
    if [ $i -eq 2]
    then
        row_name+="id"$col_name:
    else
        row_name+=$col_name:
    fi
break
fi
    ;;
* )
    echo "Not Valid Please Try again"
    continue
    ;;
esac
done
done

echo $row_name >> $table_name

# the real data

echo "insert the column type"

for((i=2;i<=table_fields;i++))
do
echo "what is the type of data for $i: "
select choice in string integer
do
case choice in
string )
    echo "string"
    if [ $i -eq 2 ]
    then
    row_type+=integer:string:
    else
    row_type+=integer:
    fi
    break
    ;;
integer )
    echo "integer"
    if [ $i -eq 2 ]
    then
    row_type+=integer:integer:
    else
    row_type+=integer:
    fi
    break
    ;;
* )
    echo "only 1 and 2 is available. please try again"
    continue
    ;;
esac
done
done

echo $row_type >>$table_name

echo "your table meta data is 
$row_name
$row_type
"