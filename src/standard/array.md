# array

This module provides multiple classes for working with arrays of twos-complement
integers in the platform byte order. The classes provided in this module complement
the _bytes()_ object and allow higher other binary data manipulation.

## Properties

- **INT16\_MAX** &#8674; _number_:

  Maximum value that "should" exist in a list passed to Int16Array.

- **UINT16\_MAX** &#8674; _number_:

  Maximum value that "should" exist in a list passed to UInt16Array.

- **INT32\_MAX** &#8674; _number_:

  Maximum value that "should" exist in a list passed to Int32Array.

- **UINT32\_MAX** &#8674; _number_:

  Maximum value that "should" exist in a list passed to UInt32Array.

- **INT64\_MAX** &#8674; _number_:

  Maximum value that "should" exist in a list passed to Int64Array.

- **UINT64\_MAX** &#8674; _number_:

  Maximum value that "should" exist in a list passed to UInt64Array.

- **FLOAT\_MAX** &#8674; _number_:

  Maximum value that "should" exist in a list passed to FloatArray.

- **INT16\_MIN** &#8674; _number_:

  Minimum value that "should" exist in a list passed to Int16Array.

- **INT32\_MIN** &#8674; _number_:

  Minimum value that "should" exist in a list passed to Int32Array.

- **INT64\_MIN** &#8674; _number_:

  Minimum value that "should" exist in a list passed to Int64Array.

- **FLOAT\_MIN** &#8674; _number_:

  Minimum value that "should" exist in a list passed to FloatArray.


## Classes

### _class_ Int16Array

class Int16Array represents an array of twos-complement 16-bit signed 
integers in the platform byte order.



#### Properties

 - __@printable__
 - __@serializable__
 - __@iterable__

#### Methods

#### Int16Array(n) &#8674; Constructor

- If n is a number, it creates a new Int16Array that can hold up to n 
number of elements, but with all the elements set to 0. 
- If n is a list, it creates a new Int16Array with its elements set to 
the values in the list.

##### Parameters

- _number|list_ **n**


#### length()

Returns the number of items in the array.

##### Returns

- number

#### bytes\_length()

Returns the length of the array if it were to be converted to bytes.

##### Returns

- number

#### first()

Returns the first item in the array or nil if the array is empty.

##### Returns

- number

#### last()

Returns the last item in the array or nil if the array is empty.

##### Returns

- int

#### append(value)

Adds the given _value_ to the end of the array.

##### Parameters

- _int_ **value**


#### get(index)

Returns the number at the specified index in the array. If index is 
outside the boundary of the array indexes (0..(array.length() - 1)), 
an exception is thrown.

##### Parameters

- _number_ **index**

##### Returns

- number

#### set(index, value)

Sets the value at the given index.

##### Parameters

- _number_ **index**
- _number_ **value**

##### Returns

- number

#### extend(array)

Updates the content of the current array by appending all the contents 
of _array_ to the end of the array in exact order.

##### Parameters

- _Int16Array_ **array**


#### reverse()

Returns a new array containing the elements in the original array 
in reverse order.


#### clone()

Returns a new Int16Array containing all items from the current array. 
The new array is a shallow copy of the original array.

##### Returns

- Int16Array

#### pop()

Removes the last element in the array and returns the value of that item.

##### Returns

- number

#### to\_bytes()

Returns the array as a bytes object.

##### Returns

- bytes

#### to\_list()

Returns the elements of the array as a list of numbers.

##### Returns

- list

#### to\_string()

Returns a string representation of the array.

##### Returns

- string

#### get\_pointer()

Returns the raw int16 array pointer.

##### Returns

- ptr



### _class_ Int32Array

class Int32Array represents an array of twos-complement 32-bit signed 
integers in the platform byte order.



#### Properties

 - __@printable__
 - __@serializable__
 - __@iterable__

#### Methods

#### Int32Array(n) &#8674; Constructor

- If n is a number, it creates a new Int32Array that can hold up to n 
number of elements, but with all the elements set to 0. 
- If n is a list, it creates a new Int32Array with its elements set to 
the values in the list.

