# sha3

This module provide the generic Keccak class and functions for 
working with SHA3, Keccak and SHAKE hashes.

## Functions

#### keccak\_224(message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### keccak\_256(message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### keccak\_384(message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### keccak\_512(message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### sha3\_224(message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### sha3\_256(message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### sha3\_384(message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### sha3\_512(message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### shake128(length, message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string



#### shake256(length, message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string



## Classes

### _class_ Keccak

@class

#### Methods

#### Keccak(bits, padding, length) &#8674; Constructor



##### Parameters

- _number_ **bits**
- _number_ **padding**
- _number?_ **length**


#### init()



##### Returns

- self

#### update(message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string

#### digest(message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string

#### hash(message)



##### Parameters

- _string|bytes_ **message**

##### Returns

- string



