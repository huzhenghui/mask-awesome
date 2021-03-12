---
pandocomatic_:
    pandoc:
        from: markdown-smart+tex_math_dollars
        to: gfm+tex_math_dollars
        filter:
        - pandoc-include-code
        lua-filter:
        - ./build/pandoc-lua-filters/include-files/include-files.lua
        output: README.md
...

# fpp

<!-- markdownlint-disable MD007 MD030 -->
```{.include}
./build/README.TOC/README.TOC.md
```
<!-- markdownlint-enable MD007 MD030 -->

# Mask SubCommands

[Mask Awesome](https://github.com/huzhenghui/mask-awesome)

## git-status-fpp

```bash
git status --untracked-files=no | \
    fpp --non-interactive --command 'git --no-pager log --'
```

## git-show-fpp

```bash
git show --color | fpp --non-interactive --command 'stat -x'
```

## git-diff-fpp

```bash
git diff --color HEAD~1 master | \
    fpp --non-interactive --command 'git --no-pager log --'
```

## git-diff-numstat-fpp

```bash
git diff --color HEAD~1 master --numstat | \
    fpp --non-interactive --command 'git --no-pager log --'
```

## grep-fpp

```bash
grep --color=always --recursive "fpp" "$(git root)" | \
    fpp --non-interactive --command 'stat -x'
```

## fselect-name-fpp

``` bash
cd "$(git root)"
echo -e "path\tsize\tmime\tline_count"
fselect "concat('[../', path, '](../', path, ')'), size, mime, line_count \
    from . gitignore \
    where name like '%fpp%' \
    order by path"
```

### fselect-name-fpp-output

<!-- markdownlint-disable MD013 -->
```{.include}
./build/fselect-name-fpp-output.md
```
<!-- markdownlint-enable MD013 -->

## fselect-name-fpp-fpp

```bash
$MASK fselect-name-fpp | \
    fpp --non-interactive --command 'git --no-pager log --'
```

## fselect-contains-fpp

```bash
cd "$(git root)"
echo -e "path\tsize\tmime\tline_count"
fselect "concat('[../', path, '](../', path, ')'), size, mime, line_count \
    from . gitignore \
    where contains(fpp) = true \
    order by path"
```

### fselect-contains-fpp-output

<!-- markdownlint-disable MD013 -->
```{.include}
./build/fselect-contains-fpp-output.md
```
<!-- markdownlint-enable MD013 -->

## fselect-contains-fpp-fpp

```bash
$MASK fselect-contains-fpp | \
    fpp --non-interactive --command 'git --no-pager log --'
```

## fpp-version

```bash
fpp --version
```

### fpp-version-output

```{.plain include=./build/fpp-version-output.txt}
```

## fpp-help

```bash
fpp --help
```

### fpp-help-output

```{.plain include=./build/fpp-help-output.txt}
```

## begin: mask task in template : build content

## ninja-rules

```bash
ninja -t rules
```

### ninja custom-rule

```{.ninja include=build.ninja snippet=custom-rule}
```

### ninja-rules-output

```{.plain include=./build/ninja/ninja-rules-output.txt}
```

## ninja-targets

```bash
ninja -t targets all
```

### ninja build-all

```{.ninja include=build.ninja snippet=build-all}
```

### ninja custom-build

```{.ninja include=build.ninja snippet=custom-build}

```

### ninja report-build

```{.ninja include=build.ninja snippet=report-build}

```

### ninja-targets-output

```{.plain include=./build/ninja/ninja-targets-output.txt}
```

## readme-md

```bash
ninja --verbose README.md
```

### ninja readme-build

```{.ninja include=build.ninja snippet=custom-readme-build}
```

```{.ninja include=build.ninja snippet=readme-build}
```

## end: mask task in template : build content

## begin: mask task in template : ninja command

## ninja-browse

```bash
ninja -t browse
```

## ninja-graph-png

```bash
dot -Tpng -o./build/ninja/ninja.graph.png ./build/ninja/ninja.graph.dot
```

![ninja](./build/ninja/ninja.graph.png)

## ninja-graph-dot-xdot

```bash
detach -- xdot "${MASKFILE_DIR}/build/ninja/ninja.graph.dot"
```

## ninja-graph-dot

```bash
ninja -t graph
```

### ninja-graph-dot-output

```{.dot include=./build/ninja/ninja.graph.dot}
```

## ninja-all

```bash
ninja --verbose
```

### build.ninja

```{.ninja include=./build.ninja}
```

## end: mask task in template : ninja command
