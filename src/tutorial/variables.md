# Variables & Statements

Variables are a basic building block in programming and they are basically memorable names associated 
with values within a codespace that can be used to refer to the said value latter in the code.

## Reference

- [Variables \& Statements](#variables--statements)
  - [Reference](#reference)
  - [Declaraing Variables](#declaraing-variables)
  - [Valid variable names](#valid-variable-names)
  - [Variable scopes](#variable-scopes)
  - [Naming Convention](#naming-convention)
  - [Statements](#statements)


## Declaraing Variables

In Zuri, the process of declaring a variable and assigning to a value to it are two distinct and 
non-dependent actions. To declare a variable, use the `var` keyword. Any variable declared without a 
value will automatically be assigned the value `nil`.

For example:

```zuri-repl
%> var a 
%> a
```

To assign or reassign/overwrite the value of a declared variable, you can simply use the `=` operator. 
For example,

```zuri-repl
%> a = 25
%> a
25
%> a = 'Hello, World'
%> a
'Hello, World'
```

Due to the frequent need to declare and assign values to variables, Zuri allows you to declare a variable
and assign value to it using a continious statement as follows:

```zuri-repl
%> var a = 'Great!'
%> a
'Great!'
```

Zuri also allows chaining variable declarations as well as it's assignment form discussed just now using
a comma (`,`) as a separator.

For example:

```zuri-repl
%> var animal, food   # declaration without assignment
%> animal
%> food
%> 
%> var name = 'Joe', age = 31, is_adult = true  # declaration with assignment
%> name
'Joe'
%> age
31
%> is_adult
true
```

Anything can be assigned to a value.

## Valid variable names

A valid variable name in Zuri follows the C convention. A variable name must start with either an ASCII alphabet (`A to Z` 
whether in the lower or upper case) or and underscore (`_`), followed by zero or more combinations of ASCII alphabets, numbers 
or underscore.

For example:

`_`, `a`, `_9`, `_test`, `test`, `another_test`, `Big_test`, `AVeryBigText`, `rot13` etc.

> **_Reserved words cannot be used as variable names_**

The following variable declaration is bound to fail as it makes use of a reserved word and will trigger a `SyntaxError`.

```zuri-repl
%> echo = 'Failure!'
SyntaxError at '=': expected expression
  <repl>:1
```

## Variable scopes

Zuri variables are scoped to their parent block and do not override or hide variables declared outside the given block. For example:

```zuri-repl
%> var a = 200
%> {
..   var a = 100
..   {
..     var a =  50
..     echo a
..   }
..   echo a
.. }
50
100
%> echo a
200
```

Scopes are in the following hierarchy in _descending_ order.

- **Module**: Variables declared globally in a module, accessible to all scopes in the module.
- **Instance**: Variables bound specifically to an instance of a class.
- **Class**: Variables belonging to a class shared by all child functions and instances.
- **Function**: Variables declared within a function. This is the same as the local scope.
- **Blocks**: Variables declared within a block. E.g. `if`, `while` block.


## Naming Convention

While Zuri as a language does not restrict the user to any particular naming convention, throughout
this tutorial and the entire documentation, the following conventions will be adhered to. The Zuri
community is adviced but not required to try to comply with the convention.

> **_The convention stated below is subject to improvement and all suggestions are welcomed and 
> will be treated with high regards._**

<br>

1. Prefer snake case variables over camel case variables. For example, instead of `myVar`, use
  `my_var`.
2. Function names begin with lower case. For example, `my_function`.
3. Class names begins in upper case and are preferably camel cased. For example, `MyClass`.
4. File and directory names are preferably in lower case and spaces in the names treated with 
   snake casing. This help to keep module and packages names for importation in-tune with the
   rest of the codebase. For example, instead of `MyPackage/MyFile.b`, use `my_package/my_file.b`.

<br>
> A few other conventions exits, but they are not highlighted here as they are REQUIRED and DEFINED
> by the language and cannot be altered. For example, to make a method private to a class, the name
> is _required_ to start with an `_`. Other conventions similar to this exists and are not covered
> here but under their respective topics.


## Statements

A statement is a unit of a code that expresses some actions to be carried out and programs are built on statements. In Zuri, statements should be terminated with a new line or a semi-colon (`;`). Most of 
our examples so far have used new lines and that's what we'll use for most of the documentation. But 
you should know that statements can also be terminated by semicolons.

For example, we can have multiple variable assignment on the same line as follows:

```zuri-repl
%> var a, b   # this statement is separated from the next one using a newline
%> a = 20; b = 35  # two statements on a line separated using a semi-colon
%> a; b
20
35
```

> **_@convention:_** Terminate statements with a newline. Only use a semi-colon when the respective statements
> are short and using a semi-colon wouldn't introduce any confusion or illegibility.



<br><br>

[Previous Topic](./strings) | [Next Topic](./reserved)