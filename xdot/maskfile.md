---

    pandocomatic_:
        pandoc:
            from: markdown
            to: markdown-fenced_code_attributes
            filter:
            - pandoc-include-code
            output: README.md

...

# xdot

# https://github.com/huzhenghui/mask-awesome

## xdot-help

```bash
xdot --help
```

### xdot-help-output

```{.plain include=./build/xdot-help.txt}

```

## xdot-open-detach

```bash
xdot ./build/ninja.README.md.dot &
```

## begin: mask task in template

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

## end: mask task in template
