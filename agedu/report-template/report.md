---
pandocomatic_:
    pandoc:
        from: markdown-smart
        to: gfm
        filter:
        - pandoc-include-code
        lua-filter:
        - ./../build/pandoc-lua-filters/include-files/include-files.lua
        output: ../report-output/report.md
...

# `/`

```{.include}
../report-output/root.auto-generated.md
```

# `/Applications`

```{.include}
../report-output/root-Applications.auto-generated.md
```

# `/Users`

```{.include}
../report-output/root-Users.auto-generated.md
```

# `HOME`

```{.include}
../report-output/HOME.auto-generated.md
```

# `HOME/.local`

```{.include}
../report-output/HOME--local.auto-generated.md
```

# `HOME/.local/share`

```{.include}
../report-output/HOME--local-share.auto-generated.md
```

# `HOME/.local/share/Trash`

```{.include}
../report-output/HOME--local-share-Trash.auto-generated.md
```

# `HOME/.local/share/Trash/files`

```{.include}
../report-output/HOME--local-share-Trash-files.auto-generated.md
```

# `HOME/.vagrant.d`

```{.include}
../report-output/HOME--vagrant-d.auto-generated.md
```

# `HOME/.vagrant.d/boxes`

```{.include}
../report-output/HOME--vagrant-d-boxes.auto-generated.md
```

# `HOME/ghq`

```{.include}
../report-output/HOME-ghq.auto-generated.md
```

# `HOME/ghq/github.com`

```{.include}
./report-output/HOME-ghq-github-com.auto-generated.md
```

# `HOME/ghq/github.com/huzhenghui`

```{.include}
./report-output/HOME-ghq-github-com-huzhenghui.auto-generated.md
```

# `HOME/ghq/github.com/huzhenghui/mask-awesome`

```{.include}
./report-output/HOME-ghq-github-com-huzhenghui-mask-awesome.auto-generated.md
```

# `HOME/Library`

```{.include}
../report-output/HOME-Library.auto-generated.md
```

# `HOME/Library/Containers`

```{.include}
../report-output/HOME-Library-Containers.auto-generated.md
```

# `HOME/OneDrive`

```{.include}
../report-output/HOME-OneDrive.auto-generated.md
```
