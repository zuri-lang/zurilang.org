# io

This module provides interfaces for working with to I/O stream and TTYs 
as well as expose the operating system standard I/O for easy access.

Some I/O operations that should belong to this module have been merged as 
core features and offered as built-in functions for Blade. Specifically 
file I/O features that can be accessed via the built-in `file()` function. 

The standard I/O streams are also files and you can call almost all file 
methods on them. Whenever a file method is not supported, you'll get an error 
message telling you that such operation is not supported for standard streams.

### Example

The following example shows how to use the `io` module for accepting user name 
and printing the result.

```blade
import io

var name = io.readline('What is your name?')
echo name
```

## Fields

_io_.**SEEK\_SET** &#x279D; _int_
: Set I/O position from the beginning.

_io_.**SEEK\_CUR** &#x279D; _int_
: Set I/O position from the current position.

_io_.**SEEK\_END** &#x279D; _int_
: Set I/O position from the end.

_io_.**stdin** &#x279D; _file_
: Stdin is a file handle to the standard input file of the system.

_io_.**stdout** &#x279D; _file_
: Stdout is a file handle to the standard output file of the system.

_io_.**stderr** &#x279D; _file_
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
    - _string?_ **obscure_text** : Default value is `*`.


  {.params}
  - **@returns**: _string_
  {.returns}



## Classes

_class_ **TTY** {#io.TTY .class}

: class TTY is an interface to TTY terminals this class contains definitions
  to control TTY terminals


  **.TTY\_IFLAG** &#x279D; _static_ _int_
  : TTY attribute for input flags.

  **.TTY\_OFLAG** &#x279D; _static_ _int_
  : TTY attribute for output flags.

  **.TTY\_CFLAG** &#x279D; _static_ _int_
  : TTY attribute for control flags.

  **.TTY\_LFLAG** &#x279D; _static_ _int_
  : TTY attribute for local flags.

  **.TTY\_ISPEED** &#x279D; _static_ _int_
  : TTY attribute for input speed.

  **.TTY\_OSPEED** &#x279D; _static_ _int_
  : TTY attribute for output speed.

  **.IGNBRK** &#x279D; _static_ _int_
  : Ignore BREAK condition.

  **.BRKINT** &#x279D; _static_ _int_
  : Map BREAK to SIGINTR.

  **.IGNPAR** &#x279D; _static_ _int_
  : Ignore (discard) parity errors.

  **.PARMRK** &#x279D; _static_ _int_
  : Mark parity and framing errors.

  **.INPCK** &#x279D; _static_ _int_
  : Enable checking of parity errors.

  **.ISTRIP** &#x279D; _static_ _int_
  : Strip 8th bit off chars.

  **.INLCR** &#x279D; _static_ _int_
  : Map NL into CR.

  **.IGNCR** &#x279D; _static_ _int_
  : Ignore CR.

  **.ICRNL** &#x279D; _static_ _int_
  : Map CR to NL (ala CRMOD).

  **.IXON** &#x279D; _static_ _int_
  : Enable output flow control.

  **.IXOFF** &#x279D; _static_ _int_
  : Enable input flow control.

  **.IXANY** &#x279D; _static_ _int_
  : Any char will restart after stop.

  **.IUTF8** &#x279D; _static_ _int_
  : Maintain state for UTF-8 VERASE.

  **.OPOST** &#x279D; _static_ _int_
  : Enable following output processing.

  **.ONLCR** &#x279D; _static_ _int_
  : Map NL to CR-NL (ala CRMOD).

  **.CSIZE** &#x279D; _static_ _int_
  : Character size mask .

  **.CS5** &#x279D; _static_ _int_
  : 5 bits (pseudo).

  **.CS6** &#x279D; _static_ _int_
  : 6 bits.

  **.CS7** &#x279D; _static_ _int_
  : 7 bits.

  **.CS8** &#x279D; _static_ _int_
  : 8 bits.

  **.CSTOPB** &#x279D; _static_ _int_
  : Send 2 stop bits.

  **.CREAD** &#x279D; _static_ _int_
  : Enable receiver.

  **.PARENB** &#x279D; _static_ _int_
  : Parity enable.

  **.PARODD** &#x279D; _static_ _int_
  : Odd parity, else even.

  **.HUPCL** &#x279D; _static_ _int_
  : Hang up on last close.

  **.CLOCAL** &#x279D; _static_ _int_
  : Ignore modem status lines.

  **.ECHOE** &#x279D; _static_ _int_
  : Visually erase chars.

  **.ECHOK** &#x279D; _static_
  : Echo NL after line kill

  **.ECHO** &#x279D; _static_ _int_
  : Enable echoing.

  **.ECHONL** &#x279D; _static_ _int_
  : Echo NL even if ECHO is off.

  **.ISIG** &#x279D; _static_ _int_
  : Enable signals INTR, QUIT, [D]SUSP.

  **.ICANON** &#x279D; _static_ _int_
  : Canonicalize input lines.

  **.IEXTEN** &#x279D; _static_ _int_
  : Enable DISCARD and LNEXT.

  **.TOSTOP** &#x279D; _static_ _int_
  : Stop background jobs from output.

  **.NOFLSH** &#x279D; _static_ _int_
  : Don't flush after interrupt.

  **.TCSANOW** &#x279D; _static_ _int_
  : Make change immediate.

  **.TCSADRAIN** &#x279D; _static_ _int_
  : Drain output, then change.

  **.TCSAFLUSH** &#x279D; _static_ _int_
  : Drain output, flush input.

  **.VEOF** &#x279D; _static_ _int_
  : ICANON.

  **.VEOL** &#x279D; _static_ _int_
  : ICANON.

  **.VERASE** &#x279D; _static_ _int_
  : ICANON.

  **.VKILL** &#x279D; _static_ _int_
  : ICANON.

  **.VINTR** &#x279D; _static_ _int_
  : ISIG.

  **.VQUIT** &#x279D; _static_ _int_
  : ISIG.

  **.VSUSP** &#x279D; _static_ _int_
  : ISIG.

  **.VSTART** &#x279D; _static_ _int_
  : IXON, IXOFF.

  **.VSTOP** &#x279D; _static_ _int_
  : IXON, IXOFF.

  **.VMIN** &#x279D; _static_ _int_
  : !ICANON.

  **.VTIME** &#x279D; _static_ _int_
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
    > - one can safely omit any of the TTY_ flags listed above and Blade will
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


  .flush() {#io.TTY.flush}

  : Flushes the standard output and standard error interface






