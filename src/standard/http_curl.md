# http_curl

> **IMPORTANT NOTICE:**
>
> THIS MODULE WAS FORMERLY THE `http` module.
>
> THIS MODULE IS DEPRECIATED AND WILL BE REMOVED FROM THE CORE
> LIBRARY AS SOON AS THE CLIENT OF THE PURE BLADE IMPLEMENTATION 
> IS STABLE.
>
> IT IS ONLY HERE FOR HISTORICAL REASONS AND TO SERVE AS A BASE
> BENCHMARK FOR THE DEVELOPMENT OF THE `http` MODULE.
>
> YOU SHOULD USE THE `http` MODULE INSTEAD AS ITS MORE SUPPORTED,
> AND ALL FURTHER DEVELOPMENTS TOWARDS HTTP WILL BE DONE THERE.
>
> BUG REPORTS AND ISSUES FOR THIS MODULE WILL NOT BE TREATED AS
> PRIORITY.
The `http_curl` module provides a rich library to help in building HTTP
clients and servers. The module also provides a few generic abstractions
for simple HTTP operations such as a GET request.
### Examples
The example below shows making a GET request to fetch a webpage.
```zuri
import http_curl
echo http_curl.get('http://example.com')
# <class HttpResponse instance at 0x600002adacd0>
```
There is a `post()` and `put()` alternative to the `get()` method called
above and they are documented below.
For a more controlled HTTP request, you should use the HttpClient class.
Below is an example of such implementation that sets the timeout for
receiving response back from the server to 30 seconds.
```zuri
import http_curl
var client = http_curl.HttpClient()
client.receive_timeout = 30000 # Optional
var res = client.send_request('http://example.com/endpoint?query=1', 'GET')
echo res.body.to_string()
```
Creating a server with the `http_curl` module is also a breeze.
The example below shows an implementation of an HTTP API server listening on port
3000 and simple returns the JSON of the request object itself.
```zuri
import http_curl
import json
var server = http_curl.server(3000)
server.handle('GET', '/', @(request, response) {
  response.json(request)
})
server.listen()
```
The `http_curl` module does not make any assumption as to the type of data to be sent
in request bodies and for this reason, it should not be expected to automatically
convert dictionaries into JSON objects or create multipart/form-data request for you.
Rather, it gives the tools required to craft any request body of your choice.

## Fields

_http_curl_.**CONTINUE** &#x279D; _readonly_ _int_ {#http_curl.CONTINUE}
: 100 continue.

_http_curl_.**SWITCHING\_PROTOCOLS** &#x279D; _readonly_ _int_ {#http_curl.SWITCHING_PROTOCOLS}
: 101 switching protocols.

_http_curl_.**PROCESSING** &#x279D; _readonly_ _int_ {#http_curl.PROCESSING}
: 102 processing.

_http_curl_.**OK** &#x279D; _readonly_ _int_ {#http_curl.OK}
: 200 ok.

_http_curl_.**CREATED** &#x279D; _readonly_ _int_ {#http_curl.CREATED}
: 201 created.

_http_curl_.**ACCEPTED** &#x279D; _readonly_ _int_ {#http_curl.ACCEPTED}
: 202 accepted.

_http_curl_.**NON\_AUTHORITATIVE\_INFORMATION** &#x279D; _readonly_ _int_ {#http_curl.NON_AUTHORITATIVE_INFORMATION}
: 203 non authoritative information.

_http_curl_.**NO\_CONTENT** &#x279D; _readonly_ _int_ {#http_curl.NO_CONTENT}
: 204 no content.

_http_curl_.**RESET\_CONTENT** &#x279D; _readonly_ _int_ {#http_curl.RESET_CONTENT}
: 205 reset content.

_http_curl_.**PARTIAL\_CONTENT** &#x279D; _readonly_ _int_ {#http_curl.PARTIAL_CONTENT}
: 206 partial content.

_http_curl_.**MULTI\_STATUS** &#x279D; _readonly_ _int_ {#http_curl.MULTI_STATUS}
: 207 multi status.

_http_curl_.**ALREADY\_REPORTED** &#x279D; _readonly_ _int_ {#http_curl.ALREADY_REPORTED}
: 208 already reported.

_http_curl_.**IM\_USED** &#x279D; _readonly_ _int_ {#http_curl.IM_USED}
: 226 im used.

