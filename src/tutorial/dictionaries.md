# Dictionaries

Zuri dictionaries are built on powerful hashtables with fast key lookups. Creating Zuri dictionaries
are extremely similar to how you create objects in JavaScript and for developers coming from that
language will find Zuri dictionaries very familiar.

## Reference

- [Dictionaries](#dictionaries)
  - [Reference](#reference)
  - [Constructing a dictionary](#constructing-a-dictionary)
  - [Automatic value assignment](#automatic-value-assignment)
  - [Accessing members of a Dictionary](#accessing-members-of-a-dictionary)
  - [Looping through dictionaries](#looping-through-dictionaries)
  - [Dictionary methods](#dictionary-methods)


## Constructing a dictionary

Zuri dictionaries are arbitary key-value pairs separated by colons (`:`) enclosed in braces (`{}`).

For example:

```zuri-repl
%> {'name': 'Zuri', 'version': 0.5}
{name: Zuri, version: 0.5}
%> {}    # empty dictionary
{}
```

> While dictionary values can be any valid Zuri object, keys can only be one of [String](./strings), 
> [Number](./numbers) or Boolean.

For example:

```zuri-repl
%> {0: 'number', false: 'boolean', 'key': 'string'}
{0: number, false: boolean, key: string}
```

For string keys in a dictionary, the quotation may be excluded given that the string contains no space 
or any non alphanumeric character or the unquoted version equals to a boolean value.

For example:

```zuri-repl
%> {country: 'Nigeria', dial_code: 234, in_africa: true}
{country: Nigeria, dial_code: 234, in_africa: true}
```

## Automatic value assignment

Sometimes when creating a dictionary, it is very common to have keys that already match the name of a variable that already exists in scope. For example:

```zuri-repl
%> var name = 'Paulina'
%> var my_dict = {name: name}
%> my_dict
{name: Paulina}
```

Because of how common and frequent developers do this, Zuri has an automatic value assignment feature for dictionaries that allow you to assing variables to dictionary keys if they are already within scope without rewriting them.

For example,

```zuri-repl
%> var name = 'Kagawa'
%> {name}
{name: Kagawa}
```


## Accessing members of a Dictionary

Each key in a dictionary is a property of the given dictionary and as such, dictionary like strings 
and lists support index access.

For example:

```zuri-repl
%> var a = {name: 'Zuri', version: 0.5}
%> a['name']
'Zuri'
```

And they also support property access whenever the key is a string. For example, the above `a['name']` 
could also be written as:

```zuri-repl
%> a.name
'Zuri'
```

## Looping through dictionaries

There are two ways to loop through a dictionary in Zuri. We can loop through the dictionary itself 
using the specialized _for_ loop, of loop through its keys using any of the _while_ or _iter_ loop.

Below is an example looping through the dictionary itself using the _for_ loop.

```zuri-repl
%> var person = {name: 'Ceaser', birth: '29AD', nation: 'Rome', position: 'Emperor'}
%> for x, y in person {
..   print(x, '=', y)
.. }
name = Ceaser
birth = 29AD
nation = Rome
position = Emperor
```

Unlike strings and lists, note that this _for_ loop takes two variables. This is to allow us take 
the key into the first and the value into the second variable respectively. 

If we only want to loop through the values without concern for the keys, we can use a single variable 
to hold our value and still iterate correctly. Note however that the corresponding _key_ information 
will be lost in the loop.

For example:

```zuri-repl
%> for x in person {
..   echo x
.. }
'Ceaser'
'29AD'
'Rome'
'Emperor'
```

<br>
The following example loops through the dictionary by looping through the keys of the dictionary. 

```zuri-repl
%> var keys = person.keys()
%> iter var i = 0; i < keys.length(); i++ {
..   print(keys[i], '=', person[keys[i]])
.. }
name = Ceaser
birth = 29AD
nation = Rome
position = Emperor
```

The technique presented above is to walk through the keys of the dictionary and use the current key 
to index the dictionary. While the example uses the _iter_ loop, the same technique applies to the 
_while_ loop. 


## Dictionary methods

Zuri dictionaries comes with a lot of power packed methods like other objects. The methods are 
detailed below.

.length() {#length}

: Returns the length of the dictionary. The length of a Zuri dictionary is equal to the number of
  keys it contains. i.e. `dict.length() == dict.keys().length()`.

  For example:

  ```zuri-repl
  %> {name: 'Zuri', version: 1}.length()
  2
  ```


.add(_key: any, value: any_) {#add}

: Adds a new key-value pair to the dictionary with the given key and value.<br>

  For example:

  ```zuri-repl
  %> var dict = {}
  %> dict.add('name', 'Zuri')
  %> dict
  {name: Zuri}
  ```


.set(_key: any, value: any_) {#set}

: Sets the value of the given key to the given value in the dictionary. If there is no exisiting entry
  for the key in the dictionary, a new entry will be added.<br>

  For example:

  ```zuri-repl
  %> dict.set('name', 'New Zuri')
  %> dict
  {name: New Zuri}
  %> dict.set('version', 1)
  %> dict
  {name: New Zuri, version: 1}
  ```

  > **_@note_:** `dict.set(x, y)` is equivalent to the following Zuri code.
  > ```zuri-repl
  > %> if dict.contains(x) {
  > ..   dict[x] = 1
  > .. } else {
  > ..   dict.add(x, 1)
  > .. }
  > ```


.clear() {#clear}

: Clears the content of the dictionary.<br>

  For example:
  
  ```zuri-repl
  %> var a = {name: 'Zuri'}
  %> a
  {name: Zuri}
  %> a.clear()
  %> a
  {}
  ```


.clone() {#clone}

: Returns a new dictionary which is a deep copy of the original dictionary.<br>

  For example:
  
  ```zuri-repl
  %> var new_dict = dict.clone()
  %> new_dict
  {name: New Zuri, version: 1}
  ```


.compact() {#compact}

: Returns a new dictionary that contains every key-value pair in the original dictionary except
  for keys whose associated value is `nil`.

  For example:

  ```zuri-repl
  %> var dict2 = {name: 'James', age: 20, address: nil, country: nil}
  %> dict2.compact()
  {name: James, age: 20}
  ```


.contains(_x: any_) {#contains}

: Returns `true` if any of the keys in the dictionary is equal to _x_, `false` otherwise.<br>

  For example:

  ```zuri-repl
  %> dict2.contains('name')
  true
  %> dict2.contains('street')
  false
  ```


.extend(_x: dict_) {#extend}

: Adds all key-value pairs in dictionary _x_ to the original dictionary.<br>

  For example:

  ```zuri-repl
  %> var dict = {name: 'Zuri'}
  %> dict.extend({version: 1})
  %> dict
  {name: Zuri, version: 1}
  ```


.get(_key: any [, default: any]_) {#get}

: Returns the value of the given _key_ in the dictionary. If the given key is not defined in the
  dictionary and the _default_ value is given, the default value will be returned. Otherwise, `nil`
  is returned.

  For example:

  ```zuri-repl
  %> dict.get('version')   # value exists
  1
  %> dict.get('age')   # value does not exist
  %> dict.get('age', 6)   # value does not exist, but default is given
  6
  %> dict.get('version', 1.1)   # value exists and default is given
  1
  ```


.keys() {#keys}

: Returns a list containing the keys in the dictionary.<br>

  For example:

  ```zuri-repl
  %> dict.keys()
  [name, version]
  ```


.values() {#values}

:  Returns a list containing the value of all keys in the dictionary.<br>

  For example:

  ```zuri-repl
  %> dict.values()
  [Zuri, 1]
  ```


.remove(_key: any_) {#remove}

: Removes a given key and it's corresponding value from the dictionary and returns the value of
  the key.

  For example:

  ```zuri-repl
  %> dict = {username: 'james', email: 'a@b.c', active: true}
  %> dict.remove('active')
  true
  %> dict
  {username: james, email: a@b.c}
  ```


.is_empty() {#is_empty}

: Returns `true` if the dictionary is empty, otherwise returns `false`.<br>

  For example:

  ```zuri-repl
  %> dict.is_empty()
  false
  %> {}.is_empty()
  true
  ```


.find_key(_x: any_) {#find_key}

: Returns the key whose value is equal to _x_ in the dictionary or `nil` if no key has the value _x_.<br>

  For example:

  ```zuri-repl
  %> dict.find_key('james')
  'username'
  %> dict.find_key('camel')
  ```


.to_list() {#to_list}

: Returns a list that contains a list of key and a list of values from the dictionary. <br>

  For example:

  ```zuri-repl
  %> var dict = {username: 'james', email: 'a@b.c'}
  %> dict.to_list()
  [[username, email], [james, a@b.c]]
  ```


.each(_callback: function_) {#each}

: Executes the provided callback once for each key/value pair in the dictionary.

  For example:

  ```zuri-repl
  %> var info = {name: 'Pius', age: 46}
  %> 
  %> # calling each without using data
  %> echo info.each(@{
  ..   echo 'Iterating dictionary'
  .. })
  'Iterating dictionary'
  'Iterating dictionary'
  ```

  The callback function can accept zero or more arguments. When the callback function 
  accepts arguments, the current value will be passed to the first parameter 
  whenever the callback is called.

  For example:

  ```zuri-repl
  %> # calling each for values only
  %> echo info.each(@(value) {
  ..   echo value
  .. })
  'Pius'
  46
  ```

  If the callback function has more than one parameter, the second parameter is assigned 
  the value of the key of the current value in the dictionary.

  For example:

  ```zuri-repl
  %> # calling each for both key and value
  %> echo info.each(@(value, key) {
  ..   echo '${key} = ${value}'
  .. })
  'name = Pius'
  'age = 46'
  ```


.filter(_callback: function_) {#filter}

: Returns a portion (shallow copy) of the dictionary filtered down to the key/value pairs
  in the dictionary that pass the test done by the callback function.

  The `filter` callback function accepts and is passed the same values as [.each()](#each).

  The callback function is required to return a value that can resolves as true for 
  elements that should be kept or resolves as false for elements that should not be kept.

  If no element passes the test in the callback, an empty dictionary is returned.

  For example:

  ```zuri-repl
  %> var info = {name: 'Pius', age: 46}
  %> 
  %> echo info.filter(@(value) {
  ..   return is_number(value)
  .. })
  {age: 46}
  ```


.some(_callback: function_) {#some}

: Returns `true` if at least one key/value pair in the dictionary pases the test conducted 
  by the callback function. The callback function is required to return a value that can 
  resolves as true for elements that should be kept or resolves as false for elements 
  that should not be kept.

  The `some` callback function accepts and is passed the same values as [.each()](#each).

  For example:

  ```zuri-repl
  %> var info = {name: 'Pius', age: 46}
  %> 
  %> echo info.some(@(value) {
  ..   return is_bool(value)
  .. })
  false
  %> 
  %> echo info.some(@(value, key) {
  ..   return key == 'age'
  .. })
  true
  ```


.every(_callback: function_) {#every}

: Returns `true` if all the key/value pair in the dictionary pases the test conducted by 
  the callback function. The callback function is required to return a value that can 
  resolves as true for elements that should be kept or resolves as false for elements 
  that should not be kept.

  The `every` callback function accepts and is passed the same values as [.each()](#each).

  For example:

  ```zuri-repl
  %> var scores = {kally: 56, anna: 79, bolf: 19}
  %> 
  %> echo scores.every(@(value) {
  ..   return value > 70
  .. })
  false
  %> 
  %> echo scores.every(@(value, key) {
  ..   return key.length() >= 3 and value > 0
  .. })
  true
  ```


.reduce(_callback: function [, initial\_value: any = nil]_) {#reduce}

: Executes the reducer callback function on every key/value pair in the dictionary in order, 
  passing in the return value from the previous calculation on the preceeding element and 
  returning a single value equal to the result of running the reducer callback across 
  all elements.

  This method is the same as the [list.reduce()](./lists#reduce) method except that this 
  method works on dictionaries and key/value pairs. For dictionaries, keys are used instead 
  of indices.

  See [list.reduce()](./lists#reduce) for more information about `reduce()`


<br><br>

[Previous Topic](./lists) | [Next Topic](./functions)