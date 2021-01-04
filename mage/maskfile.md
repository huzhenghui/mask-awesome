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

# mage

<!-- markdownlint-disable MD007 MD030 -->
```{.include}
./build/README.TOC.md
```
<!-- markdownlint-enable MD007 MD030 -->

# Mask SubCommands

[Mask Awesome](https://github.com/huzhenghui/mask-awesome)

## Begin: Prepare Steps

## get-mage

```bash
go get github.com/magefile/mage/mg
```

## settings-go-buildTags

> Set go.buildTags equal 'mage' in settings.json of Visual Studio Code

```bash
json5 "$(git root)/.vscode/settings.json" | jq 'with_entries(select(.key == "go.buildTags"))'
```

### settings-go-buildTags.json

```{.json include=./build/settings-go-buildTags.json}
```

## End: Prepare Steps

## mage-help

```bash
mage --help
```

### mage-help-output

<!-- markdownlint-disable MD010 MD013 -->
```{.plain include=./build/mage-help-output.txt}
```
<!-- markdownlint-enable MD010 MD013 -->

## mage-version

```bash
mage --version
```

### mage-version-output

```{.plain include=./build/mage-version-output.txt}
```

## mage-launcher-l

```bash
go get "github.com/magefile/mage"
mage -d "${MASKFILE_DIR}/launcher" -l
```

### mage-launcher-l-output

```{.plain include=./build/mage-launcher-l-output.txt}
```

## mage-launcher-h-launcher

```bash
go get "github.com/magefile/mage"
mage -d "${MASKFILE_DIR}/launcher" -h launcher
```

### mage-launcher-h-launcher-output

<!-- markdownlint-disable MD010 -->
```{.plain include=./build/mage-launcher-h-launcher-output.txt}
```
<!-- markdownlint-enable MD010 -->

## mage-launcher-launcher

```bash
go get "github.com/magefile/mage"
mage -d "${MASKFILE_DIR}/launcher" -v -keep launcher
```

### mage-launcher-launcher-stderr

```{.plain include=./build/mage-launcher-launcher-stderr.txt}
```

### mage-launcher-launcher-stdout

```{.plain include=./build/mage-launcher-launcher-stdout.txt}
```

### mage-launcher-launcher-Hello

```{.plain include=./FS/Hello.txt}
```

### mage-launcher-launcher-statik

> <https://golang.org/doc/effective_go.html#formatting>
>
> > Indentation
> >
> > > We use tabs for indentation and `gofmt` emits them by default.
> > > Use spaces only if you must.

<!-- markdownlint-disable MD010 MD013 -->
```{.go include=./statik/statik.go}
```
<!-- markdownlint-enable MD010 MD013 -->

### launcher/magefile.go

> <https://golang.org/doc/effective_go.html#formatting>
>
> > Indentation
> >
> > > We use tabs for indentation and `gofmt` emits them by default.
> > > Use spaces only if you must.

<!-- markdownlint-disable MD010 -->
```{.go include=./launcher/magefile.go}
```
<!-- markdownlint-enable MD010 -->

### launcher/main.go

> Fake main `func` to avoid warning in Visual Studio Code

```{.go include=./launcher//main.go}
```

### read/magefile.go

> <https://golang.org/doc/effective_go.html#formatting>
>
> > Indentation
> >
> > > We use tabs for indentation and `gofmt` emits them by default.
> > > Use spaces only if you must.

<!-- markdownlint-disable MD010 -->
```{.go include=./read/magefile.go}
```
<!-- markdownlint-enable MD010 -->

### read/main.go

> Fake main `func` to avoid warning in Visual Studio Code

```{.go include=./read/main.go}
```

### read/mage_output_file.go

> <https://golang.org/doc/effective_go.html#formatting>
>
> > Indentation
> >
> > > We use tabs for indentation and `gofmt` emits them by default.
> > > Use spaces only if you must.

<!-- markdownlint-disable MD010 MD013 -->
```{.go include=./read/mage_output_file.go}
```
<!-- markdownlint-enable MD010 MD013 -->

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
