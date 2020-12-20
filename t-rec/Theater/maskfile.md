---

    pandocomatic_:
        pandoc:
            from: markdown
            to: markdown-fenced_code_attributes
            filter:
            - pandoc-include-code
            output: README.md

...

# iTerm2

# https://github.com/huzhenghui/mask-awesome

## prepare

> Step 1: Prepare. osascript "${THEATER}/prepare.applescript"

```bash
if [[ "${THEATER}" == "" ]]; then
    echo "Environment Variable THEATER is required" | lolcat
    $MASK help prepare
    exit 1
fi
THEATER="$(realpath ${THEATER})"
if [[ ! -d "${THEATER}" ]]; then
    echo "${THEATER} is not directory" | lolcat
    $MASK help prepare
    exit 2
fi
PREPARE="${THEATER}/prepare.applescript"
if [[ ! -f "${PREPARE}" ]]; then
    echo "${PREPARE} is not file" | lolcat
    $MASK help prepare
    read -n 1
    exit 3
fi
echo "prepare begin: ${PREPARE}" | lolcat
osascript "${PREPARE}"
echo "prepare done: ${PREPARE}" | lolcat
```

## get-windowname

> Step 2.1: Get WindowName from Environment Variable WINDOWNAME

```bash
echo "${WINDOWNAME}"
```

## get-windowid

> Step 2.2: Get WindowId By Environment Variable WINDOWNAME

```bash
if [[ "${WINDOWNAME}" == "" ]]; then
    echo "Can not find Environment Variable WINDOWNAME in $(pwd)" | lolcat >&2
    read -n 1
    exit 1
fi
t-rec --ls-win |
    gawk -v FS='|' 'BEGIN {windowname_regexp = "^\\s*" ENVIRON["WINDOWNAME"] "\\s*$"}{if($1 ~ windowname_regexp){gsub(/\s/, "", $2); print $2}}'
```

## wait-window

> Step 2: Wait until get WindowId success

```bash
if [[ "${THEATER}" == "" ]]; then
    echo "Environment Variable THEATER is required" | lolcat >&2
    $MASK help prepare
    exit 1
fi
THEATER="$(realpath ${THEATER})"
if [[ ! -d "${THEATER}" ]]; then
    echo "${THEATER} is not directory" | lolcat >&2
    $MASK help prepare
    exit 2
fi
direnv allow "${THEATER}"
WINDOWNAME="$(direnv exec ${THEATER} $MASK get-windowname)"
if [[ "${WINDOWNAME}" == "" ]]; then
    echo "Can not find Environment Variable WINDOWNAME in ${THEATER}" | lolcat >&2
    $MASK help prepare
    read -n 1
    exit 3
fi
echo "wait-window begin: ${WINDOWNAME}" | lolcat >&2
WINDOWID=""
while [[ "${WINDOWID}" == "" ]];
do
    WINDOWID=$"$(direnv exec ${THEATER} $MASK get-windowid)"
done
echo "wait-window done: ${WINDOWID}" | lolcat >&2
echo "${WINDOWID}"
```

## record-window

> Step 3: Record Window while osascript "${THEATER}/story.applescript"

```bash
PWD="$(pwd)"
if [[ "${WINDOWID}" == "" ]]; then
    echo "Environment Variable WINDOWID is required" | lolcat >&2
    $MASK help record-window
    exit 1
fi
STORY="${THEATER}/story.applescript"
if [[ ! -f "${STORY}" ]]; then
    echo "${STORY} is not file" | lolcat >&2
    $MASK help record-window
    read -n 1
    exit 2
fi
RECORDER="${MASKFILE_DIR}/recorder"
if [[ ! -f "${RECORDER}/justfile" ]]; then
    echo "Can not find justfile in ${RECORDER}" | lolcat >&2
    $MASK help record-window
    read -n 1
    exit 3
fi
echo "record-window prepare: WINDOWID=${WINDOWID}" | lolcat >&2
echo "record-window prepare: STORY=${STORY}" | lolcat >&2
tempfifo="$(mktemp).pipe"
echo "record-window tempfifo: ${tempfifo}" | lolcat >&2
mkfifo "${tempfifo}"
cd "${RECORDER}"
WINDOWID="${WINDOWID}" TEMPFIFO="${tempfifo}" t-rec just &
T_REC_PID="$!"
cd "${PWD}"
echo "record-window: T_REC_PID=${T_REC_PID}" | lolcat >&2
echo "record-window before story: STORY=${STORY}" | lolcat >&2
osascript "${STORY}"
echo "record-window after story: STORY=${STORY}" | lolcat >&2
cat "${tempfifo}" | lolcat >&2
echo "record-window before wait t-rec: T_REC_PID=${T_REC_PID}" | lolcat >&2
wait "${T_REC_PID}"
echo "record-window after wait t-rec: T_REC_PID=${T_REC_PID}" | lolcat >&2
echo "record-window done: ${WINDOWID}" | lolcat >&2
```

### record-window-justfile

```{.justfile include=./recorder/justfile}

```

## finale

> Step 4: Finale. osascript "${THEATER}/finale.applescript"

