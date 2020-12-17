---

    pandocomatic_:
        pandoc:
            from: markdown
            to: markdown-fenced_code_attributes
            filter:
            - pandoc-include-code
            output: README.md

...

# fontforge

# https://github.com/huzhenghui/mask-awesome

## git-clone-depth-1-ryanoasis-nerd-fonts

```bash
mkdir -p "$(ghq root)/github.com/ryanoasis"
cd "$(ghq root)/github.com/ryanoasis"
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
```

## font-patcher-help

```bash
cd "$(ghq list --full-path https://github.com/ryanoasis/nerd-fonts)"
fontforge -script ./font-patcher -h
```

### font-patcher-help-output

```{.plain include=./build/font-patcher-help.txt}

```

## font-patcher-FiraCode-Regular

```bash
cd "$(ghq list --full-path https://github.com/ryanoasis/nerd-fonts)"
fontforge -script ./font-patcher --outputdir "${MASKFILE_DIR}/output" ~/Library/Fonts/FiraCode-Regular.otf
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
