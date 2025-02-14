# process

This module allows parallel processing by providing classes and functions 
that allows for spawning operating system processes thereby leveraging multiple 
processors on a machine. 

Example Usage:

```blade
var paged = PagedValue()

var pr = Process(@(p, s) {
  echo 'It works!'
  echo p.id()
  s.set({name: 'Richard', age: 3.142})
}, paged)

pr.on_complete(@{
  echo paged.get()
})

pr.start()
echo 'It works fine!'
# pr.await()  # this can be used to wait for completion.
echo 'It works fine again!'
```

Output:

```sh
It works fine!
It works fine again!
It works!
75608
{name: Richard, age: 3.142}
```

## Fields

**cpu\_count** &#8674; _number_
:  The number of CPU cores available on the current device.


## Functions

process(_fn_, _paged_) &#8674; Exported {#process.process}

: Creates a new instance of Process for the function _`fn`_. This 
  constructor accepts an optional PagedValue.
  
  The function passed to a process must accept at least one parameter which 
  will be passed the instance of the process itself and at most two parameters 
  if the process was initialized with a PagedValue.


  - **@params**:
    - _function_ **fn**
    - _PageValue?_ **paged**

  {.params}



## Classes

_class_ **PagedValue** {#process.PagedValue .class}

: The PagedValue object allows the sharing of single value/state between 
  processes and the main application or one another. 
  
  PagedValue supports the following types:
  
  - Boolean
  - Number
  - String
  - List
  - Dictionary
  
  @note Lists and Dictionaries cannot be nested in a PagedValue.


  .PagedValue(_executable_, _private_) &#8674; Constructor {#process.PagedValue.PagedValue}

  : - **@params**:
      - _bool?_ **executable**
      - _bool?_ **private**

    {.params}


  .lock() {#process.PagedValue.lock}

  : Locks the PagedValue and disallows updating the value.




  .unlock() {#process.PagedValue.unlock}

  : Unlocks the PagedValue to allow for updating the value.




  .is\_locked() {#process.PagedValue.is_locked}

  : Returns `true` if the PagedValue is locked for updating or `false` otherwise.


    > **@notes**:
    > 
    > - a PagedValue is locked if in an invalid state.

    - **@returns**: _boolean_


  .set(_value_) {#process.PagedValue.set}

  : Sets the value of the PagedValue to the given value. It returns the number of 
    bytes written or `false` if the PagedValue is in an invalid state.


    - **@params**:
      - _boolean|number|string|list|dictionary_ **value**

    {.params}
    - **@returns**: _number | boolean_


  .locked\_set(_value_) {#process.PagedValue.locked_set}

  : Locks the PagedValue for writing then sets the value to the given value and unlocks it. 
    It returns the number of bytes written or `false` if the PagedValue is in an invalid state.


    - **@params**:
      - _boolean|number|string|list|dictionary_ **value**

    {.params}
    - **@returns**: _number | boolean_


  .get() {#process.PagedValue.get}

  : Returns the value stored in the PagedValue or `nil` if no value has been set.


    - **@returns**: _any_


  .raw\_pointer() {#process.PagedValue.raw_pointer}

  : Returns the pointer to the raw memory paged location pointed to by the object.


    - **@returns**: _ptr_




_class_ **Process** {#process.Process .class}

: This class allows creating and spawning operating system processes 
  and using them to run functions.



  .Process(_fn_, _paged_) &#8674; Constructor {#process.Process.Process}

  : Process(fn: function [, paged: PagedValue])
    
    Creates a new instance of Process for the function _`fn`_. This 
    constructor accepts an optional PagedValue.
    
    The function passed to a process must accept at least one parameter which 
    will be passed the instance of the process itself and at most two parameters 
    if the process was initialized with a PagedValue.


    - **@params**:
      - _function_ **fn**
      - _PageValue?_ **paged**

    {.params}


  .id() {#process.Process.id}

  : Returns the ID of the process or `-1` if the process is in an invalid 
    state or has not been started.


    - **@returns**: _number_


  .on\_complete(_fn_) {#process.Process.on_complete}

  : Adds a new listener to be called when the process finishes execution.


    - **@params**:
      - _function_ **fn**

    {.params}


  .start() {#process.Process.start}

  : Starts/runs the process. This function returns `true` or `false` if the 
    process is in an invalid state.


    - **@returns**: _boolean_


  .await() {#process.Process.await}

  : Awaits for the process to finish running and returns it's exit code or `-1` 
    if the process is in an invalid state. Await can be used without `start()`.
    If `await()` is called without a previous call to start(), the await
    automatically calls start().


    - **@returns**: _number_


  .is\_alive() {#process.Process.is_alive}

  : Returns `true` if the process is running or `false` if not.


    - **@returns**: _boolean_


  .kill() {#process.Process.kill}

  : Kills the running process. Returns `true` if the process was successfully 
    killed or `false` otherwise.


    - **@returns**: _boolean_




