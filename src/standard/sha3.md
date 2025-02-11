# sha3

This module provide the generic Keccak class and functions for 
working with SHA3, Keccak and SHAKE hashes.

Like the `hash` module, this module exports quick and simple 
functions to compute SHA3/Keccak family of functions.

For example:

```blade-repl
%> import sha3
%> 
%> sha3.sha3_256('hello')
'3338be694f50c5f338814986cdf0686453a888b84f424d792af4b9202398f392'
```

It also exports the generic `Keccak` class that you can customize 
to your preference.

For example:

```blade-repl
%> import sha3
%> 
%> var h = sha3.Keccak(256, 1)
%> h.update('How are you?')
<class Keccak instance at 0x14010bf40>
%> h.digest('')
(97 bf fd e9 c7 30 76 73 58 99 84 84 1c cc c1 8c dc 28 90 d6  ...32)
```

You can use the `bytes_to_hex()` function in the `convert` module to 
get a hexadecimal string from the digest.

## Functions

#### keccak\_224(message)

Returns the Keccak-224 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### keccak\_256(message)

Returns the Keccak-256 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### keccak\_384(message)

Returns the Keccak-384 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### keccak\_512(message)

Returns the Keccak-512 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### sha3\_224(message)

Returns the SHA3-224 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### sha3\_256(message)

Returns the SHA3-256 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### sha3\_384(message)

Returns the SHA3-384 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### sha3\_512(message)

Returns the SHA3-512 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### shake128(length, message)

Returns the SHAKE-128 cryptographic hash of the given string or bytes computed to the given length.

##### Parameters

- _number_ **length**
- _string|bytes_ **message**

##### Returns

- string



#### shake256(length, message)

Returns the SHAKE-256 cryptographic hash of the given string or bytes computed to the given length.

##### Parameters

- _number_ **length**
- _string|bytes_ **message**

##### Returns

- string



## Classes

### _class_ Keccak

Keccak hash manipulation class.

#### Methods

#### Keccak(bits, padding, length) &#8674; Constructor



##### Parameters

- _number_ **bits**: : Capacity
- _number_ **padding**: : Padding value - 1 for Keccak, 6 for SHA3 and 31 for SHAKE
- _number?_ **length**: : Optional length of the output hash in bits. If not given bits is taken as default.


#### init()

Initializes the hash functionality and prepares it for a new round.

##### Returns

- self

#### update(message)

Update the hash with additional message data.

##### Parameters

- _string|bytes_ **message**

##### Returns

- self

#### digest(message)

Finalize the hash with additional message data and returns 
the message digest.

##### Parameters

- _string|bytes_ **message**

##### Returns

- bytes

#### hash(message)

All-in-one method to initialize a new round, update the 
message and generate the final hash digest.

##### Parameters

- _string|bytes_ **message**

##### Returns

- string



