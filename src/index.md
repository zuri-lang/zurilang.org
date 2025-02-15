# The Blade Language Documentation


Welcome! This is the official documentation for Blade 0.0.87.

> For the official package manager, test runner and repository server &mdash; [Nyssa](https://nyssa.bladelang.org), visit [https://nyssa.bladelang.org](https://nyssa.bladelang.org).

<div style="color:red">This documentation is a work in progress!</div>

[![Build Status](https://github.com/blade-lang/blade/actions/workflows/ci.yml/badge.svg)](https://github.com/blade-lang/blade/actions)
[![Gitter](https://badges.gitter.im/blade-lang/community.svg)](https://gitter.im/blade-lang/community)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/blade-lang/blade/blob/master/LICENSE)
[![Coverage Status](https://coveralls.io/repos/github/blade-lang/blade/badge.svg?branch=main)](https://coveralls.io/github/blade-lang/blade?branch=main)
[![Version](https://img.shields.io/badge/version-0.0.87-green)](https://github.com/blade-lang/blade)



<div class="fs-8">
<a href="#download" class="btn btn-primary fs-4 mb-4 mb-md-0 mr-2">Installation <i class="fa-regular fa-circle-down"></i></a>
<a href="/quick-learn" class="btn btn-red fs-4 mb-4 mb-md-0 mr-2">Quick Language Overview</a>
<a href="/examples" class="btn btn-green fs-4 mb-4 mb-md-0 mr-2">Learn by Example</a>
</div>

<br>

The following code implements a simple backend API that runs on port 3000:

```blade
import http

var server = http.server(3000)
server.handle('GET', '/', @(req, res) {
  res.json(req)
})

echo 'Listening on Port 3000...'
server.listen()
```

<br><br>


## What is Blade?

Blade is a modern general-purpose programming language focused on enterprise Web, IoT, and secure application development. Blade offers a comprehensive set of tools and libraries out of the box leading to reduced reliance on third-party packages. 

Blade comes equipped with an integrated package management system, simplifying the management of both internal and external dependencies and a self-hostable repository server making it ideal for private organizational and personal use. Its intuitive syntax and gentle learning curve ensure an accessible experience for developers of all skill levels. Leveraging the best features from JavaScript, Python, Ruby, and Dart, Blade provides a familiar and robust ecosystem that enables developers to harness the strengths of these languages effortlessly.

## What's interesting about Blade

- **Built-in package manager and repository server:** Package management is built into the language module system. Blade also comes with `Nyssa`. Nyssa is a package manager and self-hosted repository server highly suitable for private use.
- **Zero-dependency full-stack web development**: Blade comes with a built-in web server and a rich set of tools and libraries that support it, making it easy to build composable full-stack web applications out of the box:
  - Built-in Model-View-Template (MVT) based HTTP web server.
  - Built-in testing framework.
  - Built-in Object Relation Mapping support &mdash; Planned!
  - Built-in support for multiple databases.
  - Built-in web template engine &mdash; `Wire`.
  - Built-in routing library.
  - Built-in mail library with SMTP, IMAP, and POP3 support.
  - Built-in device integrations (such as support for COM/Ports, USB, etc.) &mdash; Planned!
  - Built-in cryptography library.
  - Built-in support for media processing (Image, audio, video, etc.) &mdash; Planned!
  - And more.
- **Function promotion**: A feature of the Blade language that makes it easy to reuse any code from an imported module.
- **Access modifiers**: Unlike JavaScript and Python, Blade supports access modifiers for variables, properties, functions, classes, modules, etc.
- **Decorator functions**: Decorator functions are a set of class methods in Blade that makes extending the functionality of existing code super easy.
- **Easy to extend with C modules**: Blade supports external extensions built in C with a built-in extension compiler via `Nyssa`. This feature makes it easy to extend language features with C modules.


## Showcase of other uses

While Blade focuses on Web and IoT, it is also great for general software development. Below are a few showcases of libraries using Blade for other impressive stuff:

- **[jsonrpc](https://github.com/mcfriend99/jsonrpc)**: A JSON-RPC library for Blade programming language.
- **[tar](https://github.com/mcfriend99/tar)**: Pure Blade library for creating and extracting TAR archives.


## Download

<span>
<a href="https://github.com/blade-lang/blade/releases/download/v0.0.87/blade-windows-v0.0.87.zip" class="btn btn-primary fs-6 mb-4 mb-md-0 mr-2">Windows &nbsp;<span class="fa-brands fa-windows"></span></a>
<a href="https://github.com/blade-lang/blade/releases/download/v0.0.87/blade-linux-v0.0.87.zip" class="btn btn-linux fs-6 mb-4 mb-md-0 mr-2">Linux  &nbsp;<span class="fa-brands fa-linux"></span></a>
<a href="https://github.com/blade-lang/blade/releases/download/v0.0.87/blade-macos-v0.0.87.zip" class="btn btn-gray fs-6 mb-4 mb-md-0 mr-2">MacOS  &nbsp;<span class="fa-brands fa-apple"></span></a>
</span>

> Since version 0.0.87, Every Blade download/installation comes with `nyssa` &mdash; the official package manager, test runner and repository server for Blade.

> - This downloads only support `x86-64` plaforms. 
> - Apple M1 devices should install `Rosetta 2` to run the downloaded application or install from source.
> - For other platforms, you'll need to install from source (see below for details).


## Installing Blade from source

Blade currently supports and have been tested on the Linux, OSX and Windows operating system. To install Blade, you need to have [CMake](https://cmake.org/download/) and a C/C++ compiler toolchain/IDE installed on your computer.

### For Linux and macOS

If you are on a Unix, OSX or Linux machine, you can use the automated install tool by running the command below in your favorite terminal.

```terminal
$ bash <(curl https://raw.githubusercontent.com/blade-lang/blade/main/scripts/install.sh)
```


### For Windows

> Starting from version `0.0.7`, Blade's officially supported compilers for the Windows environment is now the 
> TDM-GCC and WinLibs compiler. The decision to change the official compiler from Visual Studio and MSYS2 to TDM-GCC and WinLibs 
> is to allow a minial configuration effort while installing Blade as well as to allow us to develop Blade faster as trying to 
> be cross-compatible with Visual Studio has proven to slow down the growth of the language and the ecosystem and setting up 
> MSYS2 environment to compile Blade is more work than required for either TDM-GCC or WinLibs.
> 
> This also allows us to build valid Blade C extensions on Windows with less hassle. 
> Check out the [blade-ext-demo](https://github.com/blade-lang/blade-ext-demo) or any of the extension in the 
> [packages](https://github.com/blade-lang/blade/tree/main/packages) directory for more info on how to write a valid C extension for Blade.
>
> #### Important Notice
> 1. Only TDM-GCC, WinLibs, MinGW64 and MSVC compiler have been tested and are currently guaranted to build Blade. While other compilers may build it, they are not currently recommended.
> 2. For MSVC, a minimum of Windows SDK version 10.0.18362 is recommended. This will be readily available from Visual studio 2017 on Windows 10 and above.

To install Blade with TDM-GCC or WinLibs, install [TDM-GCC](https://github.com/jmeubank/tdm-gcc/releases/download/v10.3.0-tdm64-2/tdm64-gcc-10.3.0-2.exe)
or [WinLibs](https://github.com/brechtsanders/winlibs_mingw/releases/download/11.2.0-9.0.0-msvcrt-r5/winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r5.zip) 
via the given links. Add TDM-GCC or WinLibs `bin` directory to your environment path. TDM-GCC also allows you to add to path during its installation.

#### Dependencies

The following dependencies are required and can be installed via Cygwin or Vcpkg.

- CMake
- OpenSSL
- Curl
- Libffi

After this, run the following commands from the root of your Blade clone:

```shell
git clone https://github.com/blade-lang/blade.git
cd blade
cmake -B . -DCMAKE_MAKE_PROGRAM=mingw32-make -G "Unix Makefiles"
cmake --build .
```

If your dependencies were installed via Vcpkg, you may need to reference the Vcpkg toolchain. E.g.

```shell
git clone https://github.com/blade-lang/blade.git
cd blade
cmake -B . -DCMAKE_MAKE_PROGRAM=mingw32-make -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=PATH_TO_VCKPG\scripts\buildsystems\vcpkg.cmake
cmake --build .
```

This will build and install Blade into a new directory called `blade` within the current directory. You can move this directory to any location on your computer. 

To make Blade (`blade`) available from your terminal, you'll need to add the generated `blade` directory to your computer paths.

See [this](https://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path), [this](https://stackoverflow.com/questions/11530090/adding-a-new-entry-to-the-path-variable-in-zsh) or [this](https://stackoverflow.com/questions/44272416/how-to-add-a-folder-to-path-environment-variable-in-windows-10-with-screensho) Stack overflow questions for information on adding Blade installation directory to path.

### For all other platforms

For environments without an autoinstall and the adventurous ones, to install Blade, so far as you can successfully setup 
`git`, `cmake` and one of `GCC` or `Clang` based compilers, you can use the following commands to install Blade:


```shell
$ git clone https://github.com/blade-lang/blade.git
$ cd blade
$ cmake -B .
$ cmake --build .
```

> See the Windows section above for a list of dependencies.

**_See [BUILDING](https://github.com/blade-lang/blade/blob/main/BUILDING.md) for more details._**


## Running the Blade REPL

Blade comes with support for REPL (Read-Evaluate-Print-Loop). The REPL mode is triggered when calling the Blade (`blade`) executable without any file.

Something like this:

```terminal
$ blade
Blade 0.0.87 (running on BladeVM 0.1.1), REPL/Interactive mode = ON
Clang 13.0.0, (Build time = Feb  8 2022, 02:47:36)
Type ".exit" to quit or ".credits" for more information
%> echo 'Hello, World'
'Hello, World'
%> 
```

To exit the loop, simply type `.exit` and press enter or press the `Ctrl`+`D` combination on your keyboard.

We'll be using this mode a lot in this documentation.


## Running a Blade script

The `blade` command can take a file as parameter and execute the file as simply as follows:

```terminal
$ blade somefilename.b
...
```

Did you notice how the filename ends with a `.b`? Blade program files should make use of the `.b` extension. This is the recommended convention. 

It is important to remember that:

> While Blade may not enforce the `.b` extension for all scripts, it is a _requirement_ for a script that is meant to be imported as a module into another program.


## Editor Support

For editor support, we recommend Visual Studio Code along with the [blade-vscode Extension](https://marketplace.visualstudio.com/items?itemName=blade-lang.blade-vscode). 
Support for more editors are planned and on the way.


## Blade CLI options

Blade CLI comes with lots of options to control how Blade runs and how it runs
your scripts.

Type:

```terminal
$ blade -h
```

to show the CLI options. It should look something like this.


```terminal
Usage: blade [-[h | c | d | e | v | g | w]] [filename]
   -h       Show this help message.
   -v       Show version string.
   -b arg   Buffer terminal outputs with the given size.
   -d       Print bytecode.
   -e       Print bytecode and exit.
   -g arg   Sets the minimum heap size in kilobytes before the GC
            can start. [Default = 1024 (1mb)]
   -c arg   Runs the give code.
   -w       Show runtime warnings.
```

> This help message will automatically be triggered when you try to use an unsupported switch.

For example, to get the version of Blade installed:

```terminal
$ blade -v
Blade 0.0.87 (running on BladeVM 0.1.0)
```


## Community

- Join the conversation on [Gitter](https://gitter.im/blade-lang/community)
- Submit a [feature request](https://github.com/blade-lang/blade/issues/new?labels=feature-request) or [bug report](https://github.com/blade-lang/blade/issues/new?labels=bug).
<!-- - Follow us on Twitter -->

## Contributing

We need your help to make Blade great! The Blade community is as friendly and welcoming as possible. All kinds of contributions like pull requests, suggestions, typo fixes in documentation, feature request, bug reports, and others are highly appreciated. Please refer to the [Contributing](./CONTRIBUTING.md) guide for more information.


<!-- ## Sponsors

<ul class="list-style-none">
{% for sponsor in site.sponsors %}
  <li class="d-inline-block mr-1">
     <a href="#{{ sponsor.link }}"><img src="{{ sponsor.image }}" width="64" height="64" alt="{{ sponsor.name }}"/></a>
  </li>
{% endfor %}
</ul> -->

<!-- Place this tag in your head or just before your close body tag. -->
<!-- <script async defer src="https://buttons.github.io/buttons.js"></script> -->