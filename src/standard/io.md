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


  _static_ .**.TTY\_IFLAG** &#x279D; _int_
  : TTY attribute for input flags.

  _static_ .**.TTY\_OFLAG** &#x279D; _int_
  : TTY attribute for output flags.

  _static_ .**.TTY\_CFLAG** &#x279D; _int_
  : TTY attribute for control flags.

  _static_ .**.TTY\_LFLAG** &#x279D; _int_
  : TTY attribute for local flags.

  _static_ .**.TTY\_ISPEED** &#x279D; _int_
  : TTY attribute for input speed.

  _static_ .**.TTY\_OSPEED** &#x279D; _int_
  : TTY attribute for output speed.

  _static_ .**.IGNBRK** &#x279D; _int_
  : Ignore BREAK condition.

  _static_ .**.BRKINT** &#x279D; _int_
  : Map BREAK to SIGINTR.

  _static_ .**.IGNPAR** &#x279D; _int_
  : Ignore (discard) parity errors.

  _static_ .**.PARMRK** &#x279D; _int_
  : Mark parity and framing errors.

  _static_ .**.INPCK** &#x279D; _int_
  : Enable checking of parity errors.

  _static_ .**.ISTRIP** &#x279D; _int_
  : Strip 8th bit off chars.

  _static_ .**.INLCR** &#x279D; _int_
  : Map NL into CR.

  _static_ .**.IGNCR** &#x279D; _int_
  : Ignore CR.

  _static_ .**.ICRNL** &#x279D; _int_
  : Map CR to NL (ala CRMOD).

  _static_ .**.IXON** &#x279D; _int_
  : Enable output flow control.

  _static_ .**.IXOFF** &#x279D; _int_
  : Enable input flow control.

  _static_ .**.IXANY** &#x279D; _int_
  : Any char will restart after stop.

  _static_ .**.IUTF8** &#x279D; _int_
  : Maintain state for UTF-8 VERASE.

  _static_ .**.OPOST** &#x279D; _int_
  : Enable following output processing.

  _static_ .**.ONLCR** &#x279D; _int_
  : Map NL to CR-NL (ala CRMOD).

  _static_ .**.CSIZE** &#x279D; _int_
  : Character size mask .

  _static_ .**.CS5** &#x279D; _int_
  : 5 bits (pseudo).

  _static_ .**.CS6** &#x279D; _int_
  : 6 bits.

  _static_ .**.CS7** &#x279D; _int_
  : 7 bits.

  _static_ .**.CS8** &#x279D; _int_
  : 8 bits.

  _static_ .**.CSTOPB** &#x279D; _int_
  : Send 2 stop bits.

  _static_ .**.CREAD** &#x279D; _int_
  : Enable receiver.

  _static_ .**.PARENB** &#x279D; _int_
  : Parity enable.

  _static_ .**.PARODD** &#x279D; _int_
  : Odd parity, else even.

  _static_ .**.HUPCL** &#x279D; _int_
  : Hang up on last close.

  _static_ .**.CLOCAL** &#x279D; _int_
  : Ignore modem status lines.

  _static_ .**.ECHOE** &#x279D; _int_
  : Visually erase chars.

  _static_ .**.ECHOK** &#x279D;
  : Echo NL after line kill

  _static_ .**.ECHO** &#x279D; _int_
  : Enable echoing.

  _static_ .**.ECHONL** &#x279D; _int_
  : Echo NL even if ECHO is off.

  _static_ .**.ISIG** &#x279D; _int_
  : Enable signals INTR, QUIT, [D]SUSP.

  _static_ .**.ICANON** &#x279D; _int_
  : Canonicalize input lines.

  _static_ .**.IEXTEN** &#x279D; _int_
  : Enable DISCARD and LNEXT.

  _static_ .**.TOSTOP** &#x279D; _int_
  : Stop background jobs from output.

  _static_ .**.NOFLSH** &#x279D; _int_
  : Don't flush after interrupt.

  _static_ .**.TCSANOW** &#x279D; _int_
  : Make change immediate.

  _static_ .**.TCSADRAIN** &#x279D; _int_
  : Drain output, then change.

  _static_ .**.TCSAFLUSH** &#x279D; _int_
  : Drain output, flush input.

  _static_ .**.VEOF** &#x279D; _int_
  : ICANON.

  _static_ .**.VEOL** &#x279D; _int_
  : ICANON.

  _static_ .**.VERASE** &#x279D; _int_
  : ICANON.

  _static_ .**.VKILL** &#x279D; _int_
  : ICANON.

  _static_ .**.VINTR** &#x279D; _int_
  : ISIG.

  _static_ .**.VQUIT** &#x279D; _int_
  : ISIG.

  _static_ .**.VSUSP** &#x279D; _int_
  : ISIG.

  _static_ .**.VSTART** &#x279D; _int_
  : IXON, IXOFF.

  _static_ .**.VSTOP** &#x279D; _int_
  : IXON, IXOFF.

  _static_ .**.VMIN** &#x279D; _int_
  : !ICANON.

  _static_ .**.VTIME** &#x279D; _int_
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






