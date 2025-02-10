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

#### has\_prop(object, name)

Returns `true` if instance has the property or module has a value with 
the given name or `false` if not.

##### Parameters

- _instance|module_ **object**
- _string_ **name**

##### Returns

- bool



#### get\_prop(object, name)

Returns the property of the instance or value in the module matching the 
given name or nil if the object contains no property with a matching name.

##### Parameters

- _instance|module_ **object**
- _string_ **name**

##### Returns

- any



#### get\_props(object)

Returns all properties of an instance or value in a module or an empty
list if the instance or module has no property.

##### Parameters

- _instance|module_ **object**
- _string_ **name**

##### Returns

- list[string]



#### set\_prop(object, name, value)

Sets the named property of the object to value.

##### Parameters

- _instance_ **object**
- _string_ **name**
- _any_ **value**

##### Returns

- bool: `true` if a new property was set, `false` if a property was updated
##### Notes

- if the property already exist, it overwrites it.



#### del\_prop(object, name)

Deletes the named property from the instance

##### Parameters

- _instance|module_ **object**
- _string_ **name**

##### Returns

- bool



#### has\_method(object, name)

Returns true if class of the instance has the method name or
false if not.

##### Parameters

- _instance_ **object**
- _string_ **name**

##### Returns

- bool



#### has\_decorator(object, name)

Returns true if class of the instance implements the decorator name or
false if not.

##### Parameters

- _instance_ **object**
- _string_ **name**

##### Returns

- bool



#### get\_method(object, name)

Returns the method in a class instance matching the given name
or nil if the class of the instance contains no method with
a matching name.

##### Parameters

- _instance_ **object**
- _string_ **name**

##### Returns

- function



#### get\_decorator(object, name)

Returns the decorator function matching the given name in the class 
of the given instance.

##### Parameters

- _instance_ **object**
- _string_ **name**

##### Returns

- function
##### Notes

- the name of a decorator excludes the `@` character.



#### bind\_method(object, method)

Binds the given function to the instance, allowing you to access 
the instance itself in the function via the `self` keyword in 
the function.

##### Parameters

- _instance_ **object**
- _function_ **method**

##### Returns

- function



#### get\_type(object)

Returns the type of an instance as string

##### Parameters

- _instance_ **object**

##### Returns

- string



#### get\_function\_metadata(function)

Returns the metadata of a function as a dictionary. 
This dictionary contains the following keys:

- `name`: The name of the function
- `arity`: The number of none variable (...) arguments the function defines.
- `is_variadic`: If the function accepts variable arguments
- `captured_vars`: The number of variables captured (only greater than zero for captures).
- `module`: The name of the module from where the function was defined.
- `file`: The file in which the function was defined.

##### Parameters

- _function_ **object**

##### Returns

- dictionary
##### Notes

- This function does not work for built-in functions



#### get\_class\_metadata(klass)

Returns the metadata of a class as a dictionary. 
This dictionary contains the following keys:

- `name`: The name of the class.
- `properties`: a list of the name of non-static properties defined in the class
- `static_properties`: a list of the name of static properties defined in the class
- `methods`: a list of the name of methods defined in the class
- `superclass`: The name of the class it inherits from.

##### Parameters

- _class_ **klass**

##### Returns

- dictionary



#### get\_module\_metadata(module)

Returns the metadata of an imported module as a dictionary. 
This dictionary contains the following keys:

- `name`: The name of the module.
- `file`: The file from which the module was imported.
- `has_preloader`: `true` if the module is a C extension with a preloader and `false` otherwise.
- `has_unloader`: `true` if the module is a C extension with a unloader and `false` otherwise.
- `definitions`: A list of the name of objects defined in the module.

##### Parameters

- _module_ **module**

##### Returns

- dictionary



#### get\_class(object)

Returns the class value of an instance as an object that can be 
used to create a new instance of that same class.

##### Parameters

- _instance_ **object**

##### Returns

- class



#### is\_ptr(value)

Returns `true` if _value_ is a pointer, `false` otherwise.

##### Parameters

- _any_ **value**

##### Returns

- bool



#### get\_ptr(value)

Returns a pointer to the given value.

##### Parameters

- _any_ **value**

##### Returns

- ptr



#### set\_ptr(pointer, value)

Sets the value at the given pointer's address to the given value.

##### Parameters

- _ptr_ **pointer**
- _any_ **value**




#### get\_address(value)

Returns a the address of the pointer to the value in memory.

##### Parameters

- _any_ **value**

##### Returns

- ptr



#### ptr\_from\_address(address)

Returns a pointer to the given memory address.

##### Parameters

- _number_ **address**

##### Returns

- ptr



#### set\_global(value, name)

Sets any given value as globally accessible in all modules, function
and scopes with the given name.
If name is not given and the value is a class or function, the name
will automatically be set to the name of the class or function
respectively otherwise, an Exception will be raised.

##### Parameters

- _any_ **value**
- _string?_ **name**




#### run\_script(path)

Runs the content of a given script in-place as if it were part of the 
current module.

##### Parameters

- _string_ **path**




#### call\_function(function, args)

Calls a function with the given arguments.

##### Parameters

- _function_ **function**
- _list_ **args**

##### Returns

- any



