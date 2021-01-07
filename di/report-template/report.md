---
pandocomatic_:
    pandoc:
        from: markdown-smart
        to: gfm
        filter:
        - pandoc-include-code
        lua-filter:
        - ./../build/pandoc-lua-filters/include-files/include-files.lua
        output: report.md
...

# di-format-output

```{.plain include=../report-output/di-format-output.txt}
```

# di-tsv-output

```{.include}
../report-output/di-tsv-output.md
```

# mi-format-output

```{.plain include=../report-output/mi-format-output.txt}
```

# mi-tsv-output

```{.include}
../report-output/mi-tsv-output.md
```
