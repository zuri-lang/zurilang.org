# http
The `http` module provides a rich library to help in building HTTP 
clients and servers. The module also provides a few generic abstractions 
for simple HTTP operations such as a GET request and supports basic
routing.

### Examples

The example below shows making a GET request to fetch a webpage.

```blade
import http

echo http.get('http://example.com')
# <class HttpResponse instance at 0x600002adacd0>
```

There is a `post()` and `put()` alternative to the `get()` method called 
above and they are documented below.

For a more controlled HTTP request, you should use the HttpClient class. 
Below is an example of such implementation that sets the timeout for 
receiving response back from the server to 30 seconds.

```blade
import http

var client = http.HttpClient()
client.receive_timeout = 30000 # Optional
var res = client.send_request('http://example.com/endpoint?query=1', 'GET')
echo res.body.to_string()
```

Creating a server with the `http` module is also a breeze. 
The example below shows an implementation of an HTTP API server listening on port 
3000 and simple returns the JSON of the request object itself.

```blade
import http
import json

var server = http.server(3000)
server.handle('GET', '/', @(request, response) {
  response.json(request)
})
server.listen()
```

Not only is it super simple to create an HTTP server, it is also very easy to create 
a TLS/HTTPS server with few modifications.

The following code creates a TLS version of the same server we created above.

```blade
import http
import json

var server = http.tls_server(3000)
if server.load_certs('/path/to/tlscert.crt', '/path/to/tlskey.key') {
  server.handle('GET', '/', @(request, response) {
    response.json(request)
  })
  server.listen()
}
```

To create a TLS server, we use the `tls_server()` alternative to the `server()` function 
and load our certificates before we start to listen for incoming connections. It's that 
simple.

---

The `http` module client does make some basic assumption as to the type of data to be 
sent in request bodies and for this reason, it will (unless asked not to) automatically 
convert dictionaries into JSON objects and create multipart/form-data request for you.

Natively, the `http` module will automatically encode and decode requests with the 
following content types:

- multipart/form-data
- application/x-www-form-urlencoded
- application/json

In the absence of any content-type in the request header or response header from a
server as the case may be, the module defaults to the `application/x-www-form-urlencoded` 
content type.

That been said, it gives the tools required to craft any request body of your choice.

## Fields

_http_.**CONTINUE** &#x279D; _readonly_ _int_ {#http.CONTINUE}
: 100 continue.

_http_.**SWITCHING\_PROTOCOLS** &#x279D; _readonly_ _int_ {#http.SWITCHING_PROTOCOLS}
: 101 switching protocols.

_http_.**PROCESSING** &#x279D; _readonly_ _int_ {#http.PROCESSING}
: 102 processing.

_http_.**OK** &#x279D; _readonly_ _int_ {#http.OK}
: 200 ok.

_http_.**CREATED** &#x279D; _readonly_ _int_ {#http.CREATED}
: 201 created.

_http_.**ACCEPTED** &#x279D; _readonly_ _int_ {#http.ACCEPTED}
: 202 accepted.

_http_.**NON\_AUTHORITATIVE\_INFORMATION** &#x279D; _readonly_ _int_ {#http.NON_AUTHORITATIVE_INFORMATION}
: 203 non authoritative information.

_http_.**NO\_CONTENT** &#x279D; _readonly_ _int_ {#http.NO_CONTENT}
: 204 no content.

_http_.**RESET\_CONTENT** &#x279D; _readonly_ _int_ {#http.RESET_CONTENT}
: 205 reset content.

_http_.**PARTIAL\_CONTENT** &#x279D; _readonly_ _int_ {#http.PARTIAL_CONTENT}
: 206 partial content.

_http_.**MULTI\_STATUS** &#x279D; _readonly_ _int_ {#http.MULTI_STATUS}
: 207 multi status.

_http_.**ALREADY\_REPORTED** &#x279D; _readonly_ _int_ {#http.ALREADY_REPORTED}
: 208 already reported.

_http_.**IM\_USED** &#x279D; _readonly_ _int_ {#http.IM_USED}
: 226 im used.

