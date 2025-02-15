# Ranges

Ranges are simple numeric iterables. i.e. They are structures that can be iterated/looped through. 
Ranges are in the format `start..end`. They include a starting number (inclusive) and an ending 
number (non-inclusive) separated by a range operator (`..`).

For example:

```blade-repl
%> 0..10
<range 0-10>
%> 10..5
<range 10-5>
```

Ranges are valid in any direction. That is, they can either ascend (end greater than start) or 
descend (start greater than end). They are also evaluated in order. They can also be constructed 
from variables or a mixture of constant number and variables as desired.

```blade-repl
%> var a = 20
%> 5..a
<range 5-20>
%> a..10
<range 20-10>
%> var b = 16
%> a..b
<range 20-16>
```

## Range methods

The range object have the following methods:

.lower() {#range.lower}

: Returns the lower limit of the range. 

  For example:

  ```blade-repl
  %> (10..100).lower()
  10
  ```

.upper() {#range.upper}

: Returns the upper limit of the range. 

  For example:

  ```blade-repl
  %> (20..30).upper()
  30
  ```

.range() {#range.range}

: Returns a number equal to the numbers betwwen the range.

  For example:

  ```blade-repl
  %> (21..93).range()
  72
  ```

  The result of range stays the same irrespective of the direction of the range. 
  For example, swapping the upper and lower limit of our previous range still returns the same result.

  ```blade-repl
  %> (21..93).range()
  72
  ```

.within(_x: number_) {#range.within}

: Returns true if the given number falls somewhere within the range or false otherwise.

  For example:

  ```blade-repl
  %> (93..21).within(103)
  false
  %> (93..21).within(57)
  true
  ```

.loop(_callback: function_) {#range.loop}

: Iterates over the callback function for the given range starting from the lower index to the 
  number preceeding the upper index (irrespective of range direction) and calls the given function 
  for every iteration. 
  
  The function to be called can accept zero or more arguments. When the callback function accepts 
  arguments, the current position in the range will be passed as a number to the first parameter 
  of the function.

  For example:

  ```blade-repl
  %> (0..5).loop(@{
  ..   echo 'It is well'
  .. })
  'It is well'
  'It is well'
  'It is well'
  'It is well'
  'It is well'
  ```

  We can capture the current position within the range during the loop using a parameter in 
  the function as follows:

  ```blade-repl
  %> (25..18).loop(@(i) {
  ..   echo i
  .. })
  25
  24
  23
  22
  21
  20
  19
  ```

> **_@note:_** The parenthesis (`()`) around the range in our examples are important to make sure that 
> the upper limit of the range is not interpreted as a number since the range was not assigned to 
> a variable.

Other examples of iterables are [Strings](./strings), [Lists](./lists), [Dictionaries](./dictionaries), [Bytes](/standard/bytes) etc.


[Previous Topic](./loops) | [Next Topic](./lists)