# Tasks

## port-selfupdate

> Usage: selfupdate --no-sync --nosync

```bash
sudo port selfupdate
```

### output

```plain
--->  Updating MacPorts base sources using rsync
MacPorts base version 2.6.3 installed,
MacPorts base version 2.6.3 downloaded.
--->  Updating the ports tree
--->  MacPorts base is already the latest version

The ports tree has been updated. To upgrade your installed ports, you should run
  port upgrade outdated
```

## port-version

> Usage: version

```bash
port version
```

### output

```plain
Version: 2.6.3
```

## port-outdated

> Usage: outdated <portlist>

```bash
port outdated
```

## port-reclaim

> Usage: reclaim --enable-reminders --disable-reminders

```bash
sudo port -y reclaim
```

### output

```plain
--->  Checking for unnecessary unrequested ports
Found no unrequested ports without requested dependents.
--->  Checking for inactive ports
Found no inactive ports.
--->  Building list of distfiles still in use
--->  Searching for unused distfiles
No unused files found.
```

## port-usage

> Usage: usage <arguments>

```bash
port usage usage
```