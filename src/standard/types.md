# type

Provides type validation and conversion capabilities

This module is wrapper around the builtin functions
where applicable and does and return the same thing as the builtin
alternative.

## Functions

#### of(value)

Returns the name of the type of value

##### Parameters

- _any_ **value**

##### Returns

- string
##### Notes

- method implemented as part of core language features



#### digit(value)

Returns true if the value is a character and digit,
otherwise returns false.

##### Parameters

- _char_ **value**

##### Returns

- bool



#### alpha(value)

Returns true if the value is a character and alphabetic,
otherwise returns false.

##### Parameters

- _char_ **value**

##### Returns

- bool



#### int(value)

Returns true if the value is an integer or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### bool(value)

Returns true if the value is a boolean or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### number(value)

Returns true if the value is a number or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool
##### Notes

- this method also returns true for integers.



#### char(value)

Returns true if the value is a single character or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### string(value)

Returns true if the value is a string or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### bytes(value)

Returns true if the value is a bytes or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### list(value)

Returns true if the value is a list or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### dict(value)

Returns true if the value is a dictionary or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### object(value)

Returns true if the value is an object or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### function(value)

Returns true if the value is a function or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### is\_a\_class(value)

Returns true if the value is a class or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### file(value)

Returns true if the value is a file or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### iterable(value)

Returns true if the value is an iterable or false otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### callable(value)

Returns true if the value is a callable function or class and false 
otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### instance(value, type)

Returns true if the value is an instance the given class, false
otherwise.

##### Parameters

- _any_ **value**
- _class_ **type**

##### Returns

- bool



## Classes

### _class_ Convert

The Convert class handles conversion from one type to another

#### Methods

#### Convert(value) &#8674; Constructor



##### Parameters

- _any_ **value**


#### to\_int()

Converts the value into an integer.

##### Returns

- bool
##### Notes

- classes may override the return value by declaring a `to_int()` function.

#### to\_number()

Converts the value into a number.

##### Returns

- bool
##### Notes

- classes may override the return value by declaring a `to_number()` function.

#### to\_string()

Converts the value into a string.

##### Returns

- bool
##### Notes

- classes may override the return value by declaring a `to_string()` function.

#### to\_bool()

Converts the value into a boolean.

##### Returns

- bool
##### Notes

- classes may override the return value by declaring a `to_bool()` function.

#### to\_list()

Converts the value into a list.

##### Returns

- bool
##### Notes

- classes may override the return value by declaring a `to_list()` function.

#### to\_dict()

Converts the value value into a dictionary.

##### Returns

- bool
##### Notes

- classes may override the return value by declaring a `to_dict()` function.



