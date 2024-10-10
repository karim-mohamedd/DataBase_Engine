#!/usr/bin/bash
cd ../DATA

while true
do

echo "=================== enter The Data Base Name : ====================="

read db_name

case $db_name in 
'' )
    echo "-----invalid input, The Data Base name can not be empty-----"
    continue
    ;;
*[[:space:]] | *[[:space:]]* | [[:space:]]* )
    echo "-----invalid input, The Data Base name can not have spaces-----" 
    continue
    ;;
[0-9]* )
    echo "-----invalid input, The Data Base name can not start with number-----"
    continue
    ;;
*[a-zA-Z_]*[a-zA-Z_] | *[a-zA-Z_] )
    if (find $db_name `ls -F | grep /` &> ~/../../dev/null) 
    then
        echo "-----This Data Base Already Exists, try another name-----"
    continue
    else
        mkdir $db_name
    break
    fi
    ;; 
* )
    echo "-----Not valid Please Try again-----"

esac
done

cd - &> ~/../../dev/null
