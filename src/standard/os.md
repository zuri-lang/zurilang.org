# os

This module provides functions for interfacing with the underlying operating system and directories.

## Fields

_os_.**platform** &#x279D; _string_ {#os.platform}
: The name of the current platform in string or `unknown` if 
  the platform name could not be determined.
  
  
  Example,
  
  ```blade-repl
  %> import os
  %> os.platform
  'osx'
  ```

_os_.**args** &#x279D; _list_ {#os.args}
: A list containing the command line arguments passed to the startup script.

_os_.**path\_separator** &#x279D; _string_ {#os.path_separator}
: The standard path separator for the current operating system.

_os_.**exe\_path** &#x279D; _string_ {#os.exe_path}
: The full path to the running Blade executable.

_os_.**DT\_UNKNOWN** &#x279D; _number_ {#os.DT_UNKNOWN}
: Unknown file type

_os_.**DT\_BLK** &#x279D; _number_ {#os.DT_BLK}
: Block device file type

_os_.**DT\_CHR** &#x279D; _number_ {#os.DT_CHR}
: Character device file type

_os_.**DT\_DIR** &#x279D; _number_ {#os.DT_DIR}
: Directory file type

_os_.**DT\_FIFO** &#x279D; _number_ {#os.DT_FIFO}
: Named pipe file type

_os_.**DT\_LNK** &#x279D; _number_ {#os.DT_LNK}
: Symbolic link file type

_os_.**DT\_REG** &#x279D; _number_ {#os.DT_REG}
: Regular file type

_os_.**DT\_SOCK** &#x279D; _number_ {#os.DT_SOCK}
: Local-domain socket file type

_os_.**DT\_WHT** &#x279D; _number_ {#os.DT_WHT}
: Whiteout file type (only meaningful on UNIX and some unofficial Linux versions).


## Functions

