# io

This module provides interfaces for working with to I/O stream and TTYs 
as well as expose the operating system standard I/O for easy access.

Some I/O operations that should belong to this module have been merged as 
core features and offered as built-in functions for Zuri. Specifically 
file I/O features that can be accessed via the built-in `file()` function. 

The standard I/O streams are also files and you can call almost all file 
methods on them. Whenever a file method is not supported, you'll get an error 
message telling you that such operation is not supported for standard streams.

### Example

The following example shows how to use the `io` module for accepting user name 
and printing the result.

```zuri
import io

var name = io.readline('What is your name?')
echo name
```

## Fields

_io_.**SEEK\_SET** &#x279D; _int_ {#io.SEEK_SET}
: Set I/O position from the beginning.

_io_.**SEEK\_CUR** &#x279D; _int_ {#io.SEEK_CUR}
: Set I/O position from the current position.

_io_.**SEEK\_END** &#x279D; _int_ {#io.SEEK_END}
: Set I/O position from the end.

_io_.**stdin** &#x279D; _file_ {#io.stdin}
: Stdin is a file handle to the standard input file of the system.

_io_.**stdout** &#x279D; _file_ {#io.stdout}
: Stdout is a file handle to the standard output file of the system.

_io_.**stderr** &#x279D; _file_ {#io.stderr}
: Stderr is a file handle to the standard error file of the system.


## Functions