##### Parameters

- _number|list_ **n**


#### length()

Returns the number of items in the array.

##### Returns

- number

#### bytes\_length()

Returns the length of the array if it were to be converted to bytes.

##### Returns

- number

#### first()

Returns the first item in the array or nil if the array is empty.

##### Returns

- int

#### last()

Returns the last item in the array or nil if the array is empty.

##### Returns

- int

#### append(value)

Adds the given _value_ to the end of the array.

##### Parameters

- _int_ **value**


#### get(index)

Returns the number at the specified index in the array. If index is 
outside the boundary of the array indexes (0..(array.length() - 1)), 
an exception is thrown.

##### Parameters

- _number_ **index**

##### Returns

- number

#### set(index, value)

Sets the value at the given index.

##### Parameters

- _number_ **index**
- _int_ **value**

##### Returns

- number

#### extend(array)

Updates the content of the current array by appending all the contents 
of _array_ to the end of the array in exact order.

##### Parameters

- _Int32Array_ **array**


#### reverse()

Returns a new array containing the elements in the original array 
in reverse order.


#### clone()

Returns a new Int32Array containing all items from the current array. 
The new array is a shallow copy of the original array.

##### Returns

- Int32Array

#### pop()

Removes the last element in the array and returns the value of that item.

##### Returns

- number

#### to\_bytes()

Returns the array as a bytes object.

##### Returns

- bytes

#### to\_list()

Returns the elements of the array as a list of numbers.

##### Returns

- list

#### to\_string()

Returns a string representation of the array.

##### Returns

- string

#### get\_pointer()

Returns the raw int32 array pointer.

##### Returns

- ptr



### _class_ Int64Array

class Int64Array represents an array of twos-complement 64-bit signed 
integers in the platform byte order.



#### Properties

 - __@printable__
 - __@serializable__
 - __@iterable__

#### Methods

#### Int64Array(n) &#8674; Constructor

- If n is a number, it creates a new Int64Array that can hold up to n 
number of elements, but with all the elements set to 0. 
- If n is a list, it creates a new Int64Array with its elements set to 
the values in the list.

##### Parameters

- _number|list_ **n**


#### length()

Returns the number of items in the array.

##### Returns

- number

#### bytes\_length()

Returns the length of the array if it were to be converted to bytes.

##### Returns

- number

#### first()

Returns the first item in the array or nil if the array is empty.

##### Returns

- number

#### last()

Returns the last item in the array or nil if the array is empty.

##### Returns

- number

#### append(value)

Adds the given _value_ to the end of the array.

##### Parameters

- _int_ **value**


#### get(index)

Returns the number at the specified index in the array. If index is 
outside the boundary of the array indexes (0..(array.length() - 1)), 
an exception is thrown.

##### Parameters

- _number_ **index**

##### Returns

- number

#### set(index, value)

set(index: number, value: number)

Sets the value at the given index.

##### Parameters

- _number_ **index**
- _number_ **value**

##### Returns

- number

#### extend(array)

Updates the content of the current array by appending all the contents 
of _array_ to the end of the array in exact order.

##### Parameters

- _Int64Array_ **array**


#### reverse()

Returns a new array containing the elements in the original array 
in reverse order.


#### clone()

Returns a new Int64Array containing all items from the current array. 
The new array is a shallow copy of the original array.

##### Returns

- Int64Array

#### pop()

Removes the last element in the array and returns the value of that item.

##### Returns

- number

#### to\_bytes()

Returns the array as a bytes object.

##### Returns

- bytes

#### to\_list()

Returns the elements of the array as a list of numbers.

##### Returns

- list

#### to\_string()

Returns a string representation of the array.

##### Returns

- string

#### get\_pointer()

Returns the raw int64 array pointer.

##### Returns

- ptr



### _class_ UInt16Array

class UInt16Array represents an array of twos-complement 16-bit unsigned 
integers in the platform byte order.



#### Properties

 - __@printable__
 - __@serializable__
 - __@iterable__

#### Methods

#### UInt16Array(n) &#8674; Constructor

