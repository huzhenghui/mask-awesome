# Tasks

## changelog

```bash
mdcat /usr/local/opt/pandoc-include-code/CHANGELOG.md
```

## readme

```bash
pandoc --filter pandoc-include-code --from=markdown  --to=gfm  --output=README.md maskfile.md
```

### changelog

```{.markdown include=/usr/local/opt/pandoc-include-code/CHANGELOG.md}

```
