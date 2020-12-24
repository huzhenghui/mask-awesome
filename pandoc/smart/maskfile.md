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

# smart

```{.include}
./build/README.TOC.md
```

# Extension: smart

[https://pandoc.org/MANUAL.html#extension-smart](https://pandoc.org/MANUAL.html#extension-smart)

# from-markdown-source

```{.markdown include=./from-markdown.md}

```

# from-markdown-output

```{.markdown include=./from-markdown.output.md}

```

# from-markdown-smart-source

```{.markdown include=./from-markdown-smart.md}

```

# from-markdown-smart-output

```{.markdown include=./from-markdown-smart.output.md}

```

# from-markdown+smart-source

```{.markdown include=./from-markdown+smart.md}

```

# from-markdown+smart-output

```{.markdown include=./from-markdown+smart.output.md}

```

# https://github.com/huzhenghui/mask-awesome

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
