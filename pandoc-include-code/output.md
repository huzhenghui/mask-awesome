# Tasks

## changelog

``` bash
mdcat /usr/local/opt/pandoc-include-code/CHANGELOG.md
```

## include-code

``` bash
pandoc --filter pandoc-include-code --from=markdown  --to=gfm  --output=output.md maskfile.md
```

### changelog

``` markdown
# Changelog

* **1.5.0.0**
  - Support Pandoc 2.8, thereby requiring `pandoc-types == 1.20`
* **1.4.0.0**
  - Use data files for test fixtures, fixing Nixpkgs test problem
* **1.3.0.0**
  - "Snippet mode" and "range mode" can no longer be used together
  - Using the `numberLines` class sets the `startFrom` attribute for correct
    line numbering
* **1.2.0.2**
  - Replace bad `Setup.hs` script with default one
* **1.2.0.1**
  - Fix compile error
* **1.2.0.0**
  - Move `Range` to its own module (hiding the constructor)
  - Setup automated release builds using Travis. Executables for Linux
    and macOS now get published at
    https://github.com/owickstrom/pandoc-include-code/releases.
* **1.1.1.0**
  - Loosen constraint on `pandoc-types` to include `1.19`.
* **1.1.0.0**
  - Stricter checking of snippet name, fixes issue #3.
* **1.0.1.0**
  - Loosen version constraints on dependencies. Most importantly, allow all 4.x
    versions of `base`.
* **1.0.0.0**:
  - Report errors
  - Add support for dedenting
  - Remove undocumented "formatted" feature
  - Separate library and executable
* Before 1.0.0.0:
  - **2017-04-19:** Bump version
  - **2017-04-18:** Only render as RawBlock when preformatted
  - **2017-02-21:** Use new Pandoc 1.19
```
