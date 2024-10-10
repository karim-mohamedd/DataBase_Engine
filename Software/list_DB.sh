#!/usr/bin/bash

cd ../DATA
echo "================ The existing Data Bases ================"
ls -F | grep / | tr / " "
echo "========================================================="
cd ../Software
./DataBase.sh
cd - &> ~/../../dev/null
