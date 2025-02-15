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

_sha3_.keccak\_224(_message_) {#sha3.keccak_224}

: Returns the Keccak-224 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **message**

  {.params}
  - **@returns**: _string_
  {.returns}



_sha3_.keccak\_256(_message_) {#sha3.keccak_256}

: Returns the Keccak-256 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **message**

  {.params}
  - **@returns**: _string_
  {.returns}



_sha3_.keccak\_384(_message_) {#sha3.keccak_384}

: Returns the Keccak-384 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **message**

  {.params}
  - **@returns**: _string_
  {.returns}



_sha3_.keccak\_512(_message_) {#sha3.keccak_512}

: Returns the Keccak-512 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **message**

  {.params}
  - **@returns**: _string_
  {.returns}



_sha3_.sha3\_224(_message_) {#sha3.sha3_224}

: Returns the SHA3-224 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **message**

  {.params}
  - **@returns**: _string_
  {.returns}



_sha3_.sha3\_256(_message_) {#sha3.sha3_256}

: Returns the SHA3-256 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **message**

  {.params}
  - **@returns**: _string_
  {.returns}



_sha3_.sha3\_384(_message_) {#sha3.sha3_384}

: Returns the SHA3-384 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **message**

  {.params}
  - **@returns**: _string_
  {.returns}



_sha3_.sha3\_512(_message_) {#sha3.sha3_512}

: Returns the SHA3-512 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **message**

  {.params}
  - **@returns**: _string_
  {.returns}



_sha3_.shake128(_length_, _message_) {#sha3.shake128}

: Returns the SHAKE-128 cryptographic hash of the given string or bytes computed to the given length.


  - **@params**:
    - _number_ **length**
    - _string|bytes_ **message**

  {.params}
  - **@returns**: _string_
  {.returns}



_sha3_.shake256(_length_, _message_) {#sha3.shake256}

: Returns the SHAKE-256 cryptographic hash of the given string or bytes computed to the given length.


  - **@params**:
    - _number_ **length**
    - _string|bytes_ **message**

  {.params}
  - **@returns**: _string_
  {.returns}



## Classes

_class_ **Keccak** {#sha3.Keccak .class}

: Keccak hash manipulation class.



  .Keccak(_bits_, _padding_, _length_) &#x279D; _Constructor_ {#sha3.Keccak.Keccak}

  : sha3.Keccak constructor


    - **@params**:
      - _number_ **bits** : Capacity

      - _number_ **padding** : Padding value - 1 for Keccak, 6 for SHA3 and 31 for SHAKE

      - _number?_ **length** : Optional length of the output hash in bits. If not given bits is taken as default.


    {.params}


  .init() {#sha3.Keccak.init}

  : Initializes the hash functionality and prepares it for a new round.


    - **@returns**: _self_
    {.returns}


  .update(_message_) {#sha3.Keccak.update}

  : Update the hash with additional message data.


    - **@params**:
      - _string|bytes_ **message**

    {.params}
    - **@returns**: _self_
    {.returns}


  .digest(_message_) {#sha3.Keccak.digest}

  : Finalize the hash with additional message data and returns 
    the message digest.


    - **@params**:
      - _string|bytes_ **message**

    {.params}
    - **@returns**: _bytes_
    {.returns}


  .hash(_message_) {#sha3.Keccak.hash}

  : All-in-one method to initialize a new round, update the 
    message and generate the final hash digest.


    - **@params**:
      - _string|bytes_ **message**

    {.params}
    - **@returns**: _string_
    {.returns}




