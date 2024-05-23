# qmd_ctutypst

A typical qmd header for this format might look like this

```
---
format: qmd_ctutypst-typst
title: "Report Title"         # name of the report
subtitle: ""                  # subtitle - typically the project name
project_type: "Project"       # project type - typically Project or Consulting
projectno: "1837"             # project number
logo: "dcrlogo.jpg"           # logo name
logo_size: 200%               # size of the logo in percent (or auto) 
path_logo: "path-to-file"     # path to the logo file
author:                       # author details, only name, affiliation and email are used
    - name: "André Moser"
      affiliation: "Department of Clinical Research, University of Bern"
      email: "andre.moser@unibe.ch"
toc: false                    # include table of contents
paper-size: a4                # paper size
heading: true                 # include numbering in headers/sections
heading-numbering: "1.1.1"    # how to format header/section numbers
---
```
 
