# Error Handling

In this chapter, we'll be discussing the exceptions and error handling in Zuri. Their types and how to raise and handle them.

## Reference

- [Error Handling](#error-handling)
  - [Reference](#reference)
  - [Exceptions](#exceptions)
  - [Custom Exceptions](#custom-exceptions)
  - [Catching Exceptions](#catching-exceptions)
      - [Why Zuri doesn't have a Try..Catch mechanism.](#why-zuri-doesnt-have-a-trycatch-mechanism)
      - [Catching Exceptions in Zuri](#catching-exceptions-in-zuri)
  - [Asserts](#asserts)


There are generally two types of errors that can occur in Zuri &mdash; `Syntax Errors` and `Runtime Exceptions`. 
A Syntax error occurs when you attempt to run an invalid program, while a Runtime Exception is any error that occurs during the execution of the program. 

Zuri typically reports Syntax errors looking like the below.

> **_@note:_** Syntax errors cannot be handled.

```zuri-repl
SyntaxError at ':': end of statement expected
  <repl>:1
```

While Runtime Exceptions are reported similar to the following.

```zuri-repl
Unhandled Exception: only functions and classes can be called
  StackTrace:
    <repl>:1 -> @.script()
```


## Exceptions

Zuri comes with the built-in _class_ `Exception` which is raised everytime a Runtime Exception occurs. For example,

```zuri-repl
%> [1,2,3][5]
Unhandled Exception: list index 5 out of range
  StackTrace:
    <repl>:1 -> @.script()
```

Zuri allows us to manually trigger a Runtime Exception at any point in a program as well using the `raise` keyword. The raise keyword must be followed by an exception or a variable that contains an exception.

For example:

```zuri-repl
%> raise Exception('I was manually triggered')
Unhandled Exception: I was manually triggered
  StackTrace:
    <repl>:1 -> @.script()
```


## Custom Exceptions

You can define custom Exception classes by subclassing the class `Exception`. All custom Exceptions in Zuri must descend 
from the built-in `Exception` class.

For example:

```zuri-repl
%> class MyCustomException < Exception {}
%> raise MyCustomException('Something happened')
Unhandled MyCustomException: Something happened
  StackTrace:
    <repl>:1 -> @.script()
```


## Catching Exceptions

Unlike most languages, Zuri takes a unique approach to catching exceptions. Before we delve into how to catch exceptions in Zuri, it is important to know the fundational reasons why Zuri does it exactly the way it does.

#### Why Zuri doesn't have a Try..Catch mechanism.

A lot of C-like languages like Zuri have a `try...catch..(finally...)` expression or a mechanism that implements the same. Other languages like Rust and Go have opted to implement a recover or unwind function. Zuri does none of the above for simple reasons.

To more understand Zuri's approach, it is important to understand the need for a try...catch...finally... construct in the first place and why most programming languages have it.

In any system that is capable of producing an error and/or raising an exception, users of the system will always find themselves in a situation where they need to recover from such errors and that is essentially what the try..catch.. construct attempts to solve.

Irrespective of how a language chooses to allow users handle exceptions, the principal needs of the users of the language does not change. Generally, users waant to:

- Catch and manage runtime errors, preventing program crashes.
- Handle unexpected events or conditions.
- Ensure program reliability and stability.
- Simplify error identification and diagnosis.
- Handle errors gracefully and continue execution after handling errors.

If you take a careful and close look at the list above, you'll soon notice that the most important part of error handling is in the ability to catch errors. What this means in summary is that if you could efficiently catch and/or recover from errors, the rest of the construct itself is inconsequencial so long as a user can:

- Understand the error's origin and context.
- Define error handling logic.

#### Catching Exceptions in Zuri

Zuri's approach to error handling is as simple as it gets. Zuri's error handling system is centered on what the user actually needs &mdash; **The catch block**.

The center of Zuri's exception handling is the catch block itself. In Zuri, any code surrounded by the catch block never raise and exception. Rather, any exception raised within the catch block is passed on to the optional `catch variable` and the execution of code skips to the end of the catch block.

The code below uses the catch block to make sure tha the exception raised never fires.

```zuri-repl
%> catch {
..   raise Exception('Nothing happens!')
.. }
```

To recover the exception raised in the catch block, Zuri allows naming catch blocks and turn it into a regular variable by following the catch block with the `as` keyword followed by the variable name of the catch block. 

This variable will hold the exception raised in the catch block and can be treated by the caller at anytime in the lifetime of the application they choose to.

The code below modifies the previous example by assigning a name to the catch block.

```zuri-repl
%> catch {
..   raise Exception('Nothing happens!')
.. } as e
%> e
<class Exception instance at 0x60000100c060>
```

We can now handle the exception at any time in the application. The code below extract the type of the exception, the error message and the stacktrace.

```zuri-repl
%> if e {
..   echo e.type
..   echo e.message
..   echo e.stacktrace
.. }
'Exception'
'Nothing happens!'
'    <repl>:2 -> @.script()'
```

You can also check the type of exceptions using the `instance_of()` built-in function. This is particularly useful for custom exceptions but for most simple use-cases, checking the `exception.type` string is usually sufficient.

The code below uses the instance function to check the exception type while handling the error.

```zuri-repl
%> class MyCustomException < Exception {}
%> 
%> var x = 50
%> 
%> catch {
..   if x == 50 {
..     raise MyCustomException('Something custom happened')
..   } else {
..     raise Exception('Exception happened')
..   }
.. } as error
%> 
%> if instance_of(error, MyCustomException) {
..   echo 'A custom exception was raised'
..   echo error.message
.. } else {
..   echo 'Regular exception raised'
..   echo error.message
.. }
'A custom exception was raised'
'Something custom happened'
```


## Asserts

Often times, we want to verify that one or more conditions are true before we continue execution otherwise, termiate the 
function and/or process and stop it from going further. This can be achieved using complicated and/or nested `if...else...` 
blocks with a messy use of the `raise` command, but Zuri offers a more intuitive approach via the `assert` command.

For example:

```zuri-repl
%> assert 10 == 5
Illegal State:
  StackTrace:
    <repl>:1 -> @.script()
%> 
%> var a = 13
%> var b = 24
%> assert a != b
```

The assert command also takes an optional error value of any value type that can be specified by separating the assertion 
and the message by a comma (`,`). None string error messages will be converted to string before raising an Exception.

For example:

```zuri-repl
%> assert 5 > 25, 'Bad mathematician!'
Illegal State: Bad mathematician!
  StackTrace:
    <repl>:1 -> @.script()
```




<br><br>

[Previous Topic](./working-with-files) | [Next Topic](./modules)