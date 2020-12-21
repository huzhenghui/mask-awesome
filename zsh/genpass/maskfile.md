---

    pandocomatic_:
        pandoc:
            from: markdown
            to: markdown-fenced_code_attributes
            filter:
            - pandoc-include-code
            output: README.md

...

# genpass

# https://github.com/huzhenghui/mask-awesome

## genpass-apple

```bash
zsh --interactive -c 'genpass-apple'
```

### genpass-apple-output

```{.plain include=./build/genpass-apple-output.txt}

```

## genpass-monkey

```bash
zsh --interactive -c 'genpass-monkey'
```

### genpass-monkey-output

```{.plain include=./build/genpass-monkey-output.txt}

```

## genpass-xkcd

```bash
zsh --interactive -c 'genpass-xkcd '
```

### genpass-xkcd-output

```{.plain include=./build/genpass-xkcd-output.txt}

```

## begin: mask task in template

## readme

```bash
ninja --verbose README.md
```

### build.ninja

```{.ninja include=./build.ninja}

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
