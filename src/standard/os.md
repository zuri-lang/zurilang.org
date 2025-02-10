# os

This module provides functions for interfacing with the underlying operating system and directories.

## Properties

- **platform** &#8674; _string_:

  The name of the current platform in string or `unknown` if 
the platform name could not be determined.


Example,

```blade-repl
%> import os
%> os.platform
'osx'
```

- **args** &#8674; _list_:

  A list containing the command line arguments passed to the startup script.

- **path\_separator** &#8674; _string_:

  The standard path separator for the current operating system.

- **exe\_path** &#8674; _string_:

  The full path to the running Blade executable.

- **DT\_UNKNOWN** &#8674; _number_:

  Unknown file type

- **DT\_BLK** &#8674; _number_:

  Block device file type

- **DT\_CHR** &#8674; _number_:

  Character device file type

- **DT\_DIR** &#8674; _number_:

  Directory file type

- **DT\_FIFO** &#8674; _number_:

  Named pipe file type

- **DT\_LNK** &#8674; _number_:

  Symbolic link file type

- **DT\_REG** &#8674; _number_:

  Regular file type

- **DT\_SOCK** &#8674; _number_:

  Local-domain socket file type

- **DT\_WHT** &#8674; _number_:

  Whiteout file type (only meaningful on UNIX and some unofficial Linux versions).


## Functions

#### exec(cmd)

Executes the given shell (or command prompt for Windows) commands and 
returns the output as string.

Example,

```blade-repl
%> os.exec('ls -l')
'total 48
-rw-r--r--@ 1 username  staff  705 Aug 27  2021 buggy.b
-rw-r--r--  1 username  staff  197 Mar  5 05:13 myprogram.b'
```

##### Parameters

- _string_ **cmd**

##### Returns

- string



#### info()

Returns information about the current operation system and machine as a dictionary.
The returned dictionary will contain:

- `sysname`: The name of the operating system
- `nodename` The name of the current machine
- `version`: The operating system version
- `release`: The release level/version
- `machine`: The hardware/processor type.

Example,

```blade-repl
%> os.info()
{sysname: Darwin, nodename: MacBook-Pro.local, version: Darwin Kernel Version 
21.1.0: Wed Oct 13 17:33:24 PDT 2021; root:xnu-8019.41.5~1/RELEASE_ARM64_T8101, 
release: 21.1.0, machine: arm64}
```

##### Returns

- dict



#### sleep(duration)

Causes the current thread to sleep for the specified number of seconds.

##### Parameters

- _number_ **duration**




#### get\_env(name)

Returns the given environment variable if exists or nil otherwise


Example,

```blade-repl
%> import os
%> os.get_env('ENV1')
'20'
```

##### Parameters

- _string_ **name**

##### Returns

- string



#### set\_env(name, value, overwrite)

Sets the named environment variable to the given value.

Example,

```blade-repl
%> os.set_env('ENV1', 'New value')
true
%> os.get_env('ENV1')
'New value'
```

If you are in the REPL and have tried the last example in `get_env()`, 
you may notice that the value of `ENV1` doesn't change. This is because 
unless you specify, `set_env()` will not overwrite existing environment variables. 
For that, you will need to specify `true` as the third parameter to `set_env()`.

For example,

```blade-repl
%> os.set_env('ENV1', 'New value again', true)
true
%> os.get_env('ENV1')
'New value again'
```

##### Parameters

- _string_ **name**
- _string_ **value**
- _bool?_ **overwrite**: : Default value is `false`.

##### Returns

- string
##### Notes

- Environment variables set will not persist after application exists.



#### create\_dir(path, permission, recursive)

Creates the given directory with the specified permission and optionally
add new files into it if any is given.

##### Parameters

- _string_ **path**
- _number?_ **permission**: : Default value is `0c777`
- _bool?_ **recursive**: : Default value is `true`.

##### Returns

- boolean
##### Notes

- if the directory already exists, it returns `false` otherwise, it returns `true`.
- permission should be given as octal number.



#### read\_dir(path)

Scans the given directory and returns a list of all matched files


Example,

```blade-repl
%> os.read_dir('./tests')
[., .., myprogram.b, single_thread.b, test.b, buggy.b]
```

##### Parameters

- _string_ **path**

##### Returns

- list[string]
##### Notes

- `.` indicates current directory and can be used as argument to _os.path_ as well.
- `..` indicates parent directory and can be used as argument to _os.path_ as well.



#### chmod(path, mode)

Changes the permission set on a directory to the given mode. It is advisable 
to set the mode with an octal number (e.g. 0c777) as this is consistent with 
operating system values.

##### Parameters

- _string_ **path**
- _number_ **mode**

##### Returns

- boolean



#### is\_dir(path)

Returns `true` if the path is a directory or `false` otherwise.

##### Parameters

- _string_ **path**

##### Returns

- bool



#### remove\_dir(path, recursive)

Deletes a non-empty directory. If recursive is `true`, non-empty directories 
will have their contents deleted first.

##### Parameters

- _string_ **path**
- _bool_ **recursive**: : Default value is `false`.

##### Returns

- bool



#### cwd()

Returns the current working directory.

##### Returns

- string



#### change\_dir(path)

Navigates the working directory into the specified path.

##### Parameters

- _string_ **path**

##### Returns

- bool



#### dir\_exists(path)

Returns `true` if the directory exists or `false` otherwise.

##### Parameters

- _string_ **path**

##### Returns

- bool



#### exit(code)

Exit the current process and quits the Blade runtime.

##### Parameters

- _number_ **code**




#### join\_paths(...)

Concatenates the given paths together into a format that is valid on the
current operating system.

Example,

```blade-repl
%> os.join_paths('/home/user', 'path/to/myfile.ext')
'/home/user/path/to/myfile.ext'
```

##### Parameters

- _string..._ **paths**

##### Returns

- string



#### real\_path(path)

Returns the original path to a relative path.

##### Parameters

- _string_ **path**

##### Returns

- string
##### Notes

- if the path is a file, see `abs_path()`.



#### abs\_path(path)

Returns the original path to a relative path.

##### Parameters

- _string_ **path**

##### Returns

- string
##### Notes

- unlike real_path(), this function returns full path for a file.



#### dir\_name(path)

Returns the parent directory of the pathname pointed to by `path`.  Any trailing
`/` characters are not counted as part of the directory name.  If `path` is an
empty string, or contains no `/` characters, dir_name() returns the string ".", 
signifying the current directory.

##### Parameters

- _string_ **path**

##### Returns

- string



#### base\_name(path)

The base_name() function returns the last component from the pathname pointed to by 
`path`, deleting any trailing `/` characters.  If path consists entirely of `/` 
characters, the string '/' is returned.  If path is an empty string, the string '.' 
is returned.

##### Parameters

- _string_ **path**

##### Returns

- string



