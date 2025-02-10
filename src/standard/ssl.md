# ssl
Provides OpenSSL bindings for Blade.

## Properties

- **SSL\_FILETYPE\_PEM**:

  SSL_FILETYPE_PEM

- **SSL\_FILETYPE\_ASN1**:

  SSL_FILETYPE_ASN1

- **SSL\_VERIFY\_NONE**:

  
Server mode:
:  The server will not send a client certificate request to the client, 
   so the client will not send a certificate.

Client mode: 
:  If not using an anonymous cipher (by default disabled), 
   the server will send a certificate which will be checked. The handshake 
   will be continued regardless of the verification result.
<<<


- **SSL\_VERIFY\_PEER**:

  
Server mode: 
:  The server sends a client certificate request to the client. 
   The certificate returned (if any) is checked. If the verification process fails, 
   the TLS/SSL handshake is immediately terminated with an alert message containing 
   the reason for the verification failure. The behaviour can be controlled by the 
   additional SSL_VERIFY_FAIL_IF_NO_PEER_CERT, SSL_VERIFY_CLIENT_ONCE and 
   SSL_VERIFY_POST_HANDSHAKE flags.

Client mode:
:  The server certificate is verified. If the verification process 
   fails, the TLS/SSL handshake is immediately terminated with an alert message 
   containing the reason for the verification failure. If no server certificate is sent, 
   because an anonymous cipher is used, SSL_VERIFY_PEER is ignored.
<<<


- **SSL\_VERIFY\_FAIL\_IF\_NO\_PEER\_CERT**:

  
Server mode:
:  If the client did not return a certificate, the TLS/SSL handshake is immediately 
   terminated with a "handshake failure" alert. This flag must be used together 
   with SSL_VERIFY_PEER.

Client mode: 
:  Ignored
<<<


- **SSL\_VERIFY\_CLIENT\_ONCE**:

  
Server mode:
:  Only request a client certificate once during the connection. Do not 
   ask for a client certificate again during renegotiation or post-authentication if a 
   certificate was requested during the initial handshake. This flag must be used together 
   with SSL_VERIFY_PEER.

Client mode: 
:  Ignored
<<<


- **SSL\_VERIFY\_POST\_HANDSHAKE**:

  
Server mode: 
:  The server will not send a client certificate request during the initial 
   handshake, but will send the request via SSL_verify_client_post_handshake(). This allows 
   the SSL_CTX or SSL to be configured for post-handshake peer verification before the 
   handshake occurs. This flag must be used together with SSL_VERIFY_PEER. TLSv1.3 only; no 
   effect on pre-TLSv1.3 connections.

Client mode: 
:  Ignored
<<<


- **TLS\_method**:

  TLS method

- **TLS\_client\_method**:

  TLS client method

- **TLS\_server\_method**:

  TLS server method

- **SSLv23\_method**:

  SSLv23 method

- **SSLv23\_client\_method**:

  SSLv23 client method

- **SSLv23\_server\_method**:

  SSLv23 server method

- **BIO\_CLOSE**:

  BIO_CLOSE

- **BIO\_NOCLOSE**:

  BIO_NOCLOSE

- **BIO\_f\_ssl**:

  SSL BIO method f_ssl

> I/O performed on an SSL BIO communicates using the SSL protocol 
> with the SSLs read and write BIOs. If an SSL connection is not 
> established then an attempt is made to establish one on the first 
> I/O call.

- **BIO\_s\_connect**:

  SSL BIO method connect

> Using connect BIOs, TCP/IP connections can be made and data 
> transferred using only BIO routines. In this way any platform 
> specific operations are hidden by the BIO abstraction.

- **BIO\_s\_accept**:

  SSL BIO method accept

> Using accept BIOs, TCP/IP connections can be accepted and data 
> transferred using only BIO routines. In this way any platform specific 
> operations are hidden by the BIO abstraction.


## Functions

#### socket(socket, context, ssl) &#8674; Exported

Returns a new instance of a TLSSocket.

##### Parameters

