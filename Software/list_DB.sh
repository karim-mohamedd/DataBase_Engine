#!/usr/bin/bash

# Change to the DATA directory
cd ../DATA || { echo "Failed to change directory to ../DATA"; exit 1; }

echo "================ The Existing Databases ================"
# List directories (databases)
ls -F | grep '/$' | tr -d '/'
echo "========================================================="

# Change to the Software directory
cd ../Software || { echo "Failed to change directory to ../Software"; exit 1; }

# Run the DataBase.sh script
./DataBase.sh

# Return to the previous directory
cd - &> /dev/null