_http_curl_.**MULTIPLE\_CHOICES** &#x279D; _readonly_ _int_ {#http_curl.MULTIPLE_CHOICES}
: 300 multiple choices.

_http_curl_.**MOVED\_PERMANENTLY** &#x279D; _readonly_ _int_ {#http_curl.MOVED_PERMANENTLY}
: 301 moved permanently.

_http_curl_.**FOUND** &#x279D; _readonly_ _int_ {#http_curl.FOUND}
: 302 found.

_http_curl_.**SEE\_OTHER** &#x279D; _readonly_ _int_ {#http_curl.SEE_OTHER}
: 303 see other.

_http_curl_.**NOT\_MODIFIED** &#x279D; _readonly_ _int_ {#http_curl.NOT_MODIFIED}
: 304 not modified.

_http_curl_.**USE\_PROXY** &#x279D; _readonly_ _int_ {#http_curl.USE_PROXY}
: 305 use proxy.

_http_curl_.**TEMPORARY\_REDIRECT** &#x279D; _readonly_ _int_ {#http_curl.TEMPORARY_REDIRECT}
: 307 temporary redirect.

_http_curl_.**PERMANENT\_REDIRECT** &#x279D; _readonly_ _int_ {#http_curl.PERMANENT_REDIRECT}
: 308 permanent redirect.

_http_curl_.**BAD\_REQUEST** &#x279D; _readonly_ _int_ {#http_curl.BAD_REQUEST}
: 400 bad request.

_http_curl_.**UNAUTHORIZED** &#x279D; _readonly_ _int_ {#http_curl.UNAUTHORIZED}
: 401 unauthorized.

_http_curl_.**PAYMENT\_REQUIRED** &#x279D; _readonly_ _int_ {#http_curl.PAYMENT_REQUIRED}
: 402 payment required.

_http_curl_.**FORBIDDEN** &#x279D; _readonly_ _int_ {#http_curl.FORBIDDEN}
: 403 forbidden.

_http_curl_.**NOT\_FOUND** &#x279D; _readonly_ _int_ {#http_curl.NOT_FOUND}
: 404 not found.

_http_curl_.**METHOD\_NOT\_ALLOWED** &#x279D; _readonly_ _int_ {#http_curl.METHOD_NOT_ALLOWED}
: 405 method not allowed.

_http_curl_.**NOT\_ACCEPTABLE** &#x279D; _readonly_ _int_ {#http_curl.NOT_ACCEPTABLE}
: 406 not acceptable.

_http_curl_.**PROXY\_AUTHENTICATION\_REQUIRED** &#x279D; _readonly_ _int_ {#http_curl.PROXY_AUTHENTICATION_REQUIRED}
: 407 proxy authentication required.

_http_curl_.**REQUEST\_TIMEOUT** &#x279D; _readonly_ _int_ {#http_curl.REQUEST_TIMEOUT}
: 408 request timeout.

_http_curl_.**CONFLICT** &#x279D; _readonly_ _int_ {#http_curl.CONFLICT}
: 409 conflict.

_http_curl_.**GONE** &#x279D; _readonly_ _int_ {#http_curl.GONE}
: 410 gone.

_http_curl_.**LENGTH\_REQUIRED** &#x279D; _readonly_ _int_ {#http_curl.LENGTH_REQUIRED}
: 411 length required.

_http_curl_.**PRECONDITION\_FAILED** &#x279D; _readonly_ _int_ {#http_curl.PRECONDITION_FAILED}
: 412 precondition failed.

_http_curl_.**PAYLOAD\_TOO\_LARGE** &#x279D; _readonly_ _int_ {#http_curl.PAYLOAD_TOO_LARGE}
: 413 payload too large.

_http_curl_.**REQUEST\_URI\_TOO\_LONG** &#x279D; _readonly_ _int_ {#http_curl.REQUEST_URI_TOO_LONG}
: 414 request uri too long.

_http_curl_.**UNSUPPORTED\_MEDIA\_TYPE** &#x279D; _readonly_ _int_ {#http_curl.UNSUPPORTED_MEDIA_TYPE}
: 415 unsupported media type.

_http_curl_.**REQUESTED\_RANGE\_NOT\_SATISFIABLE** &#x279D; _readonly_ _int_ {#http_curl.REQUESTED_RANGE_NOT_SATISFIABLE}
: 416 requested range not satisfiable.

