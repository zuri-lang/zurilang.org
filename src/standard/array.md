# array

This module provides multiple classes for working with arrays of twos-complement
integers in the platform byte order. The classes provided in this module complement
the _bytes()_ object and allow higher other binary data manipulation.

## Fields

_array_.**INT16\_MAX** &#x279D; _number_ {#array.INT16_MAX}
: Maximum value that "should" exist in a list passed to Int16Array.

_array_.**UINT16\_MAX** &#x279D; _number_ {#array.UINT16_MAX}
: Maximum value that "should" exist in a list passed to UInt16Array.

_array_.**INT32\_MAX** &#x279D; _number_ {#array.INT32_MAX}
: Maximum value that "should" exist in a list passed to Int32Array.

_array_.**UINT32\_MAX** &#x279D; _number_ {#array.UINT32_MAX}
: Maximum value that "should" exist in a list passed to UInt32Array.

_array_.**INT64\_MAX** &#x279D; _number_ {#array.INT64_MAX}
: Maximum value that "should" exist in a list passed to Int64Array.

_array_.**UINT64\_MAX** &#x279D; _number_ {#array.UINT64_MAX}
: Maximum value that "should" exist in a list passed to UInt64Array.

_array_.**FLOAT\_MAX** &#x279D; _number_ {#array.FLOAT_MAX}
: Maximum value that "should" exist in a list passed to FloatArray.

_array_.**INT16\_MIN** &#x279D; _number_ {#array.INT16_MIN}
: Minimum value that "should" exist in a list passed to Int16Array.

_array_.**INT32\_MIN** &#x279D; _number_ {#array.INT32_MIN}
: Minimum value that "should" exist in a list passed to Int32Array.

_array_.**INT64\_MIN** &#x279D; _number_ {#array.INT64_MIN}
: Minimum value that "should" exist in a list passed to Int64Array.

_array_.**FLOAT\_MIN** &#x279D; _number_ {#array.FLOAT_MIN}
: Minimum value that "should" exist in a list passed to FloatArray.


## Classes

