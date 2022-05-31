# Some compiler flags for `GCC`, `GCC/Mingw` and `Clang++`

## Path and Library Linking Flags
 ```console
 -l[linalg]
 ```
 Links to shared libraries. Ex. Windows: `liblinalg.dll`, Linux: `liblinalg.so` and MacOS `linalg.dylib`.

 ```console
 -L[/path/to/shared-libraries]
 ```
 Adds search path to shared libraries containing files with either `*.dll`, `*.so` or `*.dlyb`

 ```console 
 -I[/path/to/header-files]
 ```
 Adds search to header files such `.h` or `.hpp`

 ```console
 -D[FLAG] -D[FLAG]=VALUE
 ```
 Preprocessor flag

## GCC and Clang Common Flags