_http_.**MULTIPLE\_CHOICES** &#x279D; _readonly_ _int_ {#http.MULTIPLE_CHOICES}
: 300 multiple choices.

_http_.**MOVED\_PERMANENTLY** &#x279D; _readonly_ _int_ {#http.MOVED_PERMANENTLY}
: 301 moved permanently.

_http_.**FOUND** &#x279D; _readonly_ _int_ {#http.FOUND}
: 302 found.

_http_.**SEE\_OTHER** &#x279D; _readonly_ _int_ {#http.SEE_OTHER}
: 303 see other.

_http_.**NOT\_MODIFIED** &#x279D; _readonly_ _int_ {#http.NOT_MODIFIED}
: 304 not modified.

_http_.**USE\_PROXY** &#x279D; _readonly_ _int_ {#http.USE_PROXY}
: 305 use proxy.

_http_.**TEMPORARY\_REDIRECT** &#x279D; _readonly_ _int_ {#http.TEMPORARY_REDIRECT}
: 307 temporary redirect.

_http_.**PERMANENT\_REDIRECT** &#x279D; _readonly_ _int_ {#http.PERMANENT_REDIRECT}
: 308 permanent redirect.

_http_.**BAD\_REQUEST** &#x279D; _readonly_ _int_ {#http.BAD_REQUEST}
: 400 bad request.

_http_.**UNAUTHORIZED** &#x279D; _readonly_ _int_ {#http.UNAUTHORIZED}
: 401 unauthorized.

_http_.**PAYMENT\_REQUIRED** &#x279D; _readonly_ _int_ {#http.PAYMENT_REQUIRED}
: 402 payment required.

_http_.**FORBIDDEN** &#x279D; _readonly_ _int_ {#http.FORBIDDEN}
: 403 forbidden.

_http_.**NOT\_FOUND** &#x279D; _readonly_ _int_ {#http.NOT_FOUND}
: 404 not found.

_http_.**METHOD\_NOT\_ALLOWED** &#x279D; _readonly_ _int_ {#http.METHOD_NOT_ALLOWED}
: 405 method not allowed.

_http_.**NOT\_ACCEPTABLE** &#x279D; _readonly_ _int_ {#http.NOT_ACCEPTABLE}
: 406 not acceptable.

_http_.**PROXY\_AUTHENTICATION\_REQUIRED** &#x279D; _readonly_ _int_ {#http.PROXY_AUTHENTICATION_REQUIRED}
: 407 proxy authentication required.

_http_.**REQUEST\_TIMEOUT** &#x279D; _readonly_ _int_ {#http.REQUEST_TIMEOUT}
: 408 request timeout.

_http_.**CONFLICT** &#x279D; _readonly_ _int_ {#http.CONFLICT}
: 409 conflict.

_http_.**GONE** &#x279D; _readonly_ _int_ {#http.GONE}
: 410 gone.

_http_.**LENGTH\_REQUIRED** &#x279D; _readonly_ _int_ {#http.LENGTH_REQUIRED}
: 411 length required.

_http_.**PRECONDITION\_FAILED** &#x279D; _readonly_ _int_ {#http.PRECONDITION_FAILED}
: 412 precondition failed.

_http_.**PAYLOAD\_TOO\_LARGE** &#x279D; _readonly_ _int_ {#http.PAYLOAD_TOO_LARGE}
: 413 payload too large.

_http_.**REQUEST\_URI\_TOO\_LONG** &#x279D; _readonly_ _int_ {#http.REQUEST_URI_TOO_LONG}
: 414 request uri too long.

_http_.**UNSUPPORTED\_MEDIA\_TYPE** &#x279D; _readonly_ _int_ {#http.UNSUPPORTED_MEDIA_TYPE}
: 415 unsupported media type.

_http_.**REQUESTED\_RANGE\_NOT\_SATISFIABLE** &#x279D; _readonly_ _int_ {#http.REQUESTED_RANGE_NOT_SATISFIABLE}
: 416 requested range not satisfiable.

_http_.**EXPECTATION\_FAILED** &#x279D; _readonly_ _int_ {#http.EXPECTATION_FAILED}
: 417 expectation failed.