_io_.flush(_file_) {#io.flush}

: Flushes the content of the given file handle





_io_.putc(_c_) {#io.putc}

: Writes character c to the screen.


  - **@params**:
    - _char|number_ **c**

  {.params}



_io_.getc() {#io.getc}

: Reads character(s) from standard input
  When length is given, gets `length` number of characters
  else, gets a single character


  - **@returns**: _char|string_
  {.returns}



_io_.getch() {#io.getch}

: Reads character(s) from standard input without printing to standard output
  When length is given, gets `length` number of characters
  else, gets a single character.


  - **@returns**: _char|string_
  {.returns}



_io_.readline(_message_, _secure_, _obscure_text_) {#io.readline}

: Reads an entire line from standard input. If a _message_ is given, the
  message will be printed before it begins to wait for a user input. If 
  _secure_ is `true`, the user's input will not be printing and _obscure_text_ 
  will be printed instead.


  > **@notes**:
  > 
  > - Newlines will not be added automatically for messages.

  - **@params**:
    - _string?_ **message**
    - _bool?_ **secure**
    - _string?_ **obscure_text** Default value is `*`.


  {.params}
  - **@returns**: _string_
  {.returns}



## Classes

_class_ **TTY** {#io.TTY .class}

: class TTY is an interface to TTY terminals this class contains definitions
  to control TTY terminals


  _static_ **.TTY\_IFLAG** &#x279D; _int_ {#io.TTY.TTY_IFLAG}
  : TTY attribute for input flags.

  _static_ **.TTY\_OFLAG** &#x279D; _int_ {#io.TTY.TTY_OFLAG}
  : TTY attribute for output flags.

  _static_ **.TTY\_CFLAG** &#x279D; _int_ {#io.TTY.TTY_CFLAG}
  : TTY attribute for control flags.

  _static_ **.TTY\_LFLAG** &#x279D; _int_ {#io.TTY.TTY_LFLAG}
  : TTY attribute for local flags.

  _static_ **.TTY\_ISPEED** &#x279D; _int_ {#io.TTY.TTY_ISPEED}
  : TTY attribute for input speed.

  _static_ **.TTY\_OSPEED** &#x279D; _int_ {#io.TTY.TTY_OSPEED}
  : TTY attribute for output speed.

  _static_ **.IGNBRK** &#x279D; _int_ {#io.TTY.IGNBRK}
  : Ignore BREAK condition.

  _static_ **.BRKINT** &#x279D; _int_ {#io.TTY.BRKINT}
  : Map BREAK to SIGINTR.

  _static_ **.IGNPAR** &#x279D; _int_ {#io.TTY.IGNPAR}
  : Ignore (discard) parity errors.

  _static_ **.PARMRK** &#x279D; _int_ {#io.TTY.PARMRK}
  : Mark parity and framing errors.

  _static_ **.INPCK** &#x279D; _int_ {#io.TTY.INPCK}
  : Enable checking of parity errors.

  _static_ **.ISTRIP** &#x279D; _int_ {#io.TTY.ISTRIP}
  : Strip 8th bit off chars.

  _static_ **.INLCR** &#x279D; _int_ {#io.TTY.INLCR}
  : Map NL into CR.

  _static_ **.IGNCR** &#x279D; _int_ {#io.TTY.IGNCR}
  : Ignore CR.

  _static_ **.ICRNL** &#x279D; _int_ {#io.TTY.ICRNL}
  : Map CR to NL (ala CRMOD).

  _static_ **.IXON** &#x279D; _int_ {#io.TTY.IXON}
  : Enable output flow control.

  _static_ **.IXOFF** &#x279D; _int_ {#io.TTY.IXOFF}
  : Enable input flow control.

  _static_ **.IXANY** &#x279D; _int_ {#io.TTY.IXANY}
  : Any char will restart after stop.

  _static_ **.IUTF8** &#x279D; _int_ {#io.TTY.IUTF8}
  : Maintain state for UTF-8 VERASE.

  _static_ **.OPOST** &#x279D; _int_ {#io.TTY.OPOST}
  : Enable following output processing.

  _static_ **.ONLCR** &#x279D; _int_ {#io.TTY.ONLCR}
  : Map NL to CR-NL (ala CRMOD).

  _static_ **.CSIZE** &#x279D; _int_ {#io.TTY.CSIZE}
  : Character size mask .

  _static_ **.CS5** &#x279D; _int_ {#io.TTY.CS5}
  : 5 bits (pseudo).

  _static_ **.CS6** &#x279D; _int_ {#io.TTY.CS6}
  : 6 bits.

  _static_ **.CS7** &#x279D; _int_ {#io.TTY.CS7}
  : 7 bits.

  _static_ **.CS8** &#x279D; _int_ {#io.TTY.CS8}
  : 8 bits.

  _static_ **.CSTOPB** &#x279D; _int_ {#io.TTY.CSTOPB}
  : Send 2 stop bits.

  _static_ **.CREAD** &#x279D; _int_ {#io.TTY.CREAD}
  : Enable receiver.

  _static_ **.PARENB** &#x279D; _int_ {#io.TTY.PARENB}
  : Parity enable.

  _static_ **.PARODD** &#x279D; _int_ {#io.TTY.PARODD}
  : Odd parity, else even.

  _static_ **.HUPCL** &#x279D; _int_ {#io.TTY.HUPCL}
  : Hang up on last close.

  _static_ **.CLOCAL** &#x279D; _int_ {#io.TTY.CLOCAL}
  : Ignore modem status lines.

  _static_ **.ECHOE** &#x279D; _int_ {#io.TTY.ECHOE}
  : Visually erase chars.

  _static_ **.ECHOK** &#x279D; {#io.TTY.ECHOK}
  : Echo NL after line kill

  _static_ **.ECHO** &#x279D; _int_ {#io.TTY.ECHO}
  : Enable echoing.

  _static_ **.ECHONL** &#x279D; _int_ {#io.TTY.ECHONL}
  : Echo NL even if ECHO is off.

  _static_ **.ISIG** &#x279D; _int_ {#io.TTY.ISIG}
  : Enable signals INTR, QUIT, [D]SUSP.

  _static_ **.ICANON** &#x279D; _int_ {#io.TTY.ICANON}
  : Canonicalize input lines.

  _static_ **.IEXTEN** &#x279D; _int_ {#io.TTY.IEXTEN}
  : Enable DISCARD and LNEXT.

  _static_ **.TOSTOP** &#x279D; _int_ {#io.TTY.TOSTOP}
  : Stop background jobs from output.

  _static_ **.NOFLSH** &#x279D; _int_ {#io.TTY.NOFLSH}
  : Don't flush after interrupt.

  _static_ **.TCSANOW** &#x279D; _int_ {#io.TTY.TCSANOW}
  : Make change immediate.

  _static_ **.TCSADRAIN** &#x279D; _int_ {#io.TTY.TCSADRAIN}
  : Drain output, then change.

  _static_ **.TCSAFLUSH** &#x279D; _int_ {#io.TTY.TCSAFLUSH}
  : Drain output, flush input.

  _static_ **.VEOF** &#x279D; _int_ {#io.TTY.VEOF}
  : ICANON.

  _static_ **.VEOL** &#x279D; _int_ {#io.TTY.VEOL}
  : ICANON.

  _static_ **.VERASE** &#x279D; _int_ {#io.TTY.VERASE}
  : ICANON.

  _static_ **.VKILL** &#x279D; _int_ {#io.TTY.VKILL}
  : ICANON.

  _static_ **.VINTR** &#x279D; _int_ {#io.TTY.VINTR}
  : ISIG.

  _static_ **.VQUIT** &#x279D; _int_ {#io.TTY.VQUIT}
  : ISIG.

  _static_ **.VSUSP** &#x279D; _int_ {#io.TTY.VSUSP}
  : ISIG.

  _static_ **.VSTART** &#x279D; _int_ {#io.TTY.VSTART}
  : IXON, IXOFF.

  _static_ **.VSTOP** &#x279D; _int_ {#io.TTY.VSTOP}
  : IXON, IXOFF.

  _static_ **.VMIN** &#x279D; _int_ {#io.TTY.VMIN}
  : !ICANON.

  _static_ **.VTIME** &#x279D; _int_ {#io.TTY.VTIME}
  : !ICANON.


  .TTY(_std_) &#x279D; _Constructor_ {#io.TTY.TTY}

  : TTY(std: file)


    > **@notes**:
    > 
    > - _file_ must be one of stdout and stderr

    - **@params**:
      - _file_ **std**

    {.params}


  .get\_attr() {#io.TTY.get_attr}

  : Returns the attribute of the current tty session
    The returned attributes is a dict containing the TTY_ flags


    - **@returns**: _dict_
    {.returns}


  .set\_attr(_option_, _attrs_) {#io.TTY.set_attr}

  : sets the attributes of the current tty session
    >  __NOTE__: 
    > - _option_ must be one ot the TCSA options above (see their description above)
    > - _attrs_ must be a dictionary of the TTY_ flags listed above
    > - one can safely omit any of the TTY_ flags listed above and Zuri will
    >   fill in the default values as it exists.
    > - This flags will be merged and not overwritten


    - **@params**:
      - _number_ **option**
      - _dict_ **attr**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .set\_raw() {#io.TTY.set_raw}

  : Sets the current tty to raw mode.


    - **@returns**: _bool_
    {.returns}


  .exit\_raw() {#io.TTY.exit_raw}

  : Disables the raw mode flags on the current tty.


    - **@returns**: _bool_
    {.returns}


  .get\_size() {#io.TTY.get_size}

  : Returns the size of the current TTY device as a dictionary of cols and rows.
    
    - `cols`: The number of text columns that can fit into the TTY device.
    - `rows`: The number of text rows that can fit into the TTY device.


    - **@returns**: _dict_
    {.returns}


  .flush() {#io.TTY.flush}

  : Flushes the standard output and standard error interface






_class_ **BytesIO** {#io.BytesIO .class}

: The BytesIO class implements a bytearray based I/O system 
  that allows you use treat bytearray (bytes) as if they were 
  a file.
  
  The class implements the essentials of a file except those 
  that ties it to the operating system filesystem such as 
  symbolic links, chmod and set time.
  
  See the tutorial on [working with files](/tutorial/working-with-files) 
  for more information.



  .BytesIO(_source_, _mode_) &#x279D; _Constructor_ {#io.BytesIO.BytesIO}

  : Returns a new instance of BytesIO


    - **@params**:
      - _bytes_ **source**
      - _string_ **mode** The I/O open mode - Default is `r`


    {.params}


  .exists() {#io.BytesIO.exists}

  : Returns `true` as BytesIO always exist.


    - **@returns**: _bool_
    {.returns}


  .close() {#io.BytesIO.close}

  : Closes the stream to an opened BytesIO. You'll rarely ever 
    need to call this method yourself in most use cases.




  .open() {#io.BytesIO.open}

  : Opens the stream to a BytesIO for the operation originally 
    specified on the BytesIO object during creation. 
    
    You may need to call this method after a call to `read()` 
    if the length isn't specified or `write()` if you wish to 
    read or write again as the BytesIO will already be closed.




  .read(_length_) {#io.BytesIO.read}

  : Reads the content of an opened BytesIO up to the specified length 
    and returns it as string or bytes if the BytesIO was opened in the 
    binary mode. If the length is not specified, the BytesIO will be 
    read to the end.
    
    This method requires that the BytesIO be opened in the read mode 
    (default mode) or a mode that supports reading. If you aren't 
    reading the full length of the BytesIO, you'll need to call the 
    close() method to free the BytesIO for further reading, otherwise, 
    the close() method will be automatically called for you.
    
    
    
    @throws Exception


    - **@params**:
      - _number_ **length** Default = -1


    {.params}
    - **@returns**: _bytes_
    {.returns}


  .gets(_length_) {#io.BytesIO.gets}

  : Same as `read()`, but doesn't open or close the BytesIO automatically.
    
    
    
    @throws Exception


    - **@params**:
      - _number_ **length** Default = -1


    {.params}
    - **@returns**: _bytes_
    {.returns}


  .write(_data_) {#io.BytesIO.write}

  : Writes a string or bytes to an opened BytesIO at the current insertion 
    point. When the BytesIO is opened with the a mode enabled, write will 
    always start from the end of the BytesIO. 
    
    If the seek() method has been previously called, write will begin 
    from the seeked position, otherwise it will start at the beginning 
    of the BytesIO.


    - **@params**:
      - _bytes|string_

    {.params}
    - **@returns**: _number_
    {.returns}


  .puts(_data_) {#io.BytesIO.puts}

  : Same as `write()`, but doesn't open or close the BytesIO automatically.


    - **@params**:
      - _bytes|string_

    {.params}
    - **@returns**: _number_
    {.returns}


  .number() {#io.BytesIO.number}

  : Returns the integer file descriptor number that is used by the 
    underlying implementation to request I/O operations from the 
    operating system. This can be very useful for low-level interfaces 
    that uses or act as BytesIO descriptors.


    - **@returns**: _number_
    {.returns}


  .is\_tty() {#io.BytesIO.is_tty}

  : Always returns `false` as a BytesIO is not a TTY device.


    - **@returns**: _bool_
    {.returns}


  .is\_open() {#io.BytesIO.is_open}

  : Returns `true` if the BytesIO is open for reading or writing and 
    `false` otherwise.


    - **@returns**: _bool_
    {.returns}


  .is\_closed() {#io.BytesIO.is_closed}

  : Returns `true` if the BytesIO is closed for reading or writing and 
    `false` otherwise.




  .flush() {#io.BytesIO.flush}

  : Does nothing for a BytesIO




  .symlink(_path_) {#io.BytesIO.symlink}

  : Does nothing for BytesIO but simply returns `false` because 
    BytesIO cannot be symbolically linked.


    - **@returns**: _bool_
    {.returns}


  .stats() {#io.BytesIO.stats}

  : Returns the statistics or details of the BytesIO.
    
    See the working with files documentation for more information 
    about the `stats()` method.


    - **@returns**: _dict_
    {.returns}


  .delete() {#io.BytesIO.delete}

  : Clears the bytearray and closes it for reading or writing.
    
    Any further attempt to perform most operations on the BytesIO 
    after calling `delete()` will raise an exception.


    - **@returns**: _bool_
    {.returns}


  .rename(_new_name_) {#io.BytesIO.rename}

  : Returns `false` because BytesIO cannot be renamed.


    - **@returns**: _bool_
    {.returns}


  .copy() {#io.BytesIO.copy}

  : Returns a new BytesIO with the source cloned and opened with 
    the same mode as the current BytesIO.


    - **@returns**: _[BytesIO](#io.BytesIO)_
    {.returns}


  .path() {#io.BytesIO.path}

  : Returns an empty string because BytesIO do not have any 
    physical path.


    - **@returns**: _string_
    {.returns}


  .abs\_path() {#io.BytesIO.abs_path}

  : Same as [BytesIO.path()](#io.BytesIO.path).


    - **@returns**: _string_
    {.returns}


  .truncate(_length_) {#io.BytesIO.truncate}

  : Truncates the entire BytesIO if length is not given or truncates 
    the BytesIO such that only length number of bytes is left in it.


    - **@returns**: _bool_
    {.returns}


  .chmod(_number_) {#io.BytesIO.chmod}

  : Returns `false` because BytesIO do not have a permission scheme.


    - **@returns**: _bool_
    {.returns}


  .set\_times(_atime_, _mtime_) {#io.BytesIO.set_times}

  : Sets the last access time and last modified time of the BytesIO.


    - **@returns**: _bool_
    {.returns}


  .seek(_position_, _seek_type_) {#io.BytesIO.seek}

  : Sets the position of a BytesIO reader or writer in a BytesIO. 
    
    The position must be within the range of the BytesIO size. The 
    `seek_type` argument must be on of [SEEK_SET](#io.SEEK_SET), 
    [SEEK_CUR](#io.SEEK_CUR) or [SEEK_END](#io.SEEK_END).


    - **@returns**: _bool_
    {.returns}


  .tell() {#io.BytesIO.tell}

  : Returns the current position of the reader/writer in the BytesIO.


    - **@returns**: _number_
    {.returns}


  .mode() {#io.BytesIO.mode}

  : Returns the mode in which the current BytesIO was opened.


    - **@returns**: _string_
    {.returns}


  .name() {#io.BytesIO.name}

  : Returns an empty string since BytesIO do not have a name.


    - **@returns**: _string_
    {.returns}




