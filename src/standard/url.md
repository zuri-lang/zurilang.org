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

_url_.encode(_url_, _strict_) {#url.encode}

: URL-encodes a string
  
  This function is convenient when encoding a string to be used in 
  a query part of a URL, as a convenient way to pass variables to 
  the next page.
  If strict mode is enabled, space character is encoded with the 
  percent (%) sign in order to conform with RFC 3986. Otherwise,
  is is encoded with the plus (+) sign in order to align with
  the default encoding used by modern browsers.


  - **@params**:
    - _string_ **url**
    - _bool?_ **strict** : Default value is `false`


  {.params}
  - **@returns**: _string_
  {.returns}



_url_.decode(_url_) {#url.decode}

: Decodes URL-encoded string. This function decodes any %## encoding in the given
  string and plus symbols ('+') to a space character.


  - **@params**:
    - _string_ **url**

  {.params}
  - **@returns**: _string_
  {.returns}



_url_.parse(_url_, _strict_) {#url.parse}

: Parses given url string into a Url object. If the strict argument is 
  set to `true`, the parser will raise an Exception when it encounters 
  a malformed url.


  - **@params**:
    - _string_ **url**
    - _bool?_ **strict** : Default value is `false`


  {.params}
  - **@returns**: _Url_
  {.returns}



## Classes

_class_ **UrlMalformedException** < _Exception_ {#url.UrlMalformedException .class}

: Exception thrown when a url is malformed


  .UrlMalformedException(_message_) &#x279D; _Constructor_ {#url.UrlMalformedException.UrlMalformedException}

  : url.UrlMalformedException constructor


    - **@params**:
      - _string_ **message**

    {.params}




_class_ **Url** {#url.Url .class}

: The Url class provides functionalities for parsing and processing URLs.


    __@printable__, __@serializable__
    {.class-props}

  **.scheme**
  : The url scheme e.g. http, https, ftp, tcp etc.

  **.host**
  : The host information contained in the url

  **.port**
  : The port information contained in the url whenever the url doesn't 
    indicate, we try to make a best guess based on the scheme.

  **.path**
  : The path of the URL.
    @default /

  **.hash**
  : Hash information contained in the url and it's beginning is indicated by the 
    hash (#) sign. This value is especially relevant to some http/https urls 
    and are usually references to the content of the document 
    at the given url

  **.query**
  : Query/Search information contained in the url and it's beginning is indicated by the 
    question (?) sign. This value is especially relevant to some http/https urls and are 
    usually used to convey data to endpoint based on the GET method.

  **.username**
  : Username information for authentication are sometimes embedded in urls. When such information
    exist, this property holds the information

  **.password**
  : Password information for authentication are sometimes embedded in urls. When such information
    exist, this property holds the information

  **.has\_slash**
  : `true` if the url contains the :// section. `false` otherwise.

  **.empty\_path** &#x279D; _bool_
  : `true` if the original url contains a path segment even if its just an `/` and false if the
    path value of `/` was implied.


  .Url(_scheme_, _host_, _port_, _path_, _query_, _hash_, _username_, _password_, _has_slash_, _empty_path_) &#x279D; _Constructor_ {#url.Url.Url}

  : url.Url constructor


    - **@params**:
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

    {.params}


  .authority() {#url.Url.authority}

  : Returns the url authority.
    
    The authority component is preceded by a double slash ("//") and is
    terminated by the next slash ("/"), question mark ("?"), or number
    sign ("#") character, or by the end of the URI.


    > **@notes**:
    > 
    > - mailto scheme does not have an authority. For this reason, mailto schemes return an empty string as authority.

    - **@returns**: _string_
    {.returns}


  .host\_is\_ipv4() {#url.Url.host_is_ipv4}

  : Returns true if the host of the url is a valid ipv4 address
    and false otherwise.


    - **@returns**: _bool_
    {.returns}


  .host\_is\_ipv6() {#url.Url.host_is_ipv6}

  : Returns true if the host of the url is a valid ipv6 address
    and false otherwise.


    - **@returns**: _bool_
    {.returns}


  .absolute\_url() {#url.Url.absolute_url}

  : Returns absolute url string of the url object.


    - **@returns**: _string_
    {.returns}


  .to\_string() {#url.Url.to_string}

  : Returns a string representation of the url object. This will 
    only be the same as the absolute url if the original string is 
    an absolute url.


    - **@returns**: _string_
    {.returns}