_http_.**TEAPOT** &#x279D; _readonly_ _int_ {#http.TEAPOT}
: 418 teapot.

_http_.**MISDIRECTED\_REQUEST** &#x279D; _readonly_ _int_ {#http.MISDIRECTED_REQUEST}
: 421 misdirected request.

_http_.**UNPROCESSABLE\_ENTITY** &#x279D; _readonly_ _int_ {#http.UNPROCESSABLE_ENTITY}
: 422 unprocessable entity.

_http_.**LOCKED** &#x279D; _readonly_ _int_ {#http.LOCKED}
: 423 locked.

_http_.**FAILED\_DEPENDENCY** &#x279D; _readonly_ _int_ {#http.FAILED_DEPENDENCY}
: 424 failed dependency.

_http_.**UPGRADE\_REQUIRED** &#x279D; _readonly_ _int_ {#http.UPGRADE_REQUIRED}
: 426 upgrade required.

_http_.**PRECONDITION\_REQUIRED** &#x279D; _readonly_ _int_ {#http.PRECONDITION_REQUIRED}
: 428 precondition required.

_http_.**TOO\_MANY\_REQUESTS** &#x279D; _readonly_ _int_ {#http.TOO_MANY_REQUESTS}
: 429 too many requests.

_http_.**REQUEST\_HEADER\_FIELDS\_TOO\_LARGE** &#x279D; _readonly_ _int_ {#http.REQUEST_HEADER_FIELDS_TOO_LARGE}
: 431 request header fields too large.

_http_.**CONNECTION\_CLOSED\_WITHOUT\_RESPONSE** &#x279D; _readonly_ _int_ {#http.CONNECTION_CLOSED_WITHOUT_RESPONSE}
: 444 connection closed without response.

_http_.**UNAVAILABLE\_FOR\_LEGAL\_REASONS** &#x279D; _readonly_ _int_ {#http.UNAVAILABLE_FOR_LEGAL_REASONS}
: 451 unavailable for legal reasons.

_http_.**CLIENT\_CLOSED\_REQUEST** &#x279D; _readonly_ _int_ {#http.CLIENT_CLOSED_REQUEST}
: 499 client closed request.

_http_.**INTERNAL\_SERVER\_ERROR** &#x279D; _readonly_ _int_ {#http.INTERNAL_SERVER_ERROR}
: 500 internal server error.

_http_.**NOT\_IMPLEMENTED** &#x279D; _readonly_ _int_ {#http.NOT_IMPLEMENTED}
: 501 not implemented.

_http_.**BAD\_GATEWAY** &#x279D; _readonly_ _int_ {#http.BAD_GATEWAY}
: 502 bad gateway.

_http_.**SERVICE\_UNAVAILABLE** &#x279D; _readonly_ _int_ {#http.SERVICE_UNAVAILABLE}
: 503 service unavailable.

_http_.**GATEWAY\_TIMEOUT** &#x279D; _readonly_ _int_ {#http.GATEWAY_TIMEOUT}
: 504 gateway timeout.

_http_.**HTTP\_VERSION\_NOT\_SUPPORTED** &#x279D; _readonly_ _int_ {#http.HTTP_VERSION_NOT_SUPPORTED}
: 505 http version not supported.

_http_.**VARIANT\_ALSO\_NEGOTIATES** &#x279D; _readonly_ _int_ {#http.VARIANT_ALSO_NEGOTIATES}
: 506 variant also negotiates.

_http_.**INSUFFICIENT\_STORAGE** &#x279D; _readonly_ _int_ {#http.INSUFFICIENT_STORAGE}
: 507 insufficient storage.

_http_.**LOOP\_DETECTED** &#x279D; _readonly_ _int_ {#http.LOOP_DETECTED}
: 508 loop detected.

_http_.**NOT\_EXTENDED** &#x279D; _readonly_ _int_ {#http.NOT_EXTENDED}
: 510 not extended.

_http_.**NETWORK\_AUTHENTICATION\_REQUIRED** &#x279D; _readonly_ _int_ {#http.NETWORK_AUTHENTICATION_REQUIRED}
: 511 network authentication required.

