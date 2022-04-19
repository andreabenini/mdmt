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
rm -rf ./tests/output/*
if [ $(ls -1 tests|wc -l) -lt 2 ]; then echo "Copy some sample data into './tests' to continue"; exit 1; fi
echo -e "\n\033[1;97mSTARTING TESTS"


# echo -e "\033[0;96m- Conversion  README.md -> README.1.html\033[0;90m"
# echo -e "  "./mdmt --input=tests/README.md --output=tests/output/README.1.html
# ./mdmt --input=tests/README.md --output=tests/output/README.1.html |grep -v WARNING

# echo -e "\033[0;96m- Conversion  README.md -> README.2.html [TEMPLATE]\033[0;90m"
# echo -e "  "./mdmt --input=tests/README.md --output=tests/output/README.2.html --template=templates/mdmt.css
# ./mdmt --input=tests/README.md --output=tests/output/README.2.html --template=templates/mdmt.css

# echo -e "\033[0;96m- Conversion  README.md -> README.1.pdf\033[0;90m"
# echo -e "  "./mdmt --input=tests/README.md --output=tests/output/README.1.pdf
# ./mdmt --input=tests/README.md --output=tests/output/README.1.pdf |grep -v WARNING

# echo -e "\033[0;96m- Conversion  README.md -> README.2.pdf  [TEMPLATE]\033[0;90m"
# echo -e "  "./mdmt --input=tests/README.md --output=tests/output/README.2.pdf --template=templates/mdmt.css
# ./mdmt --input=tests/README.md --output=tests/output/README.2.pdf --template=templates/mdmt.css

echo -e "\033[0;96m- Conversion  test.mermaid.md -> test.mermaid.[html|pdf]  [TEMPLATE]\033[0;90m"
echo -e "  "./mdmt --input=tests/test.mermaid.md --output=tests/output/test.mermaid.[html\|pdf] --template=templates/mdmt.css
./mdmt --input=tests/test.mermaid.md --output=tests/output/test.mermaid.html --template=templates/mdmt.css
./mdmt --input=tests/test.mermaid.md --output=tests/output/test.mermaid.pdf  --template=templates/mdmt.css

# echo -e "\033[0;96m- Joining     input-list-> README.3.pdf  [TEMPLATE]\033[0;90m"
# echo    '  cat << EOT | ./mdmt --input-list - --output=tests/output/README.3.pdf --template=templates/mdmt.css'
# cat << EOT  | ./mdmt --input-list - --output=tests/output/README.3.pdf --template=templates/mdmt.css
# tests/README.md
# tests/SEC-RES-REQ-1.md
# EOT

# echo -e "\033[0;96m- Splitting   test.md by header 1\033[0;90m"
# echo -e "  "./mdmt --input=./tests/test.md --output=./tests/output/split1 --template=./templates/mdmt.css --header-split 1
# rm -rf ./tests/output/split1
# mkdir -p ./tests/output/split1
# ./mdmt --input=./tests/test.md --output=./tests/output/split1 --template=./templates/mdmt.css --header-split 1

# echo -e "\033[0;96m- Splitting   README.md by header 2\033[0;90m"
# echo -e "  "./mdmt --input=./tests/test.md --output=./tests/output/split2 --template=./templates/mdmt.css --header-split 2
# rm -rf ./tests/output/split2
# mkdir -p ./tests/output/split2
# ./mdmt --input=./tests/test.md --output=./tests/output/split2 --template=./templates/mdmt.css --header-split 2


echo -e "\n\033[0;32m- - - -   COMPLETED   - - - -\033[0;37m\n"
