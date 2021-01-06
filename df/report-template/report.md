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

# df-H-output

```{.plain include=../report-output/df-H-output.txt}
```

# df-H-screenshot

![df -H -a](../report-output/df-H-screenshot.png)
