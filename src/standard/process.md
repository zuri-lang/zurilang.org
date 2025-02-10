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

## Properties

- **cpu\_count** &#8674; _number_:

  The number of CPU cores available on the current device.


## Functions

#### process(fn, paged) &#8674; Exported

Creates a new instance of Process for the function _`fn`_. This 
constructor accepts an optional PagedValue.

The function passed to a process must accept at least one parameter which 
will be passed the instance of the process itself and at most two parameters 
if the process was initialized with a PagedValue.

##### Parameters

- _function_ **fn**
- _PageValue?_ **paged**




## Classes

### _class_ PagedValue

The PagedValue object allows the sharing of single value/state between 
processes and the main application or one another. 

PagedValue supports the following types:

- Boolean
- Number
- String
- List
- Dictionary

@note Lists and Dictionaries cannot be nested in a PagedValue.

#### Methods

#### PagedValue(executable, private) &#8674; Constructor



##### Parameters

- _bool?_ **executable**
- _bool?_ **private**


#### lock()

Locks the PagedValue and disallows updating the value.


#### unlock()

Unlocks the PagedValue to allow for updating the value.


#### is\_locked()

Returns `true` if the PagedValue is locked for updating or `false` otherwise.

##### Returns

- boolean
##### Notes

- a PagedValue is locked if in an invalid state.

#### set(value)

Sets the value of the PagedValue to the given value. It returns the number of 
bytes written or `false` if the PagedValue is in an invalid state.

##### Parameters

- _boolean|number|string|list|dictionary_ **value**

##### Returns

- number | boolean

#### locked\_set(value)

Locks the PagedValue for writing then sets the value to the given value and unlocks it. 
It returns the number of bytes written or `false` if the PagedValue is in an invalid state.

##### Parameters

- _boolean|number|string|list|dictionary_ **value**

##### Returns

- number | boolean

#### get()

Returns the value stored in the PagedValue or `nil` if no value has been set.

##### Returns

- any

#### raw\_pointer()

Returns the pointer to the raw memory paged location pointed to by the object.

##### Returns

- ptr



### _class_ Process

This class allows creating and spawning operating system processes 
and using them to run functions.

#### Methods

#### Process(fn, paged) &#8674; Constructor

Process(fn: function [, paged: PagedValue])

Creates a new instance of Process for the function _`fn`_. This 
constructor accepts an optional PagedValue.

The function passed to a process must accept at least one parameter which 
will be passed the instance of the process itself and at most two parameters 
if the process was initialized with a PagedValue.

##### Parameters

- _function_ **fn**
- _PageValue?_ **paged**


#### id()

Returns the ID of the process or `-1` if the process is in an invalid 
state or has not been started.

##### Returns

- number

#### on\_complete(fn)

Adds a new listener to be called when the process finishes execution.

##### Parameters

- _function_ **fn**


#### start()

Starts/runs the process. This function returns `true` or `false` if the 
process is in an invalid state.

##### Returns

- boolean

#### await()

Awaits for the process to finish running and returns it's exit code or `-1` 
if the process is in an invalid state. Await can be used without `start()`.
If `await()` is called without a previous call to start(), the await
automatically calls start().

##### Returns

- number

#### is\_alive()

Returns `true` if the process is running or `false` if not.

##### Returns

- boolean

#### kill()

Kills the running process. Returns `true` if the process was successfully 
killed or `false` otherwise.

##### Returns

- boolean