_http_.**NETWORK\_CONNECT\_TIMEOUT\_ERROR** &#x279D; _readonly_ _int_ {#http.NETWORK_CONNECT_TIMEOUT_ERROR}
: 599 network connect timeout error.

_http_.**map** &#x279D; _readonly_ _dictionary_ {#http.map}
: A map of status code to their string representation..


## Functions

_http_.set\_headers(_headers_) {#http.set_headers}

: Sets the default request headers for the current module instance.
   
  This function returns HttpClient in order to allow for idiomatic 
  chaining such as:
  
  ```blade
  import http
  echo http.set_headers({
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



_http_.get(_url_, _headers_) {#http.get}

: Sends an Http GET request and returns an HttpResponse
  or throws one of SocketException or Exception if it fails.


  - **@params**:
    - _string_ **url**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_.post(_url_, _data_, _headers_) {#http.post}

: Sends an Http POST request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _string|bytes|nil_ **data**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_.put(_url_, _data_, _headers_) {#http.put}

: Sends an Http PUT request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _string|bytes|nil_ **data**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_.patch(_url_, _data_, _headers_) {#http.patch}

: Sends an Http PATCH request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _string|bytes|nil_ **data**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_.delete(_url_, _headers_) {#http.delete}

: Sends an Http DELETE request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_.options(_url_, _headers_) {#http.options}

: Sends an Http OPTIONS request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_.trace(_url_, _headers_) {#http.trace}

: Sends an Http TRACE request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_.head(_url_, _headers_) {#http.head}

: Sends an Http HEAD request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  {.returns}
  - **@raises**:
    - Exception
    - SocketException
    - HttpException
  {.raises}



_http_.client() {#http.client}

: Returns the default shared client.


  - **@returns**: _HttpClient_
  {.returns}



_http_.server(_port_, _address_) {#http.server}

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



_http_.tls\_server(_port_, _host_) {#http.tls_server}

: Creates an new TLSServer instance.
  
  
  
  @throws Exception, SocketException, HttpException


  - **@params**:
    - _int_ **port**
    - _string?_ **host**

  {.params}
  - **@returns**: _TLSServer_
  {.returns}



## Classes

_class_ **HttpRequest** {#http.HttpRequest .class}

: Http request handler and object.


    __@printable__, __@serializable__
    {.class-props}

  **.request\_uri** &#x279D; _string_ {#http.HttpRequest.request_uri}
  : The original request URL as sent in the raw request.

  **.path** &#x279D; _string_ {#http.HttpRequest.path}
  : The requested path or file. E.g. if the Request URI is `/users?sort=desc`, 
    then the path is `/users`.

  **.method** &#x279D; _string_ {#http.HttpRequest.method}
  : The HTTP method of the request: GET (the default), POST, PUT, etc.

  **.host** &#x279D; _string_ {#http.HttpRequest.host}
  : The hostname derived from the `Host` header or the first instance of 
    `X-Forwarded-Host` if set.

  **.ip** &#x279D; _string_ {#http.HttpRequest.ip}
  : The IP address of the remote client that initiated the request.

  **.ipv6** &#x279D; _string_ {#http.HttpRequest.ipv6}
  : The IPv6 address of the remote client that initiated the request.

  **.headers** &#x279D; _dictionary_ {#http.HttpRequest.headers}
  : A dictionary containing the headers sent with the request.

  **.queries** &#x279D; _dictionary_ {#http.HttpRequest.queries}
  : A dictionary containing the entries of the URI query string.

  **.cookies** &#x279D; _{list|dictionary_ {#http.HttpRequest.cookies}
  : A list or dictionary containing the cookies sent with the request.

  **.body** &#x279D; _dictionary_ {#http.HttpRequest.body}
  : A dictionary containing all data submitted in the request body.

  **.files** &#x279D; _dictionary_ {#http.HttpRequest.files}
  : A dictionary containing the data of all files uploaded in the request.

  **.http\_version** &#x279D; _string_ {#http.HttpRequest.http_version}
  : The HTTP version used for the request.


  .parse(_raw_data_, _client_) {#http.HttpRequest.parse}

  : Parses a raw HTTP request string into a correct HttpRequest.


    - **@params**:
      - _string_ **raw_data**
      - _Socket|TLSSocket|nil_ **client**

    {.params}
    - **@returns**: _boolean_
    {.returns}


  .send(_uri_, _method_, _data_, _headers_, _options_) {#http.HttpRequest.send}

  : Send HTTP requests to the given uri for the given method 
    and data (if given).


    - **@params**:
      - _url_ **uri**
      - _string_ **method**
      - _string|bytes|dict|nil_ **data**
      - _dict?_ **headers**
      - _dict?_ **options**

    {.params}


  .to\_string() {#http.HttpRequest.to_string}

  : Returns the request as a string.




  .to\_json() {#http.HttpRequest.to_json}

  : Returns the request as a JSON object.






_class_ **HttpException** < _Exception_ {#http.HttpException .class}

: HTTP related Exceptions.


    __@printable__
    {.class-props}



_class_ **HttpServer** {#http.HttpServer .class}

: HTTP server.


    __@printable__
    {.class-props}

  **.host** &#x279D; _string_ {#http.HttpServer.host}
  : The host address to which this server will be bound. Default value is 
    socket.IP_LOCAL (127.0.0.1)

  **.port** &#x279D; _number_ {#http.HttpServer.port}
  : The port to which this server will be bound to on the host.

  **.socket** &#x279D; _[socket.Socket](/standard/socket#socket.Socket)_ {#http.HttpServer.socket}
  : The working Socket instance for the HttpServer.

  **.reuse\_address** &#x279D; _bool_ {#http.HttpServer.reuse_address}
  : A boolean value indicating whether to reuse socket addresses or not.
    Default value is `true`.

  **.read\_timeout** &#x279D; _number_ {#http.HttpServer.read_timeout}
  : The timeout in milliseconds after which an attempt to read clients 
    request data will be terminated. Default value is 2,000 (2 seconds).

  **.write\_timeout** &#x279D; _number_ {#http.HttpServer.write_timeout}
  : The timeout in milliseconds after which an attempt to write response data to 
    clients will be terminated. 
    
    If we cannot send response to a client after the stipulated time, it will be 
    assumed such clients have disconnected and existing connections for that 
    client will be closed and their respective sockets will be discarded. Default 
    value is 2,000 (2 seconds).


  .HttpServer(_port_, _host_) &#x279D; _Constructor_ {#http.HttpServer.HttpServer}

  : http.HttpServer constructor


    - **@params**:
      - _int_ **port**
      - _string?_ **host**

    {.params}


  .close() {#http.HttpServer.close}

  : Stops the server.




  .on\_connect(_function_) {#http.HttpServer.on_connect}

  : Adds a function to be called when a new client connects.


    > **@notes**:
    > 
    > - Function _function_ MUST accept at one parameter which will be passed the client Socket object.

    > - Multiple `on_connect()` may be set on a single instance.

    - **@params**:
      - _function(1)_ **function**

    {.params}


  .on\_disconnect(_function_) {#http.HttpServer.on_disconnect}

  : Adds a function to be called when a new client disconnects.


    > **@notes**:
    > 
    > - Function _function_ MUST accept at one parameter which will be passed the client.

    > - Multiple `on_disconnect()` may be set on a single instance.

    - **@params**:
      - _function(1)_ **function**

    {.params}


  .on\_receive(_handler_) {#http.HttpServer.on_receive}

  : Adds a function to be called when the server receives a message from a client.
    
    > Function _fn_ MUST accept TWO parameters. First parameter will accept the HttpRequest 
    > object and the second will accept the HttpResponse object.


    > **@notes**:
    > 
    > - Multiple `on_receive()` may be set on a single instance.

    - **@params**:
      - _function(2)_ **handler**

    {.params}


  .on\_reply(_function_) {#http.HttpServer.on_reply}

  : Adds a function to be called when the server sends a reply to a client.
    
    > Function _function_ MUST accept one parameter which will be passed the HttpResponse object.


    > **@notes**:
    > 
    > - Multiple `on_sent()` may be set on a single instance.

    - **@params**:
      - _function(1)_ **function**

    {.params}


  .on\_error(_function_) {#http.HttpServer.on_error}

  : Adds a function to be called when the server encounters an error with a client.
    
    > Function _function_ MUST accept two parameters. The first argument will be passed the 
    > `Exception` object and the second will be passed the client `Socket` object.


    > **@notes**:
    > 
    > - Multiple `on_error()` may be set on a single instance.

    - **@params**:
      - _function(2)_ **function**

    {.params}


  .handle(_method_, _path_, _handler_) {#http.HttpServer.handle}

  : Sets up a request handler that will be called when a request with the given method 
    has a path that matches the one specified.
    
    If the path ends with a `/`, it also matches all routes that starts with the path 
    so long as there is no other path that matches the request better. The exception 
    to this is when the path is an ordinary `/` (root path) in which case it won't 
    match any other route except for the root path.
    
    For example, if the path is declared as `/user/`, it will match the request for 
    `/user/record/1` unless another handle has been registered for `/user/record` in 
    which case the handle for `/user/record` will handle the request since it is the 
    handler for the closest path.


    - **@params**:
      - _string_ **method**
      - _string_ **path**
      - _function(2)_ **handler**

    {.params}


  .none\_handler(_handler_) {#http.HttpServer.none_handler}

  : Sets up the handle to invoke when a request is not processed. That is, when it does 
    not match a registered route and no `on_receive()` handler is set.


    - **@params**:
      - _function(2)_ **handler**

    {.params}


  .serve\_files(_base_path_, _directory_, _cache_age_, _tag_) {#http.HttpServer.serve_files}

  : Setup the given base_path to serve static files from the given directory.
    If cache is set to true, and a default value is not set for tag, static
    file tagging will be automatically enabled.


    - **@params**:
      - _string_ **base_path**
      - _string_ **directory**
      - _number?_ **cache_age** = 0

      - _bool?_ **tag** = false


    {.params}


  .listen() {#http.HttpServer.listen}

  : Binds to the instance port and host and starts listening for incoming 
    connection from HTTP clients.






_class_ **TLSServer** < _HttpServer_ {#http.TLSServer .class}

: TLS server


    __@printable__
    {.class-props}

  **.cert\_file** &#x279D; _string_ {#http.TLSServer.cert_file}
  : The SSL/TLS certificate file that will be used be used by a secured server for
    serving requests.

  **.private\_key\_file** &#x279D; _string_ {#http.TLSServer.private_key_file}
  : The SSL/TLS private key file that will be used be used by a secured server for 
    serving requests.

  **.verify\_certs** &#x279D; _boolean_ {#http.TLSServer.verify_certs}
  : This value controls whether the client certificate should be verified 
    or not.


  .TLSServer(_port_, _host_) &#x279D; _Constructor_ {#http.TLSServer.TLSServer}

  : http.TLSServer constructor


    - **@params**:
      - _int_ **port**
      - _string?_ **host**

    {.params}


  .load\_certs(_cert_file_, _private_key_file_) {#http.TLSServer.load_certs}

  : Loads the given SSL/TLS certificate pairs for the given SSL/TLS context.


    - **@params**:
      - _string|file_ **cert_file**
      - _string|file|nil_ **private_key_file**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .listen() {#http.TLSServer.listen}

  : Binds to the instance port and host and starts listening for incoming 
    connection from HTTPS clients.






_class_ **HttpClient** {#http.HttpClient .class}

: Handles http requests.
  
  @note This client do not currently support the compress, deflate and gzip transfer encoding.


  **.user\_agent** &#x279D; _string_ {#http.HttpClient.user_agent}
  : The user agent of the client used to make the request. 
    Default value &mdash; `Blade HTTP Client/1.0`.

  **.follow\_redirect** &#x279D; _bool_ {#http.HttpClient.follow_redirect}
  : Indicates if we receive a redirect from a server, this flag tells us whether 
    we should follow it or not. Default value is `true`.

  **.verify\_hostname** &#x279D; _bool_ {#http.HttpClient.verify_hostname}
  : Indicates if the site you're connecting to uses a different host name that what
    they have mentioned in their server certificate's commonName (or subjectAltName) 
    fields, connection will fail. You can skip this check by setting to true, but this 
    will make the connection less secure.

  **.verify\_peer** &#x279D; _bool_ {#http.HttpClient.verify_peer}
  : Indicates if you want to connect to a site who isn't using a certificate that is
    signed by one of the certs in the CA bundle you have, you can skip the verification 
    of the server's certificate. This makes the connection A LOT LESS SECURE.

  **.referer** &#x279D; _string_ {#http.HttpClient.referer}
  : The site that refers us to the current site

  **.ca\_cert** &#x279D; _string_ {#http.HttpClient.ca_cert}
  : If you have a CA cert for the server stored someplace else than in the default bundle.

  **.connect\_timeout** &#x279D; _number_ {#http.HttpClient.connect_timeout}
  : The connect timeout duration in milliseconds. Default value is 60,000 (1 minute).

  **.receive\_timeout** &#x279D; _number_ {#http.HttpClient.receive_timeout}
  : The receive timeout duration in milliseconds. Default value is 2,000 (2 seconds).

  **.headers** &#x279D; _dict_ {#http.HttpClient.headers}
  : A dictionary of headers sent along with the request.

  **.no\_expect** &#x279D; _bool_ {#http.HttpClient.no_expect}
  : Indicates whether to remove the expect header or not only applies to requests with 
    files in the body


  .HttpClient(_base_url_) &#x279D; _Constructor_ {#http.HttpClient.HttpClient}

  : If the _base_url_ param is set, all calls to HTTP method functions will automatically
    prepend requested url with the base url if they do not start with the base url.


    - **@params**:
      - _string?_ **base_url** The base url for the HTTP client requests


    {.params}


  .send\_request(_uri_, _method_, _data_, _headers_, _options_) {#http.HttpClient.send_request}

  : Sends an Http request and returns a HttpResponse.
    
    
    
    
    
       This can be very useful if you want to reuse the same 
       instance for multiple requests and headers scenarios.


    - **@params**:
      - _string_ **uri**
      - _string?_ **method** Default value is `GET`.

      - _string|dict|nil_ **data**
      - _dict?_ **headers** To override the instance options.

      - _dict?_ **client** request options


    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - SocketException
      - Exception
    {.raises}


  .get(_url_, _headers_) {#http.HttpClient.get}

  : Sends an Http GET request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}


  .post(_url_, _data_, _headers_) {#http.HttpClient.post}

  : Sends an Http POST request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _string|bytes|nil_ **data**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}


  .put(_url_, _data_, _headers_) {#http.HttpClient.put}

  : Sends an Http PUT request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _string|bytes|nil_ **data**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}


  .patch(_url_, _data_, _headers_) {#http.HttpClient.patch}

  : Sends an Http PATCH request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _string|bytes|nil_ **data**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}


  .delete(_url_, _headers_) {#http.HttpClient.delete}

  : Sends an Http DELETE request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}


  .options(_url_, _headers_) {#http.HttpClient.options}

  : Sends an Http OPTIONS request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}


  .trace(_url_, _headers_) {#http.HttpClient.trace}

  : Sends an Http TRACE request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}


  .head(_url_, _headers_) {#http.HttpClient.head}

  : Sends an Http HEAD request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    {.returns}
    - **@raises**:
      - Exception
      - SocketException
      - HttpException
    {.raises}




_class_ **HttpResponse** {#http.HttpResponse .class}

: Represents the response to an Http request.


    __@printable__, __@serializable__
    {.class-props}

  **.version** &#x279D; _string_ {#http.HttpResponse.version}
  : The HTTP version of the response

  **.status** &#x279D; _number_ {#http.HttpResponse.status}
  : The HTTP response status code

  **.headers** &#x279D; _dictionary_ {#http.HttpResponse.headers}
  : The HTTP response headers

  **.time\_taken** &#x279D; _number_ {#http.HttpResponse.time_taken}
  : Total time taken for the HTTP request that generated this HttpResponse to complete

  **.redirects** &#x279D; _number_ {#http.HttpResponse.redirects}
  : The number of times the HTTP request that generated this HttpResponse was redirected.

  **.responder** &#x279D; _string_ {#http.HttpResponse.responder}
  : The final URL that provided the HttpResponse. This will sometimes 
    differ from the original request URI.

  **.body** &#x279D; _bytes_ {#http.HttpResponse.body}
  : The content of the HTTP response as bytes

  **.cookies** &#x279D; _list_ {#http.HttpResponse.cookies}
  : The cookies to be sent back to the client

  **.certificate** &#x279D; _dict|nil_ {#http.HttpResponse.certificate}
  : The SSL certificate for the secure connection. This is only available 
    when visiting HTTPS/SSL/TLS secured websites.


  .HttpResponse(_body_, _status_, _headers_, _cookies_, _version_, _time_taken_, _redirects_, _responder_) &#x279D; _Constructor_ {#http.HttpResponse.HttpResponse}

  : http.HttpResponse constructor


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


  .write(_data_) {#http.HttpResponse.write}

  : Writes data to the response stream. 
    
    > This method should be preferred over writing directly to the body
    > property to prevent unexpected behaviors.


    - **@params**:
      - _string|bytes_ **data**

    {.params}


  .json(_data_, _status_code_) {#http.HttpResponse.json}

  : Writes a json encoded data to the response stream and sets the response 
    `Content-Type` to `application/json`. If the status code is given, the
    response will be sent with the given status code.


    - **@params**:
      - _any_ **data**
      - _number?_ **status_code**

    {.params}


  .file(_path_, _status_code_) {#http.HttpResponse.file}

  : Writes a file into the response stream and sets the `Content-Type` to the 
    correct mimetype for the file. If the status code is given, the
    response will be sent with the given status code.


    - **@params**:
      - _string_ **path**
      - _number?_ **status_code**

    {.params}


  .set\_cookie(_key_, _value_, _domain_, _path_, _expires_, _secure_, _extras_) {#http.HttpResponse.set_cookie}

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


  .redirect(_location_, _status_) {#http.HttpResponse.redirect}

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


  .render(_path_, _variables_) {#http.HttpResponse.render}

  : A shorthand method that renders a template using  Blade's template
    module default settings.
    Follow the [template module documentation](https://bladelang.org/standard/template)
    to know more about setting up your project to render from templates.
    >*NOTE**
     >
    > The default template root directory is a directory called
    > "templates" in the current working directory. To use render, ensure
    > that the directory exists as the template instance used for `render()`
    > does not have the `auto_init` parameter set to true. This is intentional
    > to discourage misuse and/or unintended behaviors.
    Support for template rendering in HttpResponse class is lazy loaded and
    will not be enabled until the first attempt to render a template. This
    helps reduce the overhead for use cases where rending is never needed.


    - **@params**:
      - _string_ **path**
      - _dict?_ **variables**

    {.params}


  .content\_type(_mimetype_) {#http.HttpResponse.content_type}

  : Sets the content type of the HTTP response.


    - **@params**:
      - _string_ **mimetype**

    {.params}


  .to\_string() {#http.HttpResponse.to_string}

  : Returns the response details in a string




  .as\_text() {#http.HttpResponse.as_text}

  : Returns the body of an HTTP response as a string or an empty
    string if the response is empty.


    - **@returns**: _string_
    {.returns}


  .as\_dict() {#http.HttpResponse.as_dict}

  : Returns the body of an HTTP response as a dictionary.
    >*NOTE:**
     >
    > Call this method only if you're certain that the response
    > is a JSON response or have set the header `Accepts` and/or
    > `Content-Type` to accept only `application/json` responses
    > only because the method will raise and Exception if the
    > response does not contain a valid JSON in the body.


    - **@returns**: _string_
    {.returns}
    - **@raises**:
      - Exception
    {.raises}


  .to\_json() {#http.HttpResponse.to_json}

  : Returns the response as a JSON object






