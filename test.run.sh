#!/usr/bin/env bash
# "bash test unit"

# Exit when a command fails
set -e
trap 'catch $? $LINENO' ERR
catch() {
    echo "ERROR: $1. Line: $2"
}
# Tests
mkdir -p ./tests/output
if [ $(ls -1 tests|wc -l) -lt 2 ]; then echo "Copy some sample data into './tests'"; exit 1; fi
echo -e "\n\033[1;34mSTARTING TESTS\033[0;37m"


echo "- Splitting README.md by header 1"
echo "  "./mdmt --input=./tests/README.md --output=./tests/output/ --template=./templates/mdmt.css --header-split 1
./mdmt --input=./tests/README.md --output=./tests/output/ --template=./templates/mdmt.css --header-split 1

#echo "- Splitting README.md by header 2"
#echo "  "./mdmt --input=./tests/README.md --output=./tests/output/ --template=./templates/mdmt.css --header-split 2
#./mdmt --input=./tests/README.md --output=./tests/output/ --template=./templates/mdmt.css --header-split 2


echo -e "\n\033[0;32mCOMPLETED\n"
