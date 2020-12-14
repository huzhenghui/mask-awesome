---

# start snippet pandocomatic-front-matter-metadata

    pandocomatic_:
        pandoc:
            from: markdown
            to: markdown-fenced_code_attributes
            filter:
            - pandoc-include-code
            output: README.md

# end snippet pandocomatic-front-matter-metadata

...

# pandocomatic front matter metadata

```{.yaml include=./maskfile.md snippet=pandocomatic-front-matter-metadata dedent=4}

```

# Tasks

## pandocomatic-help

```bash
pandocomatic --help
```

### pandocomatic-help-output

```{.plain include=./build/pandocomatic-help.txt}

```

## readme

```bash
ninja --verbose README.md
```

### build.ninja

```{.ninja include=./build.ninja}

```

## readme-grapth-dot

```bash
ninja -t graph README.md
```

### readme-grapth-dot-output

```{.dot include=./build/ninja.README.md.dot}

```

## readme-grapth-png

```bash
dot -Tpng -o./build/ninja.README.md.png ./build/ninja.README.md.dot
```

![README.md](./build/ninja.README.md.png)
