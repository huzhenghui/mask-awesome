# Tasks

## spring-run-hello-groovy

> spring run - Run a spring groovy script

```bash
spring run hello.groovy
```

### help

```plain
spring run - Run a spring groovy script

usage: spring run [options] <files> [--] [args]

Option                      Description                               
------                      -----------                               
--autoconfigure [Boolean]   Add autoconfigure compiler transformations
                              (default: true)                         
--classpath, -cp  <String>  Additional classpath entries              
--no-guess-dependencies     Do not attempt to guess dependencies      
--no-guess-imports          Do not attempt to guess imports           
-q, --quiet                 Quiet logging                             
-v, --verbose               Verbose logging of dependency resolution  
--watch                     Watch the specified file for changes
```

## spring-run-all-groovy

> spring run - Run a spring groovy script

```bash
spring run *.groovy
```

## spring-jar-all-groovy

> spring jar - Create a self-contained executable jar file from a Spring Groovy script

```bash
spring jar my-app.jar *.groovy
```

### help

```plain
spring jar - Create a self-contained executable jar file from a Spring Groovy script

usage: spring jar [options] <jar-name> <files>

Option                      Description                                        
------                      -----------                                        
--autoconfigure [Boolean]   Add autoconfigure compiler transformations         
                              (default: true)                                  
--classpath, -cp  <String>  Additional classpath entries                       
--exclude <String>          Pattern applied to directories on the classpath to 
                              find files to exclude from the resulting jar     
                              (default: )                                      
--include <String>          Pattern applied to directories on the classpath to 
                              find files to include in the resulting  (default:
                              )                                                
--no-guess-dependencies     Do not attempt to guess dependencies               
--no-guess-imports          Do not attempt to guess imports
```

## java-jar

```bash
java -jar ./my-app.jar
```
