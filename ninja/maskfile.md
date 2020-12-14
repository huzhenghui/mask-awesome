---

    pandocomatic_:
        pandoc:
            from: markdown
            to: markdown-fenced_code_attributes
            filter:
            - pandoc-include-code
            output: README.md

...

# build.ninja

```{.ninja include=./build.ninja}

```

# Tasks

## ninja-help

```bash
ninja --help
[[ $? -eq 1 ]]
```

### output

```{.plain include=./build/ninja-help.txt}

```

## ninja-tool-list

```bash
ninja -t list
```

### output

```{.plain include=./build/ninja-tool-list.txt}

```

## readme

```bash
ninja --verbose README.md
```

## readme-grapth-dot

```bash
ninja -t graph README.md
```

### output

```{.dot include=./build/ninja.README.md.dot}

```

## readme-grapth-png

```bash
dot -Tpng -o./build/ninja.README.md.png ./build/ninja.README.md.dot
```

![README.md](./build/ninja.README.md.png)
