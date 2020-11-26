# Home

https://www.nushell.sh/

# Tasks

## nu

```bash
nu
```

## nu-help

```nu
help
```

## nu-help-commands

```nu
help commands
```

## nu-help-help

```nu
help help
```

## nu-ls

```nu
ghq list --full-path https://github.com/huzhenghui/mask-awesome | str trim | each {ls $it}
```

## git-log

```nu
ghq list --full-path https://github.com/huzhenghui/mask-awesome | str trim | each {
    cd $it
    git log --pretty=%h»¦«%aN»¦«%s»¦«%aD | lines | split column "»¦«" sha1 committer desc merged_at
}
```
