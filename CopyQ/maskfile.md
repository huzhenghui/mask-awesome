# Tasks

## which-CopyQ

> /usr/local/bin/CopyQ

```bash
which CopyQ
```

## realpath-CopyQ

> /usr/local/Caskroom/copyq/3.13.0/copyq.wrapper.sh

```bash
which CopyQ | xargs realpath
```

## CopyQ-config

```bash
ls ~/.config/copyq
```

## CopyQ-help

```bash
CopyQ --help
```

### help

Usage: copyq \[COMMAND\]\
\
Starts server if no command is specified.\
  COMMANDs:\
    show \[NAME\]             Show main window and optionally open tab with given name.\
    hide                    Hide main window.\
    toggle                  Show or hide main window.\
    menu                    Open context menu.\
    exit                    Exit server.\
    disable, enable         Disable or enable clipboard content storing.\
\
    clipboard \[**MIME**\]        Print clipboard content.\
    paste\
      Paste clipboard to current window\
      (may not work with some applications).\
    copy\
      Copy clipboard from current window\
      (may not work with some applications).\
    copy TEXT               Set clipboard text.\
    copy **MIME** DATA \[**MIME** DATA\]...\
      Set clipboard content.\
\
    count                   Print amount of items in current tab.\
    select \[ROW=0\]          Copy item in the row to clipboard.\
    next                    Copy next item from current tab to clipboard.\
    previous                Copy previous item from current tab to clipboard.\
    add TEXT...             Add text into clipboard.\
    insert ROW TEXT         Insert text into given row.\
    remove \[ROWS=0...\]      Remove items in given rows.\
    edit \[ROW=-1...\]\
      Edit items or edit new one.\
      Value -1 is for current text in clipboard.\
\
    separator SEPARATOR     Set separator for items on output.\
    read \[**MIME**\|ROW\]...      Print raw data of clipboard or item in row.\
    write \[ROW=0\] **MIME** DATA \[**MIME** DATA\]...\
      Write raw data to given row.\
\
    action \[ROWS=0...\]      Show action dialog.\
    action \[ROWS=0...\] \[PROGRAM \[SEPARATOR=\\n\]\]\
      Run PROGRAM on item text in the rows.\
      Use %1 in PROGRAM to pass text as argument.\
    popup TITLE MESSAGE \[TIME=8000\]\
      Show tray popup message for TIME milliseconds.\
\
    tab                     List available tab names.\
    tab NAME \[COMMAND\]\
      Run command on tab with given name.\
      Tab is created if it doesn\'t exist.\
      Default is the first tab.\
    removetab NAME          Remove tab.\
    renametab NAME NEW_NAME\
      Rename tab.\
\
    exporttab FILE_NAME     Export items to file.\
    importtab FILE_NAME     Import items from file.\
\
    config                  List all options.\
    config OPTION           Get option value.\
    config OPTION VALUE     Set option value.\
\
    eval, -e \[SCRIPT\] \[ARGUMENTS\]...\
      Evaluate script.\
    session, -s, --session SESSION\
      Starts or connects to application instance with given session name.\
    help, -h, --help \[COMMAND\]...\
      Print help for COMMAND or all commands.\
    version, -v, --version\
      Print version of program and libraries.\
    tests, --tests          Run application tests (append --help argument for more info).\
\
NOTES:\
  - Use dash argument (-) to read data from standard input.\
  - Use double-dash argument (--) to read all following arguments without\
    expanding escape sequences (i.e. \\n, \\t and others).\
  - Use ? for **MIME** to print available **MIME** types (default is \"text/plain\").\
\
CopyQ Clipboard Manager v3.13.0\

## CopyQ-help-MIME-html-browser

```bash
CopyQ --help | ugrep --color=always --colors="cx=nHUwK;ms=nHUwK;mt=h+r+Y" --any-line "MIME" | ansifilter --html | browser
```

## CopyQ-help-MIME-html-copy

```bash
CopyQ --help | ugrep --color=always --colors="cx=nHUwK;ms=nHUwK;mt=h+r+Y" --any-line "MIME" | ansifilter --html | CopyQ copy text/html -
```

## CopyQ-help-MIME-rtf-html-browser

```bash
CopyQ --help | ugrep --color=always --colors="cx=nHUwK;ms=nHUwK;mt=h+r+Y" --any-line "MIME" | ansifilter --rtf | textutil -stdin -stdout -convert html | browser
```

## CopyQ-help-MIME-rtf-html-copy

```bash
CopyQ --help | ugrep --color=always --colors="cx=nHUwK;ms=nHUwK;mt=h+r+Y" --any-line "MIME" | ansifilter --rtf | textutil -stdin -stdout -convert html | CopyQ copy text/html -
```

## CopyQ-help-MIME-markdown

```bash
CopyQ --help | ugrep --color=always --colors="cx=nHUwK;ms=nHUwK;mt=h+r+Y" --any-line "MIME" | ansifilter --bbcode | inv --search-root="$(ghq list --full-path https://github.com/huzhenghui/pyinvoke-awesome)/bbcode" bbcode-parser-format | pandoc --from=html --to=markdown | mdcat
```

## CopyQ-help-MIME-markdown-copy

```bash
CopyQ --help | ugrep --color=always --colors="cx=nHUwK;ms=nHUwK;mt=h+r+Y" --any-line "MIME" | ansifilter --bbcode | inv --search-root="$(ghq list --full-path https://github.com/huzhenghui/pyinvoke-awesome)/bbcode" bbcode-parser-format | pandoc --from=html --to=markdown | CopyQ copy text/plain -
```
