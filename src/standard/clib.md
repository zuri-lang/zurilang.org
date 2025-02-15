# clib
The `clib` module exposes Blade capabilities to interact with C
shared libraries. The workflow follows a simple approach.
- Load the library
- Define the function schematics
- Call the function.
That simple!
For example, the following code `dirname()` and `cos()` function from the
standard C library on a Unix machine (Linux, OSX, FreeBSD etc).
```blade
# Import clib
import clib
# 1. Load 'libc' shared module available on Unix systems
var lib = clib.load('libc')
# 2. Declare the functions
var dirname = lib.define('dirname', clib.char_ptr, clib.char_ptr)
var cos = lib.define('cos', clib.double, clib.double)     # this may not work on linux
# 3. Call the functions
echo dirname('/path/to/my/file.ext')
echo cos(23)
# Close the library (this is a good practice, but not required)
lib.close()
```
The first argument to a definition is the name of the function.
The second is its return type. If the function takes parameters,
the parameter types follow immediately. (See below for a list of the
available types.)
> **NOT YET SUPPORTED:**
> - Variadic functions

## Fields

_clib_.**void** &#x279D; _ptr_
: C void type

_clib_.**bool** &#x279D; _ptr_
: C bool type

_clib_.**uint8\_t** &#x279D; _ptr_
: C uint8_t type

_clib_.**int8\_t** &#x279D; _ptr_
: C int8_t type

_clib_.**byte** &#x279D; _ptr_
: C byte type

_clib_.**ubyte** &#x279D; _ptr_
: C ubyte type

_clib_.**uint16\_t** &#x279D; _ptr_
: C uint16_t type

_clib_.**int16\_t** &#x279D; _ptr_
: C int16_t type

_clib_.**uint32\_t** &#x279D; _ptr_
: C uint32_t type

_clib_.**int32\_t** &#x279D; _ptr_
: C int32_t type

_clib_.**uint64\_t** &#x279D; _ptr_
: C uint64_t type

_clib_.**int64\_t** &#x279D; _ptr_
: C int64_t type

_clib_.**ssize\_t** &#x279D; _ptr_
: C ssize_t type

_clib_.**float** &#x279D; _ptr_
: C float type

_clib_.**double** &#x279D; _ptr_
: C double type

_clib_.**uchar** &#x279D; _ptr_
: C uchar type

_clib_.**char** &#x279D; _ptr_
: C char type

_clib_.**ushort** &#x279D; _ptr_
: C ushort type

_clib_.**short** &#x279D; _ptr_
: C short type

_clib_.**uint** &#x279D; _ptr_
: C uint type

_clib_.**int** &#x279D; _ptr_
: C int type

_clib_.**ulong** &#x279D; _ptr_
: C ulong type

_clib_.**long** &#x279D; _ptr_
: C long type

_clib_.**size\_t** &#x279D; _ptr_
: C size_t type

_clib_.**long\_double** &#x279D; _ptr_
: C long_double type

_clib_.**char\_ptr** &#x279D; _ptr_
: C char_ptr type

_clib_.**uchar\_ptr** &#x279D; _ptr_
: C uchar_ptr type

_clib_.**ptr** &#x279D; _ptr_
: C ptr type

_clib_.**function** &#x279D; _ptr_
: C closure/callback type


## Functions

