# Tasks

## ansifilter-help

```bash
ansifilter --help
```

## ansifilter-line-numbers-html-browser

```bash
ansifilter --help | ack --passthru --color --color-match="blink italic underline bold red on_yellow" 'ANSI' | ansifilter --html --line-numbers | browser
```
