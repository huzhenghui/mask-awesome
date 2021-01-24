# agedu

<!-- markdownlint-disable MD007 MD030 -->

-   [agedu](#agedu)
-   [Mask SubCommands](#mask-subcommands)
    -   [agedu-version](#agedu-version)
        -   [agedu-version-output](#agedu-version-output)
    -   [snakemake](#snakemake)
        -   [Snakefile](#snakefile)
    -   [web](#web)
    -   [agedu-help](#agedu-help)
        -   [agedu-help-output](#agedu-help-output)
    -   [scan-home](#scan-home)
    -   [scan-root](#scan-root)
    -   [remove-root](#remove-root)
    -   [dump-root](#dump-root)
    -   [html-root](#html-root)
    -   [report](#report)
    -   [text-root](#text-root)
    -   [text-root-Applications](#text-root-applications)
    -   [text-root-Users](#text-root-users)
    -   [text-HOME](#text-home)
    -   [text-HOME–local](#text-home--local)
    -   [text-HOME–local-share](#text-home--local-share)
    -   [text-HOME–local-share-Trash](#text-home--local-share-trash)
    -   [text-HOME–local-share-Trash-files](#text-home--local-share-trash-files)
    -   [text-HOME–vagrant-d](#text-home--vagrant-d)
    -   [text-HOME–vagrant-d-boxes](#text-home--vagrant-d-boxes)
    -   [text-HOME-ghq](#text-home-ghq)
    -   [text-HOME-ghq-github-com](#text-home-ghq-github-com)
    -   [text-HOME-ghq-github-com-huzhenghui](#text-home-ghq-github-com-huzhenghui)
    -   [text-HOME-ghq-github-com-huzhenghui-mask-awesome](#text-home-ghq-github-com-huzhenghui-mask-awesome)
    -   [text-HOME-Library](#text-home-library)
    -   [text-HOME-Library-Containers](#text-home-library-containers)
    -   [text-HOME-OneDrive](#text-home-onedrive)
    -   [man-agedu](#man-agedu)
        -   [man-agedu-output](#man-agedu-output)
    -   [begin: mask task in template : build
        content](#begin-mask-task-in-template--build-content)
    -   [ninja-rules](#ninja-rules)
        -   [ninja custom-rule](#ninja-custom-rule)
        -   [ninja-rules-output](#ninja-rules-output)
    -   [ninja-targets](#ninja-targets)
        -   [ninja build-all](#ninja-build-all)
        -   [ninja custom-build](#ninja-custom-build)
        -   [ninja report-build](#ninja-report-build)
        -   [ninja-targets-output](#ninja-targets-output)
    -   [readme-md](#readme-md)
        -   [ninja readme-build](#ninja-readme-build)
    -   [end: mask task in template : build
        content](#end-mask-task-in-template--build-content)
    -   [begin: mask task in template : ninja
        command](#begin-mask-task-in-template--ninja-command)
    -   [ninja-browse](#ninja-browse)
    -   [ninja-graph-png](#ninja-graph-png)
    -   [ninja-graph-dot-xdot](#ninja-graph-dot-xdot)
    -   [ninja-graph-dot](#ninja-graph-dot)
        -   [ninja-graph-dot-output](#ninja-graph-dot-output)
    -   [ninja-all](#ninja-all)
        -   [build.ninja](#buildninja)
    -   [end: mask task in template : ninja
        command](#end-mask-task-in-template--ninja-command)

<!-- markdownlint-enable MD007 MD030 -->

# Mask SubCommands

[Mask Awesome](https://github.com/huzhenghui/mask-awesome)

## agedu-version

``` bash
agedu --version
```

### agedu-version-output

``` plain
agedu, revision 20200705.2a7d4a2
```

## snakemake

``` bash
snakemake --cores all
```

### Snakefile

``` Snakefile
input_pattern = 'report-output/dump/{storage_name}.ageduscan.dump.dat'
output_pattern = 'report-output/index/{storage_name}.ageduscan.index.dat'
STORAGES, = glob_wildcards(input_pattern, followlinks=False)

rule all:
    input:
        expand(output_pattern, storage_name=STORAGES)

rule stat:
    input: input_pattern
    output: output_pattern
    shell:
        'cat {input} | agedu --load --file {output}'
```

## web

``` bash
cd ./report-output/index/
file="$(
    find . -type f | \
        /usr/local/opt/choose-gui/bin/choose
)"
agedu --file "${file}" --files --web --auth none
```

## agedu-help

``` bash
agedu --help
```

### agedu-help-output

<!-- markdownlint-disable MD013 -->

``` plain
  usage: agedu [options] action [action...]
actions: -s, --scan directory    scan and index a directory
         -w, --web               serve HTML reports from a temporary web server
         -t, --text subdir       print a plain text report on a subdirectory
         -R, --remove            remove the index file
         -D, --dump              dump the index file on stdout
         -L, --load              load and index a dump file
         --presort               prepare a dump file for sorting
         --postsort              unprepare a dump file after sorting
         -S, --scan-dump directory scan only, generating a dump
         -H, --html subdir       print an HTML report on a subdirectory
         --cgi                   do the right thing when run from a CGI script
options: -f, --file filename     [most modes] specify index file
         --cross-fs              [--scan] cross filesystem boundaries
         --no-cross-fs           [--scan] stick to one filesystem
         --prune wildcard        [--scan] prune files matching pattern
         --prune-path wildcard   [--scan] prune pathnames matching pattern
         --exclude wildcard      [--scan] exclude files matching pattern
         --exclude-path wildcard [--scan] exclude pathnames matching pattern
         --include wildcard      [--scan] include files matching pattern
         --include-path wildcard [--scan] include pathnames matching pattern
         --progress              [--scan] report progress on stderr
         --no-progress           [--scan] do not report progress
         --tty-progress          [--scan] report progress if stderr is a tty
         --dir-atime             [--scan,--load] keep real atimes on directories
         --no-dir-atime          [--scan,--load] fake atimes on directories
         --launch shell-cmd      [--web] pass the base URL to the given command
         --no-eof                [--web] do not close web server on EOF
         --mtime                 [--scan] use mtime instead of atime
         --logicalsize           [--logicalsize] use logical instead of physical file size
         --files                 [--web,--html,--text] list individual files
         -r, --age-range age[-age] [--web,--html] set limits of colour coding
         -o, --output filename   [--html] specify output file or directory name
         --numeric               [--html] name output files numerically
         --address addr[:port]   [--web] specify HTTP server address
         --auth type             [--web] specify HTTP authentication method
         --auth-file filename    [--web] read HTTP Basic user/pass from file
         --auth-fd fd            [--web] read HTTP Basic user/pass from fd
         --title title           [--web,--html] title prefix for web pages
         -d, --depth levels      [--text,--html] recurse to this many levels
         -a, --age age           [--text] include only files older than this
   also: -h, --help              display this help text
         -V, --version           report version number
         --licence               display (MIT) licence text
```

<!-- markdownlint-enable MD013 -->

## scan-home

``` bash
sudo agedu --progress --file ./report-output/agedu-home.dat --scan "$(cd ~; pwd)"
```

## scan-root

``` bash
sudo agedu --progress --file ./report-output/agedu-root.dat \
    --prune-path '/System/Volumes/Data' --scan /
sudo chown "${USER}" ./report-output/agedu-root.dat
```

## remove-root

``` bash
agedu --file ./report-output/agedu-root.dat --remove
```

## dump-root

``` bash
agedu --file ./report-output/agedu-root.dat --dump | $PAGER
```

## html-root

``` bash
agedu --file ./report-output/agedu-root.dat --files --html '/' | browser
```

## report

``` bash
ninja --verbose ./report-output/report.md
```

## text-root

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text '/'
```

## text-root-Applications

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text '/Applications'
```

## text-root-Users

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text '/Users'
```

## text-HOME

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}"
```

## text-HOME--local

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/.local"
```

## text-HOME--local-share

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/.local/share"
```

## text-HOME--local-share-Trash

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/.local/share/Trash"
```

## text-HOME--local-share-Trash-files

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/.local/share/Trash/files"
```

## text-HOME--vagrant-d

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/.vagrant.d"
```

## text-HOME--vagrant-d-boxes

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/.vagrant.d/boxes"
```

## text-HOME-ghq

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/ghq"
```

## text-HOME-ghq-github-com

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/ghq/github.com"
```

## text-HOME-ghq-github-com-huzhenghui

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/ghq/github.com/huzhenghui"
```

## text-HOME-ghq-github-com-huzhenghui-mask-awesome

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/ghq/github.com/huzhenghui/mask-awesome"
```

## text-HOME-Library

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/Library"
```

## text-HOME-Library-Containers

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/Library/Containers"
```

## text-HOME-OneDrive

``` bash
agedu --file ./report-output/agedu-root.dat --files --depth 1 --text "${HOME}/OneDrive"
```

## man-agedu

``` bash
man agedu
```

### man-agedu-output

<!-- markdownlint-disable MD012 MD013 -->
<!-- vale Spell.Spell = NO -->

agedu(1)                         Simon Tatham                         agedu(1)  
  
  
  
**NAME**  
       **agedu**  -  correlate disk usage with last-access times to identify large  
       and disused data  
  
**SYNOPSIS**  
       **agedu** \[ *options* \] *action* \[*action*…\]  
  
**DESCRIPTION**  
       **agedu** scans a directory tree and produces reports about how  much  disk  
       space  is  used  in  each directory and subdirectory, and also how that  
       usage of disk space corresponds to files with last-access times a  long  
       time ago.  
  
       In  other words, **agedu** is a tool you might use to help you free up disk  
       space. It lets you see which directories are taking up the most  space,  
       as  **du** does; but unlike **du**, it also distinguishes between large collec-  
       tions of data which are still in use  and  ones  which  have  not  been  
       accessed  in months or years - for instance, large archives downloaded,  
       unpacked, used once, and never cleaned up.  Where  **du**  helps  you  find  
       what's  using your disk space, **agedu** helps you find what's *wasting* your  
       disk space.  
  
       **agedu** has several operating modes. In one mode, it scans your disk  and  
       builds  an  index  file  containing a data structure which allows it to  
       efficiently retrieve any information  it  might  need.  Typically,  you  
       would  use it in this mode first, and then run it in one of a number of  
       \`query' modes to display a report of the disk space usage of a particu-  
       lar  directory and its subdirectories. Those reports can be produced as  
       plain text (much like **du**) or as HTML. **agedu** can even run as a miniature  
       web  server, presenting each directory's HTML report with hyperlinks to  
       let you navigate around the file system to similar  reports  for  other  
       directories.  
  
       So  you would typically start using **agedu** by telling it to do a scan of  
       a directory tree and build an index. This is done with a  command  such  
       as  
  
       $ **agedu** **-s** **/home/fred**  
  
       which  will  build  a  large data file called **agedu.dat** in your current  
       directory. (If that current directory is *inside* **/home/fred**, don't worry  
       - **agedu** is smart enough to discount its own index file.)  
  
       Having  built  the  index,  you  would now query it for reports of disk  
       space usage. If you have a graphical  web  browser,  the  simplest  and  
       nicest way to query the index is by running **agedu** in web server mode:  
  
       $ **agedu** **-w**  
  
       which  will  print  (among other messages) a URL on its standard output  
       along the lines of  
  
       URL: {{ bbcode-link-0 }}  
  
       (That URL will always begin with  \`**127.**',  meaning  that  it's  in  the  
       **localhost** address space. So only processes running on the same computer  
       can even try to connect to that web server, and also  there  is  access  
       control  to  prevent  other  users  from seeing it - see below for more  
       detail.)  
  
       Now paste that URL into your web browser,  and  you  will  be  shown  a  
       graphical  representation of the disk usage in **/home/fred** and its imme-  
       diate subdirectories, with varying colours used to show the  difference  
       between  disused  and recently-accessed data. Click on any subdirectory  
       to descend into it and see a report for  its  subdirectories  in  turn;  
       click  on  parts  of  the  pathname at the top of any page to return to  
       higher-level directories. When you've finished browsing, you  can  just  
       press  Ctrl-D  to  send an end-of-file indication to **agedu**, and it will  
       shut down.  
  
       After that, you probably want to delete the data file **agedu.dat**,  since  
       it's  pretty large. In fact, the command **agedu** **-R** will do this for you;  
       and you can chain **agedu** commands on the  same  command  line,  so  that  
       instead of the above you could have done  
  
       $ **agedu** **-s** **/home/fred** **-w** **-R**  
  
       for a single self-contained run of **agedu** which builds its index, serves  
       web pages from it, and cleans it up when finished.  
  
       In some situations, you might want to scan the directory  structure  of  
       one  computer, but run **agedu**'s user interface on another. In that case,  
       you can do your scan using the **agedu** **-S** option in place  of  **agedu**  **-s**,  
       which  will  make  **agedu**  not bother building an index file but instead  
       just write out its scan results in plain text on standard output;  then  
       you  can funnel that output to the other machine using SSH (or whatever  
       other technique you prefer), and there, run **agedu** **-L**  to  load  in  the  
       textual dump and turn it into an index file. For example, you might run  
       a command like this (plus any **ssh** options you need) on the machine  you  
       want to scan:  
  
       $ **agedu** **-S** **/home/fred** **\|** **ssh** **indexing-machine** **agedu** **-L**  
  
       or, equivalently, run something like this on the other machine:  
  
       $ **ssh** **machine-to-scan** **agedu** **-S** **/home/fred** **\|** **agedu** **-L**  
  
       Either  way,  the **agedu** **-L** command will create an **agedu.dat** index file,  
       which you can then use with **agedu** **-w** just as above.  
  
       (Another way to do this might be to build the index file on  the  first  
       machine as normal, and then just copy it to the other machine once it's  
       complete. However, for efficiency, the index file is formatted  differ-  
       ently  depending on the CPU architecture that **agedu** is compiled for. So  
       if that doesn't match between the two machines  -  e.g.  if  one  is  a  
       32-bit  machine  and  one  64-bit - then **agedu.dat** files written on one  
       machine will not work on the other. The technique described above using  
       **-S** and **-L** should work between any two machines.)  
  
       If  you  don't  have  a  graphical  web  browser, you can do text-based  
       queries  instead  of  using  **agedu**'s  web  interface.  Having   scanned  
       **/home/fred** in any of the ways suggested above, you might run  
  
       $ **agedu** **-t** **/home/fred**  
  
       which  again  gives  a  summary of the disk usage in **/home/fred** and its  
       immediate subdirectories; but this time **agedu** will print it on standard  
       output, in much the same format as **du**. If you then want to find out how  
       much *old* data is there, you can add the **-a** option to  show  only  files  
       last  accessed  a certain length of time ago. For example, to show only  
       files which haven't been looked at in six months or more:  
  
       $ **agedu** **-t** **/home/fred** **-a** **6m**  
  
       That's the essence of what **agedu** does. It has other modes of  operation  
       for  more  complex  situations,  and  the  usual  array of configurable  
       options. The following sections contain a complete  reference  for  all  
       its functionality.  
  
**OPERATING** **MODES**  
       This  section describes the operating modes supported by **agedu**. Each of  
       these is in the form of a command-line option, sometimes with an  argu-  
       ment.  Multiple  operating-mode options may appear on the command line,  
       in which case **agedu**  will  perform  the  specified  actions  one  after  
       another. For instance, as shown in the previous section, you might want  
       to perform a disk scan and  immediately  launch  a  web  server  giving  
       reports from that scan.  
  
       **-s** *directory* or **–scan** *directory*  
              In this mode, **agedu** scans the file system starting at the speci-  
              fied directory, and indexes the results of the scan into a large  
              data file which other operating modes can query.  
  
              By  default,  the  scan  is  restricted  to a single file system  
              (since the expected use of **agedu** is that you would probably  use  
              it  because  a  particular  disk  partition  was  running low on  
              space). You can remove that  restriction  using  the  **–cross-fs**  
              option;  other  configuration  options  allow  you to include or  
              exclude files or entire subdirectories from the  scan.  See  the  
              next section for full details of the configurable options.  
  
              The  index file is created with restrictive permissions, in case  
              the file system you are scanning contains confidential  informa-  
              tion in its structure.  
  
              Index  files  are  dependent  on  the characteristics of the CPU  
              architecture you created them on. You should not  expect  to  be  
              able  to  move an index file between different types of computer  
              and have it continue to  work.  If  you  need  to  transfer  the  
              results  of a disk scan to a different kind of computer, see the  
              **-D** and **-L** options below.  
  
       **-w** or **–web**  
              In this mode, **agedu** expects to find an index file already  writ-  
              ten.  It allocates a network port, and starts up a web server on  
              that port which serves reports generated from the index file. By  
              default it invents its own URL and prints it out.  
  
              The web server runs until **agedu** receives an end-of-file event on  
              its standard input. (The expected usage is that you run it  from  
              the command line, immediately browse web pages until you're sat-  
              isfied, and then press Ctrl-D.) To disable  the  EOF  behaviour,  
              use the **–no-eof** option.  
  
              In  case  the  index  file contains any confidential information  
              about your file system, the web server  protects  the  pages  it  
              serves  from  access  by  other  people.  On Linux, this is done  
              transparently by means of using **/proc/net/tcp** to check the owner  
              of  each  incoming connection; failing that, the web server will  
              require a password to view the reports, and **agedu** will print the  
              password it invented on standard output along with the URL.  
  
              Configurable  options  for  this  mode  let you specify your own  
              address and port number to listen on, and also specify your  own  
              choice  of  authentication method (including turning authentica-  
              tion off completely) and a username and password of your choice.  
  
       **-t** *directory* or **–text** *directory*  
              In  this mode, **agedu** generates a textual report on standard out-  
              put, listing the disk usage in the specified directory  and  all  
              its  subdirectories down to a given depth. By default that depth  
              is 1, so that you see a report for *directory* itself and  all  of  
              its  immediate  subdirectories.  You  can  configure a different  
              depth (or no depth limit) using **-d**, described in the  next  sec-  
              tion.  
  
              Used  on  its  own, **-t** merely lists the *total* disk usage in each  
              subdirectory; **agedu**'s additional ability to  distinguish  unused  
              from  recently-used  data  is not activated. To activate it, use  
              the **-a** option to specify a minimum age.  
  
              The directory structure stored in **agedu**'s index file is  treated  
              as a set of literal strings. This means that you cannot refer to  
              directories by synonyms. So if you ran **agedu** **-s** **.**, then all  the  
              path names you later pass to the **-t** option must be either \`**.**' or  
              begin with \`**./**'. Similarly, symbolic links within the  directory  
              you  scanned will not be followed; you must refer to each direc-  
              tory by its canonical, symlink-free pathname.  
  
       **-R** or **–remove**  
              In this mode, **agedu** deletes its index file. Running  just  **agedu**  
              **-R**  on  its  own is therefore equivalent to typing **rm** **agedu.dat**.  
              However, you can also put **-R** on the end of  a  command  line  to  
              indicate  that  **agedu** should delete its index file after it fin-  
              ishes performing other operations.  
  
       **-S** *directory* or **–scan-dump** *directory*  
              In this mode, **agedu** will scan a directory tree and  convert  the  
              results straight into a textual dump on standard output, without  
              generating an index file at all. The dump data is  intended  for  
              **agedu** **-L** to read.  
  
       **-L** or **–load**  
              In  this  mode,  **agedu** expects to read a dump produced by the **-S**  
              option from its standard input. It constructs an index file from  
              that dump, exactly as it would have if it had read the same data  
              from a disk scan in **-s** mode.  
  
       **-D** or **–dump**  
              In this mode, **agedu** reads an existing index file and produces  a  
              dump of its contents on standard output, in the same format used  
              by **-S** and **-L**. This option could be used to convert  an  existing  
              index  file into a format acceptable to a different kind of com-  
              puter, by dumping it using **-D** and then loading the dump back  in  
              on the other machine using **-L**.  
  
              (The  output  of  **agedu** **-D** on an existing index file will not be  
              exactly *identical* to what **agedu** **-S** would  have  originally  pro-  
              duced,  due to a difference in treatment of last-access times on  
              directories. However, it should be  effectively  equivalent  for  
              most  purposes.  See the documentation of the **–dir-atime** option  
              in the next section for further detail.)  
  
       **-H** *directory* or **–html** *directory*  
              In this mode, **agedu** will generate an HTML  report  of  the  disk  
              usage  in  the specified directory and its immediate subdirecto-  
              ries, in the same form that it serves from its web server in  **-w**  
              mode.  
  
              By  default,  a  single HTML report will be generated and simply  
              written to standard output, with no hyperlinks pointing to other  
              similar  pages.  If  you also specify the **-d** option (see below),  
              **agedu** will instead write out a collection  of  HTML  files  with  
              hyperlinks between them, and call the top-level file **index.html**.  
  
       **–cgi**  In this mode, **agedu** will run as the bulk of a CGI  script  which  
              provides  the  same  set of web pages as the built-in web server  
              would. It will read the usual  CGI  environment  variables,  and  
              write CGI-style data to its standard output.  
  
              The  actual  CGI  program itself should be a tiny wrapper around  
              **agedu** which passes it the **–cgi** option, and also  (probably)  **-f**  
              to  locate  the  index  file. **agedu** will do everything else. For  
              example, your script might read  
  
              \#!/bin/sh  
              */some/path/to/*agedu –cgi -f */some/other/path/to/*agedu.dat  
  
              (Note that **agedu** will produce the *entire* CGI  output,  including  
              status code, HTTP headers and the full HTML document. If you try  
              to surround the call to **agedu** **–cgi** with code that adds your own  
              HTML  header and footer, you won't get the results you want, and  
              **agedu**'s HTTP-level features such as auto-redirecting to  canoni-  
              cal versions of URIs will stop working.)  
  
              No  access control is performed in this mode: restricting access  
              to CGI scripts is assumed to be the job of the web server.  
  
       **–presort** and **–postsort**  
              In these two modes, **agedu** will expect to  read  a  textual  data  
              dump  from  its  standard  input of the form produced by **-S** (and  
              **-D**). It will transform the data into a different version of  its  
              text  dump format, and write the transformed version on standard  
              output.  
  
              The ordinary dump file format is reasonably readable, but  load-  
              ing  it  into  an  index  file  using **agedu** **-L** requires it to be  
              sorted in a specific order, which is complicated to describe and  
              difficult  to implement using ordinary Unix sorting tools. So if  
              you want to construct your own data dump from a source  of  your  
              own that **agedu** itself doesn't know how to scan, you will need to  
              make sure it's sorted in the right order.  
  
              To help with this, **agedu** provides a secondary dump format  which  
              is  \`sortable', in the sense that ordinary **sort**(*1*) without argu-  
              ments will  arrange  it  into  the  right  order.  However,  the  
              sortable format is much more unreadable and also twice the size,  
              so you wouldn't want to write it directly!  
  
              So the recommended procedure is to generate  dump  data  in  the  
              ordinary format; then pipe it through **agedu** **–presort** to turn it  
              into the sortable format; then sort it; *then* pipe it into  **agedu**  
              **-L** (which can accept either the normal or the sortable format as  
              input). For example:  
  
              *generate\_custom\_data.sh* \| agedu –presort \| sort \| agedu -L  
  
              If you need to transform the sorted  dump  file  back  into  the  
              ordinary  format,  **agedu** **–postsort** can do that. But since **agedu**  
              **-L** can accept either format as input, you may not need to.  
  
       **-h** or **–help**  
              Causes **agedu** to print some help text and terminate  immediately.  
  
       **-V** or **–version**  
              Causes  **agedu**  to print its version number and terminate immedi-  
              ately.  
  
**OPTIONS**  
       This section describes the various configuration  options  that  affect  
       **agedu**'s operation in one mode or another.  
  
       The following option affects nearly all modes (except **-S**):  
  
       **-f** *filename* or **–file** *filename*  
              Specifies  the  location  of the index file which **agedu** creates,  
              reads or removes depending on its operating  mode.  By  default,  
              this  is  simply \`**agedu.dat**', in whatever is the current working  
              directory when you run **agedu**.  
  
       The following options affect the disk-scanning modes, **-s** and **-S**:  
  
       **–cross-fs** and **–no-cross-fs**  
              These configure whether or not the disk  scan  is  permitted  to  
              cross  between  different  file  systems. The default is not to:  
              **agedu** will normally skip over subdirectories on which a  differ-  
              ent  file  system  is mounted. This makes it convenient when you  
              want to free up space on a particular file system which is  run-  
              ning  low. However, in other circumstances you might wish to see  
              general information about the use of space no matter which  file  
              system  it's  on  (for  instance,  if  your real concern is your  
              backup media running out of space, and if your  backups  do  not  
              treat  different file systems specially); in that situation, use  
              **–cross-fs**.  
  
              (Note that this default is the opposite way round from the  cor-  
              responding option in **du**.)  
  
       **–prune** *wildcard* and **–prune-path** *wildcard*  
              These  cause  particular  files  or  directories  to  be omitted  
              entirely from the scan. If **agedu**'s scan  encounters  a  file  or  
              directory  whose  name  matches  the  wildcard  provided  to the  
              **–prune** option, it will not include that file in its index,  and  
              also  if  it's a directory it will skip over it and not scan its  
              contents.  
  
              Note that in most Unix shells, wildcards will probably  need  to  
              be  escaped  on  the  command  line,  to  prevent the shell from  
              expanding the wildcard before **agedu** sees it.  
  
              **–prune-path** is similar to **–prune**, except that the wildcard  is  
              matched against the entire pathname instead of just the filename  
              at the end of it. So whereas **–prune** **\*a\*b\*** will match  any  file  
              whose  actual  name contains an **a** somewhere before a **b**, **–prune-**  
              **path** **\*a\*b\*** will also match a file  whose  name  contains  **b**  and  
              which  is inside a directory containing an **a**, or any file inside  
              a directory of that form, and so on.  
  
       **–exclude** *wildcard* and **–exclude-path** *wildcard*  
              These cause particular files or directories to be  omitted  from  
              the  index,  but not from the scan. If **agedu**'s scan encounters a  
              file or directory whose name matches the  wildcard  provided  to  
              the **–exclude** option, it will not include that file in its index  
              - but unlike **–prune**, if the file in question is a directory  it  
              will  still  scan  its  contents  and index them if they are not  
              ruled out themselves by **–exclude** options.  
  
              As above, **–exclude-path** is similar to  **–exclude**,  except  that  
              the wildcard is matched against the entire pathname.  
  
       **–include** *wildcard* and **–include-path** *wildcard*  
              These cause particular files or directories to be re-included in  
              the index and the scan, if they had previously been ruled out by  
              one  of  the  above exclude or prune options. You can interleave  
              include, exclude and prune options as you wish  on  the  command  
              line,  and  if  more than one of them applies to a file then the  
              last one takes priority.  
  
              For example, if you wanted to see only the disk space  taken  up  
              by MP3 files, you might run  
  
              $ **agedu** **-s** **.** **–exclude** **'\*'** **–include** **'\*.mp3'**  
  
              which  will  cause  everything  to be omitted from the scan, but  
              then the MP3 files to be put back in. If you then wanted only  a  
              subset  of those MP3s, you could then exclude some of them again  
              by adding, say, \`**–exclude-path**  **'./queen/\*'**'  (or,  more  effi-  
              ciently, \`**–prune** **./queen**') on the end of that command.  
  
              As  with  the previous two options, **–include-path** is similar to  
              **–include** except that the wildcard is matched against the entire  
              pathname.  
  
       **–progress**, **–no-progress** and **–tty-progress**  
              When **agedu** is scanning a directory tree, it will typically print  
              a one-line progress report every second  showing  where  it  has  
              reached  in  the  scan,  so  you  can have some idea of how much  
              longer it will take. (Of course, it can't  predict  *exactly*  how  
              long  it  will take, since it doesn't know which of the directo-  
              ries it hasn't scanned yet will turn out to be huge.)  
  
              By default, those progress  reports  are  displayed  on  **agedu**'s  
              standard  error  channel,  if  that channel points to a terminal  
              device. If you need to manually enable or disable them, you  can  
              use the above three options to do so: **–progress** unconditionally  
              enables the progress reports, **–no-progress** unconditionally dis-  
              ables  them, and **–tty-progress** reverts to the default behaviour  
              which is conditional on standard error being a terminal.  
  
       **–dir-atime** and **–no-dir-atime**  
              In normal operation,  **agedu**  ignores  the  atimes  (last  access  
              times)  on  the  *directories* it scans: it only pays attention to  
              the atimes of  the  *files*  inside  those  directories.  This  is  
              because  directory  atimes  tend  to be reset by a lot of system  
              administrative tasks, such as **cron** jobs which scan the file sys-  
              tem  for  one  reason  or another - or even other invocations of  
              **agedu** itself, though it tries to avoid modifying any  atimes  if  
              possible. So the literal atimes on directories are typically not  
              representative of how long ago the data  in  question  was  last  
              accessed with real intent to use that data in particular.  
  
              Instead,  **agedu**  makes  up  a  fake atime for every directory it  
              scans, which is equal to the newest atime  of  any  file  in  or  
              below that directory (or the directory's last *modification* time,  
              whichever is newest). This is based on the assumption  that  all  
              *important*  accesses  to directories are actually accesses to the  
              files inside  those  directories,  so  that  when  any  file  is  
              accessed all the directories on the path leading to it should be  
              considered to have been accessed as well.  
  
              In unusual cases it is possible that a  directory  itself  might  
              embody  important  data  which is accessed by reading the direc-  
              tory. In that situation, **agedu**'s atime-faking policy will misre-  
              port  the  directory as disused. In the unlikely event that such  
              directories form a significant part of your  disk  space  usage,  
              you  might  want  to turn off the faking. The **–dir-atime** option  
              does this: it causes the disk scan to read the  original  atimes  
              of the directories it scans.  
  
              The  faking  of atimes on directories also requires a processing  
              pass over the index file after the main disk scan  is  complete.  
              **–dir-atime** also turns this pass off. Hence, this option affects  
              the **-L** option as well as **-s** and **-S**.  
  
              (The previous section mentioned that there might be subtle  dif-  
              ferences  between  the  output of **agedu** **-s** **/path** **-D** and **agedu** **-S**  
              **/path**. This is why. Doing a scan with **-s**  and  then  dumping  it  
              with  **-D**  will  dump  the fully faked atimes on the directories,  
              whereas doing a scan-to-dump with **-S** will  dump  only  *partially*  
              faked  atimes - specifically, each directory's last modification  
              time - since the subsequent processing pass will not have had  a  
              chance  to  take place. However, loading either of the resulting  
              dump files with **-L**  will  perform  the  atime-faking  processing  
              pass,  leading  to the same data in the index file in each case.  
              In normal usage it should be safe to ignore all of this complex-  
              ity.)  
  
       **–mtime**  
              This  option causes **agedu** to index files by their last modifica-  
              tion time instead of their last access time. You might  want  to  
              use  this  if your last access times were completely useless for  
              some reason: for example, if you  had  recently  searched  every  
              file on your system, the system would have lost all the informa-  
              tion about what files you hadn't recently accessed before  then.  
              Using this option is liable to be less effective at finding gen-  
              uinely wasted space than the normal mode (that is,  it  will  be  
              more  likely  to flag things as disused when they're not, so you  
              will have more candidates to go through by hand looking for data  
              you  don't  need),  but may be better than nothing if your last-  
              access times are unhelpful.  
  
              Another use for this mode might  be  to  find  *recently*  *created*  
              large  data.  If  your  disk  has  been gradually filling up for  
              years, the default mode of **agedu** will let you find  unused  data  
              to  delete;  but  if  you  know  your  disk  had plenty of space  
              recently and now it's suddenly full, and you suspect  that  some  
              rogue  program  has  left a large core dump or output file, then  
              **agedu** **–mtime** might be a convenient way to locate the culprit.  
  
       **–logicalsize**  
              This option causes **agedu** to consider the size of each file to be  
              its  \`logical' size, rather than the amount of space it consumes  
              on disk. (That is, it will use **st***\_***size** instead of  **st***\_***blocks**  in  
              the  data  returned  from **stat**(*2*).) This option makes **agedu** less  
              accurate at reporting how much of your  disk  is  used,  but  it  
              might  be  useful  in specialist cases, such as working around a  
              file system that is misreporting physical sizes.  
  
              For most files, the physical size of a file will be larger  than  
              the  logical  size,  reflecting the fact that filesystem layouts  
              generally allocate a whole number of blocks of the disk to  each  
              file,  so  some space is wasted at the end of the last block. So  
              counting only the logical file size will typically cause  under-  
              reporting  of  the  disk usage (perhaps *large* under-reporting in  
              the case of a very large number of very small files).  
  
              On the other hand, sometimes a file with a  very  large  logical  
              size can have \`holes' where no data is actually stored, in which  
              case using the logical size of the  file  will  *over*-report  its  
              disk  usage.  So the use of logical sizes can give wrong answers  
              in both directions.  
  
       The following option affects all the modes that generate  reports:  the  
       web  server  mode  **-w**,  the stand-alone HTML generation mode **-H** and the  
       text report mode **-t**.  
  
       **–files**  
              This option causes **agedu**'s reports to list the individual  files  
              in  each directory, instead of just giving a combined report for  
              everything that's not in a subdirectory.  
  
       The following option affects the text report mode **-t**.  
  
       **-a** *age* or **–age** *age*  
              This option tells **agedu** to report only files  of  at  least  the  
              specified  age. An age is specified as a number, followed by one  
              of \`**y**' (years), \`**m**' (months), \`**w**' (weeks) or \`**d**'  (days).  (This  
              syntax  is  also used by the **-r** option.) For example, **-a** **6m** will  
              produce a text report which includes only  files  at  least  six  
              months old.  
  
       The  following  options  affect the stand-alone HTML generation mode **-H**  
       and the text report mode **-t**.  
  
       **-d** *depth* or **–depth** *depth*  
              This option controls the maximum depth to which  **agedu**  recurses  
              when generating a text or HTML report.  
  
              In  text  mode,  the  default is 1, meaning that the report will  
              include the directory given on the command line and all  of  its  
              immediate  subdirectories. A depth of two includes another level  
              below that, and so on; a depth of zero means *only* the  directory  
              on the command line.  
  
              In HTML mode, specifying this option switches **agedu** from writing  
              out a single HTML file to writing out multiple files which  link  
              to  each  other. A depth of 1 means **agedu** will write out an HTML  
              file for the given directory and also one for each of its  imme-  
              diate subdirectories.  
  
              If  you  want  **agedu**  to recurse as deeply as possible, give the  
              special word \`**max**' as an argument to **-d**.  
  
       **-o** *filename* or **–output** *filename*  
              This option is used to specify an output file for **agedu** to write  
              its  report to. In text mode or single-file HTML mode, the argu-  
              ment is treated as the name of a  file.  In  multiple-file  HTML  
              mode,  the  argument  is treated as the name of a directory: the  
              directory will be created if it does not already exist, and  the  
              output HTML files will be created inside it.  
  
       The  following option affects only the stand-alone HTML generation mode  
       **-H**, and even then, only in recursive mode (with **-d**):  
  
       **–numeric**  
              This option tells **agedu** to name most of its  output  HTML  files  
              numerically.  The  root of the whole output file collection will  
              still be called **index.html**, but all the  rest  will  have  names  
              like  **73.html**  or **12525.html**. (The numbers are essentially arbi-  
              trary; in fact, they're indices of nodes in the  data  structure  
              used by **agedu**'s index file.)  
  
              This system of file naming is less intuitive than the default of  
              naming files after the sub-pathname they index. It's  also  less  
              stable: the same pathname will not necessarily be represented by  
              the same filename if **agedu** **-H** is re-run after  another  scan  of  
              the  same  directory tree. However, it does have the virtue that  
              it keeps the filenames *short*, so that  even  if  your  directory  
              tree  is  very  deep,  the output HTML files won't exceed any OS  
              limit on filename length.  
  
       The following options affect the web server mode **-w**, and in some  cases  
       also the stand-alone HTML generation mode **-H**:  
  
       **-r** *age* *range* or **–age-range** *age* *range*  
              The  HTML  reports  produced  by **agedu** use a range of colours to  
              indicate how long ago data was last accessed, running  from  red  
              (representing  the most disused data) to green (representing the  
              newest). By default, the lengths of time represented by the  two  
              ends  of  that spectrum are chosen by examining the data file to  
              see what range of ages appears in it. However, you might want to  
              set your own limits, and you can do this using **-r**.  
  
              The  argument  to **-r** consists of a single age, or two ages sepa-  
              rated by a minus sign. An age is a number, followed  by  one  of  
              \`**y**' (years), \`**m**' (months), \`**w**' (weeks) or \`**d**' (days). (This syn-  
              tax is also used by the **-a** option.) The first age in  the  range  
              represents  the  oldest  data,  and  will be coloured red in the  
              HTML; the second age represents the newest, coloured  green.  If  
              the  second  age  is  not specified, it will default to zero (so  
              that green means data which has been accessed *just* *now*).  
  
              For example, **-r** **2y** will mark data in red if it has  been  unused  
              for  two  years  or more, and green if it has been accessed just  
              now. **-r** **2y-3m** will similarly mark data red if it has been unused  
              for  two  years  or  more, but will mark it green if it has been  
              accessed three months ago or later.  
  
       **–address** *addr*\[**:***port*\]  
              Specifies the network address and port  number  on  which  **agedu**  
              should  listen when running its web server. If you want **agedu** to  
              listen for connections coming in from any  source,  specify  the  
              address as the special value **ANY**. If the port number is omitted,  
              an arbitrary unused port will be chosen for you and displayed.  
  
              If you specify this option, **agedu** will  not  print  its  URL  on  
              standard output (since you are expected to know what address you  
              told it to listen to).  
  
       **–auth** *auth-type*  
              Specifies how **agedu** should control access to the  web  pages  it  
              serves. The options are as follows:  
  
              **magic**  This option only works on Linux, and only when the incom-  
                     ing connection is from the same  machine  that  **agedu**  is  
                     running on. On Linux, the special file **/proc/net/tcp** con-  
                     tains a list of network connections  currently  known  to  
                     the operating system kernel, including which user id cre-  
                     ated them. So **agedu** will look up each incoming connection  
                     in  that file, and allow access if it comes from the same  
                     user id under which **agedu** itself is  running.  Therefore,  
                     in  **agedu**'s normal web server mode, you can safely run it  
                     on a multi-user machine and no other user will be able to  
                     read data out of your index file.  
  
              **basic**  In  this  mode, **agedu** will use HTTP Basic authentication:  
                     the user will have to provide a username and password via  
                     their browser. **agedu** will normally make up a username and  
                     password for the purpose, but you can specify  your  own;  
                     see below.  
  
              **none**   In  this  mode, the web server is unauthenticated: anyone  
                     connecting to it has full access to the reports generated  
                     by  **agedu**.  Do not do this unless there is nothing confi-  
                     dential at all in your index file, or unless you are cer-  
                     tain  that  nobody but you can run processes on your com-  
                     puter.  
  
              **default**  
                     This is the default mode if you do not specify one of the  
                     above.  In  this  mode,  **agedu**  will attempt to use Linux  
                     magic authentication, but if it detects at  startup  time  
                     that  **/proc/net/tcp**  is  absent or non-functional then it  
                     will fall back to using  HTTP  Basic  authentication  and  
                     invent a user name and password.  
  
       **–auth-file** *filename* or **–auth-fd** *fd*  
              When  **agedu**  is  using  HTTP Basic authentication, these options  
              allow you to specify your own user name  and  password.  If  you  
              specify **–auth-file**, these will be read from the specified file;  
              if you specify **–auth-fd** they will instead be read from a  given  
              file descriptor which you should have arranged to pass to **agedu**.  
              In either case, the authentication details should consist of the  
              username,  followed  by  a colon, followed by the password, fol-  
              lowed *immediately* by end of file (no trailing newline,  or  else  
              it will be considered part of the password).  
  
       **–title** *title*  
              Specify the string that appears at the start of the **&lt;title&gt;** sec-  
              tion of the output HTML pages.  The  default  is  \`**agedu**'.  This  
              title  is  followed  by a colon and then the path you're viewing  
              within the index file. You might use this  option  if  you  were  
              serving  **agedu**  reports for several different servers and wanted  
              to make it clearer which one a user was looking at.  
  
       **–launch** *shell-command*  
              Specify a command to be run with the base URL of  the  web  user  
              interface,  once the web server has started up. The command will  
              be interpreted by **/bin/sh**, and the base URL will be appended  to  
              it as an extra argument word.  
  
              A  typical  use  for this would be \`**–launch=browse**', which uses  
              the XDG \`**browse**' command to automatically  open  the  **agedu**  web  
              interface  in your default browser. However, other uses are pos-  
              sible: for example, you could provide a command  which  communi-  
              cates  the URL to some other software that will use it for some-  
              thing.  
  
       **–no-eof**  
              Stop **agedu** in web server mode from looking  for  end-of-file  on  
              standard input and treating it as a signal to terminate.  
  
**LIMITATIONS**  
       The data file is pretty large. The core of **agedu** is the tree-based data  
       structure it uses in its index in  order  to  efficiently  perform  the  
       queries it needs; this data structure requires **O(N** **log** **N)** storage. This  
       is larger than you might expect; a scan of my own home directory,  con-  
       taining  half  a  million files and directories and about 20Gb of data,  
       produced an index file over 60Mb in size. Furthermore, since  the  data  
       file  must  be  memory-mapped during most processing, it can never grow  
       larger than available address space, so a  *really*  big  filesystem  may  
       need  to  be  indexed on a 64-bit computer. (This is one reason for the  
       existence of the **-D** and **-L** options: you can  do  the  scanning  on  the  
       machine  with  access  to the filesystem, and the indexing on a machine  
       big enough to handle it.)  
  
       The data structure also does not usefully permit access control  within  
       the data file, so it would be difficult - even given the willingness to  
       do additional coding - to run a system-wide **agedu** scan on  a  **cron**  job  
       and serve the right subset of reports to each user.  
  
       In  certain  circumstances, **agedu** can report false positives (reporting  
       files as disused which are in fact in use) as well as the  more  benign  
       false  negatives (reporting files as in use which are not). This arises  
       when a file is, semantically speaking, \`read'  without  actually  being  
       physically  *read*.  Typically  this occurs when a program checks whether  
       the file's mtime has changed and only bothers re-reading it if it  has;  
       programs which do this include **rsync**(*1*) and **make**(*1*). Such programs will  
       fail to update the atime of unmodified files despite depending on their  
       continued existence; a directory full of such files will be reported as  
       disused by **agedu** even in situations  where  deleting  them  will  cause  
       trouble.  
  
       Finally, of course, **agedu**'s normal usage mode depends critically on the  
       OS providing last-access times which are at least approximately  right.  
       So  a file system mounted with Linux's \`**noatime**' option, or the equiva-  
       lent on any other OS, will not give useful results! (However, the Linux  
       mount  option  \`**relatime**',  which  distributions  now  tend  to  use by  
       default, should be fine for all but specialist purposes: it reduces the  
       accuracy  of  last-access times so that they might be wrong by up to 24  
       hours, but if you're looking for files that have been unused for months  
       or years, that's not a problem.)  
  
**LICENCE**  
       **agedu**  is  free software, distributed under the MIT licence. Type **agedu**  
       **–licence** to see the full licence text.  
  
  
  
Simon Tatham                      2008-11-02                          agedu(1)  

<!-- vale Spell.Spell = YES -->
<!-- markdownlint-enable MD012 MD013 -->

## begin: mask task in template : build content

## ninja-rules

``` bash
ninja -t rules
```

### ninja custom-rule

``` ninja
# <!-- markdownlint-disable MD013 -->
rule mask-textual-report-sort-csv-markdown
  command = $
    mask --maskfile $in $mask_subcommand | $
    sort --sort=numeric --reverse | $
    awk 'BEGIN{print "Size,Path"}{size="............" $$1; size=substr(size, length(size) - 11); $$1=null; printf("`-%s-%s-%s-%s`,%s\n",substr(size,1,3),substr(size,4,3),substr(size,7,3),substr(size,10,3),$$0);}' | $
    csvtomd | $
    tee $out 1> /dev/null
# <!-- markdownlint-enable MD013 -->

```

### ninja-rules-output

``` plain
copy_alternate
ghq
github-markdown-toc
mask
mask-man-markdown
mask-screenshot
mask-stderr-tee
mask-stdout-csv-markdown
mask-stdout-tee
mask-tee
mask-textual-report-sort-csv-markdown
pandocomatic
phony
```

## ninja-targets

``` bash
ninja -t targets all
```

### ninja build-all

``` ninja
build all: phony README.md ./report-output/report.md

default all

```

### ninja custom-build

``` ninja
# custom build here

```

### ninja report-build

``` ninja
# <!-- markdownlint-disable MD013 -->
build ./report-output/root.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-root

build ./report-output/root-Applications.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
mask_subcommand = text-root-Applications

build ./report-output/root-Users.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-root-Users

build ./report-output/HOME.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME

build ./report-output/HOME--local.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME--local

build ./report-output/HOME--local-share.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME--local-share

build ./report-output/HOME--local-share-Trash.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME--local-share-Trash

build ./report-output/HOME--local-share-Trash-files.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME--local-share-Trash-files

build ./report-output/HOME--vagrant-d.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME--vagrant-d

build ./report-output/HOME--vagrant-d-boxes.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
mask_subcommand = text-HOME--vagrant-d-boxes

build ./report-output/HOME-ghq.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-ghq

build ./report-output/HOME-ghq-github-com.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-ghq-github-com

build ./report-output/HOME-ghq-github-com-huzhenghui.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-ghq-github-com-huzhenghui

build ./report-output/HOME-ghq-github-com-huzhenghui-mask-awesome.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-ghq-github-com-huzhenghui-mask-awesome

build ./report-output/HOME-Library.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-Library

build ./report-output/HOME-Library-Containers.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-Library-Containers

build ./report-output/HOME-OneDrive.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-OneDrive

build ./report-output/report.md : pandocomatic ./report-template/report.md | $
  ./report-output/root.auto-generated.md $
  ./report-output/root-Applications.auto-generated.md $
  ./report-output/root-Users.auto-generated.md $
  ./report-output/HOME.auto-generated.md $
  ./report-output/HOME--local.auto-generated.md $
  ./report-output/HOME--local-share.auto-generated.md $
  ./report-output/HOME--local-share-Trash.auto-generated.md $
  ./report-output/HOME--local-share-Trash-files.auto-generated.md $
  ./report-output/HOME--vagrant-d.auto-generated.md $
  ./report-output/HOME--vagrant-d-boxes.auto-generated.md $
  ./report-output/HOME-ghq.auto-generated.md $
  ./report-output/HOME-ghq-github-com.auto-generated.md $
  ./report-output/HOME-ghq-github-com-huzhenghui.auto-generated.md $
  ./report-output/HOME-ghq-github-com-huzhenghui-mask-awesome.auto-generated.md $
  ./report-output/HOME-Library.auto-generated.md $
  ./report-output/HOME-Library-Containers.auto-generated.md $
  ./report-output/HOME-OneDrive.auto-generated.md
# <!-- markdownlint-disable MD013 -->

```

### ninja-targets-output

``` plain
all: phony
report-output/root.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/root-Applications.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/root-Users.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME--local.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME--local-share.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME--local-share-Trash.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME--local-share-Trash-files.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME--vagrant-d.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME--vagrant-d-boxes.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME-ghq.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME-ghq-github-com.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME-ghq-github-com-huzhenghui.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME-ghq-github-com-huzhenghui-mask-awesome.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME-Library.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME-Library-Containers.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/HOME-OneDrive.auto-generated.md: mask-textual-report-sort-csv-markdown
report-output/report.md: pandocomatic
build/pandoc-lua-filters/include-files/include-files.lua: ghq
build/ninja/ninja-rules-output.txt: mask-stdout-tee
build/ninja/ninja-targets-output.txt: mask-stdout-tee
build/ninja/ninja.graph.dot: mask-tee
build/ninja/ninja.graph.png: mask
build/temp/README.md: copy_alternate
build/README.TOC/README.TOC.md: github-markdown-toc
README-template: phony
build/agedu-version-output.txt: mask-stdout-tee
build/agedu-help-output.txt: mask-stdout-tee
build/man/man-agedu.auto-generated.md: mask-man-markdown
README.md: pandocomatic
```

## readme-md

``` bash
ninja --verbose README.md
```

### ninja readme-build

``` ninja
build ./build/agedu-version-output.txt : mask-stdout-tee ./maskfile.md
  mask_subcommand = agedu-version

build ./build/agedu-help-output.txt : mask-stdout-tee ./maskfile.md
  mask_subcommand = agedu-help

build ./build/man/man-agedu.auto-generated.md : mask-man-markdown ./maskfile.md
  mask_subcommand = man-agedu

```

``` ninja
build README.md : pandocomatic maskfile.md | README-template $
  ./build/agedu-version-output.txt $
  ./build/agedu-help-output.txt $
  ./build/man/man-agedu.auto-generated.md

```

## end: mask task in template : build content

## begin: mask task in template : ninja command

## ninja-browse

``` bash
ninja -t browse
```

## ninja-graph-png

``` bash
dot -Tpng -o./build/ninja/ninja.graph.png ./build/ninja/ninja.graph.dot
```

![ninja](./build/ninja/ninja.graph.png)

## ninja-graph-dot-xdot

``` bash
detach -- xdot "${MASKFILE_DIR}/build/ninja/ninja.graph.dot"
```

## ninja-graph-dot

``` bash
ninja -t graph
```

### ninja-graph-dot-output

``` dot
digraph ninja {
rankdir="LR"
node [fontsize=10, shape=box, height=0.25]
edge [fontsize=10]
"0x7f9650f06370" [label="all"]
"0x7f9650f06300" [label="phony", shape=ellipse]
"0x7f9650f06300" -> "0x7f9650f06370"
"0x7f9650f063d0" -> "0x7f9650f06300" [arrowhead=none]
"0x7f9650f06490" -> "0x7f9650f06300" [arrowhead=none]
"0x7f9650f063d0" [label="README.md"]
"0x7f96521056a0" [label="pandocomatic", shape=ellipse]
"0x7f96521056a0" -> "0x7f9650f063d0"
"0x7f9650f06950" -> "0x7f96521056a0" [arrowhead=none]
"0x7f9652104cb0" -> "0x7f96521056a0" [arrowhead=none]
"0x7f9652105060" -> "0x7f96521056a0" [arrowhead=none]
"0x7f9652105390" -> "0x7f96521056a0" [arrowhead=none]
"0x7f9652105570" -> "0x7f96521056a0" [arrowhead=none]
"0x7f9650f06950" [label="maskfile.md"]
"0x7f9652104cb0" [label="README-template"]
"0x7f9652104f30" [label="phony", shape=ellipse]
"0x7f9652104f30" -> "0x7f9652104cb0"
"0x7f96521040d0" -> "0x7f9652104f30" [arrowhead=none]
"0x7f9652105210" -> "0x7f9652104f30" [arrowhead=none]
"0x7f9652104390" -> "0x7f9652104f30" [arrowhead=none]
"0x7f96521046d0" -> "0x7f9652104f30" [arrowhead=none]
"0x7f96521048c0" -> "0x7f9652104f30" [arrowhead=none]
"0x7f9652104b00" -> "0x7f9652104f30" [arrowhead=none]
"0x7f9652104db0" -> "0x7f9652104f30" [arrowhead=none]
"0x7f96521040d0" [label="build/pandoc-lua-filters/include-files/include-files.lua"]
"0x7f9652004080" [label="ghq", shape=ellipse]
"0x7f9652004080" -> "0x7f96521040d0"
"0x7f9652105210" [label="build.ninja"]
"0x7f9652104390" [label="build/ninja/ninja-rules-output.txt"]
"0x7f9650f06950" -> "0x7f9652104390" [label=" mask-stdout-tee"]
"0x7f96521046d0" [label="build/ninja/ninja-targets-output.txt"]
"0x7f9650f06950" -> "0x7f96521046d0" [label=" mask-stdout-tee"]
"0x7f96521048c0" [label="build/ninja/ninja.graph.dot"]
"0x7f9650f06950" -> "0x7f96521048c0" [label=" mask-tee"]
"0x7f9652104b00" [label="build/ninja/ninja.graph.png"]
"0x7f9652104a90" [label="mask", shape=ellipse]
"0x7f9652104a90" -> "0x7f9652104b00"
"0x7f9650f06950" -> "0x7f9652104a90" [arrowhead=none]
"0x7f96521048c0" -> "0x7f9652104a90" [arrowhead=none]
"0x7f9652104db0" [label="build/README.TOC/README.TOC.md"]
"0x7f9652104c50" -> "0x7f9652104db0" [label=" github-markdown-toc"]
"0x7f9652104c50" [label="build/temp/README.md"]
"0x7f9650f06950" -> "0x7f9652104c50" [label=" copy_alternate"]
"0x7f9652105060" [label="build/agedu-version-output.txt"]
"0x7f9650f06950" -> "0x7f9652105060" [label=" mask-stdout-tee"]
"0x7f9652105390" [label="build/agedu-help-output.txt"]
"0x7f9650f06950" -> "0x7f9652105390" [label=" mask-stdout-tee"]
"0x7f9652105570" [label="build/man/man-agedu.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9652105570" [label=" mask-man-markdown"]
"0x7f9650f06490" [label="report-output/report.md"]
"0x7f9650f07a40" [label="pandocomatic", shape=ellipse]
"0x7f9650f07a40" -> "0x7f9650f06490"
"0x7f9650f08c50" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f06890" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f06aa0" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f06cb0" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f06eb0" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f070a0" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f07320" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f07530" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f077b0" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f07980" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f07b30" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f07d00" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f07fb0" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f081f0" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f08400" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f08570" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f088f0" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f08a00" -> "0x7f9650f07a40" [arrowhead=none]
"0x7f9650f08c50" [label="report-template/report.md"]
"0x7f9650f06890" [label="report-output/root.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f06890" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f06aa0" [label="report-output/root-Applications.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f06aa0" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f06cb0" [label="report-output/root-Users.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f06cb0" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f06eb0" [label="report-output/HOME.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f06eb0" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f070a0" [label="report-output/HOME--local.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f070a0" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f07320" [label="report-output/HOME--local-share.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f07320" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f07530" [label="report-output/HOME--local-share-Trash.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f07530" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f077b0" [label="report-output/HOME--local-share-Trash-files.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f077b0" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f07980" [label="report-output/HOME--vagrant-d.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f07980" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f07b30" [label="report-output/HOME--vagrant-d-boxes.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f07b30" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f07d00" [label="report-output/HOME-ghq.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f07d00" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f07fb0" [label="report-output/HOME-ghq-github-com.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f07fb0" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f081f0" [label="report-output/HOME-ghq-github-com-huzhenghui.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f081f0" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f08400" [label="report-output/HOME-ghq-github-com-huzhenghui-mask-awesome.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f08400" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f08570" [label="report-output/HOME-Library.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f08570" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f088f0" [label="report-output/HOME-Library-Containers.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f088f0" [label=" mask-textual-report-sort-csv-markdown"]
"0x7f9650f08a00" [label="report-output/HOME-OneDrive.auto-generated.md"]
"0x7f9650f06950" -> "0x7f9650f08a00" [label=" mask-textual-report-sort-csv-markdown"]
}
```

## ninja-all

``` bash
ninja --verbose
```

### build.ninja

``` ninja
builddir=./build
mask_subcommand = --help
mask_stdout_csv_markdowndelimiter = ","

#######################################
# begin: rule in template

rule mask
  command = mask --maskfile $in $mask_subcommand

rule mask-tee
  command = mask --maskfile $in $mask_subcommand 2>&1 | tee $out 1> /dev/null

rule mask-stdout-tee
  command = mask --maskfile $in $mask_subcommand 2>/dev/null | tee $out 1> /dev/null

rule mask-stderr-tee
  command = bash -c 'mask $mask_subcommand 1>/dev/null 2> >(tee $out)'

# <!-- markdownlint-disable MD013 -->
rule mask-man-markdown
  command = mask --maskfile $in $mask_subcommand | $
    ul | $
    ansifilter --bbcode | $
    inv --search-root="$$(ghq list --full-path https://github.com/huzhenghui/pyinvoke-awesome)/bbcode" bbcode-parser-format | $
    pandoc --from=html --to=markdown | $
    tee $out 1> /dev/null
# <!-- markdownlint-enable MD013 -->

rule mask-stdout-csv-markdown
  command = mask --maskfile $in $mask_subcommand 2>/dev/null | $
    csvtomd --delimiter "$$(echo $mask_stdout_csv_markdowndelimiter)" | $
    tee $out 1> /dev/null

rule mask-screenshot
  command = $
    regular_logfile="./build/temp/$$(basename $out).mask-screenshot.logfile" && $
    rm -f -v "$${regular_logfile}" && $
    until [[ -s "$${regular_logfile}" ]]; do $
      screen_logfile="$$(mktemp -d)/logfile"; $
      echo "$${screen_logfile}"; $
      mkfifo "$${screen_logfile}"; $
      screen -L -Logfile "$${screen_logfile}" $
        -dmS mask-screenshot-"$$(basename $out)" $
        sh -c "stdbuf -o0 mask --maskfile $in $mask_subcommand; $
          date +'%F %T %Z %z - %+ https://github.com/huzhenghui' | lolcat;"; $
      dd bs=1 if="$${screen_logfile}" of="$${regular_logfile}"; $
    done && $
    ansifilter --html --encoding=utf8 --input="$${regular_logfile}" | $
      tee ./build/temp/"$$(basename $out)".mask-screenshot.html | $
      wkhtmltoimage --format png - "$out"

rule pandocomatic
  command = pandocomatic --input $in --output $out

rule ghq
  command = ghq get --update "$repository" && $
    find -d "$link_dirname" -exec rmdir {} \; && $
    ln -Fs "$$(ghq list --full-path $repository)" "$link_dirname"
  generator = 1

rule github-markdown-toc
  command = gh-md-toc --hide-header --hide-footer --no-escape $in > $out

rule copy_alternate
  command = if [[ -f "$alternate" ]]; $
    then $
      cp "$alternate" "$out"; $
    else $
      cp "$in" "$out"; $
    fi;

# end: rule in template
#######################################

#######################################
# start snippet custom-rule

# <!-- markdownlint-disable MD013 -->
rule mask-textual-report-sort-csv-markdown
  command = $
    mask --maskfile $in $mask_subcommand | $
    sort --sort=numeric --reverse | $
    awk 'BEGIN{print "Size,Path"}{size="............" $$1; size=substr(size, length(size) - 11); $$1=null; printf("`-%s-%s-%s-%s`,%s\n",substr(size,1,3),substr(size,4,3),substr(size,7,3),substr(size,10,3),$$0);}' | $
    csvtomd | $
    tee $out 1> /dev/null
# <!-- markdownlint-enable MD013 -->

# end snippet custom-rule
#######################################

#######################################
# start snippet build-all

build all: phony README.md ./report-output/report.md

default all

# end snippet build-all
#######################################

#######################################
# start snippet custom-build

# custom build here

# end snippet custom-build
#######################################

#######################################
# start snippet report-build

# <!-- markdownlint-disable MD013 -->
build ./report-output/root.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-root

build ./report-output/root-Applications.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
mask_subcommand = text-root-Applications

build ./report-output/root-Users.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-root-Users

build ./report-output/HOME.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME

build ./report-output/HOME--local.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME--local

build ./report-output/HOME--local-share.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME--local-share

build ./report-output/HOME--local-share-Trash.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME--local-share-Trash

build ./report-output/HOME--local-share-Trash-files.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME--local-share-Trash-files

build ./report-output/HOME--vagrant-d.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME--vagrant-d

build ./report-output/HOME--vagrant-d-boxes.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
mask_subcommand = text-HOME--vagrant-d-boxes

build ./report-output/HOME-ghq.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-ghq

build ./report-output/HOME-ghq-github-com.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-ghq-github-com

build ./report-output/HOME-ghq-github-com-huzhenghui.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-ghq-github-com-huzhenghui

build ./report-output/HOME-ghq-github-com-huzhenghui-mask-awesome.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-ghq-github-com-huzhenghui-mask-awesome

build ./report-output/HOME-Library.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-Library

build ./report-output/HOME-Library-Containers.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-Library-Containers

build ./report-output/HOME-OneDrive.auto-generated.md : mask-textual-report-sort-csv-markdown ./maskfile.md
  mask_subcommand = text-HOME-OneDrive

build ./report-output/report.md : pandocomatic ./report-template/report.md | $
  ./report-output/root.auto-generated.md $
  ./report-output/root-Applications.auto-generated.md $
  ./report-output/root-Users.auto-generated.md $
  ./report-output/HOME.auto-generated.md $
  ./report-output/HOME--local.auto-generated.md $
  ./report-output/HOME--local-share.auto-generated.md $
  ./report-output/HOME--local-share-Trash.auto-generated.md $
  ./report-output/HOME--local-share-Trash-files.auto-generated.md $
  ./report-output/HOME--vagrant-d.auto-generated.md $
  ./report-output/HOME--vagrant-d-boxes.auto-generated.md $
  ./report-output/HOME-ghq.auto-generated.md $
  ./report-output/HOME-ghq-github-com.auto-generated.md $
  ./report-output/HOME-ghq-github-com-huzhenghui.auto-generated.md $
  ./report-output/HOME-ghq-github-com-huzhenghui-mask-awesome.auto-generated.md $
  ./report-output/HOME-Library.auto-generated.md $
  ./report-output/HOME-Library-Containers.auto-generated.md $
  ./report-output/HOME-OneDrive.auto-generated.md
# <!-- markdownlint-disable MD013 -->

# end snippet report-build
#######################################

#######################################
# begin: readme-build in template

build ./build/pandoc-lua-filters/include-files/include-files.lua : ghq
  repository = https://github.com/pandoc/lua-filters
  link_dirname = ./build/pandoc-lua-filters

build ./build/ninja/ninja-rules-output.txt : mask-stdout-tee ./maskfile.md
  mask_subcommand = ninja-rules

build ./build/ninja/ninja-targets-output.txt : mask-stdout-tee ./maskfile.md
  mask_subcommand = ninja-targets

build ./build/ninja/ninja.graph.dot : mask-tee ./maskfile.md
  mask_subcommand = ninja-graph-dot

build ./build/ninja/ninja.graph.png : mask ./maskfile.md | ./build/ninja/ninja.graph.dot
  mask_subcommand = ninja-graph-png

build ./build/temp/README.md : copy_alternate ./maskfile.md
  alternate = ./README.md

build ./build/README.TOC/README.TOC.md : github-markdown-toc ./build/temp/README.md

build README-template : phony $
  ./build/pandoc-lua-filters/include-files/include-files.lua $
  ./build.ninja $
  ./build/ninja/ninja-rules-output.txt $
  ./build/ninja/ninja-targets-output.txt $
  ./build/ninja/ninja.graph.dot $
  ./build/ninja/ninja.graph.png $
  ./build/README.TOC/README.TOC.md $

# end: readme-build in template
#######################################

#######################################
# start snippet custom-readme-build

build ./build/agedu-version-output.txt : mask-stdout-tee ./maskfile.md
  mask_subcommand = agedu-version

build ./build/agedu-help-output.txt : mask-stdout-tee ./maskfile.md
  mask_subcommand = agedu-help

build ./build/man/man-agedu.auto-generated.md : mask-man-markdown ./maskfile.md
  mask_subcommand = man-agedu

# end snippet custom-readme-build
#######################################

#######################################
# $ followed by a newline
# escape the newline (continue the current line across a line break).
# the first 8 line in this build is template
# start snippet readme-build

build README.md : pandocomatic maskfile.md | README-template $
  ./build/agedu-version-output.txt $
  ./build/agedu-help-output.txt $
  ./build/man/man-agedu.auto-generated.md

# end snippet readme-build
#######################################
```

## end: mask task in template : ninja command
