# Tasks

## ugrep-help

```bash
ugrep --help
```

## ugrep-color

```bash
ugrep --help | ugrep --context=2 --ignore-case --color=always --colors="mt=hu+r+Y" color
```

## ugrep-color-html-copy

> 粘贴到 OneNote 的表格中导致表格过宽

```bash
mask ugrep-color | ansifilter --html | copyq copy text/html -
```

## ugrep-color-rtf-html-copy

> 粘贴到 OneNote 的表格不影响表格宽度

```bash
mask ugrep-color | ansifilter --rtf | textutil -stdin -stdout -convert html | copyq copy text/html -
```
