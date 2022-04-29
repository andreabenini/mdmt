# Examples:
## MarkDown -> HTML
```sh
# Simple conversion, Default "mdmt.css" template file is used when found in path
mdmt --input=tests/README.md --output=tests/README.html

# Same as above but explicitly specify output file type, autodetection is skipped
mdmt --input=tests/README.md --output=tests/README --type=html

# Use specific template file during conversion
#     Filename might be absolute or relative to current working path
mdmt --input=tests/README.md --output=tests/README.html --template=templates/mdmt.css
```

## MarkDown -> PDF
```sh
# Simple conversion, Default "mdmt.css" template file is used when found in path
mdmt --input=tests/README.md --output=tests/README.pdf

# Same as above but explicitly specify output file type, autodetection is skipped
mdmt --input=tests/README.md --output=tests/README --type=pdf

# Use specific template file during conversion
#     Filename might be absolute or relative to current working path
mdmt --input=tests/README.md --output=tests/README.pdf --template=templates/mdmt.css
```

## HTML -> PDF
```sh
# Convert HTML file to a PDF file, templates are not used
./mdmt --verbose --input=tests/index.html --output=tests/output/index.pdf
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

# Same command with input stream generated from another command
ls -1 tests/*.md | \
    mdmt --input-list - --output=tests/README.pdf --template=templates/mdmt.css
```

## Split by headers
Split on different files based on selected headings, few notes are necessary to 
understand how it works:

- `--output` is **mandatory** and it must be an existing directory. Few examples:
    - `--output=tests`. Valid if "_tests_" is an existing (and writable) directory
    - `--output=tests/a.md`. Invalid because it is a file, **but** output files 
        **will be saved** to `tests` if directory exists and it is writable.
- Each single generated file will be saved when selected header is found in source,
    allowed values are `1..6`. This structure will be generated:
    - `--header-split 1` Files will be saved as "`[nn] [title].md`" in the target
        directory.  
        `[nn]` is calculated on the number of sections found in the source file
        (starting from "0").  
        `[title]` is the header title name, allowed characters: [a-zA-Z0-9 ]
    - `--header-split 2..6` Directories with `H1` headers will be created inside
        `--output` dir. Naming conventions will follow what already described above.
        Inside each directory a `README.md` file with contents from upper sections
        will be created and files for selected section will be stored separately
        with "`[nn] [title].md`" convention previously described. This schema aims
        to reproduce some sort of "README.md"+Tree structure just like common
        github repos.

Examples:
```sh
# H1 Split
mdmt --input=tests/README.md --output=tests/ --template=templates/mdmt.css --header-split 1

# H2..n Split
mdmt --input=tests/README.md --output=tests/ --template=templates/mdmt.css --header-split 2
mdmt --input=tests/README.md --output=tests/ --template=templates/mdmt.css --header-split 3
#...
mdmt --input=tests/README.md --output=tests/ --template=templates/mdmt.css --header-split 6
```
