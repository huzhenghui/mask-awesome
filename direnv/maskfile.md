# Tasks

## direnv-help

```bash
direnv --help
```

## test

```bash
echo ${FOO-nope}
```

## pwd

```bash
DIRPATH=$(pwd)
echo "${DIRPATH}"
```

## direnv-allow

```bash
DIRPATH=$(pwd)
echo "${DIRPATH}"
direnv allow "${DIRPATH}"
```

## direnv-deny

```bash
DIRPATH=$(pwd)
echo "${DIRPATH}"
direnv deny "${DIRPATH}"
```
