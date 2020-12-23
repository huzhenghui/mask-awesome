---

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

```{.include}
./build/README.TOC.md
```

# https://github.com/huzhenghui/mask-awesome

## gh-md-toc-help

```bash
gh-md-toc --help
```

### gh-md-toc-help-output

```{.plain include=./build/gh-md-toc-help.txt}

```

## gh-md-toc-version

```bash
gh-md-toc --version
```

### gh-md-toc-version-output

```{.plain include=./build/gh-md-toc-version.txt}

```

## begin: mask task in template

## readme

```bash
ninja --verbose README.md
```

### build.ninja

```{.ninja include=./build.ninja}

```

### ninja custom-rule

```{.ninja include=build.ninja snippet=custom-rule}

```

### ninja custom-build

```{.ninja include=build.ninja snippet=custom-build}

```

## readme-graph-dot

```bash
ninja -t graph README.md
```

### readme-graph-dot-output

```{.dot include=./build/ninja.README.md.dot}

```

## readme-graph-dot-xdot

```bash
detach -- xdot "${MASKFILE_DIR}/build/ninja.README.md.dot"
```

## readme-graph-png

```bash
dot -Tpng -o./build/ninja.README.md.png ./build/ninja.README.md.dot
```

![README.md](./build/ninja.README.md.png)

## end: mask task in template
