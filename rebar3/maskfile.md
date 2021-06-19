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

# rebar3

<!-- markdownlint-disable MD007 MD030 -->
```{.include}
./build/README.TOC/README.TOC.md
```
<!-- markdownlint-enable MD007 MD030 -->

# Mask SubCommands

[Mask Awesome](https://github.com/huzhenghui/mask-awesome)

## rebar-create-mochiwebapp

```bash
dest="$(realpath ./mochiweb)"
ghq get --update --shallow https://github.com/mochi/mochiweb
cd "$(ghq list --full-path https://github.com/mochi/mochiweb)"
/usr/local/opt/rebar/bin/rebar \
    --recursive \
    create \
    template=mochiwebapp \
    dest="${dest}" \
    appid="appmochiweb"
```

## rebar3-path

```bash
cd "$(realpath ./mochiweb)"
rebar3 path --base | xargs urelpath
rebar3 path --bin | xargs urelpath
rebar3 path --ebin | xargs urelpath
rebar3 path --lib | xargs urelpath
rebar3 path --priv | xargs urelpath
rebar3 path --src | xargs urelpath
rebar3 path --rel | xargs urelpath
```

### rebar3-path-output

```{.plain include=./build/rebar3-path-output.txt}
```

## rebar3-tree

```bash
cd "$(realpath ./mochiweb)"
rebar3 tree --verbose
```

### rebar3-tree-output

```{.plain include=./build/rebar3-tree-output.txt}
```

## rebar3-shell

```bash
cd "$(realpath ./mochiweb)"
rebar3 shell --apps appmochiweb
```

### Open Site

[http://localhost:8080/](http://localhost:8080/)

### Shell Command

-   `help().`

-   `q().`

## rebar3-get-deps

```bash
cd "$(realpath ./mochiweb)"
rebar3 get-deps
```

### rebar3-get-deps-output

```{.plain include=./build/rebar3-get-deps-output.txt}
```

## rebar3-release-all

```bash
cd "$(realpath ./mochiweb)"
rebar3 release --all
```

### rebar3-release-all-output

```{.plain include=./build/rebar3-release-all-output.txt}
```

## trash-mochiweb

```bash
trash "$(realpath ./mochiweb)"
```

## rebar3-report

```bash
rebar3 report
```

### rebar3-report-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/rebar3-report-output.txt}
```
<!-- markdownlint-enable MD013 -->

## rebar3-new-help

```bash
rebar3 new help
```

### rebar3-new-help-output

```{.plain include=./build/rebar3-new-help-output.txt}
```

## rebar3-new-help-app

```bash
rebar3 new help app
```

### rebar3-new-help-app-output

<!-- markdownlint-disable MD010 -->
```{.plain include=./build/rebar3-new-help-app-output.txt}
```
<!-- markdownlint-enable MD010 -->

## rebar3-new-help-cmake

```bash
rebar3 new help cmake
```

### rebar3-new-help-cmake-output

<!-- markdownlint-disable MD010 -->
```{.plain include=./build/rebar3-new-help-cmake-output.txt}
```
<!-- markdownlint-enable MD010 -->

## rebar3-new-help-escript

```bash
rebar3 new help escript
```

### rebar3-new-help-escript-output

<!-- markdownlint-disable MD010 -->
```{.plain include=./build/rebar3-new-help-escript-output.txt}
```
<!-- markdownlint-enable MD010 -->

## rebar3-new-help-lib

```bash
rebar3 new help lib
```

### rebar3-new-help-lib-output

<!-- markdownlint-disable MD010 -->
```{.plain include=./build/rebar3-new-help-lib-output.txt}
```
<!-- markdownlint-enable MD010 -->

## rebar3-new-help-plugin

```bash
rebar3 new help plugin
```

### rebar3-new-help-plugin-output

<!-- markdownlint-disable MD010 -->
```{.plain include=./build/rebar3-new-help-plugin-output.txt}
```
<!-- markdownlint-enable MD010 -->

## rebar3-new-help-release

```bash
rebar3 new help release
```

### rebar3-new-help-release-output

<!-- markdownlint-disable MD010 -->
```{.plain include=./build/rebar3-new-help-release-output.txt}
```
<!-- markdownlint-enable MD010 -->

## rebar3-new-help-umbrella

```bash
rebar3 new help umbrella
```

### rebar3-new-help-umbrella-output

<!-- markdownlint-disable MD010 -->
```{.plain include=./build/rebar3-new-help-umbrella-output.txt}
```
<!-- markdownlint-enable MD010 -->

## rebar3-version

```bash
rebar3 --version
```

### rebar3-version-output

```{.plain include=./build/rebar3-version-output.txt}
```

## rebar3-help

```bash
rebar3 --help
```

### rebar3-help-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/rebar3-help-output.txt}
```
<!-- markdownlint-enable MD013 -->

## rebar3-help-as

```bash
rebar3 help as
```

### rebar3-help-as-output

```{.plain include=./build/rebar3-help-as-output.txt}
```

## rebar3-help-clean

```bash
rebar3 help clean
```

### rebar3-help-clean-output

```{.plain include=./build/rebar3-help-clean-output.txt}
```

## rebar3-help-compile

```bash
rebar3 help compile
```

### rebar3-help-compile-output

```{.plain include=./build/rebar3-help-compile-output.txt}
```

## rebar3-help-cover

```bash
rebar3 help cover
```

### rebar3-help-cover-output

```{.plain include=./build/rebar3-help-cover-output.txt}
```

## rebar3-help-ct

```bash
rebar3 help ct
```

### rebar3-help-ct-output

```{.plain include=./build/rebar3-help-ct-output.txt}
```

## rebar3-help-deps

```bash
rebar3 help deps
```

### rebar3-help-deps-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/rebar3-help-deps-output.txt}
```
<!-- markdownlint-enable MD013 -->

## rebar3-help-dialyzer

```bash
rebar3 help dialyzer
```

### rebar3-help-dialyzer-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/rebar3-help-dialyzer-output.txt}
```
<!-- markdownlint-enable MD013 -->

## rebar3-help-do

```bash
rebar3 help do
```

### rebar3-help-do-output

```{.plain include=./build/rebar3-help-do-output.txt}
```

## rebar3-help-edoc

```bash
rebar3 help edoc
```

### rebar3-help-edoc-output

```{.plain include=./build/rebar3-help-edoc-output.txt}
```

## rebar3-help-escriptize

```bash
rebar3 help escriptize
```

### rebar3-help-escriptize-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/rebar3-help-escriptize-output.txt}
```
<!-- markdownlint-enable MD013 -->

## rebar3-help-eunit

```bash
rebar3 help eunit
```

### rebar3-help-eunit-output

```{.plain include=./build/rebar3-help-eunit-output.txt}
```

## rebar3-help-get-deps

```bash
rebar3 help get-deps
```

### rebar3-help-get-deps-output

```{.plain include=./build/rebar3-help-get-deps-output.txt}
```

## rebar3-help-help

```bash
rebar3 help help
```

### rebar3-help-help-output

```{.plain include=./build/rebar3-help-help-output.txt}
```

## rebar3-help-new

```bash
rebar3 help new
```

### rebar3-help-new-output

```{.plain include=./build/rebar3-help-new-output.txt}
```

## rebar3-help-path

```bash
rebar3 help path
```

### rebar3-help-path-output

```{.plain include=./build/rebar3-help-path-output.txt}
```

## rebar3-help-pkgs

```bash
rebar3 help pkgs
```

### rebar3-help-pkgs-output

```{.plain include=./build/rebar3-help-pkgs-output.txt}
```

## rebar3-help-release

```bash
rebar3 help release
```

### rebar3-help-release-output

```{.plain include=./build/rebar3-help-release-output.txt}
```

## rebar3-help-relup

```bash
rebar3 help relup
```

### rebar3-help-relup-output

```{.plain include=./build/rebar3-help-relup-output.txt}
```

## rebar3-help-report

```bash
rebar3 help report
```

### rebar3-help-report-output

```{.plain include=./build/rebar3-help-report-output.txt}
```

## rebar3-help-shell

```bash
rebar3 help shell
```

### rebar3-help-shell-output

```{.plain include=./build/rebar3-help-shell-output.txt}
```

## rebar3-help-tar

```bash
rebar3 help tar
```

### rebar3-help-tar-output

```{.plain include=./build/rebar3-help-tar-output.txt}
```

## rebar3-help-tree

```bash
rebar3 help tree
```

### rebar3-help-tree-output

```{.plain include=./build/rebar3-help-tree-output.txt}
```

## rebar3-help-unlock

```bash
rebar3 help unlock
```

### rebar3-help-unlock-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/rebar3-help-unlock-output.txt}
```
<!-- markdownlint-enable MD013 -->

## rebar3-help-update

```bash
rebar3 help update
```

### rebar3-help-update-output

```{.plain include=./build/rebar3-help-update-output.txt}
```

## rebar3-help-upgrade

```bash
rebar3 help upgrade
```

### rebar3-help-upgrade-output

<!-- markdownlint-disable MD013 -->
```{.plain include=./build/rebar3-help-upgrade-output.txt}
```
<!-- markdownlint-enable MD013 -->

## rebar3-help-version

```bash
rebar3 help version
```

### rebar3-help-version-output

```{.plain include=./build/rebar3-help-version-output.txt}
```

## rebar3-help-xref

```bash
rebar3 help xref
```

### rebar3-help-xref-output

```{.plain include=./build/rebar3-help-xref-output.txt}
```

## rebar3-help-local

```bash
rebar3 help local
```

### rebar3-help-local-output

```{.plain include=./build/rebar3-help-local-output.txt}
```

## rebar3-help-local-install

```bash
rebar3 help local install
```

### rebar3-help-local-install-output

```{.plain include=./build/rebar3-help-local-install-output.txt}
```

## rebar3-help-local-upgrade

```bash
rebar3 help local upgrade
```

### rebar3-help-local-upgrade-output

```{.plain include=./build/rebar3-help-local-upgrade-output.txt}
```

## rebar3-help-plugins

```bash
rebar3 help plugins
```

### rebar3-help-plugins-output

```{.plain include=./build/rebar3-help-plugins-output.txt}
```

## rebar3-help-plugins-list

```bash
rebar3 help plugins list
```

### rebar3-help-plugins-list-output

```{.plain include=./build/rebar3-help-plugins-list-output.txt}
```

## rebar3-help-plugins-upgrade

```bash
rebar3 help plugins upgrade
```

### rebar3-help-plugins-upgrade-output

```{.plain include=./build/rebar3-help-plugins-upgrade-output.txt}
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