```bash
if [[ "${THEATER}" == "" ]]; then
    echo "Environment Variable THEATER is required" | lolcat
    $MASK help finale
    exit 1
fi
THEATER="$(realpath ${THEATER})"
if [[ ! -d "${THEATER}" ]]; then
    echo "${THEATER} is not directory" | lolcat
    $MASK help finale
    exit 2
fi
FINALE="${THEATER}/finale.applescript"
if [[ ! -f "${FINALE}" ]]; then
    echo "${FINALE} is not file" | lolcat
    $MASK help finale
    read -n 1
    exit 3
fi
echo "finale begin: ${FINALE}" | lolcat
osascript "${FINALE}"
echo "finale done: ${FINALE}" | lolcat
```

## record

> Step 1~2~3~4. Accouding to Environment Variable THEATER

```bash
if [[ "${THEATER}" == "" ]]; then
    echo "Environment Variable THEATER is required" | lolcat
    $MASK help record
    read -n 1
    exit 1
fi
THEATER="$(realpath ${THEATER})"
if [[ ! -d "${THEATER}" ]]; then
    echo "${THEATER} is not directory" | lolcat
    $MASK help record
    read -n 1
    exit 2
fi
echo "record begin: ${THEATER}" | lolcat
$MASK prepare
WINDOWID="$($MASK wait-window)"
echo "record windowid: ${WINDOWID}" | lolcat
export WINDOWID="${WINDOWID}"
$MASK record-window
$MASK finale
echo "record end: ${THEATER}" | lolcat
$MASK iTerm2-quit
exit
```

## iTerm2

> Launch iTerm2 to record. Accouding to Environment Variable THEATER

```bash
if [[ "${THEATER}" == "" ]]; then
    echo "Environment Variable THEATER is required" | lolcat
    $MASK help iTerm2
    exit 1
fi
THEATER="$(realpath ${THEATER})"
if [[ ! -d "${THEATER}" ]]; then
    echo "${THEATER} is not directory" | lolcat
    $MASK help iTerm2
    exit 2
fi
echo "iTerm2: ${THEATER}" | lolcat
export THEATER="${THEATER}"
osascript -sh ./iTerm2.applescript
```

### iTerm2-iTerm2.applescript

```{.applescript include=./iTerm2.applescript}

```

## iTerm2-quit

> Exit iTerm2

```bash
osascript -e 'tell application "iTerm" to quit'
```

## run

> Run. Accounding to option --theater

**OPTIONS**

- theater
  - flags: -t --theater
  - type: string
  - desc: Theater Directory

```bash
if [[ "${theater}" == "" ]]; then
    echo "OPTIONS: --theater is required" | lolcat
    $MASK help run
    exit 1
fi
THEATER="$(realpath ${theater})"
if [[ ! -d "${THEATER}" ]]; then
    echo "${THEATER} is not directory" | lolcat
    $MASK help run
    exit 2
fi
echo "run: ${THEATER}" | lolcat
export THEATER="${THEATER}"
$MASK iTerm2
```

## run-Calculator

> run --theater "$(realpath $MASKFILE_DIR/Calculator)"

```bash
CALCULATOR_THEATER="$(realpath $MASKFILE_DIR/Calculator)"
echo "run-Calculator: ${CALCULATOR_THEATER}" | lolcat
$MASK run --theater "${CALCULATOR_THEATER}"
```

### run-Calculator-env

```{.bash include=./Calculator/.env}

```

### run-Calculator-envrc

```{.bash include=./Calculator/.envrc}

```

### run-Calculator-prepare.applescript

```{.applescript include=./Calculator/prepare.applescript}

```

### run-Calculator-story.applescript

```{.applescript include=./Calculator/story.applescript}

```

### run-Calculator-finale.applescript

```{.applescript include=./Calculator/finale.applescript}

```

### run-Calculator-Screencast

![Calculator Screencast](./build/run-Calculator-Screencast.gif)

## run-Music

> run --theater "$(realpath $MASKFILE_DIR/Music)"

```bash
MUSIC_THEATER="$(realpath $MASKFILE_DIR/Music)"
echo "run-Music: ${MUSIC_THEATER}" | lolcat
$MASK run --theater "${MUSIC_THEATER}"
```

### run-Music-env

```{.bash include=./Music/.env}

```

### run-Music-envrc

```{.bash include=./Music/.envrc}

```

### run-Music-prepare.applescript

```{.applescript include=./Music/prepare.applescript}

```

### run-Music-story.applescript

```{.applescript include=./Music/story.applescript}

```

### run-Music-finale.applescript

```{.applescript include=./Music/finale.applescript}

```

### run-Music-Screencast

![Music Screencast](./build/run-Music-Screencast.gif)

## trash-gif

> Trash GIF files in ./recorder/\*.gif

```bash
trash --force ./recorder/*.gif
```

## begin: mask task in template

## readme

```bash
ninja --verbose -j 1 README.md
```

### build.ninja

```{.ninja include=./build.ninja}

```

## readme-graph-dot

```bash
ninja -t graph README.md
```

### readme-graph-dot-output

```{.dot include=./build/ninja.README.md.dot}

```

## readme-graph-dot-xdot

```bash
detach -- xdot "${MASKFILE_DIR}/build/ninja.README.md.dot"
```

## readme-graph-png

```bash
dot -Tpng -o./build/ninja.README.md.png ./build/ninja.README.md.dot
```

![README.md](./build/ninja.README.md.png)

## end: mask task in template
