# threads

The thread module provides functionality for creating and 
controlling threads. With the thread module, you can create 
applications that perform multiple operations at the same 
time. 

Operations that can potentially block/hold up other operations 
can be executed on separate threads.

As the workload of your application increases, the need to 
offload long tasks to a separate thread of execution becomes 
apparent when creating scalable applications.

### Create and start a new thread

You can create a thread by creating a new instance if the `Thread` 
class wither directly or via the `thread()` function and passing 
in a function delegate that will be called when the thread is run.
To start the thread, you can call the start function passing 
parameters for the thread delegate function to it directly to the 
start function.

For example, the following code creates and start a new thread by 
creating an instance of the Thread class directly,

```blade-repl
import thread

var th = thread.Thread(@(t, name) {
  echo name * 5
})

th.start('John')
```

The `thread()` function serves as a syntax sugar for this as well
as a module function and like other blade module functions is the 
conventional way to create an instance of a thread. The example 
below is a rewrite of the previous example with the module function.

```blade-repl
import thread

var th = thread(@(t, name) {
  echo name * 5
})

th.start('John')
```

Since for most use-cases this is exactly the process you'll want and
not very often will you need to configure settings on a thread, the 
`start()` module function provides a simply way of combining this 
process into a single function call. However, unlike with the Thread 
instance or thread function, the start function accepts it's delegate 
function arguments as a list in its second argument. This makes it 
very friendly for creating fine-tuned and non-predefined arguments 
to the delegate function.

The example below rewrites the previous functionality by using the 
start function.

```blade-repl
import thread

var th = thread.start(@(t, name) {
  echo name * 5
}, ['John'])
```

Notice that the `start()` function is more concise. Unless you need to 
configure the thread behavior before starting a thread, the `start()` 
function is the idiomatic way to create threads.

> **NOTICE THE _t_ VARIABLE?**
>
> When a thread's delegate function accepts parameters, it will always 
> be given the thread instance itself as the first argument. Any other 
> argument passed into the function will be received in the succeeding
> parameters.
### Awaiting a thread

### Stopping a thread

### Renaming a thread

## Properties

- **cpu\_count** &#8674; _number_:

  The number of CPU cores available on the current device.


## Functions

#### thread(delegate, stack_size)

Returns a new instance of Thread.



@see Constructor

##### Parameters

- _function_ **delegate**
- _number?_ **stack_size**

##### Returns

- Thread



#### start(delegate, args)

Creates a new thread and automatically starts the thread 
using the default options and arguments.

##### Parameters

- _function_ **delegate**
- _list_ **args**




## Classes

### _class_ Thread

The thread class exposes methods to manage creating, running, 
and controlling threads.

@class

#### Methods

#### Thread(delegate, stack_size) &#8674; Constructor

The delegate function passed to the constructor may accept zero 
or more parameters. When it accepts no parameter, the function 
will be called without any argument when run otherwise, it will 
be called with as many argument as it can receive.

When a delegate accepts arguments, the first argument passed 
will always be the thread object itself followed by the arguments 
it received from start.

For example, in the following thread execution, the first 
parameter _t_ in the delegate will receive the thread object 
itself.

```blade
var th = Thread(@(t) {
  echo t.get_id()
})

th.start(21)
```

The delegate function doesn't raise an exception because parameter 
_t_ never received the `start()` argument but the thread itself. 
In the next example, the function accepts the start argument. Note 
that the start argument was received starting from the second 
argument.

```blade
var th = Thread(@(t, balance) {
  echo balance
})

th.start(21)
```

The optional second parameter allows us to set the size of the stack
used for the thread when started.

##### Parameters

- _function_ **delegate**
- _number?_ **stack_size**


#### start(...)

Starts the thread by putting it in the running state and passing 
any argument to the function to the thread function itself.

If no argument is provided, no argument is passed to the function 
otherwise, arguments will be passed to the thread function only 
when the thread function is only able to accept them.

>*NOTE:** A thread can only be started once.

##### Parameters

- _any..._ **args**


#### start\_from\_list(args)

Same as `start()` but takes the argument from a list instead.

##### Parameters

- _list_ **args**


#### cancel()

Terminates the thread by sending kill signals to the thread 
and freeing all associated resources afterwards. If the thread 
has already been cancelled, then it does nothing.

Returns `true` if the thread was successfully terminated and all 
resources freed otherwise it returns `false`.

##### Returns

- bool

#### detach()

Marks this thread as a detached thread.

When a detached thread terminates, its resources are automatically 
released back to the system without the need for another thread to 
join with the terminated thread.

Once a thread is detached, it can't be awaited anymore.

The detached attribute merely determines the behavior of the
system when the thread terminates; it does not prevent the thread
from being terminated if the process terminates (or equivalently, if 
the main thread returns).

Either `await() or `detach()` should be called for each thread that 
an application creates, so that system resources for the thread can 
be released.  (But note that the resources of any threads for which 
one of these actions has not been done will be freed when the process 
terminates.).

If the thread was already detached, it simply returns `true` and 
does nothing.

##### Returns

- bool

#### await()

Suspends execution until the thread terminates. If the thread 
has already terminated, it returns immediately.

Multiple threads can call `await()` at the same time, but only 
one of them will be actively waiting while others will remain in 
a suspended state until the thread exits. If `await()` is called 
from another cancelled thread, then this thread will remain 
awaitable.

Failure to join with a thread that is joinable (i.e., one that is
not detached), produces a "zombie thread".  Avoid doing this,
since each zombie thread consumes some system resources, and when
enough zombie threads have accumulated, it will no longer be
possible to create new threads (or processes).

All of the threads in an application are peers: any thread can join
with any other thread in the process.


#### sleep(duration)

Causes the current thread to sleep for the specified number of seconds.

##### Parameters

- _number_ **duration**


#### yield()

Causes the calling thread to relinquish the CPU.

The thread is moved to the end of the queue for its static 
priority and a new thread gets to run.

If the calling thread is the only thread in the highest 
priority list at that time, it will continue to run after a 
call to `yield()`.

On success, returns `true` and otherwise `false`.

##### Returns

- bool

#### set\_name(name)

Sets the internal name for the calling thread to string 
value specified by name argument.

By default, all the threads inherit the program name. 
The `set_name()` function can be used to set a unique name 
for a thread, which can be useful for debugging 
multithreaded applications. The thread name should be a 
meaningful string, whose length is restricted to 15 
characters.

Returns `true` if successful and `false` otherwise.

##### Parameters

- _string_ **name**

##### Returns

- bool

#### get\_name()

Returns the name of the current thread.

##### Returns

- string

#### set\_stack\_size(size)

sets the stack size attribute of the thread attributes 
object to the value specified in _size_.

The stack size attribute determines the minimum size 
(in bytes) that will be allocated for the thread when created.

Some systems have a minimum stack size and setting the 
number below that can lead to undefined behaviors. For 
this reason, the minimum stack size allowed is `16384` 
bytes (16kb) and the default stack size when not set is 
65536 bytes (64kb). 

On some systems, this setting will be ignored if _size_ 
is not a multiple of the system page size.

##### Parameters

- _number_ **size**


#### get\_stack\_size()

Returns the size of the stack allocated to the thread 
when created.

##### Returns

- number

#### get\_id()

Returns the ID of the current thread.

##### Returns

- number

#### is\_alive()

Returns true if the thread is started and alive (running) 
or false if not.

##### Returns

- bool



