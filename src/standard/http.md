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

**CONTINUE** &#8674; _readonly_ _int_
:  100 continue.

**SWITCHING\_PROTOCOLS** &#8674; _readonly_ _int_
:  101 switching protocols.

**PROCESSING** &#8674; _readonly_ _int_
:  102 processing.

**OK** &#8674; _readonly_ _int_
:  200 ok.

**CREATED** &#8674; _readonly_ _int_
:  201 created.

**ACCEPTED** &#8674; _readonly_ _int_
:  202 accepted.

**NON\_AUTHORITATIVE\_INFORMATION** &#8674; _readonly_ _int_
:  203 non authoritative information.

**NO\_CONTENT** &#8674; _readonly_ _int_
:  204 no content.

**RESET\_CONTENT** &#8674; _readonly_ _int_
:  205 reset content.

**PARTIAL\_CONTENT** &#8674; _readonly_ _int_
:  206 partial content.

**MULTI\_STATUS** &#8674; _readonly_ _int_
:  207 multi status.

**ALREADY\_REPORTED** &#8674; _readonly_ _int_
:  208 already reported.

**IM\_USED** &#8674; _readonly_ _int_
:  226 im used.

**MULTIPLE\_CHOICES** &#8674; _readonly_ _int_
:  300 multiple choices.

**MOVED\_PERMANENTLY** &#8674; _readonly_ _int_
:  301 moved permanently.

**FOUND** &#8674; _readonly_ _int_
:  302 found.

**SEE\_OTHER** &#8674; _readonly_ _int_
:  303 see other.

**NOT\_MODIFIED** &#8674; _readonly_ _int_
:  304 not modified.

**USE\_PROXY** &#8674; _readonly_ _int_
:  305 use proxy.

**TEMPORARY\_REDIRECT** &#8674; _readonly_ _int_
:  307 temporary redirect.

**PERMANENT\_REDIRECT** &#8674; _readonly_ _int_
:  308 permanent redirect.

**BAD\_REQUEST** &#8674; _readonly_ _int_
:  400 bad request.

**UNAUTHORIZED** &#8674; _readonly_ _int_
:  401 unauthorized.

**PAYMENT\_REQUIRED** &#8674; _readonly_ _int_
:  402 payment required.

**FORBIDDEN** &#8674; _readonly_ _int_
:  403 forbidden.

**NOT\_FOUND** &#8674; _readonly_ _int_
:  404 not found.

**METHOD\_NOT\_ALLOWED** &#8674; _readonly_ _int_
:  405 method not allowed.

**NOT\_ACCEPTABLE** &#8674; _readonly_ _int_
:  406 not acceptable.

**PROXY\_AUTHENTICATION\_REQUIRED** &#8674; _readonly_ _int_
:  407 proxy authentication required.

**REQUEST\_TIMEOUT** &#8674; _readonly_ _int_
:  408 request timeout.

**CONFLICT** &#8674; _readonly_ _int_
:  409 conflict.

**GONE** &#8674; _readonly_ _int_
:  410 gone.

**LENGTH\_REQUIRED** &#8674; _readonly_ _int_
:  411 length required.

**PRECONDITION\_FAILED** &#8674; _readonly_ _int_
:  412 precondition failed.

**PAYLOAD\_TOO\_LARGE** &#8674; _readonly_ _int_
:  413 payload too large.

**REQUEST\_URI\_TOO\_LONG** &#8674; _readonly_ _int_
:  414 request uri too long.

**UNSUPPORTED\_MEDIA\_TYPE** &#8674; _readonly_ _int_
:  415 unsupported media type.

**REQUESTED\_RANGE\_NOT\_SATISFIABLE** &#8674; _readonly_ _int_
:  416 requested range not satisfiable.

**EXPECTATION\_FAILED** &#8674; _readonly_ _int_
:  417 expectation failed.

**TEAPOT** &#8674; _readonly_ _int_
:  418 teapot.

**MISDIRECTED\_REQUEST** &#8674; _readonly_ _int_
:  421 misdirected request.

**UNPROCESSABLE\_ENTITY** &#8674; _readonly_ _int_
:  422 unprocessable entity.

**LOCKED** &#8674; _readonly_ _int_
:  423 locked.

**FAILED\_DEPENDENCY** &#8674; _readonly_ _int_
:  424 failed dependency.

**UPGRADE\_REQUIRED** &#8674; _readonly_ _int_
:  426 upgrade required.

**PRECONDITION\_REQUIRED** &#8674; _readonly_ _int_
:  428 precondition required.

