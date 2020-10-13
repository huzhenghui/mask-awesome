# Tasks

## install

```bash
brew install mypy
```

## greeting

```python
def greeting(name):
    return 'Hello ' + name

print(greeting('world'))
```

## mypy-greeting

```zsh
tempfile="$(mktemp)"
echo "${tempfile}"
source "${ZSH}/custom/plugins/huzhenghui-mask/huzhenghui-mask.plugin.zsh"
mask-raw greeting > "${tempfile}"
cat "${tempfile}"
mypy "${tempfile}"
```

## greeting-hints

```python
def greeting(name: str) -> str:
    return 'Hello ' + name

print(greeting('world'))
```

## mypy-greeting-hints

```zsh
tempfile="$(mktemp)"
echo "${tempfile}"
source "${ZSH}/custom/plugins/huzhenghui-mask/huzhenghui-mask.plugin.zsh"
mask-raw greeting-hints > "${tempfile}"
cat "${tempfile}"
mypy "${tempfile}"
```

## greeting-error

```python
def greeting(name: str) -> str:
    return 'Hello ' + name

print(greeting('world'))
print(greeting(3))
print(greeting(b'world'))
```

## mypy-greeting-error

```zsh
tempfile="$(mktemp)"
echo "${tempfile}"
source "${ZSH}/custom/plugins/huzhenghui-mask/huzhenghui-mask.plugin.zsh"
mask-raw greeting-error > "${tempfile}"
cat "${tempfile}"
mypy "${tempfile}"
```