- _Socket_ **socket**
- _SSLContext?_ **context**
- _SSL?_ **ssl**




## Classes

### _class_ SSL

SSL interface class

#### Methods

#### SSL(context) &#8674; Constructor



##### Parameters

- _SSLContext_ **context**


#### set\_connect\_state()

Puts this SSL instance in the connected mode.


#### set\_accept\_state()

Puts this SSL instance in the accept mode.


#### get\_fd()

Returns the current socket file descriptor.
It returns `-1` on failure or a positive integer on success.

##### Returns

- number

#### set\_fd(fd)

Sets the socket file descriptor for this SSL.

##### Parameters

- _int_ **fd**

##### Returns

- bool

#### accept()

Begins accepting data on SSL and returns `true` if successful or 
`false` otherwise.

##### Returns

- bool

#### connect()

Connects to an SSL server instance.


@throws

##### Returns

- bool

#### write(data)

Writes data to the current I/O stream and return an integer representing 
the total bytes written.

##### Parameters

- _string|bytes_ **data**

##### Returns

- int

#### read(length, is_blocking)

Reads data off the I/O and returns it. Set _length_ to -1 to read 
till no data is available in the stream.

##### Parameters

- _int?_ **length**: : Default value is -1
- _bool?_ **is_blocking**: : Default value is false

##### Returns

- string

#### error(code)

Returns the last SSL error number

##### Parameters

- _int?_ **code**

##### Returns

- int

#### shutdown()

Shutdown the SSL object.


#### set\_tlsext\_host\_name(name)

Sets the Server Name Indication (SNI) for use by Secure Sockets 
Layer (SSL). This function should be called on a client SSL 
session before the TLS handshake for the SNI extension 
to be set properly.

##### Parameters

- _string_ **name**

##### Returns

- bool

#### get\_peer\_certificate()

Returns informations about the peer certificate in a dictionary.

The returned information includes:

- `subject_name`
- `issuer_name`
- `serial_number`
- `not_before`
- `not_after`
- `public_key`
- `extensions`
- `algorithm`

##### Returns

- dict

#### free()

Frees this SSL and all associated resources.


#### get\_pointer()

Returns the raw OpenSSl SSL pointer.

##### Returns

- ptr



### _class_ TLSSocket

TLS enabled Socket version powered by OpenSSL.


#### Properties

 - __@printable__

#### Fields

- **host** &#8674; _string_:

  This property holds the host bound, to be bound to or connected to by the current socket.
Whenever a host is not given, the host will default to localhost.

- **port** &#8674; _number_:

  The port currently bound or connected to by the socket.

- **family** &#8674; _number_:

  The socket family (which must be one of the `AF_` variables).
The default family for the socket is AF_INET.

- **type** &#8674; _number_:

  The type of socket stream used by the socket.
The default socket type is `SOCK_STREAM`.

- **protocol** &#8674; _number_:

  The current operating protocol of the socket that controls the 
underlying behavior of the socket. The default is `IPPROTO_TCP`.

- **id** &#8674; _number_:

  The file descriptor id of the current socket on the host machine.

- **is\_client** &#8674; _bool_:

  `true` when the socket is a client to a server socket, `false` otherwise.

- **is\_bound** &#8674; _bool_:

  `true` when the socket is bound to a given port on the device, `false` 
otherwise.

- **is\_connected** &#8674; _bool_:

  `true` when the socket is connected to a server socket, `false` otherwise.

- **is\_listening** &#8674; _bool_:

  `true` when the socket is currently listening on a host device port as a 
server, `false` otherwise.

- **is\_closed** &#8674; _bool_:

  `true` when the socket is closed, `false` otherwise.

- **is\_shutdown** &#8674; _bool_:

  `true` when the socket is shutdown, `false` otherwise.

- **is\_blocking** &#8674; _bool_:

  `true` when the socket is running in a blocking mode, `false` otherwise.

- **shutdown\_reason** &#8674; _number_:

  The property holds the reason for which the last `shutdown` operation 
