# args
This module provides functionalities that makes writing command-line 
interfaces easy. A user can define the options and commands available 
in a program and this module can automatically figure out how to parse 
those options and commands out of the CLI arguments. It also provides 
automatic help and usage messages as well as error/warnings generation 
for valid/invalid arguments.

### Example

The below is a simple program that shows a typical use of the module.

```blade
import args

var parser = args.Parser('myprogram')
parser.add_option('name', 'The name of person to call', {type: args.STRING})
parser.add_command('call', 'Make a phone call')
parser.parse()
```

We can simply print help information for the above program if it were saved 
in a file `myprogram.b` as follows.

```sh
$ blade myprogram.b -h 
Usage: myprogram [ [-h] | [--name NAME] ] [COMMAND]

OPTIONS:
  -h, --help                 Show this help message and exit
      --name <value>         The name of person to call

COMMANDS:
  call                       Make a phone call
```

if we change the last line of the program to `echo parser.parse()` so that we 
can see the result of the parsing, the following CLI call will yield the given result.

```terminal
$ blade myprogram.b --name 25
{options: {name: 25}, command: nil}

$ blade myprogram.b call  
{options: {}, command: {name: call, value: nil}}

$ blade myprogram.b call --name 25
{options: {name: 25}, command: {name: call, value: nil}}
```

Calling name without an option will yield the following result/error.

```sh
$ blade myprogram.b --name   
error: Option "name" expects a value
```

You may even get help on a command directly like below:

```sh
$ blade myprogram.b --help call
Usage: myprogram call

  Make a phone call
```

## Properties

- **NONE**:

  value type none

- **INT**:

  value type integer (allows numbers, but floors them to integers)

- **NUMBER**:

  value type number

- **BOOL**:

  value type boolean (accepts `1` and `0` as well as `true` 
and `false` as valid values).

- **STRING**:

  value type string

- **LIST**:

  value type for list

- **CHOICE**:

  value type enumeration choices.


## Classes

### _class_ ArgsException < _Exception_

Commandline argument exception.



### _class_ Parser

A configurable commandline parser.

#### Fields

- **commands**:

  A list of commands supported by the parser.

- **indexes**:

  A list of positional values supported by the parser.

#### Methods

#### Parser(name, default_help) &#8674; Constructor



##### Parameters

- _string_ **name**: : Refers to the name of the cli program.
- _bool?_ **default_help**: : Whether to show help when no command or option is matched or not &mdash; Default value is `true`.


#### add\_option(name, help, opts)

Adds a support for a new command to the parser.

The `opts` dictionary can contain one or more of:

- `short_name`: A shorter version of the option name parsed via 
single hyphens (`-`) without the hyphen. For example, short_name `v` 
will match `-v` in the commandline.
- `type`: type must be one of the args types and will indicate 
how the parsed data should be interpreted in the final result.
- `value`: tells the parser the default value for this option.
- `choices`: a list of allowed options or a dictionary of allowed 
options with their respective descriptions.

##### Parameters

- _string_ **name**
- _string?_ **help**
- _dict?_ **opts**

##### Notes

- the `choices` option only works for type `CHOICE`.

#### add\_command(name, help, opts)

Adds a support for a new command to the parser.

The `opts` dictionary can contain one or more of:

- `type`: type must be one of the args types and will indicate 
how the parsed data should be interpreted in the final result.
- `choices`: a list of allowed options or a dictionary of allowed 
options with their respective descriptions.
- The `action` property must be a function.

##### Parameters

- _string_ **name**
- _string?_ **help**
- _dict?_ **opts**

##### Notes

- the `choices` option only works for type `CHOICE`.

#### add\_index(name, help, opts)

Adds a support for a new positional argument to the parser.

The `opts` dictionary can contain one or more of:

- `type`: type must be one of the args types and will indicate 
how the parsed data should be interpreted in the final result.
- `value`: tells the parser the default value for this index.
- `choices`: a list of allowed options or a dictionary of allowed 
values with their respective descriptions.

##### Parameters

- _string_ **name**
- _string?_ **help**
- _dict?_ **opts**

##### Notes

- the `choices` option only works for type `CHOICE`.

#### parse()

Parses the commandline arguments and returns a dictionary of command 
and options.

For example, parsing the commandline

```
blade test.b install 5 --verbose
``` 

may yield such a result as similar to the one below.

```
{options: {verbose: true}, command: {name: install, value: 5}}
```

##### Returns

- dict

#### help()

Show the help message.



