# type

Provides type validation and conversion capabilities

This module is wrapper around the builtin functions
where applicable and does and return the same thing as the builtin
alternative.

## Functions

of(_value_) {#types.of}

: Returns the name of the type of value


  > **@notes**:
  > 
  > - method implemented as part of core language features

  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _string_



digit(_value_) {#types.digit}

: Returns true if the value is a character and digit,
  otherwise returns false.


  - **@params**:
    - _char_ **value**

  {.params}
  - **@returns**: _bool_



alpha(_value_) {#types.alpha}

: Returns true if the value is a character and alphabetic,
  otherwise returns false.


  - **@params**:
    - _char_ **value**

  {.params}
  - **@returns**: _bool_



int(_value_) {#types.int}

: Returns true if the value is an integer or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



bool(_value_) {#types.bool}

: Returns true if the value is a boolean or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



number(_value_) {#types.number}

: Returns true if the value is a number or false otherwise.


  > **@notes**:
  > 
  > - this method also returns true for integers.

  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



char(_value_) {#types.char}

: Returns true if the value is a single character or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



string(_value_) {#types.string}

: Returns true if the value is a string or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



bytes(_value_) {#types.bytes}

: Returns true if the value is a bytes or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



list(_value_) {#types.list}

: Returns true if the value is a list or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



dict(_value_) {#types.dict}

: Returns true if the value is a dictionary or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



object(_value_) {#types.object}

: Returns true if the value is an object or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



function(_value_) {#types.function}

: Returns true if the value is a function or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



is\_a\_class(_value_) {#types.is_a_class}

: Returns true if the value is a class or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



file(_value_) {#types.file}

: Returns true if the value is a file or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



iterable(_value_) {#types.iterable}

: Returns true if the value is an iterable or false otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



callable(_value_) {#types.callable}

: Returns true if the value is a callable function or class and false 
  otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_



instance(_value_, _type_) {#types.instance}

: Returns true if the value is an instance the given class, false
  otherwise.


  - **@params**:
    - _any_ **value**
    - _class_ **type**

  {.params}
  - **@returns**: _bool_



## Classes

_class_ **Convert** {#types.Convert .class}

: The Convert class handles conversion from one type to another


  .Convert(_value_) &#8674; Constructor {#types.Convert.Convert}

  : - **@params**:
      - _any_ **value**

    {.params}


  .to\_int() {#types.Convert.to_int}

  : Converts the value into an integer.


    > **@notes**:
    > 
    > - classes may override the return value by declaring a `to_int()` function.

    - **@returns**: _bool_


  .to\_number() {#types.Convert.to_number}

  : Converts the value into a number.


    > **@notes**:
    > 
    > - classes may override the return value by declaring a `to_number()` function.

    - **@returns**: _bool_


  .to\_string() {#types.Convert.to_string}

  : Converts the value into a string.


    > **@notes**:
    > 
    > - classes may override the return value by declaring a `to_string()` function.

    - **@returns**: _bool_


  .to\_bool() {#types.Convert.to_bool}

  : Converts the value into a boolean.


    > **@notes**:
    > 
    > - classes may override the return value by declaring a `to_bool()` function.

    - **@returns**: _bool_


  .to\_list() {#types.Convert.to_list}

  : Converts the value into a list.


    > **@notes**:
    > 
    > - classes may override the return value by declaring a `to_list()` function.

    - **@returns**: _bool_


  .to\_dict() {#types.Convert.to_dict}

  : Converts the value value into a dictionary.


    > **@notes**:
    > 
    > - classes may override the return value by declaring a `to_dict()` function.

    - **@returns**: _bool_