was called or `-1` if `shutdown` was never requested.

- **send\_timeout** &#8674; _number_:

  The amount of time in milliseconds that the socket waits before it 
terminates a `send` operation. This is equal to the `SO_SNDTIMEO`.

- **receive\_timeout** &#8674; _number_:

  The amount of time in milliseconds that the socket waits before it 
terminates a `receive` operation. This is equal to the `SO_RCVTIMEO`.

#### Methods

#### TLSSocket(socket, context, ssl) &#8674; Constructor



##### Parameters

- _Socket_ **socket**
- _SSLContext?_ **context**
- _SSL?_ **ssl**


#### connect(host, port, timeout)

Initiates a connection to the given host on the specified port. If host is `nil`, it will 
connect on to the current hostn specified on the socket.

##### Parameters

- _string_ **host**
- _int_ **port**
- _int?_ **timeout**: : Default is 300,000ms (i.e. 300 seconds)

##### Returns

- bool

#### bind(port, host)

Binds this socket to the given port on the given host. If host is `nil` or not specified, it will connect 
on to the current hostn specified on the socket.

##### Parameters

- _int_ **port**
- _string?_ **host**

##### Returns

- bool

#### send(message, flags)

Sends the specified message to the socket. When this methods accepts a file as a message, 
the file is read and the resultant bytes of the file content is streamed to the socket.

##### Parameters

- _string|bytes|file_ **message**
- _int?_ **flags**

##### Returns

- number greater than -1 if successful indicating the total number of bytes sent or -1 if it fails.
##### Notes

- the flags parameter is currently redundant and is kept only to remain compatible with future plans for this method.

#### receive(length, flags)

Receives bytes of the given length from the socket. If the length is not given, it default length of 
-1 indicating that the total available data on the socket stream will be read. 
If no data is available for read on the socket, the socket will wait to receive data or until the 
`receive_timeout` which is also equal to the `SO_RCVTIMEO` setting of the socket has elapsed before or 
until it has received the total number of bytes required (whichever comes first).

##### Parameters

- _int?_ **length**
- _int?_ **flags**

##### Returns

- string
##### Notes

- the flags parameter is currently redundant and is kept only to remain compatible with future plans for this method.

#### read(length)

Reads bytes of the given length from the socket. If the length is not given, it default length of 
-1 indicating that the total available data on the socket stream will be read. 

> This method differs from `receive()` in that it does not check for a socket having data to 
> read or not and will block until data of _length_ have been read or no more data is available for 
> reading.

##### Parameters

- _int?_ **length**: : Default value is 1024.

##### Returns

- string
##### Notes

- Only use this function after a call to `receive()` has succeeded.

#### listen(queue_length)

Listen for connections on a socket

This method puts the socket in a state where it is willing to accept incoming connections and creates 
a queue limit of `queue_length` for incoming connections. If a connection request arrives with 
the queue full, the client may receive an error with an indication of `ECONNREFUSED`. 
Alternatively, if the underlying protocol supports retransmission, the request may be ignored 
so that retries may succeed.

When the `queue_length` is omitted or set to -1, the method will use the default queue limit of
the current platform which is usually equal to `SOMAXCONN`.

##### Parameters

- _int?_ **queue_length**: : Default value is `SOMAXCONN`.

##### Returns

- bool
##### Notes

- listen() call applies only to sockets of type `SOCK_STREAM` (which is the default).

#### accept()

Accepts a connection on a socket

This method extracts the first connection request on the queue of pending connections, creates a new socket 
with the same properties of the current socket, and allocates a new file descriptor for the socket.  If no 
pending connections are present on the queue, and the socket is not marked as non-blocking, accept() blocks 
the caller until a connection is present.  If the socket is marked non-blocking and no pending connections 
are present on the queue, accept() returns an error as described below.  

The accepted socket may not be used to accept more connections.  The original socket remains open.

##### Returns

- TLSSocket

#### close()

Closes the socket.

##### Returns

- bool

#### shutdown()