- If n is a number, it creates a new UInt16Array that can hold up to n 
number of elements, but with all the elements set to 0. 
- If n is a list, it creates a new UInt16Array with its elements set to 
the values in the list.

##### Parameters

- _number|list_ **n**


#### length()

Returns the number of items in the array.

##### Returns

- number

#### bytes\_length()

Returns the length of the array if it were to be converted to bytes.

##### Returns

- number

#### first()

Returns the first item in the array or nil if the array is empty.

##### Returns

- number

#### last()

Returns the last item in the array or nil if the array is empty.

##### Returns

- number

#### append(value)

Adds the given _value_ to the end of the array.

##### Parameters

- _int_ **value**


#### get(index)

Returns the number at the specified index in the array. If index is 
outside the boundary of the array indexes (0..(array.length() - 1)), 
an exception is thrown.

##### Parameters

- _number_ **index**

##### Returns

- number

#### set(index, value)

Sets the value at the given index.

##### Parameters

- _number_ **index**
- _number_ **value**

##### Returns

- number

#### extend(array)

Updates the content of the current array by appending all the contents 
of _array_ to the end of the array in exact order.

##### Parameters

- _UInt16Array_ **array**


#### reverse()

Returns a new array containing the elements in the original array 
in reverse order.


#### clone()

Returns a new UInt16Array containing all items from the current array. 
The new array is a shallow copy of the original array.

##### Returns

- UInt16Array

#### pop()

Removes the last element in the array and returns the value of that item.

##### Returns

- number

#### to\_bytes()

Returns the array as a bytes object.

##### Returns

- bytes

#### to\_list()

Returns the elements of the array as a list of numbers.

##### Returns

- list

#### to\_string()

Returns a string representation of the array.

##### Returns

- string

#### get\_pointer()

Returns the raw uint16 array pointer.

##### Returns

- ptr



### _class_ UInt32Array

class UInt32Array represents an array of twos-complement 32-bit unsigned 
integers in the platform byte order.



#### Properties

 - __@printable__
 - __@serializable__
 - __@iterable__

#### Methods

#### UInt32Array(n) &#8674; Constructor

- If n is a number, it creates a new UInt32Array that can hold up to n 
number of elements, but with all the elements set to 0. 
- If n is a list, it creates a new UInt32Array with its elements set to 
the values in the list.

##### Parameters

- _number|list_ **n**


#### length()

Returns the number of items in the array.

##### Returns

- number

#### bytes\_length()

Returns the length of the array if it were to be converted to bytes.

##### Returns

- number

#### first()

Returns the first item in the array or nil if the array is empty.

##### Returns

- number

#### last()

Returns the last item in the array or nil if the array is empty.

##### Returns

- number

#### append(value)

Adds the given _value_ to the end of the array.

##### Parameters

- _int_ **value**


#### get(index)

Returns the number at the specified index in the array. If index is 
outside the boundary of the array indexes (0..(array.length() - 1)), 
an exception is thrown.

##### Parameters

- _number_ **index**

##### Returns

- number

#### set(index, value)

Sets the value at the given index.

##### Parameters

- _number_ **index**
- _number_ **value**

##### Returns

- number

#### extend(array)

Updates the content of the current array by appending all the contents 
of _array_ to the end of the array in exact order.

##### Parameters

- _UInt32Array_ **array**


#### reverse()

Returns a new array containing the elements in the original array 
in reverse order.


#### clone()

Returns a new UInt32Array containing all items from the current array. 
The new array is a shallow copy of the original array.

##### Returns

- UInt32Array

#### pop()

Removes the last element in the array and returns the value of that item.

##### Returns

- number

#### to\_bytes()

Returns the array as a bytes object.

##### Returns

- bytes

#### to\_list()

Returns the elements of the array as a list of numbers.

##### Returns

- list

#### to\_string()

Returns a string representation of the array.

##### Returns

- string

#### get\_pointer()

Returns the raw uint32 array pointer.

##### Returns

- ptr



### _class_ UInt64Array

class UInt64Array represents an array of twos-complement 64-bit unsigned 
integers in the platform byte order.



