# bcrypt
This module provides functions for generating and verifying bcrypt 
hashes as well as functions for getting information from a bcrypt hash.

## Properties

- **DEFAULT\_LOG2\_ROUNDS** &#8674; _number_:

  Default log2 rounds (default: 10).

- **MAX\_EXECUTION\_TIME** &#8674; _number_:

  Maximum execution time for each cipher iteration in 
milliseconds (default: 100).


## Functions

#### hash(str, salt_length)

Generates a hash for the given string. If _salt_length_ is not given, 
the length of the salt will be equal to `DEFAULT_LOG2_ROUNDS`.

##### Parameters

- _string_ **str**
- _number?_ **salt_length**

##### Returns

- string
##### Raises Exception

- Exception
@returns



#### compare(str, known_hash)

Tests a string against a known hash.

##### Parameters

- _string_ **str**
- _string_ **known_hash**

##### Returns

- bool
##### Raises Exception

- Exception
@returns



#### get\_rounds(hash)

Gets the number of rounds used to encrypt the specified hash.

##### Parameters

- _string_ **hash**

##### Returns

- number
##### Raises Exception

- Exception
@returns



#### get\_salt(hash)

Gets the salt portion from a hash.

##### Parameters

- _string_ **hash**

##### Returns

- string
##### Notes

- This function does not validate the hash.
##### Raises Exception

- Exception
@returns



