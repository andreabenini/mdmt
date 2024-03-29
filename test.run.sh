#!/usr/bin/env bash
#
# Bash test unit
# @see      Yeah, I'm one of those junkies that builds test units all day, even for batch utilities :)
#
# @author   Ben <Andrea Benini>.  Email on github website for details
# @see      https://github.com/andreabenini/mdmt
#           Feel free to adapt to your environment,
#             place your files into the test dir and you're ready to go
#

# Exit even if just a single command fails
set -e
trap 'catch $? $LINENO' ERR
catch() {
    echo "ERROR: $1. Line: $2"
}
cleanup() {
    mkdir -p ./tests/output
    rm -rf ./tests/output/*
    if [ $(ls -1 tests|wc -l) -lt 2 ]; then echo "Copy some sample data into './tests' to continue"; exit 1; fi
}
cleanup
if [ "$1" != "" ]; then
    exit 1
fi
# Tests
echo -e "\n\033[1;97mSTARTING TESTS"



echo -e "\033[0;96m- Conversion  README.md -> README.1.html\033[0;90m"
echo -e "  "./mdmt --input=tests/README.md --output=tests/output/README.1.html
./mdmt --input=tests/README.md --output=tests/output/README.1.html |grep -v WARNING

echo -e "\033[0;96m- Conversion  README.md -> README.2.html [TEMPLATE]\033[0;90m"
echo -e "  "./mdmt --input=tests/README.md --output=tests/output/README.2.html --template=templates/mdmt.css
./mdmt --input=tests/README.md --output=tests/output/README.2.html --template=templates/mdmt.css

echo -e "\033[0;96m- Conversion  README.md -> README.1.pdf\033[0;90m"
echo -e "  "./mdmt --input=tests/README.md --output=tests/output/README.1.pdf
./mdmt --input=tests/README.md --output=tests/output/README.1.pdf |grep -v WARNING

echo -e "\033[0;96m- Conversion  README    -> README.4.pdf   (force input to MD)\033[0;90m"
echo -e "  "./mdmt --input=tests/README --typein=md --output=tests/output/README.4.pdf
cp tests/README.md tests/README
./mdmt --input=tests/README.md --output=tests/output/README.4.pdf |grep -v WARNING
rm -f tests/README

echo -e "\033[0;96m- Conversion  README.md -> README.5       (force output to PDF)\033[0;90m"
echo -e "  "./mdmt --input=tests/README.md --output=tests/output/README.5 --typeout=pdf
./mdmt --input=tests/README.md --output=tests/output/README.5 --typeout=pdf |grep -v WARNING

echo -e "\033[0;96m- Conversion  README.md -> README.2.pdf  [TEMPLATE]\033[0;90m"
echo -e "  "./mdmt --input=tests/README.md --output=tests/output/README.2.pdf --template=templates/mdmt.css
./mdmt --input=tests/README.md --output=tests/output/README.2.pdf --template=templates/mdmt.css

echo -e "\033[0;96m- Conversion  test.mermaid.md -> test.mermaid.[html|pdf]  [TEMPLATE]\033[0;90m"
echo -e "  "./mdmt --verbose --input=tests/test.mermaid.md --output=tests/output/test.mermaid.[html\|pdf] --template=templates/mdmt.css
./mdmt --verbose --input=tests/test.mermaid.md --output=tests/output/test.mermaid.html --template=templates/mdmt.css
./mdmt --verbose --input=tests/test.mermaid.md --output=tests/output/test.mermaid.pdf  --template=templates/mdmt.css

echo -e "\033[0;96m- Conversion  output/test.mermaid.html -> test.mermaid.html.pdf \033[0;90m"
echo -e "  "./mdmt --verbose --input=tests/output/test.mermaid.html --output=tests/output/test.mermaid.html.pdf
./mdmt --verbose --input=tests/output/test.mermaid.html --output=tests/output/test.mermaid.html.pdf

echo -e "\033[0;96m- Joining     input-list-> README.3.pdf  [TEMPLATE]\033[0;90m"
echo    '  cat << EOT | ./mdmt --input-list - --output=tests/output/README.3.pdf --template=templates/mdmt.css'
cat << EOT  | ./mdmt --input-list - --output=tests/output/README.3.pdf --template=templates/mdmt.css
tests/README.md
tests/SEC-RES-REQ-1.md
EOT

echo -e "\033[0;96m- Splitting   test.md by header 1\033[0;90m"
echo -e "  "./mdmt --input=./tests/test.md --output=./tests/output/split1 --template=./templates/mdmt.css --header-split 1
rm -rf ./tests/output/split1
mkdir -p ./tests/output/split1
./mdmt --input=./tests/test.md --output=./tests/output/split1 --template=./templates/mdmt.css --header-split 1

echo -e "\033[0;96m- Splitting   README.md by header 2\033[0;90m"
echo -e "  "./mdmt --input=./tests/test.md --output=./tests/output/split2 --template=./templates/mdmt.css --header-split 2
rm -rf ./tests/output/split2
mkdir -p ./tests/output/split2
./mdmt --input=./tests/test.md --output=./tests/output/split2 --template=./templates/mdmt.css --header-split 2



echo -e "\n\033[0;32m- - - -   COMPLETED   - - - -\033[0;37m\n"