_clib_.load(_name_) {#clib.load}

: Loads a new C shared library pointed to by name. Name must be a 
  relative path, absolute path or the name of a system library. 
  If the system shared library extension is omitted in the name, 
  it will be automatically added.


  - **@params**:
    - _string_ **name**

  {.params}
  - **@returns**: _CLib_
  {.returns}



_clib_.new(_type_, _..._) {#clib.new}

: Creates a new C value for the specified clib type with the given values.


  - **@params**:
    - _clib_type_ **type**
    - _any..._ **values**

  {.params}
  - **@returns**: _bytes_
  {.returns}



_clib_.get(_type_, _data_) {#clib.get}

: Returns the data contained in a C type _type_ encoded in the data.
  The data should either be an output of `clib.new()` or a call to a 
  function returning one of struct, union or array.
  
  For structures created with `named_struct()`, a dictionary will 
  automatically be returned with the values mapped to the names of the 
  structure elements.


  - **@params**:
    - _clib_type_ **type**
    - _string|bytes_ **data**

  {.params}
  - **@returns**: _list|dictionary_
  {.returns}



_clib_.get\_ptr\_index(_pointer_, _type_, _index_) {#clib.get_ptr_index}

: get_ptr_index(pointer: ptr, type: clib_type, index: number)
  
  Get the value at the given index of a pointer based 
  on the given CLib type.


  - **@params**:
    - _ptr_ **pointer**
    - _clib_type_ **type**
    - _number_ **index**

  {.params}
  - **@returns**: _any_
  {.returns}



_clib_.set\_ptr\_index(_pointer_, _type_, _index_, _value_) {#clib.set_ptr_index}

: Sets the value at the given index of a pointer based 
  on the given CLib type to the given value.


  - **@params**:
    - _ptr_ **pointer**
    - _clib_type_ **type**
    - _number_ **index**
    - _any_ **value**

  {.params}
  - **@returns**: _any_
  {.returns}



_clib_.function\_handle(_handle_, _return_type_, _..._) {#clib.function_handle}

: Defines a new C function from an existing handle and return type.
  -  When there are no more argument, it is declared that the function
     takes no argument.
  -  `define()` expects a list of the argument/parameter types as expected
     by the function.
  
  E.g.
  
  ```blade
  function_handle(my_ptr, int, int, ptr)
  ```
  
  Corresponds to the C declaration:
  
  ```c
  int (*my_ptr)(int a, void *b);
  ```


  - **@params**:
    - _ptr_ **handle**
    - _clib_type_ **return_type**
    - _clib_type..._ **arg_types**

  {.params}
  - **@returns**: _function_
  {.returns}



_clib_.create\_callback(_closure_, _return_type_, _..._) {#clib.create_callback}

: Creates a callback to be passed to C functions expecting a callback.
  
  For example, imagine a C function defined as below:
  
  ```c
  void ex_puts(const char *name, void (*fn)(char *req, char *res));
  ```
  
  To pass the callback (second parameter) to this function, you'll need to 
  wrap a blade function with `create_callback()` to properly define the 
  callback return type and parameters.
  
  The above function can be defined as:
  
  ```blade
  var fn lib.define('ex_puts', clib.void, clib.char_ptr, clib.function)
  ```
  
  To call this function and pass a Blade function that can be called when C 
  triggers the callback, the second argument to the function will need to be 
  wrapped in `create_callback()`. Thus, the above function can be called 
  like this:
  
  ```blade
  fn(
     'Blade Callbacks', 
     clib.create_callback(
       @(req, res) {
         echo 'Request is: ' + req
         echo 'Response is: ' + res
       }, 
       clib.void, # The return type of the callback
       clib.char_ptr, clib.char_ptr  # the parameters of the callback
     )
  )
  ```
  
  > **NOTE:** A callback can only be passed to a parameter previously defined 
  > as function.


  - **@params**:
    - _function_ **closure**
    - _clib_type_ **return_type**
    - _clib_type..._ **types**

  {.params}
  - **@returns**: _clib_callback_
  {.returns}



_clib_.struct(_..._) {#clib.struct}

: Returns a type that can be used to declare structs. 
  To create or read value for the struct you need to use the `new()` 
  and `get()` functions respectively.
  Alternatively, you may use the `pack()` and `unpack()` 
  function in the `struct` module respectively.


  > **@notes**:
  > 
  > - This function can also be used to define a C union or array.

  - **@params**:
    - _any..._ **type**

  {.params}
  - **@returns**: _type_
  {.returns}



_clib_.named\_struct(_types_) {#clib.named_struct}

: Returns a type that can be used to declare structs based on the named 
  types. The function works well with the `get()` function because it 
  automatically assigns the name of the struct elements when getting the 
  value. 
  
  To create or read value for the struct you need to use the `new()` 
  and `get()` functions respectively.
  Alternatively, you may use the `pack()` and `unpack()` 
  function in the `struct` module respectively.


  > **@notes**:
  > 
  > - This function can also be used to define a C union or array.

  - **@params**:
    - _dictionary_ **types**

  {.params}
  - **@returns**: _type_
  {.returns}



## Classes

_class_ **Clib** {#clib.Clib .class}

: class CLib provides an interface for interacting with C shared modules.



  .Clib(_name_) &#x279D; _Constructor_ {#clib.Clib.Clib}

  : clib.Clib constructor


    > **@notes**:
    > 
    > - The _name_ should follow the same practice outlined in `load()`.

    - **@params**:
      - _string?_ **name**

    {.params}


  .load(_name_) {#clib.Clib.load}

  : Loads a new C shared library pointed to by name. Name must be a 
    relative path, absolute path or the name of a system library. 
    If the system shared library extension is omitted in the name, 
    it will be automatically added except on Linux machines.


    - **@params**:
      - _string_ **name**

    {.params}


  .close() {#clib.Clib.close}

  : Closes the handle to the shared library.




  .function(_name_) {#clib.Clib.function}

  : Retrieves the handle to a specific function in the shared library.


    - **@params**:
      - _string_ **name**

    {.params}
    - **@returns**: _ptr_
    {.returns}


  .define(_name_, _return_type_, _..._) {#clib.Clib.define}

  : Defines a new C function with the given name and return type.
    -  When there are no more argument, it is declared that the function
       takes no argument.
    -  `define()` expects a list of the argument/parameter types as expected
       by the function.
    
    E.g.
    
    ```blade
    define('myfunc', int, int, ptr)
    ```
    
    Corresponds to the C declaration:
    
    ```c
    int myfunc(int a, voidb);
     ```


    - **@params**:
      - _string_ **name**
      - _clib_type_ **return_type**
      - _clib_type..._ **types**

    {.params}
    - **@returns**: _function_
    {.returns}


  .get\_pointer() {#clib.Clib.get_pointer}

  : Returns a pointer to the underlying module.


    - **@returns**: _ptr_
    {.returns}




