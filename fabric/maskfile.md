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

# fabric

<!-- markdownlint-disable MD007 MD030 -->
```{.include}
./build/README.TOC/README.TOC.md
```
<!-- markdownlint-enable MD007 MD030 -->

# ./fabfile.py

<!-- markdownlint-disable MD013 -->
```{.python include=./fabfile.py}
```
<!-- markdownlint-enable MD013 -->

# Mask SubCommands

[Mask Awesome](https://github.com/huzhenghui/mask-awesome)

## task-info

*   `--hide=both`
    *   [run(command, **kwargs)](http://docs.pyinvoke.org/en/latest/api/runners.html#invoke.runners.Runner.run)

        > Allows the caller to disable run’s default behavior of
        > copying the subprocess’ stdout and stderr to the controlling terminal.
        > Specify hide='out' (or 'stdout') to hide only the stdout stream,
        > hide='err' (or 'stderr') to hide only stderr,
        > or hide='both' (or True) to hide both streams.

```bash
fab --hide=both info
```

## task-info-help

```bash
fab info --help
```

### task-info-help-output

```{.plain include=./build/task-info-help-output.txt}
```

## fab-list-flat

```bash
fab --list --list-format flat
```

### fab-list-flat-output

```{.plain include=./build/fab-list-flat-output.txt}
```

## fab-list-nested

```bash
fab --list --list-format nested
```

### fab-list-nested-output

```{.plain include=./build/fab-list-nested-output.txt}
```

## fab-list-json

```bash
fab --list --list-format json
```

### fab-list-json-output

```{.json include=./build/fab-list-json-output.json}
```

## fab-complete

```bash
fab --complete
```

### fab-complete-output

```{.plain include=./build/fab-complete-output.txt}
```

## fab-version

```bash
fab --version
```

### fab-version-output

```{.plain include=./build/fab-version-output.txt}
```

## fab-help

```bash
fab --help
```

### fab-help-output

```{.plain include=./build/fab-help-output.txt}
```

## fab-print-completion-script-bash

```bash
fab --print-completion-script bash
```

### fab-print-completion-script-bash-output

```{.bash include=./build/fab-print-completion-script-bash-output.bash}
```

## fab-print-completion-script-fish

```fish
fab --print-completion-script fish
```

### fab-print-completion-script-fish-output

```{.fish include=./build/fab-print-completion-script-fish-output.fish}
```

## fab-print-completion-script-zsh

```zsh
fab --print-completion-script zsh
```

### fab-print-completion-script-zsh-output

```{.zsh include=./build/fab-print-completion-script-zsh-output.zsh}
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
