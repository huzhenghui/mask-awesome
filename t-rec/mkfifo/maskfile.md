# Taaks

## prepare

```bash
osascript ./prepare.applescript
```

## get-windowname

```bash
echo "${WINDOWNAME}"
```

## get-windowid

```bash
t-rec --ls-win |
    gawk -v FS='|' 'BEGIN {windowname_regexp = "^\\s*" ENVIRON["WINDOWNAME"] "\\s*$"}{if($1 ~ windowname_regexp){gsub(/\s/, "", $2); print $2}}'
```

## wait-windowid

```bash
windowid=""
while [ "-${windowid}-" == "--" ]
do
    windowid="$(cd ${MASKFILE_DIR}; direnv exec ${MASKFILE_DIR} mask get-windowid)"
done
echo "${windowid}"
```

## ready

```bash
mask prepare
mask wait-windowid
```

## record

```bash
windowid="$(cd $MASKFILE_DIR; direnv exec ${MASKFILE_DIR}  mask ready)"
echo WINDOWID="${windowid}"
tempfifo="$(mktemp).pipe"
echo tempfifo="${tempfifo}"
mkfifo "${tempfifo}"
WINDOWID="${windowid}" TEMPFIFO="${tempfifo}" t-rec just &
osascript ./story.applescript
cat "${tempfifo}"
```

## iTerm2

```bash
osascript ./iTerm2.applescript
```

## trash-gif

```bash
trash ./*.gif
```
