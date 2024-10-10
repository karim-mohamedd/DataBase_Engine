#!/usr/bin/bash

cd ../DATA
echo "================ The existing Data Bases ================"
ls -F | grep / | tr / " "
cd - &> ~/../../dev/null