The shutdown() call causes all or part of a full-duplex connection on the socket associated with 
socket to be shut down.

##### Returns

- bool

#### set\_option(option, value)

Sets the options of the current socket.

##### Parameters

- _int_ **option**
- _any_ **value**

##### Returns

- bool
##### Notes

- Only `SO_` variables are valid option types.

#### get\_option(option)

Gets the options set on the current socket.

##### Parameters

- _int_ **option**

##### Returns

- any

#### set\_blocking(mode)

Sets if the socket should operate in blocking or non-blocking mode. `true` for blocking 
(default) and `false` for non-blocking.

##### Parameters

- _bool_ **mode**

##### Returns

- bool

#### info()

Returns a dictionary containing the address, port and family of the current socket or an 
empty dictionary if the socket information could not be retrieved.

##### Returns

- dictionary

#### get\_socket()

Returns the underlying Socket instance.

##### Returns

- Socket

#### get\_context()

Returns the underlying SSLContext instance.

##### Returns

- SSLContext

#### get\_ssl()

Returns the underlying SSL instance

##### Returns

- SSL

#### set\_context(context)

Sets the underlying SSL context to use.

##### Parameters

- _SSLContext_ **context**



### _class_ BIO

SSL Binary Input/Output implementation

#### Methods

#### BIO(method) &#8674; Constructor

@param ptr method

##### Notes

- Method must be a valid SSL BIO_ method

#### set\_ssl(ssl, option)

Sets the working SSL instance for this BIO.

##### Parameters

- _SSL_ **ssl**
- _int?_ **option**: : Default value is `BIO_NOCLOSE`

##### Notes

- Option must be one of the BIO constants if given.

#### set\_conn\_hostname(name)

Sets the hostname for the current connected BIO socket.

##### Parameters

- _string_ **name**


#### set\_accept\_tname(name)

Sets the address name for the current accepted BIO socket.

##### Parameters

- _string_ **name**


#### set\_conn\_address(address)

Sets the address for the current connected BIO socket.

##### Parameters

- _string_ **address**


#### set\_conn\_port(port)

Sets the port for the current connected BIO socket.

##### Parameters

- _int|string_ **port**


#### set\_accept\_port(port)

Sets the port for the current accepted BIO socket.

##### Parameters

- _int|string_ **port**


#### set\_conn\_family(family)

Sets the socket family for the current connected BIO socket.

##### Parameters

- _int_ **family**


#### set\_accept\_family(family)

Sets the socket family for the current accepted BIO socket.

##### Parameters

- _int_ **family**


#### get\_conn\_hostname()

Returns the hostname for the current connected BIO socket.

##### Returns

- string

#### get\_accept\_name()

Returns the hostname for the current accepted BIO socket.

##### Returns

- string

#### get\_conn\_address()

Returns the address for the current connected BIO socket.

##### Returns

- string

#### get\_conn\_port()

Returns the port for the current connected BIO socket.

##### Returns

- string

#### get\_accept\_port()

Returns the port for the current accepted BIO socket.

##### Returns

- string

#### get\_conn\_family()

Returns the family for the current connected BIO socket.

##### Returns

- int

#### get\_accept\_family()

Returns the family for the current accepted BIO socket.

##### Returns

- int

#### get\_fd()

Returns the current socket file descriptor.
It returns `-1` on failure or a positive integer on success.

##### Returns

- number

#### set\_fd(fd, opt)

Sets the socket file descriptor for this BIO

##### Parameters

- _int_ **fd**
- _int?_ **opt**: : Default value is `BIO_NOCLOSE`


#### set\_non\_blocking(is_blocking)

Converts the BIO into a non-blocking I/O stream if b is `true`, otherwise 
converts it into a blocking stream.

##### Parameters

- _bool?_ **is_blocking**: : Default value is `true`.


#### push(bio)

It appends bio, which may be a single BIO or a chain of BIOs, 
to the current BIO stack (unless the current pinter is `nil`). 
It then makes a control call on BIO _bio_ and returns it.

##### Parameters

- _BIO_ **bio**

