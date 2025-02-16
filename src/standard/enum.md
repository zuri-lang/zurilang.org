# enum
This module provides support for enumerations in Blade.
An enumeration in Blade is a set of unique values bound to symbolic
names via an alias.
Enums are single state instances similar to a dictionary but having
automatically or distinctly assigned values.

You can create an enumeration by calling the `enum()` function and 
initializing it with either a list of constants (as string) or a 
dictionary. When an enumeration is initialized with a list, individual 
items in the list are automatically assigned an ordinal value 
starting from zero (0). 

For example:

```blade-repl
%> import enum
%> 
%> var Gender = enum(['Male', 'Female'])
%> to_string(Gender)
'<Enum Male=0 Female=1>'
```

If an enumeration is initialized with a dictionary, the keys are 
automatically bound to the values as defined in the dictionary. This can 
be useful if your enumeration requires values that are not in order or 
require specific values. When an enumeration is initialized with a 
dictionary, the values of the enumeration constants can be either a 
number or a string. 

For example:

```blade-repl
%> import enum
%> 
%> var Color = enum({
..   Red: 'r',
..   Green: 'g',
..   Blue: 'b',
.. })
%> echo to_string(Color)
'<Enum Red=r Green=g Blue=b>'
```

Enums can never contain duplicate keys and do not _normally_ allow 
duplicate values as they are unique by default and an attempt to 
duplicate a key or value will raise an Exception. 

For example:

```blade-repl
%> import enum
%> 
%> var Speed = enum({
..   Slow: 1,
..   Sluggish: 1,
..   Fast: 2,
.. })
Illegal State: duplicate enumeration value "1" at "Sluggish"
  StackTrace:
    <repl>:5 -> @.script()
```

To allow duplicate values in an enumeration if desired, you can pass 
a second argument _false_ after the initialization data to disable 
uniqueness like below.

```blade-repl
%> import enum
%> 
%> var Speed = enum({
..   Slow: 1,
..   Sluggish: 1,
..   Fast: 2,
.. }, false)
%> echo to_string(Speed)
'<Enum Slow=1 Sluggish=1 Fast=2>'
```

> **NOTE:**
>
> Duplicate values are only allowed in enumerations initialized 
> with a dictionary.

The value of an enumeration key can be retrieved from the enumeration 
object itself like in the example below.

```blade-repl
%> import enum
%> 
%> # list initialization
%> var Gender = enum(['Male', 'Female'])
%> 
%> Gender.Male
0
%> Gender.Female
1
```

## Functions

