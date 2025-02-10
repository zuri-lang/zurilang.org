# hash
This module provides a framework for cryptographic and non-cryptographic encryption.

Examples,

```blade-repl
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

#### hash(value)

Returns the hash of a value as used in a dictionary underlying
implementation.
A class may override the result of this function by implementing the
`to_hash` decorator

##### Parameters

- _any_ **value**

##### Returns

- number



#### adler32(str, value)

Returns the adler32 value of the given string or bytes
If value is given, it is used as the base value of the adler32
computation. Else, 1 is used.

##### Parameters

- _string|bytes_ **str**
- _number?_ **value**

##### Returns

- number



#### crc32(str, value)

Returns the crc32 value of the given string or bytes
If value is given, it is used as the base value of the crc32
computation. Else, 0 is used.

##### Parameters

- _string|bytes_ **str**
- _number?_ **value**

##### Returns

- number



#### md2(str)

Returns the md2 hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### md4(str)

Returns the md4 hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### md5(str)

Returns the md5 hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### md5\_file(file)

Returns the md5 hash of the given file.

##### Parameters

- _file_ **file**

##### Returns

- string



#### sha1(str)

Returns the sha1 hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### sha224(str)

Returns the sha224 hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### sha256(str)

Returns the sha256 hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### sha384(str)

Returns the sha384 hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### sha512(str)

Returns the sha512 hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### fnv1(str)

Returns the 32 bit fnv1 hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### fnv1\_64(str)

Returns the 64 bit fnv1 hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### fnv1a(str)

Returns the 32 bit fnv1a hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### fnv1a\_64(str)

Returns the 64 bit fnv1a hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### whirlpool(str)

Returns the whirlpool hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### snefru(str)

Returns the Snefru cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### siphash(key, str)

Returns the SipHash cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### gost(str)

Returns the Gost cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **str**

##### Returns

- string



#### hmac(method, key, str)

Computes an HMAC with the key and str using the given method.

##### Parameters

- _function_ **method**
- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### hmac\_md2(key, str)

Returns the HMAC-MD2 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### hmac\_md4(key, str)

Returns the HMAC-MD4 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### hmac\_md5(key, str)

Returns the HMAC-MD5 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### hmac\_sha1(key, str)

Returns the HMAC-SHA1 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### hmac\_sha224(key, str)

Returns the HMAC-SHA224 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### hmac\_sha256(key, str)

Returns the HMAC-SHA256 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### hmac\_sha384(key, str)

Returns the HMAC-SHA384 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### hmac\_sha512(key, str)

Returns the HMAC-SHA512 cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### hmac\_whirlpool(key, str)

Returns the HMAC-WHIRLPOOL cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### hmac\_snefru(key, str)

Returns the HMAC-SNEFRU cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



#### hmac\_gost(key, str)

Returns the HMAC-GOST cryptographic hash of the given string or bytes.

##### Parameters

- _string|bytes_ **key**
- _string|bytes_ **str**

##### Returns

- string



