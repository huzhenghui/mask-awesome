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

# github-markdown-toc

-   [github-markdown-toc](#github-markdown-toc)
-   [<a href="https://github.com/huzhenghui/mask-awesome">https://github.com/huzhenghui/mask-awesome</a>](#httpsgithubcomhuzhenghuimask-awesome)
    -   [gh-md-toc-help](#gh-md-toc-help)
        -   [gh-md-toc-help-output](#gh-md-toc-help-output)
    -   [gh-md-toc-version](#gh-md-toc-version)
        -   [gh-md-toc-version-output](#gh-md-toc-version-output)
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

# https://github.com/huzhenghui/mask-awesome

## gh-md-toc-help

``` bash
gh-md-toc --help
```

### gh-md-toc-help-output

``` plain
usage: gh-md-toc [<flags>] [<path>...]

Flags:
  --help         Show context-sensitive help (also try --help-long and
                 --help-man).
  --serial       Grab TOCs in the serial mode
  --hide-header  Hide TOC header
  --hide-footer  Hide TOC footer
  --depth=0      How many levels of headings to include. Defaults to 0 (all)
  --no-escape    Do not escape chars in sections
  --token=TOKEN  GitHub personal token
  --indent=2     Indent space of generated list
  --debug        Show debug info
  --version      Show application version.

Args:
  [<path>]  Local path or URL of the document to grab TOC. Read MD from stdin if
            not entered.

```

## gh-md-toc-version

``` bash
gh-md-toc --version
```

### gh-md-toc-version-output

``` plain
1.1.0
```

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

# end: rule in template
#######################################

#######################################
# start snippet custom-rule

rule github-markdown-toc
  command = gh-md-toc --hide-header --hide-footer --no-escape $in > $out

rule copy_alternate
  command = if [[ -f "$alternate" ]]; then cp "$alternate" "$out"; else cp "$in" "$out"; fi;

# end snippet custom-rule
#######################################

#######################################
# begin: build in template

build ./build/ninja.README.md.dot : mask-tee | ./maskfile.md
  mask_subcommand = readme-graph-dot

build ./build/ninja.README.md.png : mask | ./build/ninja.README.md.dot
  mask_subcommand = readme-graph-png

# end: build in template
#######################################

#######################################
# start snippet custom-build

build ./build/pandoc-lua-filters/include-files/include-files.lua : ghq
  repository = https://github.com/pandoc/lua-filters
  link_dirname = ./build/pandoc-lua-filters

build ./build/temp/README.md : copy_alternate ./maskfile.md
  alternate = ./README.md

build ./build/README.TOC.md : github-markdown-toc ./build/temp/README.md

build ./build/gh-md-toc-help.txt : mask-tee | ./maskfile.md
  mask_subcommand = gh-md-toc-help

build ./build/gh-md-toc-version.txt : mask-tee | ./maskfile.md
  mask_subcommand = gh-md-toc-version

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
  ./build/gh-md-toc-help.txt $
  ./build/gh-md-toc-version.txt

default README.md
# end: build README.md
#######################################
```

### ninja custom-rule

``` ninja
rule github-markdown-toc
  command = gh-md-toc --hide-header --hide-footer --no-escape $in > $out

rule copy_alternate
  command = if [[ -f "$alternate" ]]; then cp "$alternate" "$out"; else cp "$in" "$out"; fi;

```

### ninja custom-build

``` ninja
build ./build/pandoc-lua-filters/include-files/include-files.lua : ghq
  repository = https://github.com/pandoc/lua-filters
  link_dirname = ./build/pandoc-lua-filters

build ./build/temp/README.md : copy_alternate ./maskfile.md
  alternate = ./README.md

build ./build/README.TOC.md : github-markdown-toc ./build/temp/README.md

build ./build/gh-md-toc-help.txt : mask-tee | ./maskfile.md
  mask_subcommand = gh-md-toc-help

build ./build/gh-md-toc-version.txt : mask-tee | ./maskfile.md
  mask_subcommand = gh-md-toc-version

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
"0x7fe374407a10" [label="README.md"]
"0x7fe374407790" [label="pandocomatic", shape=ellipse]
"0x7fe374407790" -> "0x7fe374407a10"
"0x7fe374406b20" -> "0x7fe374407790" [arrowhead=none]
"0x7fe374407af0" -> "0x7fe374407790" [arrowhead=none]
"0x7fe374406900" -> "0x7fe374407790" [arrowhead=none]
"0x7fe374406ce0" -> "0x7fe374407790" [arrowhead=none]
"0x7fe374406fd0" -> "0x7fe374407790" [arrowhead=none]
"0x7fe374407280" -> "0x7fe374407790" [arrowhead=none]
"0x7fe3744074a0" -> "0x7fe374407790" [arrowhead=none]
"0x7fe3744076a0" -> "0x7fe374407790" [arrowhead=none]
"0x7fe374406b20" [label="maskfile.md"]
"0x7fe374407af0" [label="build.ninja"]
"0x7fe374406900" [label="build/ninja.README.md.dot"]
"0x7fe374406b20" -> "0x7fe374406900" [label=" mask-tee"]
"0x7fe374406ce0" [label="build/ninja.README.md.png"]
"0x7fe374406900" -> "0x7fe374406ce0" [label=" mask"]
"0x7fe374406fd0" [label="build/pandoc-lua-filters/include-files/include-files.lua"]
"0x7fe374406f60" [label="ghq", shape=ellipse]
"0x7fe374406f60" -> "0x7fe374406fd0"
"0x7fe374407280" [label="build/README.TOC.md"]
"0x7fe374407170" -> "0x7fe374407280" [label=" github-markdown-toc"]
"0x7fe374407170" [label="build/temp/README.md"]
"0x7fe374406b20" -> "0x7fe374407170" [label=" copy_alternate"]
"0x7fe3744074a0" [label="build/gh-md-toc-help.txt"]
"0x7fe374406b20" -> "0x7fe3744074a0" [label=" mask-tee"]
"0x7fe3744076a0" [label="build/gh-md-toc-version.txt"]
"0x7fe374406b20" -> "0x7fe3744076a0" [label=" mask-tee"]
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
