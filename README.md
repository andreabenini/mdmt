![project logo](logo.png)

# MarkDown Multi Tool _(mdmt)_

<!--[TOC]-->

---
&nbsp;  
&nbsp;  


#### **Concept**
This tool deals with markdown files and it's used to convert them to other formats such as
**PDF** and **HTML** files.  

- I usually write manuals as MarkDown files, there's no need for a GUI editor even if it helps
a lot. Printing or rendering MD files outside a proper tool might be a pain. Fortunately HTML
or PDF files doesn't suffer this problem.
- Want a full blown formatting language with a lot of pro features ? Markdown is not the right
format for you, and this utility is not needed at all. Pick up TeX (LaTeX, ConTeXt, ...) for
that, Knuth's work is still awesome even after 50 years. Please stay away from proprietary formats.

## Purpose
It's still a small utility but it already has achieved its basic tasks such as:

- No human interaction, used in massive batch processes, just a small task in an automation process.
- Lightweight and highly portable. Even if pandoc is a massive tool and has plenty of features (and
I like it) it also has a lot of dependencies, having a full blown Haskell environment installed 
(~400Mb) might not be your best choice for a small/minimal machine or container.
- Highly portable means: python3 required, webkit _wkhtmltopdf_ required, nothing more. Script is
just **one** file, there's no need (yet) to define it as a module or require massive python deps.
Linux and MacOS users might be happy with it.
- Do not reinvent the wheel. Building a full blown HTML renderer is an interesting task but not
something I need to achieve when webkit is already in place. In fact it uses webkit and its rendering
features to properly deal with HTML pages and scripts.
- Layout friendly and customizable. CSS is a thing for a while and a quite nice style sheet language,
reinventing some sort of custom language for rendering pages might not be a good idea when webkit+css
might do the same for you.
- No proprietary extensions. Rendering with plain CSS, display pages with webkit, automation with
batch scripting. As easy as it gets.
- Custom themes available. Default (and now only) CSS template file resembles github.com style HTML
pages layout, I've barely taken formatting from there because that's what I use most and what I 
personally prefer. It's totally up to you to create your own CSS layout and define page rendering
according to your needs, dark layouts and so on.

## Requirements
- **_python3_**. This is a python utility, basic libs supplied are fine, there's no need to install
additional things
- **_wkhtmltopdf_**. Webkit command line renderer. It uses the webkit engine from the command line,
if you already have any major linux desktop environment you should already have it. The package
is usually named `wkhtmltox`. MacOS users might download it directly or use _brew_ for that
(`brew install wkhtmltopdf`)

<!--DISCLAIMER-->
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  

# Usage
```sh
$ ./mdmt --help
Usage: mdmt [options]
       Markdown Management Tool utility
       Convert markdown files to your favorite format

Options:
  -h, --help            show this help message and exit
  -v, --verbose         Verbose output information
  -i INPUTFILE, --input=INPUTFILE
                        Input file to convert (*.md)
  -l INPUTLIST, --input-list=INPUTLIST
                        Concat *.MD list from stdin as one sigle file
  -o OUTPUTFILE, --output=OUTPUTFILE
                        Destination file name (md,htm,html,cnfdoc,pdf)
  -s INPUTTYPE, --typein=INPUTTYPE
                        Force input to one of these values:
                        (md,htm,html,cnfdoc,pdf) autodetected by default
  -t OUTPUTTYPE, --typeout=OUTPUTTYPE
                        Force output to one of these values:
                        (md,htm,html,cnfdoc,pdf) autodetected by default
  -p PAGE, --page=PAGE  Page size (when applicable) (A4,Letter)
  -T TEMPLATE, --template=TEMPLATE
                        CSS template to apply, default: mdmt.css
  -P PLUGINS, --plugins=PLUGINS
                        Specify plugins to use on markdown formatting
  -I, --plugins-help    Complete help on plugins and their usage
  -H HEADER, --header-split=HEADER
                        Split a markdown by headers
```
