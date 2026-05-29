# hash
This module provides a framework for cryptographic and non-cryptographic encryption.

Examples,

```zuri-repl
%> import hash
%> 
%> hash.md5('Hello, World')
'82bb413746aee42f89dea2b59614f9ef'
%> 
%> hash.sha256('Hello, World')
'03675ac53ff9cd1535ccc7dfcdfa2c458c5218371f418dc136f2d19ac1fbe8a5'
%> 
%> hash.siphash('mykey', 'Hello, World')
'd8e830a590c92b4c'
%> 
%> hash.hmac_sha256('mykey', 'Hello, World')
'61035d3d2119ffdfd710913bf4161d5fba1c2d9431f7de7ef398d359eb1d2481'
%> 
%> hash.hmac_sha256(bytes([10, 11, 12]), 'My secure text!')
'd782079145a3476fd4e018d44dd024034fa91f626f7f30f2009200c5ac757723'
```

## Functions

_hash_.hash(_value_) {#hash.hash}

: Returns the hash of a value as used in a dictionary underlying
  implementation.
  A class may override the result of this function by implementing the
  `to_hash` decorator


  - **@params**:
    - _any_ **value**

  {.params}
  - **@returns**: _number_
  {.returns}



_hash_.adler32(_str_, _value_) {#hash.adler32}

: Returns the adler32 value of the given string or bytes
  If value is given, it is used as the base value of the adler32
  computation. Else, 1 is used.


  - **@params**:
    - _string|bytes_ **str**
    - _number?_ **value**

  {.params}
  - **@returns**: _number_
  {.returns}



_hash_.crc32(_str_, _value_) {#hash.crc32}

: Returns the crc32 value of the given string or bytes
  If value is given, it is used as the base value of the crc32
  computation. Else, 0 is used.


  - **@params**:
    - _string|bytes_ **str**
    - _number?_ **value**

  {.params}
  - **@returns**: _number_
  {.returns}



_hash_.md2(_str_) {#hash.md2}

: Returns the md2 hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.md4(_str_) {#hash.md4}

: Returns the md4 hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.md5(_str_) {#hash.md5}

: Returns the md5 hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.md5\_file(_file_) {#hash.md5_file}

: Returns the md5 hash of the given file.


  - **@params**:
    - _file_ **file**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.sha1(_str_) {#hash.sha1}

: Returns the sha1 hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.sha224(_str_) {#hash.sha224}

: Returns the sha224 hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.sha256(_str_) {#hash.sha256}

: Returns the sha256 hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.sha384(_str_) {#hash.sha384}

: Returns the sha384 hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.sha512(_str_) {#hash.sha512}

: Returns the sha512 hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.fnv1(_str_) {#hash.fnv1}

: Returns the 32 bit fnv1 hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.fnv1\_64(_str_) {#hash.fnv1_64}

: Returns the 64 bit fnv1 hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.fnv1a(_str_) {#hash.fnv1a}

: Returns the 32 bit fnv1a hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.fnv1a\_64(_str_) {#hash.fnv1a_64}

: Returns the 64 bit fnv1a hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.whirlpool(_str_) {#hash.whirlpool}

: Returns the whirlpool hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.snefru(_str_) {#hash.snefru}

: Returns the Snefru cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.siphash(_key_, _str_) {#hash.siphash}

: Returns the SipHash cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.gost(_str_) {#hash.gost}

: Returns the Gost cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac(_method_, _key_, _str_) {#hash.hmac}

: Computes an HMAC with the key and str using the given method.


  - **@params**:
    - _function_ **method**
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac\_md2(_key_, _str_) {#hash.hmac_md2}

: Returns the HMAC-MD2 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac\_md4(_key_, _str_) {#hash.hmac_md4}

: Returns the HMAC-MD4 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac\_md5(_key_, _str_) {#hash.hmac_md5}

: Returns the HMAC-MD5 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac\_sha1(_key_, _str_) {#hash.hmac_sha1}

: Returns the HMAC-SHA1 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac\_sha224(_key_, _str_) {#hash.hmac_sha224}

: Returns the HMAC-SHA224 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac\_sha256(_key_, _str_) {#hash.hmac_sha256}

: Returns the HMAC-SHA256 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac\_sha384(_key_, _str_) {#hash.hmac_sha384}

: Returns the HMAC-SHA384 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac\_sha512(_key_, _str_) {#hash.hmac_sha512}

: Returns the HMAC-SHA512 cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac\_whirlpool(_key_, _str_) {#hash.hmac_whirlpool}

: Returns the HMAC-WHIRLPOOL cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac\_snefru(_key_, _str_) {#hash.hmac_snefru}

: Returns the HMAC-SNEFRU cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



_hash_.hmac\_gost(_key_, _str_) {#hash.hmac_gost}

: Returns the HMAC-GOST cryptographic hash of the given string or bytes.


  - **@params**:
    - _string|bytes_ **key**
    - _string|bytes_ **str**

  {.params}
  - **@returns**: _string_
  {.returns}



