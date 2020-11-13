# Tasks

## spring-version

> spring version - Show the version

```bash
spring  version
```

### output

```plain
Spring CLI v2.3.5.RELEASE
```

## spring-shell

> spring shell - Start a nested shell

```bash
spring shell
```

## spring-help

> spring help - Get help on commands

```bash
spring --help
```

### help

```plain
spring help - Get help on commands

usage: spring help command
```

### output

```plain
usage: spring [--help] [--version] 
       <command> [<args>]

Available commands are:

  run [options] <files> [--] [args]
    Run a spring groovy script

  grab                
    Download a spring groovy script's dependencies to ./repository

  jar [options] <jar-name> <files>
    Create a self-contained executable jar file from a Spring Groovy script

  war [options] <war-name> <files>
    Create a self-contained executable war file from a Spring Groovy script

  install [options] <coordinates>
    Install dependencies to the lib/ext directory

  uninstall [options] <coordinates>
    Uninstall dependencies from the lib/ext directory

  init [options] [location]
    Initialize a new project using Spring Initializr (start.spring.io)

  encodepassword [options] <password to encode>
    Encode a password for use with Spring Security

  shell                
    Start a nested shell

Common options:

  --debug Verbose mode   
    Print additional status information for the command you are running


See 'spring help <command>' for more information on a specific command.
```