_os_.exec(_cmd_) {#os.exec}

: Executes the given shell (or command prompt for Windows) commands and 
  returns the output as string.
  
  Example,
  
  ```blade-repl
  %> os.exec('ls -l')
  'total 48
  -rw-r--r--@ 1 username  staff  705 Aug 27  2021 buggy.b
  -rw-r--r--  1 username  staff  197 Mar  5 05:13 myprogram.b'
  ```


  - **@params**:
    - _string_ **cmd**

  {.params}
  - **@returns**: _string_
  {.returns}



_os_.info() {#os.info}

: Returns information about the current operation system and machine as a dictionary.
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


  - **@returns**: _dict_
  {.returns}



_os_.sleep(_duration_) {#os.sleep}

: Causes the current thread to sleep for the specified number of seconds.


  - **@params**:
    - _number_ **duration**

  {.params}



_os_.get\_env(_name_) {#os.get_env}

: Returns the given environment variable if exists or nil otherwise
  
  
  Example,
  
  ```blade-repl
  %> import os
  %> os.get_env('ENV1')
  '20'
  ```


  - **@params**:
    - _string_ **name**

  {.params}
  - **@returns**: _string_
  {.returns}



_os_.set\_env(_name_, _value_, _overwrite_) {#os.set_env}

: Sets the named environment variable to the given value.
  
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


  > **@notes**:
  > 
  > - Environment variables set will not persist after application exists.

  - **@params**:
    - _string_ **name**
    - _string_ **value**
    - _bool?_ **overwrite** Default value is `false`.


  {.params}
  - **@returns**: _string_
  {.returns}



_os_.create\_dir(_path_, _permission_, _recursive_) {#os.create_dir}

: Creates the given directory with the specified permission and optionally
  add new files into it if any is given.


  > **@notes**:
  > 
  > - if the directory already exists, it returns `false` otherwise, it returns `true`.

  > - permission should be given as octal number.

  - **@params**:
    - _string_ **path**
    - _number?_ **permission** Default value is `0c777`

    - _bool?_ **recursive** Default value is `true`.


  {.params}
  - **@returns**: _boolean_
  {.returns}



_os_.read\_dir(_path_) {#os.read_dir}

: Scans the given directory and returns a list of all matched files
  
  
  Example,
  
  ```blade-repl
  %> os.read_dir('./tests')
  [., .., myprogram.b, single_thread.b, test.b, buggy.b]
  ```


  > **@notes**:
  > 
  > - `.` indicates current directory and can be used as argument to _os.path_ as well.

  > - `..` indicates parent directory and can be used as argument to _os.path_ as well.

  - **@params**:
    - _string_ **path**

  {.params}
  - **@returns**: _list[string]_
  {.returns}



_os_.chmod(_path_, _mode_) {#os.chmod}

: Changes the permission set on a directory to the given mode. It is advisable 
  to set the mode with an octal number (e.g. 0c777) as this is consistent with 
  operating system values.


  - **@params**:
    - _string_ **path**
    - _number_ **mode**

  {.params}
  - **@returns**: _boolean_
  {.returns}



_os_.is\_dir(_path_) {#os.is_dir}

: Returns `true` if the path is a directory or `false` otherwise.


  - **@params**:
    - _string_ **path**

  {.params}
  - **@returns**: _bool_
  {.returns}



_os_.remove\_dir(_path_, _recursive_) {#os.remove_dir}

: Deletes a non-empty directory. If recursive is `true`, non-empty directories 
  will have their contents deleted first.


  - **@params**:
    - _string_ **path**
    - _bool_ **recursive** Default value is `false`.


  {.params}
  - **@returns**: _bool_
  {.returns}



_os_.cwd() {#os.cwd}

: Returns the current working directory.


  - **@returns**: _string_
  {.returns}



_os_.change\_dir(_path_) {#os.change_dir}

: Navigates the working directory into the specified path.


  - **@params**:
    - _string_ **path**

  {.params}
  - **@returns**: _bool_
  {.returns}



_os_.dir\_exists(_path_) {#os.dir_exists}

: Returns `true` if the directory exists or `false` otherwise.


  - **@params**:
    - _string_ **path**

  {.params}
  - **@returns**: _bool_
  {.returns}



_os_.exit(_code_) {#os.exit}

: Exit the current process and quits the Blade runtime.


  - **@params**:
    - _number_ **code**

  {.params}



_os_.join\_paths(_..._) {#os.join_paths}

: Concatenates the given paths together into a format that is valid on the
  current operating system.
  
  Example,
  
  ```blade-repl
  %> os.join_paths('/home/user', 'path/to/myfile.ext')
  '/home/user/path/to/myfile.ext'
  ```


  - **@params**:
    - _string..._ **paths**

  {.params}
  - **@returns**: _string_
  {.returns}



_os_.real\_path(_path_) {#os.real_path}

: Returns the original path to a relative path.


  > **@notes**:
  > 
  > - if the path is a file, see `abs_path()`.

  - **@params**:
    - _string_ **path**

  {.params}
  - **@returns**: _string_
  {.returns}



_os_.abs\_path(_path_) {#os.abs_path}

: Returns the original path to a relative path.


  > **@notes**:
  > 
  > - unlike real_path(), this function returns full path for a file.

  - **@params**:
    - _string_ **path**

  {.params}
  - **@returns**: _string_
  {.returns}



_os_.dir\_name(_path_) {#os.dir_name}

: Returns the parent directory of the pathname pointed to by `path`.  Any trailing
  `/` characters are not counted as part of the directory name.  If `path` is an
  empty string, or contains no `/` characters, dir_name() returns the string ".", 
  signifying the current directory.


  - **@params**:
    - _string_ **path**

  {.params}
  - **@returns**: _string_
  {.returns}



_os_.base\_name(_path_) {#os.base_name}

: The base_name() function returns the last component from the pathname pointed to by 
  `path`, deleting any trailing `/` characters.  If path consists entirely of `/` 
  characters, the string '/' is returned.  If path is an empty string, the string '.' 
  is returned.


  - **@params**:
    - _string_ **path**

  {.params}
  - **@returns**: _string_
  {.returns}



