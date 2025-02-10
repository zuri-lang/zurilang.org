# base64
This module provides interface for encoding binary data into strings and 
decoding such encoded strings back into binary data based on the base64 
encoding specified in [RFC4648](https://datatracker.ietf.org/doc/html/rfc4648)

## Functions

#### encode(data)

Encodes a byte array into a base64 string

##### Parameters

- _bytes_ **data**

##### Returns

- string



#### decode(data)

Decodes a base64 string into it's corresponding bytes.

##### Parameters

- _string_ **data**

##### Returns

- bytes