**TOO\_MANY\_REQUESTS** &#8674; _readonly_ _int_
:  429 too many requests.

**REQUEST\_HEADER\_FIELDS\_TOO\_LARGE** &#8674; _readonly_ _int_
:  431 request header fields too large.

**CONNECTION\_CLOSED\_WITHOUT\_RESPONSE** &#8674; _readonly_ _int_
:  444 connection closed without response.

**UNAVAILABLE\_FOR\_LEGAL\_REASONS** &#8674; _readonly_ _int_
:  451 unavailable for legal reasons.

**CLIENT\_CLOSED\_REQUEST** &#8674; _readonly_ _int_
:  499 client closed request.

**INTERNAL\_SERVER\_ERROR** &#8674; _readonly_ _int_
:  500 internal server error.

**NOT\_IMPLEMENTED** &#8674; _readonly_ _int_
:  501 not implemented.

**BAD\_GATEWAY** &#8674; _readonly_ _int_
:  502 bad gateway.

**SERVICE\_UNAVAILABLE** &#8674; _readonly_ _int_
:  503 service unavailable.

**GATEWAY\_TIMEOUT** &#8674; _readonly_ _int_
:  504 gateway timeout.

**HTTP\_VERSION\_NOT\_SUPPORTED** &#8674; _readonly_ _int_
:  505 http version not supported.

**VARIANT\_ALSO\_NEGOTIATES** &#8674; _readonly_ _int_
:  506 variant also negotiates.

**INSUFFICIENT\_STORAGE** &#8674; _readonly_ _int_
:  507 insufficient storage.

**LOOP\_DETECTED** &#8674; _readonly_ _int_
:  508 loop detected.

**NOT\_EXTENDED** &#8674; _readonly_ _int_
:  510 not extended.

**NETWORK\_AUTHENTICATION\_REQUIRED** &#8674; _readonly_ _int_
:  511 network authentication required.

**NETWORK\_CONNECT\_TIMEOUT\_ERROR** &#8674; _readonly_ _int_
:  599 network connect timeout error.

**map** &#8674; _readonly_ _dictionary_
:  A map of status code to their string representation..


## Functions

