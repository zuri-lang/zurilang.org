# bcrypt
This module provides functions for generating and verifying bcrypt 
hashes as well as functions for getting information from a bcrypt hash.

## Fields

_bcrypt_.**DEFAULT\_LOG2\_ROUNDS** &#x279D; _number_ {#bcrypt.DEFAULT_LOG2_ROUNDS}
: Default log2 rounds (default: 10).

_bcrypt_.**MAX\_EXECUTION\_TIME** &#x279D; _number_ {#bcrypt.MAX_EXECUTION_TIME}
: Maximum execution time for each cipher iteration in 
  milliseconds (default: 100).


## Functions

_bcrypt_.hash(_str_, _salt_length_) {#bcrypt.hash}

: Generates a hash for the given string. If _salt_length_ is not given, 
  the length of the salt will be equal to `DEFAULT_LOG2_ROUNDS`.


  - **@params**:
    - _string_ **str**
    - _number?_ **salt_length**

  {.params}
  - **@returns**: _string_
  {.returns}
  - **@raises**:
    - Exception
@returns
  {.raises}



_bcrypt_.compare(_str_, _known_hash_) {#bcrypt.compare}

: Tests a string against a known hash.


  - **@params**:
    - _string_ **str**
    - _string_ **known_hash**

  {.params}
  - **@returns**: _bool_
  {.returns}
  - **@raises**:
    - Exception
@returns
  {.raises}



_bcrypt_.get\_rounds(_hash_) {#bcrypt.get_rounds}

: Gets the number of rounds used to encrypt the specified hash.


  - **@params**:
    - _string_ **hash**

  {.params}
  - **@returns**: _number_
  {.returns}
  - **@raises**:
    - Exception
@returns
  {.raises}



_bcrypt_.get\_salt(_hash_) {#bcrypt.get_salt}

: Gets the salt portion from a hash.


  > **@notes**:
  > 
  > - This function does not validate the hash.

  - **@params**:
    - _string_ **hash**

  {.params}
  - **@returns**: _string_
  {.returns}
  - **@raises**:
    - Exception
@returns
  {.raises}