_enum_.enum(_data_, _unique_) {#enum.enum}

: The default export of the enum module used to create enums.
  
  See [Enum](#enum.Enum)





_enum_.has(_enum_, _key_) {#enum.has}

: Exported Enum.has static function for module access.
  
  See [Enum.has](#enum.Enum.has)





_enum_.keys(_enum_) {#enum.keys}

: Exported Enum.keys static function for module access.
  
  See [Enum.keys](#enum.Enum.keys)





_enum_.values(_enum_) {#enum.values}

: Exported Enum.values static function for module access.
  
  See [Enum.values](#enum.Enum.values)





_enum_.ensure(_enum_, _value_) {#enum.ensure}

: Exported Enum.ensure static function for module access.
  
  See [Enum.ensure](#enum.Enum.ensure)





_enum_.to\_dict(_enum_) {#enum.to_dict}

: Exported Enum.to_dict static function for module access.
  
  See [Enum.to_dict](#enum.Enum.to_dict)





_enum_.to\_value\_dict(_enum_) {#enum.to_value_dict}

: Exported Enum.to_value_dict static function for module access.
  
  See [Enum.to_value_dict](#enum.Enum.to_value_dict)





## Classes

_class_ **Enum** {#enum.Enum .class}

: The enum class provides the interface for creating enumerations.


    __@printable__
    {.class-props}

  .Enum(_data_, _unique_) &#x279D; _Constructor_ {#enum.Enum.Enum}

  : The constructor of the Enum class accepts a list of symbolic names or a
    dictionary of name to unique value mapping and returns a copy of the Enum
    class that represents the enumeration.


    - **@params**:
      - _{list|dict}_ **data**
      - _bool?_ **unique** = true


    {.params}


  _static_ .keys(_enum_) {#enum.Enum.keys}

  : Returns the symbolic keys of an enumeration.
    
    For example:
    
    ```blade-repl
    %> var Color = enum({
    ..   Red: 'r',
    ..   Green: 'g',
    ..   Blue: 'b',
    .. })
    %> 
    %> enum.keys(Color)
    [Red, Green, Blue]
    ```


    - **@params**:
      - _Enum_ **enum**

    {.params}
    - **@returns**: _list[string]_
    {.returns}


  _static_ .values(_enum_) {#enum.Enum.values}

  : Returns possible numeric values of an enumeration.
    
    For example:
    
    ```blade-repl
    %> var Gender = enum(['Male', 'Female'])
    %> 
    %> enum.values(Gender)
    [0, 1]
    ```


    - **@params**:
      - _Enum_ **enum**

    {.params}
    - **@returns**: _list[number|string]_
    {.returns}


  _static_ .to\_dict(_enum_) {#enum.Enum.to_dict}

  : Returns the enumeration as a key/value dictionary.
    
    For example:
    
    ```blade-repl
    %> var Gender = enum(['Male', 'Female'])
    %> 
    %> enum.to_dict(Gender)
    {Male: 0, Female: 1}
    ```


    - **@params**:
      - _Enum_ **enum**

    {.params}
    - **@returns**: _dict_
    {.returns}


  _static_ .to\_value\_dict(_enum_) {#enum.Enum.to_value_dict}

  : Returns the enumeration as a value/key dictionary.
    
    For example:
    
    ```blade-repl
    %> var Speed = enum({
    ..   Slow: 1,
    ..   Sluggish: 1,
    ..   Fast: 2,
    .. }, false)
    %> 
    %> enum.to_value_dict(Speed)
    {1: Sluggish, 2: Fast}
    ```
    
    >*NOTE:**
     > 
    > It is important to remember that dictionaries cannot contain
    > duplicates themselves so all enumeration keys that share the
    > same value will be represented as one. This is in fact not an 
    > error since the values are originally the same like in the 
    > example above where `Speed.Slow` and `Speed.Sluggish` are 
    > actually the same.


    - **@params**:
      - _Enum_ **enum**

    {.params}
    - **@returns**: _dict_
    {.returns}


  _static_ .has(_enum_, _key_) {#enum.Enum.has}

  : Returns `true` if the enumeration contains the given symbolic key or
    `false` if otherwise.
    
    For example:
    
    ```blade-repl
    %> var Holiday = enum([
    ..   'Christmas',
    ..   'Easter',
    ..   'NewYear'
    .. ])
    %> 
    %> enum.has(Holiday, 'NineEleven')
    false
    %> enum.has(Holiday, 'Easter')
    true
    ```


    - **@params**:
      - _Enum_ **enum**
      - _string_ **key**

    {.params}
    - **@returns**: _bool_
    {.returns}


  _static_ .ensure(_enum_, _value_) {#enum.Enum.ensure}

  : Returns the value of an enumeration if it is a valid value for the enumeration
    
    ```blade-repl
    %> var Gender = enum(['Male', 'Female'])
    %> %> enum.ensure(Gender, 0)
    0
    ```
    
    or raises Exception if the value is invalid.
    
    ```blade-repl
    %> var Gender = enum(['Male', 'Female'])
    %> enum.ensure(Gender, 2)
    Unhandled Exception: unknown key/value in specified enumeration
      StackTrace:
        <repl>:1 -> @.script()
    ```


    - **@params**:
      - _Enum_ **enum**
      - _any_ **value**

    {.params}
    - **@returns**: _any_
    {.returns}
    - **@raises**:
      - Exception
    {.raises}




