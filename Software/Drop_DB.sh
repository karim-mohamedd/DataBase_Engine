#!/usr/bin/bash

cd ../DATA
echo "================ Select The Data Base You want to remove ================"

array=(`ls -F | grep / | tr / ' '`)

PS3=">>>>>>  Type DB number to Delete "
select choice in ${array[*]}
do
if [ $REPLY -gt ${#array[*]} ]
then 
    echo "============== it is not in the menue ============="
    continue
else 
    rm -r ${array[${REPLY}-1]}
    echo " ----The selected Data Base is removed sucessfully----"
    cd ../Software
    ./DataBase.sh
fi
done

cd - &> ~/../../dev/null
