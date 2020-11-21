# Tasks

## whistle-help

> Display help information

```bash
/usr/local/opt/whistle/bin/whistle help
```

## whistle-start

> Start a background service

```bash
/usr/local/opt/whistle/bin/whistle start
```

## whistle-status

> Show the running status

```bash
/usr/local/opt/whistle/bin/whistle status
```

## whistle-stop

> Stop current background service

```bash
/usr/local/opt/whistle/bin/whistle stop
```

## WhistleAppData

```bash
open -R ~/.WhistleAppData/
```

## whistle-start-base

```bash
BASEDIR=$(/usr/bin/dirname $(/usr/local/bin/realpath $0))
echo "${BASEDIR}"
/usr/local/opt/whistle/bin/whistle --baseDir "${BASEDIR}" --storage "${BASEDIR}" start
```

## whistle-stop-base

```bash
BASEDIR=$(/usr/bin/dirname $(/usr/local/bin/realpath $0))
echo "${BASEDIR}"
/usr/local/opt/whistle/bin/whistle --baseDir "${BASEDIR}" --storage "${BASEDIR}" stop
```

## whistle-start-port

**OPTIONS**

- port
  - flags: --port
  - type: string
  - desc: set the proxy port (8899 by default)

```bash
PORT=${port:-8899}
BASEDIR=$(/usr/bin/dirname $(/usr/local/bin/realpath $0))
echo "${BASEDIR}"
/usr/local/opt/whistle/bin/whistle --baseDir "${BASEDIR}" --storage "${BASEDIR}" --port "${PORT}" --uiport "${PORT}" start
```
