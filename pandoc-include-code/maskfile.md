# Tasks

## changelog

```bash
mdcat /usr/local/opt/pandoc-include-code/CHANGELOG.md
```

## include-code

```bash
pandoc --filter pandoc-include-code --from=markdown  --to=gfm  --output=output.md maskfile.md
```

### changelog

```{.markdown include=/usr/local/opt/pandoc-include-code/CHANGELOG.md}

```
