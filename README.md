# LPMDocker
Docker containers for building lazarus projects using LPM. For infos about lpm see https://github.com/Warfley/LazarusPackageManager.

## Building

Each sub-directory contains the build.sh script for building the given lazarus version using fpcup:
- 1.6: lazarus 1.6.4, fpc 3.0.0
- 1.8: lazarus 1.8.4, fpc 3.0.4
- 2.0: lazarus 2.0.6, fpc 3.0.4
- stable: lazarus stable, fpc stable (according to fpcup)
- trunk: lazarus trunk, fpc stable (according to fpcup)
- experimental: lazarus trunk, fpc trunk

The images can be build using `./build.sh subdirectory` e.g. `./build.sh 2.0`. To build all images multithreaded via gnu parallel use `build_all.sh` (requires gnu parallel)

## Extending
To extend this with a new version, simply create a new directory with the tag name (e.g. `fixes2.0`) and add a `build.sh` (with execution rights) which builds the fpc and lazarus version to `~/development/[fpc|lazarus]`. E.g.
```
#!/bin/bash

fpcup --noconfirm --fpcURL=stable --lazURL=fixes2.0
```
