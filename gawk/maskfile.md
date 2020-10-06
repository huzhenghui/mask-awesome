# Task

## mask-gawk

```bash
hash gawk 2>/dev/null || { echo >&2 "I require gawk but it's not installed.  Aborting."; exit 1; }
echo | mask gawk
```

## gawk

> A gawk script

```gawk
{
    print "Hello, World"
}
```