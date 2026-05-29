# Lists

Lists in Zuri are sequence types that is used to hold zero or more values in a single storage. 
Each item in a list is assigned a number (index) starting from zero (`0`) for the first item. 
Zuri Lists are comma (`,`) separated list of different values of different or same type. For example, 
a list can contain only number, another can contain a mixture of numbers and strings and yet another 
can contain lists as well.

## Reference

- [Lists](#lists)
  - [Reference](#reference)
  - [Creating a list](#creating-a-list)
  - [List Operations](#list-operations)
  - [Looping thorugh Lists](#looping-thorugh-lists)
  - [List Methods](#list-methods)


## Creating a list

Creating a list is very simple. Simply type a left square bracket (`[`), followed by the values in 
the list if any, all separated by commas and close it all with a right square bracket (`]`). 

For example:

```zuri-repl
%> [1, 2, 3]
[1, 2, 3]
%> ['Lane', 21, nil]
[Lane, 21, nil]
%> [['Lois', 36], ['Clark', 27]]
[[Lois, 36], [Clark, 27]]
```

A list can contain any mixture of data types.


## List Operations

Like Strings, Lists support lots of operations too, but Lists generally support fewer _operators_. 
List supports additions, slicing, iteration and methods too.

Working with Lists is a breeze. For example, adding two lists together looks like this:

```zuri-repl
%> [1, 2] + [3, 4]
[1, 2, 3, 4]
%> ['Hello'] + ['World']
[Hello, World]
```

Lists follow the same indexing and slicing rules as [Strings](./strings) so for breviety, we'll 
not go into the whole academic stuffs anymore.

Just for a quick run-through, accessing indexes in _Lists_ will look like this:

```zuri-repl
%> var names = ['John', 'Wick', 'III']
%> names[1]
'Wick'
%> names[-1]
'III'
```

And slicing _Lists_ just like [Strings](./strings#string-operations) will look like this:

```zuri-repl
%> var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
%> numbers[,]
[1, 2, 3, 4, 5, 6, 7, 8, 9]
%> numbers[-1,]
[]
%> numbers[,3]
[1, 2, 3]
%> numbers[2,6]
[3, 4, 5, 6]
%> numbers[4,]
[5, 6, 7, 8, 9]
%> numbers[4,-2]
[5, 6, 7]
```


## Looping thorugh Lists

Lists can be iterated using any of the looping techniques available in Zuri. However, the `iter` 
and the `for` loop are the recommended as they will require fewer moving parts, and Lists are 
optimized for those looping techniques.

For example, you can use the `iter` loop like this:

```zuri-repl
%> var users = ['Gabriel', 'Anna', 'Cindarella']
%> iter var i = 0; i < users.length(); i++ {
..   echo users[i]
.. }
'Gabriel'
'Anna'
'Cindarella'
```

The above example uses the `iter` loop to iterate through the list. Notice how the condition uses 
the `length()` method of the list and how we accessed the current list item using the iteration 
variable.

We can do the same with the `for` loop using even fewer code schematics. For example,

```zuri-repl
%> users = ['James', 'Lucy', 'Estonia']
%> for user in users {
..   echo user
.. }
'James'
'Lucy'
'Estonia'
```

We can also use the `while` loop to iterate through a list. For example,

```zuri-repl
%> users = ['Odin', 'Parker', 'Kent']
%> var i = 0
%> while i < users.length() {
..   echo users[i]
..   i++
.. }
'Odin'
'Parker'
'Kent'
```

## List Methods

Lists support methods operations too. Here are a list of all the methods supported by list.

.length() {#length}

: Returns the number of items in the list. <br>
    
  For example:

  ```zuri-repl
  %> ['A', 'B', 'C'].length()
  3
  ```


.append(_x: any_) {#append}

: Adds the given value _x_ to the end of the list.
    
  For example:

  ```zuri-repl
  %> var a = [1,2,3]
  %> a.append(4)
  %> a
  [1, 2, 3, 4]
  ```


.clear() {#clear}

: Removes all items from the list.<br>
    
  For example:

  ```zuri-repl
  %> var a = [1,2,3,4,5]
  %> a
  [1, 2, 3, 4, 5]
  %> a.clear()
  %> a
  []
  ```


.clone() {#clone}

: Returns a new list containing all items from the _list_. The new list is a shallow copy of the 
  original list. This is equivalent to `list[,]`.

  For example:

  ```zuri-repl
  %> var a = [1, 2, 3]
  %> var b = a.clone()
  %> a.append(4)
  %> a
  [1, 2, 3, 4]
  %> b
  [1, 2, 3]
  ```


.count(_x: any_) {#count}

: Returns the number of times itesm _x_ occurs in the list.
    
  For example:

  ```zuri-repl
  %> [1, 2, 1, 3, 2, 1, 1].count(1)
  4
  ```


.extend(_x: list_) {#extend}

: Updates the content of the _list_ by appending all the contents of list _x_ to the end of the 
  original list in exact order. This is equivalent to `list + x`.

  For example:

  ```zuri-repl
  %> var a = [1, 2, 3]
  %> var b = [4, 5, 6]
  %> a.extend(b)
  %> a
  [1, 2, 3, 4, 5, 6]
  %> b
  [4, 5, 6]
  ```


.index_of(_x: any [, start\_index: number = 0]_) {#index_of}

: Returns the zero-based index of the first occurrence of the value _x_ in the list starting from the 
  given _start_index_ or `-1` if the list does not contain the value _x_.

  For example:

  ```zuri-repl
  %> [1,2].index_of(3)
  -1
  %> [4,5,6,5].index_of(5)
  1
  %> ['a', 'b', 'r', 'a', 'h', 'a', 'm'].index_of('a')
  0
  %> ['a', 'b', 'r', 'a', 'h', 'a', 'm'].index_of('a', 1)
  3
  ```


.insert(_x: any, index: number_) {#insert}

: Inserts the item _x_ into the list at the specified _index_. By specifying an index of zero 
  (`list.insert(x, 0)`), one can prepend the list and `list.insert(x, list.length())` is equivalent 
  to `list.append(x)`. If the _index_ specified is greater than `list.length()`, the list will be 
  padded with `nil` up till the index preceeding the specified index. 

  For example:

  ```zuri-repl
  %> var a = [1,2,3]
  %> a.insert(4, 0)
  %> a
  [4, 1, 2, 3]
  %> a.insert(5, a.length())
  %> a
  [4, 1, 2, 3, 5]
  %> a.insert(6, 3)
  %> a
  [4, 1, 2, 6, 3, 5]
  %> a.insert(7, 11)
  %> a
  [4, 1, 2, 6, 3, 5, nil, nil, nil, nil, nil, 7]
  ```


.pop() {#pop}

: Removes the last item in a list and returns the value of that item.<br>
    
  For example:

  ```zuri-repl
  %> var a = [4, 5, 6]
  %> a.pop()
  6
  %> a
  [4, 5]
    ```


.shift(_[count: number]_) {#shift}

: Removed the specified count of items from the beginning of the list and returns it. If _count_ 
  is not specified, _count_ defaults to 1. If one item is shifted, the method returns that item. 
  If more than one item is shifted, the method returns a list containing the shifted items.

  > The square brackets (`[]`) around the _`count: number`_ in the method definition indicates that 
  > the parameter is optional and does not mean you have to type the square brackets.

  If the number of items required to be shifted exceeeds the size of the list, the list is cleared
  and `nil` is returned.

  For example:

  ```zuri-repl
  %> var a = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
  %> a.shift()
  9
  %> a
  [8, 7, 6, 5, 4, 3, 2, 1, 0]
  %> a.shift(3)
  [8, 7, 6]
  %> a
  [5, 4, 3, 2, 1, 0]
  %> a.shift(10)
  %> a
  []
  ```


.remove_at(_index: number_) {#remove_at}

: Removes the item at the specified index in the list and returns it. If the index is less than 
  `0` or greater than `list.length() - 1`, an exception is raised.

  For example:

  ```zuri-repl
  %> var a = [1, 2, 3, 4, 5]
  %> a.remove_at(3)
  4
  %> a
  [1, 2, 3, 5]
  %> a.remove_at(6)
  Unhandled Exception: list index 6 out of range at remove_at()
    StackTrace:
      <repl>:1 -> @.script()
  %> a.remove_at(-1)
  Unhandled Exception: list index -1 out of range at remove_at()
    StackTrace:
      <repl>:1 -> @.script()
  ```


.remove(_x: any_) {#remove}

: Removes the first occurrence of item _x_ from the list.

  For example:

  ```zuri-repl
  %> var a = ['Kirk', 'Tasha', 'Emily', 'Kirk']
  %> a.remove('Kirk')
  %> a
  [Tasha, Emily, Kirk]
  ```

  Notice that only the first occurrence of `Kirk` was removed.


.reverse() {#reverse}

: Returns a new list containing the items in the original list in reverse order.

  For example:

  ```zuri-repl
  %> var a = ['apple', 'mango', 'banana', 'orange', 'peach']
  %> a.reverse()
  [peach, orange, banana, mango, apple]
  ```


.sort() {#sort}

: Sorts the items in the list in-place and returns the sorted list. Sorting in Lists 
  follows are strict set of precedence based on the object type. The order for sorting 
  is as follows in ascending orders:<br>

  `nil`, boolean, numbers, strings, ranges, lists, dictionaries, file, bytes, functions, classes 
  and modules.

  When the corresponding items in the list are of the same type, they are sorted based on their
  respective values according to the type. For example, the number `5` is less than `8` and as such
  will appear first in the sort.

  For example:

  ```zuri-repl
  %> var a  = ['A', 5, false, nil, [21, 13, 46]]
  %> a.sort()
  %> a
  [nil, false, 5, A, [13, 21, 46]]
  ```

  > Notice how the boolean value preceeds the number and how the number in turn preceeds the string
  > and the strings in turn, preceeds the list in the result. Also, note that the items of the inner 
  > list is sorted.



.contains(_x: any_) {#contains}

: Returns `true` if the list contains the item _x_ or `false` otherwise.

  For example:

  ```zuri-repl
  %>  ['dog', 'cat', 'wolf', 'tiger'].contains('cat')
  true
  %>  ['dog', 'cat', 'wolf', 'tiger'].contains('giraffe')
  false
  ```


.delete(_lower: number, upper: number_) {#delete}

: Deletes a range of items from the list starting from the lower to the upper limit and returns 
  the number of items removed. If the lower and upper are the same, this will be equivalent to 
  `list.remove_at(lower)`.

  For example:

  ```zuri-repl
  %> var a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  %> a.delete(3, 6)
  4
  %> a
  [1, 2, 3, 8, 9]
  %> a.delete(1,1)  # equal upper and lower
  1
  %> a
  [1, 3, 8, 9]
  ```


.first() {#first}

: Returns the first item in the list or `nil` if the list is empty.

  For example:

  ```zuri-repl
  %> ['c', 'd', 'a', 'b'].first()
  'c'
  ```


.last() {#last}

: Returns the last item in the list or `nil` if the list is empty.

  For example:

  ```zuri-repl
  %> ['c', 'd', 'a', 'b'].last()
  'b'
  ```


.is_empty() {#is_empty}

: Returns `true` if the list is empty or `false` otherwise.

  For example:

  ```zuri-repl
  %> [1, 2].is_empty()
  false
  %> [].is_empty()
  true
  ```


.take(_n: number_) {#take}

: Returns a new list containing the first _n_ items in the list or a new copy of the list if _n_ 
  greater than or equals to the `list.length()`. If `n < 0`, returns `list.take(list.length() - n)`.

  For example:

  ```zuri-repl
  %> var a = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  %> a.take(4)
  [10, 11, 12, 13]
  %> a.take(11) # taking more than the size of the list
  [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  %> a.take(-5)   # taking n < 0
  [10, 11, 12, 13, 14, 15]
  ```


.get(_index: number_) {#get}

: Returns the value at the specified index in the list. If _index_ is outside the boundary of 
  the list indexes (`0..(list.length() - 1)`), an exception is thrown. This method is equivalent 
  to `list[index]`.

  For example:

  ```zuri-repl
  %> [13, 14, 15, 16].get(1)
  14
  %> [13, 14, 15, 16].get(6)
  Unhandled Exception: list index 6 out of range at get()
    StackTrace:
      <repl>:1 -> @.script()
  ```


.compact() {#compact}

: Returns a new list containing the items in the original list but with all `nil` values removed.

  For example:

  ```zuri-repl
  %> [21, nil, 14, 'age', nil, nil, [], 11].compact()
  [21, 14, age, [], 11]
  ```


.unique() {#unique}

: Returns a new list containing the unique values from the original list.

  For example:

  ```zuri-repl
  %> [1, 1, 3, 5].unique()
  [1, 3, 5]
  ```


.zip(_items... : list..._) {#zip}

: Returns a list that contains the items in the original list merged with corresponding items 
  from the individual arguments. This generates a list of length equal to the length of the 
  original argument.

  If the size of any of the arguments is less than the size of the original list, it's corresponding 
  entry will be `nil`.

  For example:

  ```zuri-repl
  %> var a = [4, 5, 6]
  %> var b = [7, 8, 9]
  %> [1, 2, 3].zip(a, b)
  [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  %> [1, 2].zip(a, b)
  [[1, 4, 7], [2, 5, 8]]
  %> a.zip([1, 2], [8])
  [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
  %> [1, 2].zip([3])
  [[1, 3], [2, nil]]
  %> [1].zip([10, 11], [12, 13, 14])
  [[1, 10, 12]]
  %> [[1, 2], [3]].zip(a, b)
  [[[1, 2], 4, 7], [[3], 5, 8]]
  ```


.zip_from(_items: list_) {#zip_from}

: The same as `list.zip()` except that instead of accepting an arbitrary list or arguments, it 
  accepts a single list that should contain other lists.

  For example:

  ```zuri-repl
  %> [1, 2].zip_from([[3, 4]])
  [[1, 3], [2, 4]]
  ```


.to_dict() {#to_dict}

: Returns a number indexed dictionary representing the list.

  For example:

  ```zuri-repl
  %> ['English', 'French', 'Spanish'].to_dict()
  {0: English, 1: French, 2: Spanish}
  ```


.each(_callback: function_) {#each}

: Executes the provided callback once for each element in the list.

  For example:

  ```zuri-repl
  %> echo ['apple', 'mango', 'orange'].each(@{
  ..   echo 'A list iteration'
  .. })
  'A list iteration'
  'A list iteration'
  'A list iteration'
  ```

  The callback function can accept zero or more arguments. When the callback function 
  accepts arguments, the current element will be passed to the first parameter 
  whenever the callback is called.

  For example:

  ```zuri-repl
  %> var fruits = ['apple', 'mango', 'orange']
  %> 
  %> fruits.each(@(fruit){
  ..   echo '${fruit} is in the list'
  .. })
  'apple is in the list'
  'mango is in the list'
  'orange is in the list'
  ```

  If the callback function has more than one parameter, the second parameter is assigned the 
  value of the index of the current element in the list.

  For example:

  ```zuri-repl
  %> fruits.each(@(fruit, index){
  ..   echo '${fruit} is in the list at index ${index}'
  .. })
  'apple is in the list at index 0'
  'mango is in the list at index 1'
  'orange is in the list at index 2'
  ```


.map(_callback: function_) {#map}

: Returns a new list created from the result of calling the given callback function once 
  for each element of the current list.

  The `map` callback function accepts and is passed the same values as [.each()](#each).

  > Since `map()` returns a new array, its adviced to use a regular `for...` loop instead 
  > if you do not plan to use the return value.

  For example:

  ```zuri-repl
  %> var roots = [3, 9, 12]
  %> 
  %> echo roots.map(@(root) {
  ..   return root * root
  .. })
  [9, 81, 144]
  ```


.filter(_callback: function_) {#filter}

: Returns a portion (shallow copy) of the list filtered down to just the elements in the 
  list that pass the test done by the callback function.

  The `filter` callback function accepts and is passed the same values as [.each()](#each).

  The callback function is required to return a value that can resolves as true for 
  elements that should be kept or resolves as false for elements that should not be kept.

  If no element passes the test in the callback, an empty list is returned.

  For example:

  ```zuri-repl
  %> # remove all even numbers
  %> echo [1, 2, 3, 4, 5, 6].filter(@(x) { 
  ..   return x % 2 != 0 
  .. })
  [1, 3, 5]
  ```

  Below is an example that filters a list of number and returns only the prime numbers:

  ```zuri-repl
  %> var list = [
  ..   -3, -2, -1, 0, 1, 2, 3, 4, 5, 
  ..   6, 7, 8, 9, 10, 11, 12, 13
  .. ]
  %> 
  %> def is_prime(num) {
  ..   for i in 2..num {
  ..     if num % i == 0 {
  ..       return false
  ..     }
  ..   }
  .. 
  ..   return num > 1
  .. }
  %> 
  %> echo list.filter(is_prime)
  [2, 3, 5, 7, 11, 13]
  ```

.some(_callback: function_) {#some}

: Returns `true` if at least one element in the list pases the test conducted by the 
  callback function. The callback function is required to return a value that can 
  resolves as true for elements that should be kept or resolves as false for elements 
  that should not be kept.

  The `some` callback function accepts and is passed the same values as [.each()](#each).

  For example:

  ```zuri-repl
  %> # checks to see if the list contains an odd number
  %> echo [1, 2, 3, 4, 5].some(@(x) { 
  ..   return x % 2 != 0 
  .. })
  true
  ```

.every(_callback: function_) {#every}

: Returns `true` if all the elements in the list pases the test conducted by the 
  callback function. The callback function is required to return a value that can 
  resolves as true for elements that should be kept or resolves as false for elements 
  that should not be kept.

  The `every` callback function accepts and is passed the same values as [.each()](#each).

  For example:

  ```zuri-repl
  %> # checks to see if all the list are odd numbers
  %> echo [1, 2, 3, 4, 5].every(@(x) { 
  ..   return x % 2 != 0 
  .. })
  false
  ```

.reduce(_callback: function [, initial\_value: any = nil]_) {#reduce}

: Executes the reducer callback function on every element in the list in order, passing in 
  the return value from the previous calculation on the preceeding element and returning a 
  single value equal to the result of running the reducer callback across all elements.

  When the callback function is run on the first element, there is not result from any 
  preceeding value. If the initial value has been set, the initial value will be used as the 
  preceeding value, otherwise the the first element (index 0) of the list is used and the 
  function starts running from the second element in the list (index 1).

  The callback function for the `reduce` method is called with the following arguments:

  - `initial_value`: The value resulting from the previous call to `callback`. On the first 
    call, its value is `initial_value` if the latter is specified; otherwise its value is 
    `list[0]`.

  - `current_value`: The value of the current element. On the first call, its value is `list[0]`
    if `initial_value` is specified; otherwise its value is `list[1]`.

  - `current_index`: The index position of `current_value` in the list. On the first call, 
    its value is `0` if `initial_value` is specified, otherwise `1`.

  - `list`: The list `reduce()` was called upon.

  For example:

  ```zuri-repl
  %> var list = [1, 2, 3, 4]
  %> 
  %> var sum = list.reduce(@(initial_value, current_value) {
  ..   return initial_value + current_value
  .. }, 0)
  %> 
  %> sum
  10
  ```

  The following example illustrates how the `reduce()` method works in the abscence of an initial value.

  ```zuri-repl
  %> var list = [15, 16, 17, 18, 19]
  %> 
  %> def reducer(initial_value, current_value, index) {
  ..   var returns = initial_value + current_value
  ..   echo 'initial_value: ${initial_value}, current_value: ${current_value}, index: ${index}, returns: ${returns}'
  ..   return returns
  .. }
  %> 
  %> list.reduce(reducer)
  'initial_value: 15, current_value: 16, index: 1, returns: 31'
  'initial_value: 31, current_value: 17, index: 2, returns: 48'
  'initial_value: 48, current_value: 18, index: 3, returns: 66'
  'initial_value: 66, current_value: 19, index: 4, returns: 85'
  85
  ```


<br><br>

[Previous Topic](./ranges) | [Next Topic](./dictionaries)