_http_curl_.**EXPECTATION\_FAILED** &#x279D; _readonly_ _int_ {#http_curl.EXPECTATION_FAILED}
: 417 expectation failed.

_http_curl_.**TEAPOT** &#x279D; _readonly_ _int_ {#http_curl.TEAPOT}
: 418 teapot.

_http_curl_.**MISDIRECTED\_REQUEST** &#x279D; _readonly_ _int_ {#http_curl.MISDIRECTED_REQUEST}
: 421 misdirected request.

_http_curl_.**UNPROCESSABLE\_ENTITY** &#x279D; _readonly_ _int_ {#http_curl.UNPROCESSABLE_ENTITY}
: 422 unprocessable entity.

_http_curl_.**LOCKED** &#x279D; _readonly_ _int_ {#http_curl.LOCKED}
: 423 locked.

_http_curl_.**FAILED\_DEPENDENCY** &#x279D; _readonly_ _int_ {#http_curl.FAILED_DEPENDENCY}
: 424 failed dependency.

_http_curl_.**UPGRADE\_REQUIRED** &#x279D; _readonly_ _int_ {#http_curl.UPGRADE_REQUIRED}
: 426 upgrade required.

_http_curl_.**PRECONDITION\_REQUIRED** &#x279D; _readonly_ _int_ {#http_curl.PRECONDITION_REQUIRED}
: 428 precondition required.

_http_curl_.**TOO\_MANY\_REQUESTS** &#x279D; _readonly_ _int_ {#http_curl.TOO_MANY_REQUESTS}
: 429 too many requests.

_http_curl_.**REQUEST\_HEADER\_FIELDS\_TOO\_LARGE** &#x279D; _readonly_ _int_ {#http_curl.REQUEST_HEADER_FIELDS_TOO_LARGE}
: 431 request header fields too large.

_http_curl_.**CONNECTION\_CLOSED\_WITHOUT\_RESPONSE** &#x279D; _readonly_ _int_ {#http_curl.CONNECTION_CLOSED_WITHOUT_RESPONSE}
: 444 connection closed without response.

_http_curl_.**UNAVAILABLE\_FOR\_LEGAL\_REASONS** &#x279D; _readonly_ _int_ {#http_curl.UNAVAILABLE_FOR_LEGAL_REASONS}
: 451 unavailable for legal reasons.

_http_curl_.**CLIENT\_CLOSED\_REQUEST** &#x279D; _readonly_ _int_ {#http_curl.CLIENT_CLOSED_REQUEST}
: 499 client closed request.

_http_curl_.**INTERNAL\_SERVER\_ERROR** &#x279D; _readonly_ _int_ {#http_curl.INTERNAL_SERVER_ERROR}
: 500 internal server error.

_http_curl_.**NOT\_IMPLEMENTED** &#x279D; _readonly_ _int_ {#http_curl.NOT_IMPLEMENTED}
: 501 not implemented.

_http_curl_.**BAD\_GATEWAY** &#x279D; _readonly_ _int_ {#http_curl.BAD_GATEWAY}
: 502 bad gateway.

_http_curl_.**SERVICE\_UNAVAILABLE** &#x279D; _readonly_ _int_ {#http_curl.SERVICE_UNAVAILABLE}
: 503 service unavailable.

_http_curl_.**GATEWAY\_TIMEOUT** &#x279D; _readonly_ _int_ {#http_curl.GATEWAY_TIMEOUT}
: 504 gateway timeout.

_http_curl_.**HTTP\_VERSION\_NOT\_SUPPORTED** &#x279D; _readonly_ _int_ {#http_curl.HTTP_VERSION_NOT_SUPPORTED}
: 505 http version not supported.

_http_curl_.**VARIANT\_ALSO\_NEGOTIATES** &#x279D; _readonly_ _int_ {#http_curl.VARIANT_ALSO_NEGOTIATES}
: 506 variant also negotiates.

_http_curl_.**INSUFFICIENT\_STORAGE** &#x279D; _readonly_ _int_ {#http_curl.INSUFFICIENT_STORAGE}
: 507 insufficient storage.

_http_curl_.**LOOP\_DETECTED** &#x279D; _readonly_ _int_ {#http_curl.LOOP_DETECTED}
: 508 loop detected.