_class_ **Int16Array** {#array.Int16Array .class}

: class Int16Array represents an array of twos-complement 16-bit signed 
  integers in the platform byte order.


    __@printable__, __@serializable__, __@iterable__
    {.class-props}

  .Int16Array(_n_) &#x279D; _Constructor_ {#array.Int16Array.Int16Array}

  : - If n is a number, it creates a new Int16Array that can hold up to n 
    number of elements, but with all the elements set to 0. 
    - If n is a list, it creates a new Int16Array with its elements set to 
    the values in the list.


    - **@params**:
      - _number|list_ **n**

    {.params}


  .length() {#array.Int16Array.length}

  : Returns the number of items in the array.


    - **@returns**: _number_
    {.returns}


  .bytes\_length() {#array.Int16Array.bytes_length}

  : Returns the length of the array if it were to be converted to bytes.


    - **@returns**: _number_
    {.returns}


  .first() {#array.Int16Array.first}

  : Returns the first item in the array or nil if the array is empty.


    - **@returns**: _number_
    {.returns}


  .last() {#array.Int16Array.last}

  : Returns the last item in the array or nil if the array is empty.


    - **@returns**: _int_
    {.returns}


  .append(_value_) {#array.Int16Array.append}

  : Adds the given _value_ to the end of the array.


    - **@params**:
      - _int_ **value**

    {.params}


  .get(_index_) {#array.Int16Array.get}

  : Returns the number at the specified index in the array. If index is 
    outside the boundary of the array indexes (0..(array.length() - 1)), 
    an exception is thrown.


    - **@params**:
      - _number_ **index**

    {.params}
    - **@returns**: _number_
    {.returns}


  .set(_index_, _value_) {#array.Int16Array.set}

  : Sets the value at the given index.


    - **@params**:
      - _number_ **index**
      - _number_ **value**

    {.params}
    - **@returns**: _number_
    {.returns}


  .extend(_array_) {#array.Int16Array.extend}

  : Updates the content of the current array by appending all the contents 
    of _array_ to the end of the array in exact order.


    - **@params**:
      - _Int16Array_ **array**

    {.params}


  .reverse() {#array.Int16Array.reverse}

  : Returns a new array containing the elements in the original array 
    in reverse order.




  .clone() {#array.Int16Array.clone}

  : Returns a new Int16Array containing all items from the current array. 
    The new array is a shallow copy of the original array.


    - **@returns**: _Int16Array_
    {.returns}


  .pop() {#array.Int16Array.pop}

  : Removes the last element in the array and returns the value of that item.


    - **@returns**: _number_
    {.returns}


  .to\_bytes() {#array.Int16Array.to_bytes}

  : Returns the array as a bytes object.


    - **@returns**: _bytes_
    {.returns}


  .to\_list() {#array.Int16Array.to_list}

  : Returns the elements of the array as a list of numbers.


    - **@returns**: _list_
    {.returns}


  .to\_string() {#array.Int16Array.to_string}

  : Returns a string representation of the array.


    - **@returns**: _string_
    {.returns}


  .get\_pointer() {#array.Int16Array.get_pointer}

  : Returns the raw int16 array pointer.


    - **@returns**: _ptr_
    {.returns}




_class_ **Int32Array** {#array.Int32Array .class}

: class Int32Array represents an array of twos-complement 32-bit signed 
  integers in the platform byte order.


    __@printable__, __@serializable__, __@iterable__
    {.class-props}

  .Int32Array(_n_) &#x279D; _Constructor_ {#array.Int32Array.Int32Array}

  : - If n is a number, it creates a new Int32Array that can hold up to n 
    number of elements, but with all the elements set to 0. 
    - If n is a list, it creates a new Int32Array with its elements set to 
    the values in the list.


    - **@params**:
      - _number|list_ **n**

    {.params}


  .length() {#array.Int32Array.length}

  : Returns the number of items in the array.


    - **@returns**: _number_
    {.returns}


  .bytes\_length() {#array.Int32Array.bytes_length}

  : Returns the length of the array if it were to be converted to bytes.


    - **@returns**: _number_
    {.returns}


  .first() {#array.Int32Array.first}

  : Returns the first item in the array or nil if the array is empty.


    - **@returns**: _int_
    {.returns}


  .last() {#array.Int32Array.last}

  : Returns the last item in the array or nil if the array is empty.


    - **@returns**: _int_
    {.returns}


  .append(_value_) {#array.Int32Array.append}

  : Adds the given _value_ to the end of the array.


    - **@params**:
      - _int_ **value**

    {.params}


  .get(_index_) {#array.Int32Array.get}

  : Returns the number at the specified index in the array. If index is 
    outside the boundary of the array indexes (0..(array.length() - 1)), 
    an exception is thrown.


    - **@params**:
      - _number_ **index**

    {.params}
    - **@returns**: _number_
    {.returns}


  .set(_index_, _value_) {#array.Int32Array.set}

  : Sets the value at the given index.


    - **@params**:
      - _number_ **index**
      - _int_ **value**

    {.params}
    - **@returns**: _number_
    {.returns}


  .extend(_array_) {#array.Int32Array.extend}

  : Updates the content of the current array by appending all the contents 
    of _array_ to the end of the array in exact order.


    - **@params**:
      - _Int32Array_ **array**

    {.params}


  .reverse() {#array.Int32Array.reverse}

  : Returns a new array containing the elements in the original array 
    in reverse order.




  .clone() {#array.Int32Array.clone}

  : Returns a new Int32Array containing all items from the current array. 
    The new array is a shallow copy of the original array.


    - **@returns**: _Int32Array_
    {.returns}


  .pop() {#array.Int32Array.pop}

  : Removes the last element in the array and returns the value of that item.


    - **@returns**: _number_
    {.returns}


  .to\_bytes() {#array.Int32Array.to_bytes}

  : Returns the array as a bytes object.


    - **@returns**: _bytes_
    {.returns}


  .to\_list() {#array.Int32Array.to_list}

  : Returns the elements of the array as a list of numbers.


    - **@returns**: _list_
    {.returns}


  .to\_string() {#array.Int32Array.to_string}

  : Returns a string representation of the array.


    - **@returns**: _string_
    {.returns}


  .get\_pointer() {#array.Int32Array.get_pointer}

  : Returns the raw int32 array pointer.


    - **@returns**: _ptr_
    {.returns}




_class_ **Int64Array** {#array.Int64Array .class}

: class Int64Array represents an array of twos-complement 64-bit signed 
  integers in the platform byte order.


    __@printable__, __@serializable__, __@iterable__
    {.class-props}

  .Int64Array(_n_) &#x279D; _Constructor_ {#array.Int64Array.Int64Array}

  : - If n is a number, it creates a new Int64Array that can hold up to n 
    number of elements, but with all the elements set to 0. 
    - If n is a list, it creates a new Int64Array with its elements set to 
    the values in the list.


    - **@params**:
      - _number|list_ **n**

    {.params}


  .length() {#array.Int64Array.length}

  : Returns the number of items in the array.


    - **@returns**: _number_
    {.returns}


  .bytes\_length() {#array.Int64Array.bytes_length}

  : Returns the length of the array if it were to be converted to bytes.


    - **@returns**: _number_
    {.returns}


  .first() {#array.Int64Array.first}

  : Returns the first item in the array or nil if the array is empty.


    - **@returns**: _number_
    {.returns}


  .last() {#array.Int64Array.last}

  : Returns the last item in the array or nil if the array is empty.


    - **@returns**: _number_
    {.returns}


  .append(_value_) {#array.Int64Array.append}

  : Adds the given _value_ to the end of the array.


    - **@params**:
      - _int_ **value**

    {.params}


  .get(_index_) {#array.Int64Array.get}

  : Returns the number at the specified index in the array. If index is 
    outside the boundary of the array indexes (0..(array.length() - 1)), 
    an exception is thrown.


    - **@params**:
      - _number_ **index**

    {.params}
    - **@returns**: _number_
    {.returns}


  .set(_index_, _value_) {#array.Int64Array.set}

  : set(index: number, value: number)
    
    Sets the value at the given index.


    - **@params**:
      - _number_ **index**
      - _number_ **value**

    {.params}
    - **@returns**: _number_
    {.returns}


  .extend(_array_) {#array.Int64Array.extend}

  : Updates the content of the current array by appending all the contents 
    of _array_ to the end of the array in exact order.


    - **@params**:
      - _Int64Array_ **array**

    {.params}


  .reverse() {#array.Int64Array.reverse}

  : Returns a new array containing the elements in the original array 
    in reverse order.




  .clone() {#array.Int64Array.clone}

  : Returns a new Int64Array containing all items from the current array. 
    The new array is a shallow copy of the original array.


    - **@returns**: _Int64Array_
    {.returns}


  .pop() {#array.Int64Array.pop}

  : Removes the last element in the array and returns the value of that item.


    - **@returns**: _number_
    {.returns}


  .to\_bytes() {#array.Int64Array.to_bytes}

  : Returns the array as a bytes object.


    - **@returns**: _bytes_
    {.returns}


  .to\_list() {#array.Int64Array.to_list}

  : Returns the elements of the array as a list of numbers.


    - **@returns**: _list_
    {.returns}


  .to\_string() {#array.Int64Array.to_string}

  : Returns a string representation of the array.


    - **@returns**: _string_
    {.returns}


  .get\_pointer() {#array.Int64Array.get_pointer}

  : Returns the raw int64 array pointer.


    - **@returns**: _ptr_
    {.returns}




_class_ **UInt16Array** {#array.UInt16Array .class}

: class UInt16Array represents an array of twos-complement 16-bit unsigned 
  integers in the platform byte order.


    __@printable__, __@serializable__, __@iterable__
    {.class-props}

  .UInt16Array(_n_) &#x279D; _Constructor_ {#array.UInt16Array.UInt16Array}

  : - If n is a number, it creates a new UInt16Array that can hold up to n 
    number of elements, but with all the elements set to 0. 
    - If n is a list, it creates a new UInt16Array with its elements set to 
    the values in the list.


    - **@params**:
      - _number|list_ **n**

    {.params}


  .length() {#array.UInt16Array.length}

  : Returns the number of items in the array.


    - **@returns**: _number_
    {.returns}


  .bytes\_length() {#array.UInt16Array.bytes_length}

  : Returns the length of the array if it were to be converted to bytes.


    - **@returns**: _number_
    {.returns}


  .first() {#array.UInt16Array.first}

  : Returns the first item in the array or nil if the array is empty.


    - **@returns**: _number_
    {.returns}


  .last() {#array.UInt16Array.last}

  : Returns the last item in the array or nil if the array is empty.


    - **@returns**: _number_
    {.returns}


  .append(_value_) {#array.UInt16Array.append}

  : Adds the given _value_ to the end of the array.


    - **@params**:
      - _int_ **value**

    {.params}


  .get(_index_) {#array.UInt16Array.get}

  : Returns the number at the specified index in the array. If index is 
    outside the boundary of the array indexes (0..(array.length() - 1)), 
    an exception is thrown.


    - **@params**:
      - _number_ **index**

    {.params}
    - **@returns**: _number_
    {.returns}


  .set(_index_, _value_) {#array.UInt16Array.set}

  : Sets the value at the given index.


    - **@params**:
      - _number_ **index**
      - _number_ **value**

    {.params}
    - **@returns**: _number_
    {.returns}


  .extend(_array_) {#array.UInt16Array.extend}

  : Updates the content of the current array by appending all the contents 
    of _array_ to the end of the array in exact order.


    - **@params**:
      - _UInt16Array_ **array**

    {.params}


  .reverse() {#array.UInt16Array.reverse}

  : Returns a new array containing the elements in the original array 
    in reverse order.




  .clone() {#array.UInt16Array.clone}

  : Returns a new UInt16Array containing all items from the current array. 
    The new array is a shallow copy of the original array.


    - **@returns**: _UInt16Array_
    {.returns}


  .pop() {#array.UInt16Array.pop}

  : Removes the last element in the array and returns the value of that item.


    - **@returns**: _number_
    {.returns}


  .to\_bytes() {#array.UInt16Array.to_bytes}

  : Returns the array as a bytes object.


    - **@returns**: _bytes_
    {.returns}


  .to\_list() {#array.UInt16Array.to_list}

  : Returns the elements of the array as a list of numbers.


    - **@returns**: _list_
    {.returns}


  .to\_string() {#array.UInt16Array.to_string}

  : Returns a string representation of the array.


    - **@returns**: _string_
    {.returns}


  .get\_pointer() {#array.UInt16Array.get_pointer}

  : Returns the raw uint16 array pointer.


    - **@returns**: _ptr_
    {.returns}




_class_ **UInt32Array** {#array.UInt32Array .class}

: class UInt32Array represents an array of twos-complement 32-bit unsigned 
  integers in the platform byte order.


    __@printable__, __@serializable__, __@iterable__
    {.class-props}

  .UInt32Array(_n_) &#x279D; _Constructor_ {#array.UInt32Array.UInt32Array}

  : - If n is a number, it creates a new UInt32Array that can hold up to n 
    number of elements, but with all the elements set to 0. 
    - If n is a list, it creates a new UInt32Array with its elements set to 
    the values in the list.


    - **@params**:
      - _number|list_ **n**

    {.params}


  .length() {#array.UInt32Array.length}

  : Returns the number of items in the array.


    - **@returns**: _number_
    {.returns}


  .bytes\_length() {#array.UInt32Array.bytes_length}

  : Returns the length of the array if it were to be converted to bytes.


    - **@returns**: _number_
    {.returns}


  .first() {#array.UInt32Array.first}

  : Returns the first item in the array or nil if the array is empty.


    - **@returns**: _number_
    {.returns}


  .last() {#array.UInt32Array.last}

  : Returns the last item in the array or nil if the array is empty.


    - **@returns**: _number_
    {.returns}


  .append(_value_) {#array.UInt32Array.append}

  : Adds the given _value_ to the end of the array.


    - **@params**:
      - _int_ **value**

    {.params}


  .get(_index_) {#array.UInt32Array.get}

  : Returns the number at the specified index in the array. If index is 
    outside the boundary of the array indexes (0..(array.length() - 1)), 
    an exception is thrown.


    - **@params**:
      - _number_ **index**

    {.params}
    - **@returns**: _number_
    {.returns}


  .set(_index_, _value_) {#array.UInt32Array.set}

  : Sets the value at the given index.


    - **@params**:
      - _number_ **index**
      - _number_ **value**

    {.params}
    - **@returns**: _number_
    {.returns}


  .extend(_array_) {#array.UInt32Array.extend}

  : Updates the content of the current array by appending all the contents 
    of _array_ to the end of the array in exact order.


    - **@params**:
      - _UInt32Array_ **array**

    {.params}


  .reverse() {#array.UInt32Array.reverse}

  : Returns a new array containing the elements in the original array 
    in reverse order.




  .clone() {#array.UInt32Array.clone}

  : Returns a new UInt32Array containing all items from the current array. 
    The new array is a shallow copy of the original array.


    - **@returns**: _UInt32Array_
    {.returns}


  .pop() {#array.UInt32Array.pop}

  : Removes the last element in the array and returns the value of that item.


    - **@returns**: _number_
    {.returns}


  .to\_bytes() {#array.UInt32Array.to_bytes}

  : Returns the array as a bytes object.


    - **@returns**: _bytes_
    {.returns}


  .to\_list() {#array.UInt32Array.to_list}

  : Returns the elements of the array as a list of numbers.


    - **@returns**: _list_
    {.returns}


  .to\_string() {#array.UInt32Array.to_string}

  : Returns a string representation of the array.


    - **@returns**: _string_
    {.returns}


  .get\_pointer() {#array.UInt32Array.get_pointer}

  : Returns the raw uint32 array pointer.


    - **@returns**: _ptr_
    {.returns}




_class_ **UInt64Array** {#array.UInt64Array .class}

: class UInt64Array represents an array of twos-complement 64-bit unsigned 
  integers in the platform byte order.


    __@printable__, __@serializable__, __@iterable__
    {.class-props}

  .UInt64Array(_n_) &#x279D; _Constructor_ {#array.UInt64Array.UInt64Array}

  : - If n is a number, it creates a new UInt64Array that can hold up to n 
    number of elements, but with all the elements set to 0. 
    - If n is a list, it creates a new UInt64Array with its elements set to 
    the values in the list.


    - **@params**:
      - _number|list_ **n**

    {.params}


  .length() {#array.UInt64Array.length}

  : Returns the number of items in the array.


    - **@returns**: _number_
    {.returns}


  .bytes\_length() {#array.UInt64Array.bytes_length}

  : Returns the length of the array if it were to be converted to bytes.


    - **@returns**: _number_
    {.returns}


  .first() {#array.UInt64Array.first}

  : Returns the first item in the array or nil if the array is empty.


    - **@returns**: _number_
    {.returns}


  .last() {#array.UInt64Array.last}

  : Returns the last item in the array or nil if the array is empty.


    - **@returns**: _number_
    {.returns}


  .append(_value_) {#array.UInt64Array.append}

  : Adds the given _value_ to the end of the array.


    - **@params**:
      - _int_ **value**

    {.params}


  .get(_index_) {#array.UInt64Array.get}

  : Returns the number at the specified index in the array. If index is 
    outside the boundary of the array indexes (0..(array.length() - 1)), 
    an exception is thrown.


    - **@params**:
      - _number_ **index**

    {.params}
    - **@returns**: _number_
    {.returns}


  .set(_index_, _value_) {#array.UInt64Array.set}

  : Sets the value at the given index.


    - **@params**:
      - _number_ **index**
      - _number_ **value**

    {.params}
    - **@returns**: _number_
    {.returns}


  .extend(_array_) {#array.UInt64Array.extend}

  : Updates the content of the current array by appending all the contents 
    of _array_ to the end of the array in exact order.


    - **@params**:
      - _UInt64Array_ **array**

    {.params}


  .reverse() {#array.UInt64Array.reverse}

  : Returns a new array containing the elements in the original array 
    in reverse order.




  .clone() {#array.UInt64Array.clone}

  : Returns a new UInt64Array containing all items from the current array. 
    The new array is a shallow copy of the original array.


    - **@returns**: _UInt64Array_
    {.returns}


  .pop() {#array.UInt64Array.pop}

  : Removes the last element in the array and returns the value of that item.


    - **@returns**: _number_
    {.returns}


  .to\_bytes() {#array.UInt64Array.to_bytes}

  : Returns the array as a bytes object.


    - **@returns**: _bytes_
    {.returns}


  .to\_list() {#array.UInt64Array.to_list}

  : Returns the elements of the array as a list of numbers.


    - **@returns**: _list_
    {.returns}


  .to\_string() {#array.UInt64Array.to_string}

  : Returns a string representation of the array.


    - **@returns**: _string_
    {.returns}


  .get\_pointer() {#array.UInt64Array.get_pointer}

  : Returns the raw uint64 array pointer.


    - **@returns**: _ptr_
    {.returns}




_class_ **FloatArray** {#array.FloatArray .class}

: class FloatArray represents an array of 32-bit floating point numbers 
  corresponding to the C float data type in the platform byte order.


    __@printable__, __@serializable__, __@iterable__
    {.class-props}

  .FloatArray(_n_) &#x279D; _Constructor_ {#array.FloatArray.FloatArray}

  : - If n is a number, it creates a new FloatArray that can hold up to n 
    number of elements, but with all the elements set to 0. 
    - If n is a list, it creates a new FloatArray with its elements set to 
    the values in the list.


    - **@params**:
      - _number|list_ **n**

    {.params}


  .length() {#array.FloatArray.length}

  : Returns the number of items in the array.


    - **@returns**: _number_
    {.returns}


  .bytes\_length() {#array.FloatArray.bytes_length}

  : Returns the length of the array if it were to be converted to bytes.


    - **@returns**: _number_
    {.returns}


  .first() {#array.FloatArray.first}

  : Returns the first item in the array or nil if the array is empty.


    - **@returns**: _number_
    {.returns}


  .last() {#array.FloatArray.last}

  : Returns the last item in the array or nil if the array is empty.


    - **@returns**: _number_
    {.returns}


  .append(_value_) {#array.FloatArray.append}

  : Adds the given _value_ to the end of the array.


    - **@params**:
      - _int_ **value**

    {.params}


  .get(_index_) {#array.FloatArray.get}

  : Returns the number at the specified index in the array. If index is 
    outside the boundary of the array indexes (0..(array.length() - 1)), 
    an exception is thrown.


    - **@params**:
      - _number_ **index**

    {.params}
    - **@returns**: _number_
    {.returns}


  .set(_index_, _value_) {#array.FloatArray.set}

  : Sets the value at the given index.


    - **@params**:
      - _number_ **index**
      - _int_ **value**

    {.params}
    - **@returns**: _number_
    {.returns}


  .extend(_array_) {#array.FloatArray.extend}

  : Updates the content of the current array by appending all the contents 
    of _array_ to the end of the array in exact order.


    - **@params**:
      - _FloatArray_ **array**

    {.params}


  .reverse() {#array.FloatArray.reverse}

  : Returns a new array containing the elements in the original array 
    in reverse order.




  .clone() {#array.FloatArray.clone}

  : Returns a new FloatArray containing all items from the current array. 
    The new array is a shallow copy of the original array.


    - **@returns**: _FloatArray_
    {.returns}


  .pop() {#array.FloatArray.pop}

  : Removes the last element in the array and returns the value of that item.


    - **@returns**: _number_
    {.returns}


  .to\_bytes() {#array.FloatArray.to_bytes}

  : Returns the array as a bytes object


    - **@returns**: _bytes_
    {.returns}


  .to\_list() {#array.FloatArray.to_list}

  : Returns the elements of the array as a list of numbers


    - **@returns**: _list_
    {.returns}


  .to\_string() {#array.FloatArray.to_string}

  : Returns a string representation of the array


    - **@returns**: _string_
    {.returns}


  .get\_pointer() {#array.FloatArray.get_pointer}

  : Returns the raw uint64 array pointer.


    - **@returns**: _ptr_
    {.returns}




