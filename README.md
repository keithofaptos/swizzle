swizzle
=======

Fixes Dragon 6 startup crash on macOS Mojave.

compile
-------

    cmake .
    make

run
---

    DYLD_INSERT_LIBRARIES=libswizzle.dylib /Applications/Dragon.app/Contents/MacOS/Dragon