##### Returns

- self

#### pop()

Removes this BIO from any chain is is part of


#### write(data)

Writes data to the current I/O stream and returns the total bytes written.

##### Parameters

- _string|bytes_ **data**

##### Returns

- int

#### read(length)

Reads data off the I/O and returns it.

##### Parameters

- _int?_ **length**: : Default value is `1024`

##### Returns

- string

#### should\_retry()

Returns `true` if this BIO needs to retry its last operation. 
`false` otherwise.

##### Returns

- bool

#### do\_connect()

Attempts to establish a connection to the host.

##### Returns

- int

#### do\_accept()

Attempts to accept the connected socket.

##### Returns

- int

#### error(code)

Returns the last SSL error number.

##### Parameters

- _int?_ **code**

##### Returns

- int

#### error\_string()

Returns the last SSL error as string.

##### Returns

- string

#### free()

Frees this BIO and all associated resources.


#### get\_pointer()

Returns the raw OpenSSl BIO pointer.

##### Returns

- ptr



### _class_ SSLBIO < _BIO_

SSLBIO is a generic BIO for SSL I/O

#### Methods

#### SSLBIO() &#8674; Constructor



### _class_ ConnectBIO < _BIO_

ConnectBIO is a generic BIO for new secured connections

#### Methods

#### ConnectBIO() &#8674; Constructor



### _class_ AcceptedBIO < _BIO_

AcceptedBIO is a generic BIO for accepting new secured 
connections from a TLS server

#### Methods

#### AcceptedBIO() &#8674; Constructor



### _class_ SSLContext

SSL context representation class

#### Methods

#### SSLContext(method) &#8674; Constructor



##### Parameters

- _ptr_ **method**

##### Notes

- Method must be a valid SSL method pointer.

#### set\_verify(mode, disable)

Enables or disables the verification flags for the given mode on the context.

##### Parameters

- _int_ **mode**
- _bool?_ **disable**: - Default: false

##### Notes

- The verification of certificates can be controlled by a set of logically or'ed mode flags.
- If the mode is SSL_VERIFY_NONE none of the other flags may be set.

#### set\_verify\_locations(locations)

Sets the default locations for trusted CA certificates.

##### Parameters

- _string_ **locations**


#### load\_certs(cert_file, private_key_file)

Loads the given SSL/TLS certificate pairs for the given SSL/TLS context.

##### Parameters

- _string|file_ **cert_file**
- _string|file_ **private_key_file**

##### Returns

- bool

#### set\_ciphers(ciphers)

Sets the list of allowed ciphers. This list must be colon (:) separated.

##### Parameters

- _string_ **ciphers**

##### Returns

- bool

#### free()

Frees this Context and all associated resources


#### get\_pointer()

Returns the raw OpenSSl SSL_CTX pointer.

##### Returns

- ptr



### _class_ TLSContext < _SSLContext_

TLSContext is a specialized Context providing generic TLS support 
for both client and server mode.

#### Methods

#### TLSContext() &#8674; Constructor



### _class_ TLSClientContext < _SSLContext_

TLSClientContext is a specialized Context for supporting TLS clients.

#### Methods

#### TLSClientContext() &#8674; Constructor



### _class_ TLSServerContext < _SSLContext_

TLSServerContext is a specialized Context for supporting TLS servers.

#### Methods

#### TLSServerContext() &#8674; Constructor



### _class_ SSLv23Context < _SSLContext_

SSLv23Context is a specialized Context providing generic SSLv23 support 
for both client and server mode.

#### Methods

#### SSLv23Context() &#8674; Constructor



### _class_ SSLv23ClientContext < _SSLContext_

SSLv23ClientContext is a specialized Context for supporting SSLv23 clients.

#### Methods

#### SSLv23ClientContext() &#8674; Constructor



### _class_ SSLv23ServerContext < _SSLContext_

SSLv23ServerContext is a specialized Context for supporting SSLv23 servers.

#### Methods

#### SSLv23ServerContext() &#8674; Constructor



