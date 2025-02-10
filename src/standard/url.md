# url
 
This module provides classes and functions for parsing and processing URLs.
This module supports username and passwords in URLs in order to support an 
arbitrary number of RFC combinations but this does not strictly conform to 
RFC1738.

The scope of URL in this module have not been limited to HTTP or any protocol 
for that matter. However, where deductible, the module tries to conform to the
most appropriate URL for the specified scheme.

Constructing a URL is vey simple. Here is an example.

### Example

```blade-repl
%> import url
%> var link = url.Url('https', 'example.com', 9000)
%> link.absolute_url()
'https://example.com:9000'
```

What each function and class method does are easy to deduce from their names.

For example, we can use the `parse()` function to convert a URL string into a URL 
instance like below.

```blade-repl
%> link = url.parse('https://example.com:9000')
%> link.scheme
'https'
%> link.port
'9000'
```

## Functions

#### encode(url, strict)

URL-encodes a string

this function is convenient when encoding a string to be used in 
a query part of a URL, as a convenient way to pass variables to 
the next page.
if strict mode is enabled, space character is encoded with the 
percent (%) sign in order to conform with RFC 3986. Otherwise,
is is encoded with the plus (+) sign in order to align with
the default encoding used by modern browsers.

##### Parameters

- _string_ **url**
- _bool?_ **strict**: : Default value is `false`

##### Returns

- string



#### decode(url)

Decodes URL-encoded string. This function decodes any %## encoding in the given
string and plus symbols ('+') to a space character.

##### Parameters

- _string_ **url**

##### Returns

- string



#### parse(url, strict)

Parses given url string into a Url object. If the strict argument is 
set to `true`, the parser will raise an Exception when it encounters 
a malformed url.

##### Parameters

- _string_ **url**
- _bool?_ **strict**: : Default value is `false`

##### Returns

- Url



## Classes

### _class_ UrlMalformedException < _Exception_

Exception thrown when a url is malformed

#### Methods

#### UrlMalformedException(message) &#8674; Constructor

UrlMalformedException(message: string)



### _class_ Url

The Url class provides functionalities for parsing and processing URLs.


#### Properties

 - __@printable__
 - __@serializable__

#### Fields

- **scheme**:

  The url scheme e.g. http, https, ftp, tcp etc.

- **host**:

  The host information contained in the url

- **port**:

  The port information contained in the url whenever the url doesn't 
indicate, we try to make a best guess based on the scheme.

- **path**:

  The path of the URL.
@default /

- **hash**:

  Hash information contained in the url and it's beginning is indicated by the 
hash (#) sign. This value is especially relevant to some http/https urls 
and are usually references to the content of the document 
at the given url

- **query**:

  Query/Search information contained in the url and it's beginning is indicated by the 
question (?) sign. This value is especially relevant to some http/https urls and are 
usually used to convey data to endpoint based on the GET method.

- **username**:

  Username information for authentication are sometimes embedded in urls. When such information
exist, this property holds the information

- **password**:

  Password information for authentication are sometimes embedded in urls. When such information
exist, this property holds the information

- **has\_slash**:

  `true` if the url contains the :// section. `false` otherwise.

- **empty\_path** &#8674; _bool_:

  `true` if the original url contains a path segment even if its just an `/` and false if the
path value of `/` was implied.

#### Methods

#### Url(scheme, host, port, path, query, hash, username, password, has_slash, empty_path) &#8674; Constructor



##### Parameters

- _string_ **scheme**
- _string_ **host**
- _string?_ **port**
- _string?_ **path**
- _string?_ **query**
- _string?_ **hash**
- _string?_ **username**
- _string?_ **password**
- _bool?_ **has_slash**
- _bool?_ **empty_path**


#### authority()

Returns the url authority.

The authority component is preceded by a double slash ("//") and is
terminated by the next slash ("/"), question mark ("?"), or number
sign ("#") character, or by the end of the URI.

##### Returns

- string
##### Notes

- mailto scheme does not have an authority. For this reason, mailto schemes return an empty string as authority.

#### host\_is\_ipv4()

Returns true if the host of the url is a valid ipv4 address
and false otherwise.

##### Returns

- bool

#### host\_is\_ipv6()

Returns true if the host of the url is a valid ipv6 address
and false otherwise.

##### Returns

- bool

#### absolute\_url()

Returns absolute url string of the url object.

##### Returns

- string

#### to\_string()

Returns a string representation of the url object. This will 
only be the same as the absolute url if the original string is 
an absolute url.

##### Returns

- string