set\_headers(_headers_) {#http.set_headers}

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



get(_url_, _headers_) {#http.get}

: Sends an Http GET request and returns an HttpResponse
  or throws one of SocketException or Exception if it fails.


  - **@params**:
    - _string_ **url**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  - **@raises**:
    - Exception
@raises



post(_url_, _data_, _headers_) {#http.post}

: Sends an Http POST request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _string|bytes|nil_ **data**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  - **@raises**:
    - Exception
@raises



put(_url_, _data_, _headers_) {#http.put}

: Sends an Http PUT request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _string|bytes|nil_ **data**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  - **@raises**:
    - Exception
@raises



patch(_url_, _data_, _headers_) {#http.patch}

: Sends an Http PATCH request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _string|bytes|nil_ **data**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  - **@raises**:
    - Exception
@raises



delete(_url_, _headers_) {#http.delete}

: Sends an Http DELETE request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  - **@raises**:
    - Exception
@raises



options(_url_, _headers_) {#http.options}

: Sends an Http OPTIONS request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  - **@raises**:
    - Exception
@raises



trace(_url_, _headers_) {#http.trace}

: Sends an Http TRACE request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  - **@raises**:
    - Exception
@raises



head(_url_, _headers_) {#http.head}

: Sends an Http HEAD request and returns an HttpResponse.


  - **@params**:
    - _string_ **url**
    - _dict?_ **headers**

  {.params}
  - **@returns**: _HttpResponse_
  - **@raises**:
    - Exception
@raises



client() {#http.client}

: Returns the default shared client.


  - **@returns**: _HttpClient_



server(_port_, _address_) {#http.server}

: Creates an new HttpServer instance.


  - **@params**:
    - _int_ **port**
    - _string_ **address**

  {.params}
  - **@returns**: _HttpServer_
  - **@raises**:
    - Exception
@raises



tls\_server(_port_, _host_) {#http.tls_server}

: Creates an new TLSServer instance.
  
  
  
  @throws Exception, SocketException, HttpException


  - **@params**:
    - _int_ **port**
    - _string?_ **host**

  {.params}
  - **@returns**: _TLSServer_



## Classes

_class_ **HttpRequest** {#http.HttpRequest .class}

: Http request handler and object.


  ~ Properties

    - __@printable__
    - __@serializable__

  **.request\_uri** &#8674; _string_
  :  The original request URL as sent in the raw request.

  **.path** &#8674; _string_
  :  The requested path or file. E.g. if the Request URI is `/users?sort=desc`, 
    then the path is `/users`.

  **.method** &#8674; _string_
  :  The HTTP method of the request: GET (the default), POST, PUT, etc.

  **.host** &#8674; _string_
  :  The hostname derived from the `Host` header or the first instance of 
    `X-Forwarded-Host` if set.

  **.ip** &#8674; _string_
  :  The IP address of the remote client that initiated the request.

  **.ipv6** &#8674; _string_
  :  The IPv6 address of the remote client that initiated the request.

  **.headers** &#8674; _dictionary_
  :  A dictionary containing the headers sent with the request.

  **.queries** &#8674; _dictionary_
  :  A dictionary containing the entries of the URI query string.

  **.cookies** &#8674; _{list|dictionary_
  :  A list or dictionary containing the cookies sent with the request.

  **.body** &#8674; _dictionary_
  :  A dictionary containing all data submitted in the request body.

  **.files** &#8674; _dictionary_
  :  A dictionary containing the data of all files uploaded in the request.

  **.http\_version** &#8674; _string_
  :  The HTTP version used for the request.


  .parse(_raw_data_, _client_) {#http.HttpRequest.parse}

  : Parses a raw HTTP request string into a correct HttpRequest.


    - **@params**:
      - _string_ **raw_data**
      - _Socket|TLSSocket|nil_ **client**

    {.params}
    - **@returns**: _boolean_


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


  ~ Properties

    - __@printable__



_class_ **HttpServer** {#http.HttpServer .class}

: HTTP server.


  ~ Properties

    - __@printable__

  **.host** &#8674; _string_
  :  The host address to which this server will be bound. Default value is 
    socket.IP_LOCAL (127.0.0.1)

  **.port** &#8674; _number_
  :  The port to which this server will be bound to on the host.

  **.socket** &#8674; _{Socket_
  :  The working Socket instance for the HttpServer.

  **.reuse\_address** &#8674; _bool_
  :  A boolean value indicating whether to reuse socket addresses or not.
    Default value is `true`.

  **.read\_timeout** &#8674; _number_
  :  The timeout in milliseconds after which an attempt to read clients 
    request data will be terminated. Default value is 2,000 (2 seconds).

  **.write\_timeout** &#8674; _number_
  :  The timeout in milliseconds after which an attempt to write response data to 
    clients will be terminated. 
    
    If we cannot send response to a client after the stipulated time, it will be 
    assumed such clients have disconnected and existing connections for that 
    client will be closed and their respective sockets will be discarded. Default 
    value is 2,000 (2 seconds).


  .HttpServer(_port_, _host_) &#8674; Constructor {#http.HttpServer.HttpServer}

  : - **@params**:
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


  ~ Properties

    - __@printable__

  **.cert\_file** &#8674; _string_
  :  The SSL/TLS certificate file that will be used be used by a secured server for
    serving requests.

  **.private\_key\_file** &#8674; _string_
  :  The SSL/TLS private key file that will be used be used by a secured server for 
    serving requests.

  **.verify\_certs** &#8674; _boolean_
  :  This value controls whether the client certificate should be verified 
    or not.


  .TLSServer(_port_, _host_) &#8674; Constructor {#http.TLSServer.TLSServer}

  : - **@params**:
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


  .listen() {#http.TLSServer.listen}

  : Binds to the instance port and host and starts listening for incoming 
    connection from HTTPS clients.






_class_ **HttpClient** {#http.HttpClient .class}

: Handles http requests.
  
  @note This client do not currently support the compress, deflate and gzip transfer encoding.


  **.user\_agent** &#8674; _string_
  :  The user agent of the client used to make the request. 
    Default value &mdash; `Blade HTTP Client/1.0`.

  **.follow\_redirect** &#8674; _bool_
  :  Indicates if we receive a redirect from a server, this flag tells us whether 
    we should follow it or not. Default value is `true`.

  **.verify\_hostname** &#8674; _bool_
  :  Indicates if the site you're connecting to uses a different host name that what
    they have mentioned in their server certificate's commonName (or subjectAltName) 
    fields, connection will fail. You can skip this check by setting to true, but this 
    will make the connection less secure.

  **.verify\_peer** &#8674; _bool_
  :  Indicates if you want to connect to a site who isn't using a certificate that is
    signed by one of the certs in the CA bundle you have, you can skip the verification 
    of the server's certificate. This makes the connection A LOT LESS SECURE.

  **.referer** &#8674; _string_
  :  The site that refers us to the current site

  **.ca\_cert** &#8674; _string_
  :  If you have a CA cert for the server stored someplace else than in the default bundle.

  **.connect\_timeout** &#8674; _number_
  :  The connect timeout duration in milliseconds. Default value is 60,000 (1 minute).

  **.receive\_timeout** &#8674; _number_
  :  The receive timeout duration in milliseconds. Default value is 2,000 (2 seconds).

  **.headers** &#8674; _dict_
  :  A dictionary of headers sent along with the request.

  **.no\_expect** &#8674; _bool_
  :  Indicates whether to remove the expect header or not only applies to requests with 
    files in the body


  .HttpClient(_base_url_) &#8674; Constructor {#http.HttpClient.HttpClient}

  : If the _base_url_ param is set, all calls to HTTP method functions will automatically
    prepend requested url with the base url if they do not start with the base url.


    - **@params**:
      - _string?_ **base_url** : The base url for the HTTP client requests


    {.params}


  .send\_request(_uri_, _method_, _data_, _headers_, _options_) {#http.HttpClient.send_request}

  : Sends an Http request and returns a HttpResponse.
    
    
    
    
    
       This can be very useful if you want to reuse the same 
       instance for multiple requests and headers scenarios.


    - **@params**:
      - _string_ **uri**
      - _string?_ **method** : Default value is `GET`.

      - _string|dict|nil_ **data**
      - _dict?_ **headers** : To override the instance options. 

      - _dict?_ **client** request options


    {.params}
    - **@returns**: _HttpResponse_
    - **@raises**:
      - SocketException
@raises


  .get(_url_, _headers_) {#http.HttpClient.get}

  : Sends an Http GET request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    - **@raises**:
      - Exception
@raises


  .post(_url_, _data_, _headers_) {#http.HttpClient.post}

  : Sends an Http POST request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _string|bytes|nil_ **data**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    - **@raises**:
      - Exception
@raises


  .put(_url_, _data_, _headers_) {#http.HttpClient.put}

  : Sends an Http PUT request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _string|bytes|nil_ **data**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    - **@raises**:
      - Exception
@raises


  .patch(_url_, _data_, _headers_) {#http.HttpClient.patch}

  : Sends an Http PATCH request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _string|bytes|nil_ **data**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    - **@raises**:
      - Exception
@raises


  .delete(_url_, _headers_) {#http.HttpClient.delete}

  : Sends an Http DELETE request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    - **@raises**:
      - Exception
@raises


  .options(_url_, _headers_) {#http.HttpClient.options}

  : Sends an Http OPTIONS request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    - **@raises**:
      - Exception
@raises


  .trace(_url_, _headers_) {#http.HttpClient.trace}

  : Sends an Http TRACE request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    - **@raises**:
      - Exception
@raises


  .head(_url_, _headers_) {#http.HttpClient.head}

  : Sends an Http HEAD request and returns an HttpResponse.


    - **@params**:
      - _string_ **url**
      - _dict?_ **headers**

    {.params}
    - **@returns**: _HttpResponse_
    - **@raises**:
      - Exception
@raises




_class_ **HttpResponse** {#http.HttpResponse .class}

: Represents the response to an Http request.


  ~ Properties

    - __@printable__
    - __@serializable__

  **.version** &#8674; _string_
  :  The HTTP version of the response

  **.status** &#8674; _number_
  :  The HTTP response status code

  **.headers** &#8674; _dictionary_
  :  The HTTP response headers

  **.time\_taken** &#8674; _number_
  :  Total time taken for the HTTP request that generated this HttpResponse to complete

  **.redirects** &#8674; _number_
  :  The number of times the HTTP request that generated this HttpResponse was redirected.

  **.responder** &#8674; _string_
  :  The final URL that provided the HttpResponse. This will sometimes 
    differ from the original request URI.

  **.body** &#8674; _bytes_
  :  The content of the HTTP response as bytes

  **.cookies** &#8674; _list_
  :  The cookies to be sent back to the client

  **.certificate** &#8674; _dict|nil_
  :  The SSL certificate for the secure connection. This is only available 
    when visiting HTTPS/SSL/TLS secured websites.


  .HttpResponse(_body_, _status_, _headers_, _cookies_, _version_, _time_taken_, _redirects_, _responder_) &#8674; Constructor {#http.HttpResponse.HttpResponse}

  : - **@params**:
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


  .to\_json() {#http.HttpResponse.to_json}

  : Returns the response as a JSON object






