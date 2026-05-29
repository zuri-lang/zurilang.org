# Built-in Functions

Zuri comes with an array of optimized built-in functions for simple tasks. Below is a list of the 
built-in functions followed by their respective documentations.


abs(*x: number | instance*) {#abs}

: If x is a number, this function returns the absolute value of the number x. 
  This is equivalent to `x >= 0 ? x : -x`. However, if x is an instance of a class 
  y and y defines `@to_abs()`, then this functions returns `x.@to_abs()`. 

bin(*x: number | instance*) {#bin}

: If x is a number, this function converts number x to it's binary string and 
  returns the value. However, if x is an instance of a class y and y defines `@to_bin()`, 
  then this functions returns `x.@to_bin()`. 

bytes(*x: number | list*) {#bytes}

: If x is a number, this function returns a new `bytes` object with length x having all 
  its bytes set to `0x0`. 

  If x is a list, it returns a new `bytes` object whose contents are the bytes specified in the list.

  > **@note:** If x is a list, then the list must only contain valid bytes which can be any 
  > number between 0 and 255.

chr(*x: number*) {#chr}

: Returns the Unicode character whose code point is equal to the number x.

delprop(*object: instance, name: string*) {#delprop}

: Deletes the property name from the given instance of object.

file(*path: string [, mode: string]*) {#file}

: Returns an open file handle to the file specified in the path in the specified mode. If the mode is not specified, 
    the file will be opened in the read only mode.

getprop(*object: instance, name: string*) {#getprop}

: Returns the value of the property name from the given instance of object. If the object 
    has no such property, `nil` is returned.

hasprop(*object: instance, name: string*) {#hasprop}

: Returns `true` if the object has a property name. Returns `false` otherwise.

hex(*x: number | instance*) {#hex}

: If x is a number, this function converts number x to its hexadecimal string and returns the 
    value. However, if x is an instance of a class y and y defines `@to_hex()`, then this 
    functions returns `x.@to_hex()`. 

id(*x: any*) {#id}

: Returns the unique identifier of value x within the system. This value is also equivalent to the current 
    address of object x in memory.

instance_of(*x: any, y: class*) {#instance_of}

: Returns `true` if x is an instance of the given class y or `false` otherwise.

int(*[x: number | instance]*) {#int}

: If x is not given, returns `0`. If x is a number, converts the number to an integer and 
    returns the integer. However, if x is an instance of a class y and y defines `@to_int()`, 
    then this functions returns `x.@to_int()`.

is_bool(*x: any*) {#is_bool}

: Returns `true` if x is a boolean or `false` otherwise.

is_callable(*x: any*) {#is_callable}

: Returns `true` if x is a callable or `false` otherwise. Callables includes classes, functions 
    and closures.

is_class(*x: any*) {#is_class}

: Returns `true` if x is a class or `false` otherwise.

is_dict(*x: any*) {#is_dict}

: Returns `true` if x is a dictionary or `false` otherwise.

is_function(*x: any*) {#is_function}

: Returns `true` if x is a function or closure or `false` otherwise.

is_instance(*x: any*) {#is_instance}

: Returns `true` if x is an instance of any class or `false` otherwise.

is_int(*x: any*) {#is_int}

: Returns `true` if x is an integer or `false` otherwise.

is_list(*x: any*) {#is_list}

: Returns `true` if x is a list or `false` otherwise.

is_number(*x: any*) {#is_number}

: Returns `true` if x is a number or `false` otherwise.

is_object(*x: any*) {#is_object}

: Returns `true` if x is an object or `false` otherwise.

is_string(*x: any*) {#is_string}

: Returns `true` if x is a string or `false` otherwise.

is_bytes(*x: any*) {#is_bytes}

: Returns `true` if x is a bytes object or `false` otherwise.

is_file(*x: any*) {#is_file}

: Returns `true` if x is a file object or `false` otherwise.

is_iterable(*x: any*) {#is_iterable}

: Returns `true` if x is an iterable object or `false` otherwise. Iterables includes lists, 
    dictionaries, strings, bytes, and instances of any class that defines both `@iter()` and 
    `@itern()` decorator functions.

max(*numbers...*) {#max}

: Returns the greatest of the given numbers. This method requires at least two numbers.

microtime() {#microtime}

: Returns the current epoch time to the microseconds resolution.

min(*numbers...*) {#min}

: Returns the least of the given numbers. This method requires at least two numbers.


oct(*x: number*) {#oct}

: If x is a number, this function converts number x to it's octal string and returns the 
    value. However, if x is an instance of a class y and y defines `@to_oct()`, then this 
    functions returns `x.@to_oct()`. 


ord(*x: char*) {#ord}

: Returns the code point value of a unicode character x.

print(*values...*) {#print}

: Prints the given values joined by spaces to standard output.

rand(*[x: number [, y: number]]*) {#rand}

: If no argument is given, returns a random number between 0 and 1. If x is given, returns a 
    random number between 0 and x. If y is given, returns a random number between x and y.

setprop(*object: instance, name: string, value: any*) {#setprop}

: Sets the value of the object's property with the matching name to the given value. If the property already 
    exists, it overwrites it and returns `true`, otherwise it returns `false`.

sum(*numbers...*) {#sum}

: Returns the sum of all the given numbers. This method expects at least two arguments.

time() {#time}

: Returns the current epoch time in seconds.

to_bool(*x: any*) {#to_bool}

: Converts the given value into a boolean. If x is an instance of class y and y defines 
    `@to_bool()` decorator, returns `x.@to_bool()`.

to_dict(*x: any*) {#to_dict}

: Converts the given value into a dictionary. If x is an instance of class y and y defines 
    `@to_dict())` decorator, returns `x.@to_dict()`.

to_int(x: number | instance) {#to_int}

: If x is a number, converts the given value into an integer and returns the integer. If x is 
    an instance of a class and the class defines `@to_int()` decorator, returns `x.@to_int()`.

to_list(*x: any*) {#to_list}

: Converts the given value into a list. If x is an instance of class y and y defines 
    `@to_list()` decorator, returns `x.@to_list()`.

to_number(*x: any*) {#to_number}

: Converts the given value into a number. If x is an instance of class y and y defines 
    `@to_number()` decorator, returns `x.@to_number()`.

to_string(*x: any*) {#to_string}

: Converts the given value into a string. If x is an instance of class y and y defines 
    `@to_string()` decorator, returns `x.@to_string()`.

typeof(*x: any*) {#typeof}

: Returns the name of the type of x as a string.




<br><br>

[Previous Topic](./functions) | [Next Topic](./class)