#### Properties

 - __@printable__
 - __@serializable__
 - __@iterable__

#### Methods

#### UInt64Array(n) &#8674; Constructor

- If n is a number, it creates a new UInt64Array that can hold up to n 
number of elements, but with all the elements set to 0. 
- If n is a list, it creates a new UInt64Array with its elements set to 
the values in the list.

##### Parameters

- _number|list_ **n**


#### length()

Returns the number of items in the array.

##### Returns

- number

#### bytes\_length()

Returns the length of the array if it were to be converted to bytes.

##### Returns

- number

#### first()

Returns the first item in the array or nil if the array is empty.

##### Returns

- number

#### last()

Returns the last item in the array or nil if the array is empty.

##### Returns

- number

#### append(value)

Adds the given _value_ to the end of the array.

##### Parameters

- _int_ **value**


#### get(index)

Returns the number at the specified index in the array. If index is 
outside the boundary of the array indexes (0..(array.length() - 1)), 
an exception is thrown.

##### Parameters

- _number_ **index**

##### Returns

- number

#### set(index, value)

Sets the value at the given index.

##### Parameters

- _number_ **index**
- _number_ **value**

##### Returns

- number

#### extend(array)

Updates the content of the current array by appending all the contents 
of _array_ to the end of the array in exact order.

##### Parameters

- _UInt64Array_ **array**


#### reverse()

Returns a new array containing the elements in the original array 
in reverse order.


#### clone()

Returns a new UInt64Array containing all items from the current array. 
The new array is a shallow copy of the original array.

##### Returns

- UInt64Array

#### pop()

Removes the last element in the array and returns the value of that item.

##### Returns

- number

#### to\_bytes()

Returns the array as a bytes object.

##### Returns

- bytes

#### to\_list()

Returns the elements of the array as a list of numbers.

##### Returns

- list

#### to\_string()

Returns a string representation of the array.

##### Returns

- string

#### get\_pointer()

Returns the raw uint64 array pointer.

##### Returns

- ptr



### _class_ FloatArray

class FloatArray represents an array of 32-bit floating point numbers 
corresponding to the C float data type in the platform byte order.



#### Properties

 - __@printable__
 - __@serializable__
 - __@iterable__

#### Methods

#### FloatArray(n) &#8674; Constructor

- If n is a number, it creates a new FloatArray that can hold up to n 
number of elements, but with all the elements set to 0. 
- If n is a list, it creates a new FloatArray with its elements set to 
the values in the list.

##### Parameters

- _number|list_ **n**


#### length()

Returns the number of items in the array.

##### Returns

- number

#### bytes\_length()

Returns the length of the array if it were to be converted to bytes.

##### Returns

- number

#### first()

Returns the first item in the array or nil if the array is empty.

##### Returns

- number

#### last()

Returns the last item in the array or nil if the array is empty.

##### Returns

- number

#### append(value)

Adds the given _value_ to the end of the array.

##### Parameters

- _int_ **value**


#### get(index)

Returns the number at the specified index in the array. If index is 
outside the boundary of the array indexes (0..(array.length() - 1)), 
an exception is thrown.

##### Parameters

- _number_ **index**

##### Returns

- number

#### set(index, value)

Sets the value at the given index.

##### Parameters

- _number_ **index**
- _int_ **value**

##### Returns

- number

#### extend(array)

Updates the content of the current array by appending all the contents 
of _array_ to the end of the array in exact order.

##### Parameters

- _FloatArray_ **array**


#### reverse()

Returns a new array containing the elements in the original array 
in reverse order.


#### clone()

Returns a new FloatArray containing all items from the current array. 
The new array is a shallow copy of the original array.

##### Returns

- FloatArray

#### pop()

Removes the last element in the array and returns the value of that item.

##### Returns

- number

#### to\_bytes()

Returns the array as a bytes object

##### Returns

- bytes

#### to\_list()

Returns the elements of the array as a list of numbers

##### Returns

- list

#### to\_string()

Returns a string representation of the array

##### Returns

- string

#### get\_pointer()

Returns the raw uint64 array pointer.

##### Returns

- ptr



