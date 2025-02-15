# base64
This module provides interface for encoding binary data into strings and 
decoding such encoded strings back into binary data based on the base64 
encoding specified in [RFC4648](https://datatracker.ietf.org/doc/html/rfc4648)

## Functions

_base64_.encode(_data_) {#base64.encode}

: Encodes a byte array into a base64 string


  - **@params**:
    - _bytes_ **data**

  {.params}
  - **@returns**: _string_
  {.returns}



_base64_.decode(_data_) {#base64.decode}

: Decodes a base64 string into it's corresponding bytes.


  - **@params**:
    - _string_ **data**

  {.params}
  - **@returns**: _bytes_
  {.returns}



