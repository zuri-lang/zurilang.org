# json
Provides APIs for encoding and decoding JSON data.
JavaScript Object Notation (JSON) is a lightweight, text-based,
language-independent data interchange format.  It was derived from
the ECMAScript Programming Language Standard.  JSON defines a small
set of formatting rules for the portable representation of structured
data.
This implementation complies with [RFC 8259](https://datatracker.ietf.org/doc/html/rfc8259).
### JSON to Blade value mapping
| JSON | Blade |
|------|-------|
| Null | Nil |
| String | String |
| Number | Number |
| Boolean | Boolean |
| Array | List |
| Object | Dict |
### Blade to JSON object mapping
| Blade | JSON |
|-------|------|
| `nil` | Null |
| Integer | Number |
| Number | Number |
| Char | String |
| String | String |
| List | Array |
| Dict | Object |
| Instance of class implementing `to_json()` decorator | Any |
Example,
```blade-repl
%> import json
%> json.encode([1, 2, 3])
'[1,2,3]'
%>
%> json.encode({name: 'Blade', version: '0.0.7'})
'{"name":"Blade","version":"0.0.7"}'
%>
%> json.encode({name: 'Blade', version: '0.0.7'}, false)
'{
  "name": "Blade",
  "version": "0.0.7"
}'
```

## Functions

encode(_value_, _compact_, _max_depth_) {#json.encode}

: JSON encodes the given value with a recursive depth up to `max_depth`.
  
  If _compact_ is `false`, the resulting json string will be 
  tightly packed. i.e. spaces will be trimmed from objects and arrays. Otherwise, 
  the JSON output will be pretty formatted.


  > **@notes**:
  > 
  > - pretty formatting use 2 spaces instead of tabs.

  - **@params**:
    - _any_ **value**
    - _bool?_ **compact** : Default value is `true`.

    - _number?_ **max_depth** : is the maximum recursive depth for encoding, default = 1024.


  {.params}
  - **@returns**: _string_



decode(_value_, _allow_comments_) {#json.decode}

: Decodes the input JSON string into Blade objects


  - **@params**:
    - _string_ **value** : The string to decode

    - _bool?_ **allow_comments** : Can be set to enable/disable C-style comments in json [default = true]


  {.params}
  - **@returns**: _object_



parse(_path_) {#json.parse}

: Parses a file containing json data.


  - **@params**:
    - _string_ **path**

  {.params}
  - **@returns**: _object_



## Classes

_class_ **Encoder** {#json.Encoder .class}

: Blade to JSON encoding class



  .Encoder(_compact_, _max_depth_) &#8674; Constructor {#json.Encoder.Encoder}

  : > **@notes**:
    > 
    > - Depth starts from zero

    > - Set max_depth to `0` to disable max depth

    - **@params**:
      - _bool?_ **compact** : Default value is `false`.

      - _number?_ **max_depth** : Default value is `1024`.


    {.params}


  .encode(_value_) {#json.Encoder.encode}

  : Encodes a value to it's corresponding JSON string.


    - **@params**:
      - _any_ **value**

    {.params}
    - **@returns**: _string_




