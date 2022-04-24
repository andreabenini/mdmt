&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
# Changelog
Changelog documentation on various mdmt versions, known issues, inner working and fixes along the way
&nbsp;  
&nbsp;  


---
> **v1.0.0 (22/05)**  
_Stable release, runtime custom formatting plugins available_

- **New features:**
    - Markdown formatting plugins activation available at runtime, new parameter `--plugins`
    - `--plugins-help` option for extensive help on available plugins.
- **Internals:**
    - Testing on big files, it might take out a lot of memory but does a rather decent job.
    - Feature freeze, stability and patches releases only for a while.


---
> **v0.9.2 (22/04)**  
_minor layout cleanup and document formatting_

- **New Features:**
    - `text-align:justify` is now the default text alignment on standard (and still only) CSS theme.
    - plugin **nl2br** is not pleasant on HTML page rendering, CSS `text-align:justify` has been
    elected as default page justification on all text. Layout is more appealing even if rendered
    text is not exactly like the markdown (but markdown does not have text justification at all).
    - Added a new script to automatically generate a complete user manual for this project, **HTML**
    and **PDF** files are now created by `mdmt` itself !
    - User manuals available as HTML or PDF in the `doc/` directory.
    - `README.md` gets automatically updated from the document generation script.
    - ***md*** and ***html*** files are now both supported as `--input` parameter but **html -> md**
    conversion is still not yet implemented.
- **Internals:**
    - Minor error checking added to improve script reliability.
    - Input and output files are checked before dealing with them


---
> **v0.9.1 (22/04)**  
_Usable, all planned features are in place_

- **New features:**
    - Slightly optimized code generation and layout cleanup
    - Better exceptions trapping
    - CSS minor fixes, default layout is mainly oriented to GitHub look and feel
    - Providing more CSS templates for different layouts is not yet a priority but it's possible
    on future releases
- **Internals:**
    - HTML javascript code cleanup. Avoiding to generate static HTML pages with JS code in it,
    this really helps during PDF generation due to the fact the webkit plain rendering is good
    doesn't handle runtime code properly. Emoji is still there as the only exception.


---
> **v0.9 (22/04)**  
_Code cleanup_

- **New features:**
    - Added `--verbose` flag for additional output when needed.
    - mermaid code block support now added, now it's fully supported on HTML and PDF files
    generation.
    - Major rewrite and some code optimization.
    - Internet access is required during Mermaid blocks generation (if any), there's no need
    later on.
- **Internals:**
    - Code optimizations are related to a stable and usable mermaid support for PDF and HTML
    generation.
    - External mermaid service from their CDN is now used when images are generated. Raw HTML
    pages might be rendered on the fly with some JS code but newly added methods _totally avoid_
    to inject JavaScript code in the build process. This approach fairly and properly render all
    Mermaid blocks equally on PDF and HTML.
    There are a lot of known issues with webkit libs and their Javascript interpreter due to the
    fact it is way less powerful than Google V8 or equivalent engines. Statically generating graphs
    directly from MarkDown code seems to be the best option, GitHub does exactly the same.


---
> **v0.3 (22/04)**  
_PDF proper fixes when used with webkit rendering engine_

- **New features:**
    - Major cleanup for PDF generation, reliable and based on tmp files to avoid webkit known issues
- **Internals:**
    - Fonts and formatting are left on the CSS side, need to fix it properly.
    - webkit rendering is really good but workaround must be placed to fix its errantic behavior
    when local resources are loaded from main page.
    - Basically this is a webkit fix for known issues release.


---
> **v0.2 (22/04)**  
_HTML generation seems to be finally acceptable_

- **New features:**
    - md join from multiple files from stdin
- **Internals:**
    - Syntax fixes, python linter is now happy
    - Focusing on single pages generation multiple file joins are not yet ready for prime time
    - Working on speed and efficiency, no refactoring yet
    - Getting emoji as UTF-8 chars. Somewhat important when importing chat conversations


---
> **v0.1 (22/04)**  
_Nothing special but it works, a rather good RC1_

- **New features:**
    - md -> html
    - md -> pdf
    - md multiple split
    - md join from multiple files
    - using python builtin markdown module and external `wkhtmltopdf` utility
- **Internals:**
    - barebone test unit in place for multiple tests
    - software is still for personal usage, it just works, no heavy input checks or
        sanity improvements
    - tested with small markdown files _(<=100 Kb)_

---
&nbsp;  
&nbsp;  
