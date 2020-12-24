------------------------------------------------------------------------

    pandocomatic_:
        pandoc:
            from: markdown-smart
            to: gfm
            filter:
            - pandoc-include-code
            lua-filter:
            - ./build/pandoc-lua-filters/include-files/include-files.lua
            output: README.md

...

# smart

-   [smart](#smart)
-   [Extension: smart](#extension-smart)
-   [from-markdown-source](#from-markdown-source)
-   [from-markdown-output](#from-markdown-output)
-   [from-markdown-smart-source](#from-markdown-smart-source)
-   [from-markdown-smart-output](#from-markdown-smart-output)
-   [from-markdown+smart-source](#from-markdownsmart-source)
-   [from-markdown+smart-output](#from-markdownsmart-output)
-   [<a href="https://github.com/huzhenghui/mask-awesome">https://github.com/huzhenghui/mask-awesome</a>](#httpsgithubcomhuzhenghuimask-awesome)
    -   [begin: mask task in template](#begin-mask-task-in-template)
    -   [readme](#readme)
        -   [build.ninja](#buildninja)
        -   [ninja custom-rule](#ninja-custom-rule)
        -   [ninja custom-build](#ninja-custom-build)
    -   [readme-graph-dot](#readme-graph-dot)
        -   [readme-graph-dot-output](#readme-graph-dot-output)
    -   [readme-graph-dot-xdot](#readme-graph-dot-xdot)
    -   [readme-graph-png](#readme-graph-png)
    -   [end: mask task in template](#end-mask-task-in-template)

# Extension: smart

<https://pandoc.org/MANUAL.html#extension-smart>

# from-markdown-source

``` markdown
---

    pandocomatic_:
        pandoc:
            from: markdown
            to: gfm

...

# Interpret straight quotes as curly quotes

'Interpret straight quotes as curly quotes'

"Interpret straight quotes as curly quotes"

# --- as em-dashes

---

# -- as en-dashes

--

# ... as ellipses

...
```

# from-markdown-output

``` markdown
------------------------------------------------------------------------

    pandocomatic_:
        pandoc:
            from: markdown
            to: gfm

…

# Interpret straight quotes as curly quotes

‘Interpret straight quotes as curly quotes’

“Interpret straight quotes as curly quotes”

# — as em-dashes

------------------------------------------------------------------------

# – as en-dashes

–

# … as ellipses

…
```

# from-markdown-smart-source

``` markdown
---

    pandocomatic_:
        pandoc:
            from: markdown-smart
            to: gfm

...

# Interpret straight quotes as curly quotes

'Interpret straight quotes as curly quotes'

"Interpret straight quotes as curly quotes"

# --- as em-dashes

---

# -- as en-dashes

--

# ... as ellipses

...
```

# from-markdown-smart-output

``` markdown
------------------------------------------------------------------------

    pandocomatic_:
        pandoc:
            from: markdown-smart
            to: gfm

...

# Interpret straight quotes as curly quotes

'Interpret straight quotes as curly quotes'

"Interpret straight quotes as curly quotes"

# --- as em-dashes

------------------------------------------------------------------------

# -- as en-dashes

--

# ... as ellipses

...
```

# from-markdown+smart-source

``` markdown
---

    pandocomatic_:
        pandoc:
            from: markdown+smart
            to: gfm

...

# Interpret straight quotes as curly quotes

'Interpret straight quotes as curly quotes'

"Interpret straight quotes as curly quotes"

# --- as em-dashes

---

# -- as en-dashes

--

# ... as ellipses

...
```

# from-markdown+smart-output

``` markdown
------------------------------------------------------------------------

    pandocomatic_:
        pandoc:
            from: markdown+smart
            to: gfm

…

# Interpret straight quotes as curly quotes

‘Interpret straight quotes as curly quotes’

“Interpret straight quotes as curly quotes”

# — as em-dashes

------------------------------------------------------------------------

# – as en-dashes

–

# … as ellipses

…
```

# https://github.com/huzhenghui/mask-awesome

## begin: mask task in template

## readme

``` bash
ninja --verbose README.md
```

### build.ninja

``` ninja
builddir=./build
mask_subcommand = --help

#######################################
# begin: rule in template

rule mask
  command = mask $mask_subcommand

rule mask-tee
  command = mask $mask_subcommand 2>&1 | tee $out 1> /dev/null

rule pandocomatic
  command = pandocomatic --input $in --output $out

rule ghq
  command = ghq get --update "$repository" && find -d "$link_dirname" -exec rmdir {} \; && ln -Fs "$$(ghq list --full-path $repository)" "$link_dirname"
  generator = 1

rule github-markdown-toc
  command = gh-md-toc --hide-header --hide-footer --no-escape $in > $out

rule copy_alternate
  command = if [[ -f "$alternate" ]]; then cp "$alternate" "$out"; else cp "$in" "$out"; fi;

# end: rule in template
#######################################

#######################################
# start snippet custom-rule

# custom rule here

# end snippet custom-rule
#######################################

#######################################
# begin: build in template

build ./build/ninja.README.md.dot : mask-tee | ./maskfile.md
  mask_subcommand = readme-graph-dot

build ./build/ninja.README.md.png : mask | ./build/ninja.README.md.dot
  mask_subcommand = readme-graph-png

build ./build/pandoc-lua-filters/include-files/include-files.lua : ghq
  repository = https://github.com/pandoc/lua-filters
  link_dirname = ./build/pandoc-lua-filters

build ./build/temp/README.md : copy_alternate ./maskfile.md
  alternate = ./README.md

build ./build/README.TOC.md : github-markdown-toc ./build/temp/README.md

# end: build in template
#######################################

#######################################
# start snippet custom-build

build ./from-markdown.output.md : pandocomatic ./from-markdown.md

build ./from-markdown-smart.output.md : pandocomatic ./from-markdown-smart.md

build ./from-markdown+smart.output.md : pandocomatic ./from-markdown+smart.md

# end snippet custom-build
#######################################

#######################################
# begin: build README.md
# $ followed by a newline
# escape the newline (continue the current line across a line break).
# the first 4 line in this build is template
build README.md : pandocomatic maskfile.md | $
  build.ninja $
  ./build/ninja.README.md.dot $
  ./build/ninja.README.md.png $
  ./build/pandoc-lua-filters/include-files/include-files.lua $
  ./build/README.TOC.md $
  ./from-markdown.output.md $
  ./from-markdown-smart.output.md $
  ./from-markdown+smart.output.md

default README.md
# end: build README.md
#######################################
```

### ninja custom-rule

``` ninja
# custom rule here

```

### ninja custom-build

``` ninja
build ./from-markdown.output.md : pandocomatic ./from-markdown.md

build ./from-markdown-smart.output.md : pandocomatic ./from-markdown-smart.md

build ./from-markdown+smart.output.md : pandocomatic ./from-markdown+smart.md

```

## readme-graph-dot

``` bash
ninja -t graph README.md
```

### readme-graph-dot-output

``` dot
digraph ninja {
rankdir="LR"
node [fontsize=10, shape=box, height=0.25]
edge [fontsize=10]
"0x7fc54a104560" [label="README.md"]
"0x7fc54a104080" [label="pandocomatic", shape=ellipse]
"0x7fc54a104080" -> "0x7fc54a104560"
"0x7fc549605db0" -> "0x7fc54a104080" [arrowhead=none]
"0x7fc54a104610" -> "0x7fc54a104080" [arrowhead=none]
"0x7fc549605b90" -> "0x7fc54a104080" [arrowhead=none]
"0x7fc549605f70" -> "0x7fc54a104080" [arrowhead=none]
"0x7fc549606260" -> "0x7fc54a104080" [arrowhead=none]
"0x7fc549606510" -> "0x7fc54a104080" [arrowhead=none]
"0x7fc5496066a0" -> "0x7fc54a104080" [arrowhead=none]
"0x7fc5496068b0" -> "0x7fc54a104080" [arrowhead=none]
"0x7fc549606a80" -> "0x7fc54a104080" [arrowhead=none]
"0x7fc549605db0" [label="maskfile.md"]
"0x7fc54a104610" [label="build.ninja"]
"0x7fc549605b90" [label="build/ninja.README.md.dot"]
"0x7fc549605db0" -> "0x7fc549605b90" [label=" mask-tee"]
"0x7fc549605f70" [label="build/ninja.README.md.png"]
"0x7fc549605b90" -> "0x7fc549605f70" [label=" mask"]
"0x7fc549606260" [label="build/pandoc-lua-filters/include-files/include-files.lua"]
"0x7fc5496061f0" [label="ghq", shape=ellipse]
"0x7fc5496061f0" -> "0x7fc549606260"
"0x7fc549606510" [label="build/README.TOC.md"]
"0x7fc549606400" -> "0x7fc549606510" [label=" github-markdown-toc"]
"0x7fc549606400" [label="build/temp/README.md"]
"0x7fc549605db0" -> "0x7fc549606400" [label=" copy_alternate"]
"0x7fc5496066a0" [label="from-markdown.output.md"]
"0x7fc549606750" -> "0x7fc5496066a0" [label=" pandocomatic"]
"0x7fc549606750" [label="from-markdown.md"]
"0x7fc5496068b0" [label="from-markdown-smart.output.md"]
"0x7fc549606960" -> "0x7fc5496068b0" [label=" pandocomatic"]
"0x7fc549606960" [label="from-markdown-smart.md"]
"0x7fc549606a80" [label="from-markdown+smart.output.md"]
"0x7fc549606b30" -> "0x7fc549606a80" [label=" pandocomatic"]
"0x7fc549606b30" [label="from-markdown+smart.md"]
}
```

## readme-graph-dot-xdot

``` bash
detach -- xdot "${MASKFILE_DIR}/build/ninja.README.md.dot"
```

## readme-graph-png

``` bash
dot -Tpng -o./build/ninja.README.md.png ./build/ninja.README.md.dot
```

![README.md](./build/ninja.README.md.png)

## end: mask task in template
