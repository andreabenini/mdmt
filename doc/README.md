# Usage Examples:
## MarkDown -> HTML
```sh
# Simple conversion, Default "mdmt.css" template file is used when found in path
mdmt --input=tests/README.md --output=tests/README.html

# Use specific template file during conversion
#     Filename might be absolute or relative to current working path
mdmt --input=tests/README.md --output=tests/README.html --template=templates/mdmt.css
```

## MarkDown -> PDF
```sh
# Simple conversion, Default "mdmt.css" template file is used when found in path
mdmt --input=tests/README.md --output=tests/README.pdf

# Use specific template file during conversion
#     Filename might be absolute or relative to current working path
mdmt --input=tests/README.md --output=tests/README.pdf --template=templates/mdmt.css
```

## Concatenate MarkDown -> PDF
```sh
# - Concatenate a bunch of separate markdown files into one single stream
# - Convert markdown files stream to a single PDF file (join)
# - Use specific template file during conversion
#       template filename might be absolute or relative to current working path
cat << EOT |mdmt --input-list - --output=tests/README.pdf --template=templates/mdmt.css
tests/README.md
tests/SEC-RES-REQ-1.md
EOT

# Same command with input stream generated from another command on pipe
ls -1 tests/*.md | \
    mdmt --input-list - --output=tests/README.pdf --template=templates/mdmt.css
```
