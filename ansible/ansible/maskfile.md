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

# ansible

<!-- markdownlint-disable MD007 MD030 -->
```{.include}
./build/README.TOC/README.TOC.md
```
<!-- markdownlint-enable MD007 MD030 -->

# Mask SubCommands

[Mask Awesome](https://github.com/huzhenghui/mask-awesome)

## inventory

```bash
cat /etc/ansible/hosts
```

## ansible-list-hosts

```bash
ansible all --list-hosts
```

### ansible-list-hosts-output

```{.plain include=./build/ansible-list-hosts-output.txt}
```

## ping

```bash
ansible all --module-name=ping
```

### ping-output

```{.plain include=./build/ping-output.txt}
```

## ping-one-line

```bash
ansible all --one-line --module-name=ping
```

### ping-one-line-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/ping-one-line-output.txt}
```
<!-- markdownlint-enable MD013 -->

## echo

```bash
ansible all --args="/bin/echo hello"
```

### echo-output

```{.plain include=./build/echo-output.txt}
```

## echo-one-line

```bash
ansible all --one-line --args="/bin/echo hello"
```

### echo-one-line-output

```{.plain include=./build/echo-one-line-output.txt}
```

## date

```bash
ansible all --args="/bin/date"
```

### date-output

```{.plain include=./build/date-output.txt}
```

## date-one-line

```bash
ansible all --one-line --args="/bin/date"
```

### date-one-line-output

```{.plain include=./build/date-one-line-output.txt}
```

## fselect-name-ansible

``` bash
cd "$(git root)"
echo -e "path\tsize\tmime\tline_count"
fselect "concat('[../', path, '](../', path, ')'), size, mime, line_count \
    from . gitignore \
    where name like '%ansible%' \
    order by path"
```

### fselect-name-ansible-output

<!-- markdownlint-disable MD013 -->
```{.include}
./build/markdown/fselect-name-ansible-output.md
```
<!-- markdownlint-enable MD013 -->

## fselect-contains-ansible

```bash
cd "$(git root)"
echo -e "path\tsize\tmime\tline_count"
fselect "concat('[../', path, '](../', path, ')'), size, mime, line_count \
    from . gitignore \
    where contains(ansible) = true \
    order by path"
```

### fselect-contains-ansible-output

<!-- markdownlint-disable MD013 -->
```{.include}
./build/markdown/fselect-contains-ansible-output.md
```
<!-- markdownlint-enable MD013 -->
## ansible-help

```bash
ansible --help
```

### ansible-help-output

```{.plain include=./build/ansible-help-output.txt}
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
