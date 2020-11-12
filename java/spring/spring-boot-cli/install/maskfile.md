# Port

https://github.com/huzhenghui/mask-awesome/blob/master/port/maskfile.md

# Tasks

## port-search-spring

> Usage: search --case-sensitive --category --categories --depends_fetch --depends_extract --depends_patch --depends_build --depends_lib --depends_run --depends_test --depends --description --epoch --exact --glob --homepage --line --long_description --maintainer --maintainers --name --platform --platforms --portdir --regex --revision
>              --variant --variants --version <arguments>

```bash
port search spring
```

### output

```plain
spring-boot-cli @2.3.5 (java)
    Spring Boot CLI -- An opinionated view of building production-ready Spring applications.

spring-framework25 @2.5.6.SEC01 (java)
    Spring application framework for Java

spring-framework30 @3.0.7 (java)
    Spring application framework for Java

spring-framework31 @3.1.2 (java)
    Spring application framework for Java

spring-javaconfig @0.2.1.0.0.M4_1 (java)
    Type-safe, pure-Java way to configure applications

Found 5 ports.
```

## port-info-spring-boot-cli

> Usage: info --category --categories --conflicts --depends_fetch --depends_extract --depends_patch --depends_build --depends_lib --depends_run --depends_test --depends --description --epoch --fullname --heading --homepage --index --license --line --long_description --maintainer --maintainers --name --patchfiles --platform --platforms
>            --portdir --pretty --replaced_by --revision --subports --variant --variants --version <portlist>

```bash
port info spring-boot-cli
```

### output

```plain
spring-boot-cli @2.3.5 (java)
Variants:             bash_completion

Description:          The Spring Boot CLI is a command line tool that can be used if you want to quickly prototype with Spring. It allows you to run Groovy scripts, which means that you have a familiar Java-like syntax, without much boilerplate code. You don't need to use the CLI to work with Spring Boot but it's definitely the quickest
                      way to get a Spring application off the ground.
Homepage:             https://projects.spring.io/spring-boot/

Platforms:            darwin
License:              Apache-2
Maintainers:          Email: nils@breun.nl, GitHub: breun
                      Policy: openmaintainer
```

## port-list-spring-boot-cli

> Usage: list <portlist>

```bash
port list spring-boot-cli
```

### output

```plain
spring-boot-cli                @2.3.5          java/spring-boot-cli
```

## port-gohome-spring-boot-cli

> Usage: gohome <portlist>

```bash
port gohome spring-boot-cli
```

## port-variants-spring-boot-cli

> Usage: variants --index <portlist>

```bash
port variants spring-boot-cli
```

### output

```plain
spring-boot-cli has the variants:
   bash_completion: Enable completion support for Bash
```

## port-deps-spring-boot-cli

> Usage: deps --index --no-build <portlist>

```bash
port deps spring-boot-cli
```

### output

```plain
spring-boot-cli @2.3.5_0 has no dependencies.
```

## port-rdeps-spring-boot-cli

> Usage: rdeps --index --no-build --full <portlist>

```bash
port rdeps spring-boot-cli
```

### output

```plain
spring-boot-cli @2.3.5_0 has no dependencies.
```

## port-dependents-spring-boot-cli

> Usage: dependents <portlist>

```bash
port dependents spring-boot-cli
```

### output

```plain
spring-boot-cli has no dependents.
```

## port-rdependents-spring-boot-cli

> Usage: rdependents --full <portlist>

```bash
port rdependents spring-boot-cli
```

### output

```plain
spring-boot-cli has no dependents.
```

## port-notes-spring-boot-cli

> Usage: notes <portlist>

```bash
port notes spring-boot-cli
```

### output

```plain
spring-boot-cli has no notes.
```

## port-install-spring-boot-cli

> Usage: install --no-rev-upgrade --unrequested <portlist>

```bash
sudo port install spring-boot-cli
```

### output

```plain
--->  Fetching archive for spring-boot-cli
Warning: Your DNS servers incorrectly claim to know the address of nonexistent hosts. This may cause checksum mismatches for some ports. See this page for more information: <https://trac.macports.org/wiki/MisbehavingServers>
--->  Attempting to fetch spring-boot-cli-2.3.5_0.darwin_19.noarch.tbz2 from https://packages.macports.org/spring-boot-cli
--->  Attempting to fetch spring-boot-cli-2.3.5_0.darwin_19.noarch.tbz2 from https://cph.dk.packages.macports.org/spring-boot-cli
--->  Attempting to fetch spring-boot-cli-2.3.5_0.darwin_19.noarch.tbz2.rmd160 from https://cph.dk.packages.macports.org/spring-boot-cli
--->  Installing spring-boot-cli @2.3.5_0
--->  Deactivating spring-boot-cli @2.3.4_0
--->  Cleaning spring-boot-cli
--->  Activating spring-boot-cli @2.3.5_0
--->  Cleaning spring-boot-cli
```

## port-activate-spring-boot-cli

> Usage: activate --no-exec <portlist>

```bash
sudo port activate spring-boot-cli
```

### output

```plain
The following versions of spring-boot-cli are currently installed:
 1) spring-boot-cli @2.3.4_0
 2) spring-boot-cli @2.3.5_0 (active)
```

## port-upgrade-spring-boot-cli

> Usage: upgrade --force --enforce-variants --no-replace --no-rev-upgrade <portlist>

```bash
sudo port upgrade spring-boot-cli
```

## port-installed-spring-boot-cli

> Usage: installed <portlist>

```bash
port installed spring-boot-cli
```

### output

```plain
The following ports are currently installed:
  spring-boot-cli @2.3.4_0
  spring-boot-cli @2.3.5_0 (active)
```

## port-location-spring-boot-cli

> Usage: location <portlist>

```bash
port location spring-boot-cli@2.3.5
```

### output

```plain
Port spring-boot-cli 2.3.5_0 is installed as an image in:
/opt/local/var/macports/software/spring-boot-cli/spring-boot-cli-2.3.5_0.darwin_19.noarch.tbz2
```

## port-contents-spring-boot-cli

> Usage: contents --size --units <arg1> <portlist>

```bash
port contents --size --units B spring-boot-cli
```

### output

```plain
Port spring-boot-cli contains:
      3367 B /opt/local/bin/spring
      3367 B /opt/local/share/java/spring-boot-cli/bin/spring
  13757468 B /opt/local/share/java/spring-boot-cli/lib/spring-boot-cli-2.3.5.RELEASE.jar
```

## port-clean-spring-boot-cli

> Usage: clean --all --archive --dist --work --logs <portlist>

```bash
port clean spring-boot-cli
```

### output

```bash
--->  Cleaning spring-boot-cli
```

## port-log-spring-boot-cli

> Usage: log --phase <arg1> --level <arg1> <portlist>

```bash
port log spring-boot-cli
```

### output

```plain
Error: Log file for port spring-boot-cli not found
```

## port-logfile-spring-boot-cli

> Usage: logfile <portlist>

```bash
port logfile spring-boot-cli
```

### output

```plain
Error: Log file for port spring-boot-cli not found
```

## which-spring

```bash
which spring
```

### output

```plain
/opt/local/bin/spring
```

## realpath-which-spring

```bash
which spring | xargs realpath | xargs realpath
```

### output

```plain
/opt/local/share/java/spring-boot-cli/bin/spring
```