<img src="http://i.imgur.com/SAKjJQI.png" width=400>

*"This file was automatically generated by ./configure"*

### What?
*Quick and easy Linux/C project set up.*
* Are autotools overkill for your project? 
* Have you ever wanted a script that will quickly set up a build directory and Makefiles for you?
* Do you want a configuration script that is human readable, simple, and hackable?

### Why?
I like messing around with lots of little projects, and I wanted some way to standardize my build process between all of them, yet found autotools to be more than what I needed or wanted.

### How?
To install configure and it's documentation, simply run `sudo ./install.sh`, which copies configure to ~/bin and it's man page to the appropriate location.

After installation, to set up a new project simply do the following:

```
mkdir my-project
cd my-project
configure
```
The project name and build target will default to my-project-0.1.0, and generate the following directory tree:
```
./.config/
./build/
./docs/    --\ my-project.1 (skeleton man page)
./src/
./include/
           --\ configure.h (conditional defines and tests)
./LICENSE (defaults to MIT)
./Makefile
./README.md
./.gitignore
```

The following make targets are generated by default:
```
all        build target binary
clean      remove object files
install    install my-project-0.1.0 to PREFIX
uninstall  uninstall my-project from PREFIX
upgrade    re-copy my-project to PREFIX, overwriting existing file
dist       create my-project-0.1.0.tar.gz containing binary, source, headers, and configure
```

Rerunning `./configure` with options later will simply regenerate your configure.h and Makefile.

Version number can be changed in the Makefile line `export VERSION = x.x.x`, and will propagate through the configuration process. Default version numbr is 0.1.0.

Command line arguments:
```
--help:                 display help menu
--prefix=/path/to/dir   set the installation directory  default /usr/local/bin
--cc=/path/to/compiler  set the C compiler              default /usr/bin/cc
--cflags="-Wall -O3"    set the C compiler flags        default -O2 -Wall -Werror -Wextra
--clean                 clean up the config and build directories, regenerate Makefile
```

### Configuring configure

Configure has builtin bash functions that allow for quick tests of C functions or header files.
For example:

```
check_function "stdio.h" printf '"%d"', 1
```

Will check that stdio.h contains a function called printf that takes the following arguments. A `#define CONFIGURE_PRINTF 1` line will be added to configure.h

### License
See LICENSE file