_http_curl_.**NOT\_EXTENDED** &#x279D; _readonly_ _int_ {#http_curl.NOT_EXTENDED}
: 510 not extended.

_http_curl_.**NETWORK\_AUTHENTICATION\_REQUIRED** &#x279D; _readonly_ _int_ {#http_curl.NETWORK_AUTHENTICATION_REQUIRED}
: 511 network authentication required.

_http_curl_.**NETWORK\_CONNECT\_TIMEOUT\_ERROR** &#x279D; _readonly_ _int_ {#http_curl.NETWORK_CONNECT_TIMEOUT_ERROR}
: 599 network connect timeout error.

_http_curl_.**map** &#x279D; _readonly_ _dictionary_ {#http_curl.map}
: A map of status code to their string representation..


## Functions

_http_curl_.set\_headers(_headers_) {#http_curl.set_headers}

: Sets the request headers for the current module instance.
   
  This function returns HttpClient in order to allow for idiomatic 
  chaining such as:
  
  ```zuri
  import http_curl
  echo http_curl.set_headers({
    'Authorization': 'Bearer SomeAPIBearerToken',
    'Host': 'example.com',
  }).get('http://example.com/current-user').body.to_string()
  ```


  - **@params**:
    - _dict_ **headers**

  {.params}
  - **@returns**: _HttpClient_
  {.returns}
  - **@raises**:
    - Exception
  {.raises}



_http_curl_.get(_url_) {#http_curl.get}

: Sends an Http GET request and returns an HttpResponse
  or throws one of SocketException or Exception if it fails.


  - **@params**:
    - _string_ **url**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_curl_.post(_url_, _data_) {#http_curl.post}

: Sends an Http POST request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _string|bytes|nil_ **data**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_curl_.put(_url_, _data_) {#http_curl.put}

: Sends an Http PUT request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _string|bytes|nil_ **data**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_curl_.delete(_url_) {#http_curl.delete}

: Sends an Http DELETE request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_curl_.server(_port_, _address_) {#http_curl.server}

: Creates an new HttpServer instance.


  - **@params**:
    - _int_ **port**
    - _string_ **address**

  {.params}
  - **@returns**: _HttpServer_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_curl_.client() {#http_curl.client}

: Returns the default client.


  - **@returns**: _HttpClient_
  {.returns}



## Classes

_class_ **HttpRequest** {#http_curl.HttpRequest .class}

: Http request handler and object.


    __@printable__, __@serializable__
    {.class-props}

  **.request\_uri** &#x279D; _string_ {#http_curl.HttpRequest.request_uri}
  : The original request URL as sent in the raw request.

  **.path** &#x279D; _string_ {#http_curl.HttpRequest.path}
  : The requested path or file. E.g. if the Request URI is `/users?sort=desc`, 
    then the path is `/users`.

  **.method** &#x279D; _string_ {#http_curl.HttpRequest.method}
  : The HTTP method of the request: GET (the default), POST, PUT, etc.

  **.host** &#x279D; _string_ {#http_curl.HttpRequest.host}
  : The hostname derived from the `Host` header or the first instance of 
    `X-Forwarded-Host` if set.

  **.ip** &#x279D; _string_ {#http_curl.HttpRequest.ip}
  : The IP address of the remote client that initiated the request.

  **.ipv6** &#x279D; _string_ {#http_curl.HttpRequest.ipv6}
  : The IPv6 address of the remote client that initiated the request.

  **.headers** &#x279D; _dictionary_ {#http_curl.HttpRequest.headers}
  : A dictionary containing the headers sent with the request.

  **.queries** &#x279D; _dictionary_ {#http_curl.HttpRequest.queries}
  : A dictionary containing the entries of the URI query string.

  **.cookies** &#x279D; _dictionary_ {#http_curl.HttpRequest.cookies}
  : A dictionary containing the cookies sent with the request.

  **.body** &#x279D; _dictionary_ {#http_curl.HttpRequest.body}
  : A dictionary containing all data submitted in the request body.

  **.files** &#x279D; _dictionary_ {#http_curl.HttpRequest.files}
  : A dictionary containing the data of all files uploaded in the request.

  **.http\_version** &#x279D; _string_ {#http_curl.HttpRequest.http_version}
  : The HTTP version used for the request.

  **.auth\_method** &#x279D; _Auth_ {#http_curl.HttpRequest.auth_method}
  : The HTTP authentication method to use when the uri contains a credential. 
    Default value is `Auth.ANY`.


  .parse(_raw_data_, _client_) {#http_curl.HttpRequest.parse}

  : Parses a raw HTTP request string into a correct HttpRequest.


    - **@params**:
      - _string_ **raw_data**
      - _Socket|TLSSocket|nil_ **client**

    {.params}
    - **@returns**: _boolean_
    {.returns}


  .send(_uri_, _method_, _data_, _options_) {#http_curl.HttpRequest.send}

  : Sends the given request to the given uri using the given method and 
    optionally passing the data if given.


    - **@params**:
      - _Url_ **uri**
      - _string_ **method**
      - _string|bytes|nil_ **data**
      - _dict?_ **options**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - HttpException
    {.raises}


  .to\_dict() {#http_curl.HttpRequest.to_dict}

  : Returns a dictionary representation of the HttpRequest instance.


    - **@returns**: _dict_
    {.returns}


  .to\_string() {#http_curl.HttpRequest.to_string}

  : Returns a string representation of the HttpRequest instance.


    - **@returns**: _string_
    {.returns}




_class_ **HttpException** < _Exception_ {#http_curl.HttpException .class}

: HTTP related Exceptions.


    __@printable__
    {.class-props}



_class_ **HttpServer** {#http_curl.HttpServer .class}

: HTTP server.


    __@printable__
    {.class-props}

  **.host** &#x279D; _string_ {#http_curl.HttpServer.host}
  : The host address to which this server will be bound. Default value is 
    socket.IP_LOCAL (127.0.0.1)

  **.port** &#x279D; _number_ {#http_curl.HttpServer.port}
  : The port to which this server will be bound to on the host.

  **.socket** &#x279D; _{Socket_ {#http_curl.HttpServer.socket}
  : The working Socket instance for the HttpServer.

  **.reuse\_address** &#x279D; _bool_ {#http_curl.HttpServer.reuse_address}
  : A boolean value indicating whether to reuse socket addresses or not.
    Default value is `true`.

  **.read\_timeout** &#x279D; _number_ {#http_curl.HttpServer.read_timeout}
  : The timeout in milliseconds after which an attempt to read clients 
    request data will be terminated. Default value is 2,000 (2 seconds).

  **.write\_timeout** &#x279D; _number_ {#http_curl.HttpServer.write_timeout}
  : The timeout in milliseconds after which an attempt to write response data to 
    clients will be terminated. 
    
    If we cannot send response to a client after the stipulated time, it will be 
    assumed such clients have disconnected and existing connections for that 
    client will be closed and their respective sockets will be discarded. Default 
    value is 2,000 (2 seconds).


  .HttpServer(_port_, _host_) &#x279D; _Constructor_ {#http_curl.HttpServer.HttpServer}

  : http_curl.HttpServer constructor


    - **@params**:
      - _int_ **port**
      - _string?_ **host**

    {.params}


  .close() {#http_curl.HttpServer.close}

  : Stops the server.




  .on\_connect(_function_) {#http_curl.HttpServer.on_connect}

  : Adds a function to be called when a new client connects.


    > **@notes**:
    > 
    > - Function _function_ MUST accept at one parameter which will be passed the client Socket object.

    > - Multiple `on_connect()` may be set on a single instance.

    - **@params**:
      - _function(1)_ **function**

    {.params}


  .on\_disconnect(_function_) {#http_curl.HttpServer.on_disconnect}

  : Adds a function to be called when a new client disconnects.


    > **@notes**:
    > 
    > - Function _function_ MUST accept at one parameter which will be passed the client information.

    > - Multiple `on_disconnect()` may be set on a single instance.

    - **@params**:
      - _function(1)_ **function**

    {.params}


  .on\_receive(_handler_) {#http_curl.HttpServer.on_receive}

  : Adds a function to be called when the server receives a message from a client.
    
    > Function _fn_ MUST accept TWO parameters. First parameter will accept the HttpRequest 
    > object and the second will accept the HttpResponse object.


    > **@notes**:
    > 
    > - Multiple `on_receive()` may be set on a single instance.

    - **@params**:
      - _function(2)_ **handler**

    {.params}


  .on\_reply(_function_) {#http_curl.HttpServer.on_reply}

  : Adds a function to be called when the server sends a reply to a client.
    
    > Function _function_ MUST accept one parameter which will be passed the HttpResponse object.


    > **@notes**:
    > 
    > - Multiple `on_sent()` may be set on a single instance.

    - **@params**:
      - _function(1)_ **function**

    {.params}


  .on\_error(_function_) {#http_curl.HttpServer.on_error}

  : Adds a function to be called when the server encounters an error with a client.
    
    > Function _function_ MUST accept two parameters. The first argument will be passed the 
    > `Exception` object and the second will be passed the client `Socket` object.


    > **@notes**:
    > 
    > - Multiple `on_error()` may be set on a single instance.

    - **@params**:
      - _function(2)_ **function**

    {.params}


  .handle(_method_, _path_, _handler_) {#http_curl.HttpServer.handle}

  : Sets up a request handler that will be called when a request with the given method 
    has a path that matches the one specified.


    - **@params**:
      - _string_ **method**
      - _string_ **path**
      - _function(2)_ **handler**

    {.params}


  .none\_handler(_handler_) {#http_curl.HttpServer.none_handler}

  : Sets up the handle to invoke when a request is not processed. That is, when it does 
    not match a registered route and no `on_receive()` handler is set.


    - **@params**:
      - _function(2)_ **handler**

    {.params}


  .listen() {#http_curl.HttpServer.listen}

  : Binds to the instance port and host and starts listening for incoming 
    connection from HTTP clients.






_class_ **HttpClient** {#http_curl.HttpClient .class}

: Handles http requests.
  
  @note This client do not currently support the compress, deflate and gzip transfer encoding.


  **.user\_agent** &#x279D; _string_ {#http_curl.HttpClient.user_agent}
  : The user agent of the client used to make the request. 
    Default value &mdash; `Zuri HTTP Client/1.0`.

  **.follow\_redirect** &#x279D; _bool_ {#http_curl.HttpClient.follow_redirect}
  : Indicates if we receive a redirect from a server, this flag tells us whether 
    we should follow it or not. Default value is `true`.

  **.skip\_hostname\_verification** &#x279D; _bool_ {#http_curl.HttpClient.skip_hostname_verification}
  : Indicates if the site you're connecting to uses a different host name that what
    they have mentioned in their server certificate's commonName (or subjectAltName) 
    fields, connection will fail. You can skip this check by setting to true, but this 
    will make the connection less secure.

  **.skip\_peer\_verification** &#x279D; _bool_ {#http_curl.HttpClient.skip_peer_verification}
  : Indicates if you want to connect to a site who isn't using a certificate that is
    signed by one of the certs in the CA bundle you have, you can skip the verification 
    of the server's certificate. This makes the connection A LOT LESS SECURE.

  **.referer** &#x279D; _string_ {#http_curl.HttpClient.referer}
  : The site that refers us to the current site

  **.ca\_cert** &#x279D; _string_ {#http_curl.HttpClient.ca_cert}
  : If you have a CA cert for the server stored someplace else than in the default bundle.

  **.connect\_timeout** &#x279D; _number_ {#http_curl.HttpClient.connect_timeout}
  : The connect timeout duration in milliseconds. Default value is 60,000 (1 minute).

  **.receive\_timeout** &#x279D; _number_ {#http_curl.HttpClient.receive_timeout}
  : The receive timeout duration in milliseconds. Default value is 300,000 (5 minutes).

  **.headers** &#x279D; _dict_ {#http_curl.HttpClient.headers}
  : A dictionary of headers sent along with the request.

  **.no\_expect** &#x279D; _bool_ {#http_curl.HttpClient.no_expect}
  : Indicates whether to remove the expect header or not only applies to requests with 
    files in the body


  .send\_request(_uri_, _method_, _data_) {#http_curl.HttpClient.send_request}

  : Sends an Http request and returns a HttpResponse.


    - **@params**:
      - _string_ **uri**
      - _string?_ **method** Default value is `GET`.

      - _string|dict|nil_ **data**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - SocketException
      - Exception
    {.raises}


  .get(_url_) {#http_curl.HttpClient.get}

  : Sends an Http GET request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}


  .post(_url_, _data_) {#http_curl.HttpClient.post}

  : Sends an Http POST request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _string|bytes|nil_ **data**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}


  .put(_url_, _data_) {#http_curl.HttpClient.put}

  : Sends an Http PUT request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _string|bytes|nil_ **data**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}


  .delete(_url_) {#http_curl.HttpClient.delete}

  : Sends an Http DELETE request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}




_class_ **HttpResponse** {#http_curl.HttpResponse .class}

: Represents the response to an Http request.


    __@printable__, __@serializable__
    {.class-props}

  **.version** &#x279D; _string_ {#http_curl.HttpResponse.version}
  : The HTTP version of the response

  **.status** &#x279D; _number_ {#http_curl.HttpResponse.status}
  : The HTTP response status code

  **.headers** &#x279D; _dictionary_ {#http_curl.HttpResponse.headers}
  : The HTTP response headers

  **.time\_taken** &#x279D; _number_ {#http_curl.HttpResponse.time_taken}
  : Total time taken for the HTTP request that generated this HttpResponse to complete

  **.redirects** &#x279D; _number_ {#http_curl.HttpResponse.redirects}
  : The number of times the HTTP request that generated this HttpResponse was redirected.

  **.responder** &#x279D; _string_ {#http_curl.HttpResponse.responder}
  : The final URL that provided the HttpResponse. This will sometimes differ from the 
    original request URI.

  **.body** &#x279D; _bytes_ {#http_curl.HttpResponse.body}
  : The content of the HTTP response as bytes

  **.cookies** &#x279D; _list_ {#http_curl.HttpResponse.cookies}
  : The cookies to be sent back to the client


  .HttpResponse(_body_, _status_, _headers_, _cookies_, _version_, _time_taken_, _redirects_, _responder_) &#x279D; _Constructor_ {#http_curl.HttpResponse.HttpResponse}

  : http_curl.HttpResponse constructor


    - **@params**:
      - _string_ **body**
      - _int_ **status**
      - _dict_ **headers**
      - _list[string]_ **cookies**
      - _string_ **version**
      - _number_ **time_taken**
      - _int_ **redirects**
      - _string_ **responder**

    {.params}


  .write(_data_) {#http_curl.HttpResponse.write}

  : Writes data to the response stream. 
    
    > This method should be prefered over writing directly to the body 
    > property to prevent unexpected behaviors.


    - **@params**:
      - _string|bytes_ **data**

    {.params}


  .json(_data_, _status_code_) {#http_curl.HttpResponse.json}

  : Writes a json encoded data to the response stream and sets the response 
    `Content-Type` to `application/json`. If the status code is given, the
    response will be sent with the given status code.


    - **@params**:
      - _any_ **data**
      - _number?_ **status_code**

    {.params}


  .file(_path_, _status_code_) {#http_curl.HttpResponse.file}

  : Writes a file into the response stream and sets the `Content-Type` to the 
    correct mimetype for the file. If the status code is given, the
    response will be sent with the given status code.


    - **@params**:
      - _string_ **path**
      - _number?_ **status_code**

    {.params}


  .set\_cookie(_key_, _value_, _domain_, _path_, _expires_, _secure_, _extras_) {#http_curl.HttpResponse.set_cookie}

  : Sets a cookie to be send back to a client with the given _key_ and _value_. 
    When other parameters are given, they are used to construct a correct Set-Cookie 
    header based on their named properties.


    - **@params**:
      - _string_ **key**
      - _string_ **value**
      - _string?_ **domain**
      - _string?_ **path**
      - _string?_ **expires**
      - _bool?_ **secure**
      - _string?_ **extras**

    {.params}


  .redirect(_location_, _status_) {#http_curl.HttpResponse.redirect}

  : Redirects the client to a new location. This function simultaneously sets 
    the `Location` header and returns a 30x status code. If the `status` 
    parameter is not given, the function defaults to `302`.
    
    
    
    
    @throw HttpException


    > **@notes**:
    > 
    > - When supplying a status, it must be a 30x

    - **@params**:
      - _string_ **location**
      - _string?_ **status**

    {.params}


  .content\_type(_mimetype_) {#http_curl.HttpResponse.content_type}

  : Sets the content type of the HTTP response.


    - **@params**:
      - _string_ **mimetype**

    {.params}




