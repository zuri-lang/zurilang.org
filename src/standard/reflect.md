# reflect

This module provides many functions that can be used to interact with or modify modules, 
classes and functions. It is well suited for many uses cases such as creating a library 
that is heavily dependent on decorators (e.g. the `json` module).

### For example,

We can call a decorator using the `reflect` module like this.

```blade
class A {
  @custom_decorator() {
    echo 'It works!'
  }
}

import reflect

var instance_of_a = A()
var decorator = reflect.get_decorator(instance_of_a, 'custom_decorator')

# It's always good to check the result first as it will be a good 
# practice to make decorators optional to make it easy for users to 
# opt-in and opt-out of features your package or library provide.
if decorator {
  decorator()
}
```

Try it out!

## Functions

_reflect_.has\_prop(_object_, _name_) {#reflect.has_prop}

: Returns `true` if instance has the property or module has a value with 
  the given name or `false` if not.


  - **@params**:
    - _instance|module_ **object**
    - _string_ **name**

  {.params}
  - **@returns**: _bool_
  {.returns}



_reflect_.get\_prop(_object_, _name_) {#reflect.get_prop}

: Returns the property of the instance or value in the module matching the 
  given name or nil if the object contains no property with a matching name.


  - **@params**:
    - _instance|module_ **object**
    - _string_ **name**

  {.params}
  - **@returns**: _any_
  {.returns}



_reflect_.get\_props(_object_) {#reflect.get_props}

: Returns all properties of an instance or value in a module or an empty
  list if the instance or module has no property.


  - **@params**:
    - _instance|module_ **object**
    - _string_ **name**

  {.params}
  - **@returns**: _list[string]_
  {.returns}



_reflect_.set\_prop(_object_, _name_, _value_) {#reflect.set_prop}

: Sets the named property of the object to value.


  > **@notes**:
  > 
  > - if the property already exist, it overwrites it.

  - **@params**:
    - _instance_ **object**
    - _string_ **name**
    - _any_ **value**

  {.params}
  - **@returns**: _bool: `true` if a new property was set, `false` if a property was updated_
  {.returns}



_reflect_.del\_prop(_object_, _name_) {#reflect.del_prop}

: Deletes the named property from the instance


  - **@params**:
    - _instance|module_ **object**
    - _string_ **name**

  {.params}
  - **@returns**: _bool_
  {.returns}



_reflect_.has\_method(_object_, _name_) {#reflect.has_method}

: Returns true if class of the instance has the method name or
  false if not.


  - **@params**:
    - _instance_ **object**
    - _string_ **name**

  {.params}
  - **@returns**: _bool_
  {.returns}



_reflect_.has\_decorator(_object_, _name_) {#reflect.has_decorator}

: Returns true if class of the instance implements the decorator name or
  false if not.


  - **@params**:
    - _instance_ **object**
    - _string_ **name**

  {.params}
  - **@returns**: _bool_
  {.returns}



_reflect_.get\_method(_object_, _name_) {#reflect.get_method}

: Returns the method in a class instance matching the given name
  or nil if the class of the instance contains no method with
  a matching name.


  - **@params**:
    - _instance_ **object**
    - _string_ **name**

  {.params}
  - **@returns**: _function_
  {.returns}



_reflect_.get\_decorator(_object_, _name_) {#reflect.get_decorator}

: Returns the decorator function matching the given name in the class 
  of the given instance.


  > **@notes**:
  > 
  > - the name of a decorator excludes the `@` character.

  - **@params**:
    - _instance_ **object**
    - _string_ **name**

  {.params}
  - **@returns**: _function_
  {.returns}



_reflect_.bind\_method(_object_, _method_) {#reflect.bind_method}

: Binds the given function to the instance, allowing you to access 
  the instance itself in the function via the `self` keyword in 
  the function.


  - **@params**:
    - _instance_ **object**
    - _function_ **method**

  {.params}
  - **@returns**: _function_
  {.returns}



_reflect_.get\_type(_object_) {#reflect.get_type}

: Returns the type of an instance as string


  - **@params**:
    - _instance_ **object**

  {.params}
  - **@returns**: _string_
  {.returns}



_reflect_.get\_function\_metadata(_function_) {#reflect.get_function_metadata}

: Returns the metadata of a function as a dictionary. 
  This dictionary contains the following keys:
  
  - `name`: The name of the function
  - `arity`: The number of none variable (...) arguments the function defines.
  - `is_variadic`: If the function accepts variable arguments
  - `captured_vars`: The number of variables captured (only greater than zero for captures).
  - `module`: The name of the module from where the function was defined.
  - `file`: The file in which the function was defined.


  > **@notes**:
  > 
  > - This function does not work for built-in functions

  - **@params**:
    - _function_ **object**

  {.params}
  - **@returns**: _dictionary_
  {.returns}



_reflect_.get\_class\_metadata(_klass_) {#reflect.get_class_metadata}

: Returns the metadata of a class as a dictionary. 
  This dictionary contains the following keys:
  
  - `name`: The name of the class.
  - `properties`: a list of the name of non-static properties defined in the class
  - `static_properties`: a list of the name of static properties defined in the class
  - `methods`: a list of the name of methods defined in the class
  - `superclass`: The name of the class it inherits from.


  - **@params**:
    - _class_ **klass**

  {.params}
  - **@returns**: _dictionary_
  {.returns}



_reflect_.get\_module\_metadata(_module_) {#reflect.get_module_metadata}

: Returns the metadata of an imported module as a dictionary. 
  This dictionary contains the following keys:
  
  - `name`: The name of the module.
  - `file`: The file from which the module was imported.
  - `has_preloader`: `true` if the module is a C extension with a preloader and `false` otherwise.
  - `has_unloader`: `true` if the module is a C extension with a unloader and `false` otherwise.
  - `definitions`: A list of the name of objects defined in the module.


  - **@params**:
    - _module_ **module**

  {.params}
  - **@returns**: _dictionary_
  {.returns}



_reflect_.get\_class(_object_) {#reflect.get_class}

: Returns the class value of an instance as an object that can be 
  used to create a new instance of that same class.


  - **@params**:
    - _instance_ **object**

  {.params}
  - **@returns**: _class_
  {.returns}



_reflect_.is\_ptr(_value_) {#reflect.is_ptr}

: Returns `true` if _value_ is a pointer, `false` otherwise.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _bool_
  {.returns}



_reflect_.get\_ptr(_value_) {#reflect.get_ptr}

: Returns a pointer to the given value.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _ptr_
  {.returns}



_reflect_.set\_ptr(_pointer_, _value_) {#reflect.set_ptr}

: Sets the value at the given pointer's address to the given value.


  - **@params**:
    - _ptr_ **pointer**
    - _any_ **value**

  {.params}



_reflect_.get\_address(_value_) {#reflect.get_address}

: Returns a the address of the pointer to the value in memory.


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _ptr_
  {.returns}



_reflect_.ptr\_from\_address(_address_) {#reflect.ptr_from_address}

: Returns a pointer to the given memory address.


  - **@params**:
    - _number_ **address**

  {.params}
  - **@returns**: _ptr_
  {.returns}



_reflect_.set\_global(_value_, _name_) {#reflect.set_global}

: Sets any given value as globally accessible in all modules, function
  and scopes with the given name.
  If name is not given and the value is a class or function, the name
  will automatically be set to the name of the class or function
  respectively otherwise, an Exception will be raised.


  - **@params**:
    - _any_ **value**
    - _string?_ **name**

  {.params}



_reflect_.run\_script(_path_) {#reflect.run_script}

: Runs the content of a given script in-place as if it were part of the 
  current module.


  - **@params**:
    - _string_ **path**

  {.params}



_reflect_.call\_function(_function_, _args_) {#reflect.call_function}

: Calls a function with the given arguments.


  - **@params**:
    - _function_ **function**
    - _list_ **args**

  {.params}
  - **@returns**: _any_
  {.returns}



