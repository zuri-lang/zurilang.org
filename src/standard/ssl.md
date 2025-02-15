# ssl
Provides OpenSSL bindings for Blade.

## Fields

_ssl_.**SSL\_FILETYPE\_PEM**
: SSL_FILETYPE_PEM

_ssl_.**SSL\_FILETYPE\_ASN1**
: SSL_FILETYPE_ASN1

_ssl_.**SSL\_VERIFY\_NONE**
: Server mode:
  :  The server will not send a client certificate request to the client, 
     so the client will not send a certificate.
  
  Client mode: 
  :  If not using an anonymous cipher (by default disabled), 
     the server will send a certificate which will be checked. The handshake 
     will be continued regardless of the verification result.

_ssl_.**SSL\_VERIFY\_PEER**
: Server mode: 
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

_ssl_.**SSL\_VERIFY\_FAIL\_IF\_NO\_PEER\_CERT**
: Server mode:
  :  If the client did not return a certificate, the TLS/SSL handshake is immediately 
     terminated with a "handshake failure" alert. This flag must be used together 
     with SSL_VERIFY_PEER.
  
  Client mode: 
  :  Ignored

_ssl_.**SSL\_VERIFY\_CLIENT\_ONCE**
: Server mode:
  :  Only request a client certificate once during the connection. Do not 
     ask for a client certificate again during renegotiation or post-authentication if a 
     certificate was requested during the initial handshake. This flag must be used together 
     with SSL_VERIFY_PEER.
  
  Client mode: 
  :  Ignored

_ssl_.**SSL\_VERIFY\_POST\_HANDSHAKE**
: Server mode: 
  :  The server will not send a client certificate request during the initial 
     handshake, but will send the request via SSL_verify_client_post_handshake(). This allows 
     the SSL_CTX or SSL to be configured for post-handshake peer verification before the 
     handshake occurs. This flag must be used together with SSL_VERIFY_PEER. TLSv1.3 only; no 
     effect on pre-TLSv1.3 connections.
  
  Client mode: 
  :  Ignored

_ssl_.**TLS\_method**
: TLS method

_ssl_.**TLS\_client\_method**
: TLS client method

_ssl_.**TLS\_server\_method**
: TLS server method

_ssl_.**SSLv23\_method**
: SSLv23 method

_ssl_.**SSLv23\_client\_method**
: SSLv23 client method

_ssl_.**SSLv23\_server\_method**
: SSLv23 server method

_ssl_.**BIO\_CLOSE**
: BIO_CLOSE

_ssl_.**BIO\_NOCLOSE**
: BIO_NOCLOSE

_ssl_.**BIO\_f\_ssl**
: SSL BIO method f_ssl
  
  > I/O performed on an SSL BIO communicates using the SSL protocol 
  > with the SSLs read and write BIOs. If an SSL connection is not 
  > established then an attempt is made to establish one on the first 
  > I/O call.

_ssl_.**BIO\_s\_connect**
: SSL BIO method connect
  
  > Using connect BIOs, TCP/IP connections can be made and data 
  > transferred using only BIO routines. In this way any platform 
  > specific operations are hidden by the BIO abstraction.

_ssl_.**BIO\_s\_accept**
: SSL BIO method accept
  
  > Using accept BIOs, TCP/IP connections can be accepted and data 
  > transferred using only BIO routines. In this way any platform specific 
  > operations are hidden by the BIO abstraction.


## Functions

_ssl_.socket(_socket_, _context_, _ssl_) &#x279D; _Exported_ {#ssl.socket}

: Returns a new instance of a TLSSocket.


  - **@params**:
    - _Socket_ **socket**
    - _SSLContext?_ **context**
    - _SSL?_ **ssl**

  {.params}



## Classes

_class_ **SSL** {#ssl.SSL .class}

: SSL interface class


  .SSL(_context_) &#x279D; _Constructor_ {#ssl.SSL.SSL}

  : ssl.SSL constructor


    - **@params**:
      - _SSLContext_ **context**

    {.params}


  .set\_connect\_state() {#ssl.SSL.set_connect_state}

  : Puts this SSL instance in the connected mode.




  .set\_accept\_state() {#ssl.SSL.set_accept_state}

  : Puts this SSL instance in the accept mode.




  .get\_fd() {#ssl.SSL.get_fd}

  : Returns the current socket file descriptor.
    It returns `-1` on failure or a positive integer on success.


    - **@returns**: _number_
    {.returns}


  .set\_fd(_fd_) {#ssl.SSL.set_fd}

  : Sets the socket file descriptor for this SSL.


    - **@params**:
      - _int_ **fd**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .accept() {#ssl.SSL.accept}

  : Begins accepting data on SSL and returns `true` if successful or 
    `false` otherwise.


    - **@returns**: _bool_
    {.returns}


  .connect() {#ssl.SSL.connect}

  : Connects to an SSL server instance.
    
    
    @throws


    - **@returns**: _bool_
    {.returns}


  .write(_data_) {#ssl.SSL.write}

  : Writes data to the current I/O stream and return an integer representing 
    the total bytes written.


    - **@params**:
      - _string|bytes_ **data**

    {.params}
    - **@returns**: _int_
    {.returns}


  .read(_length_, _is_blocking_) {#ssl.SSL.read}

  : Reads data off the I/O and returns it. Set _length_ to -1 to read 
    till no data is available in the stream.


    - **@params**:
      - _int?_ **length** : Default value is -1

      - _bool?_ **is_blocking** : Default value is false


    {.params}
    - **@returns**: _string_
    {.returns}


  .error(_code_) {#ssl.SSL.error}

  : Returns the last SSL error number


    - **@params**:
      - _int?_ **code**

    {.params}
    - **@returns**: _int_
    {.returns}


  .shutdown() {#ssl.SSL.shutdown}

  : Shutdown the SSL object.




  .set\_tlsext\_host\_name(_name_) {#ssl.SSL.set_tlsext_host_name}

  : Sets the Server Name Indication (SNI) for use by Secure Sockets 
    Layer (SSL). This function should be called on a client SSL 
    session before the TLS handshake for the SNI extension 
    to be set properly.


    - **@params**:
      - _string_ **name**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .get\_peer\_certificate() {#ssl.SSL.get_peer_certificate}

  : Returns informations about the peer certificate in a dictionary.
    
    The returned information includes:
    
    - `subject_name`
    - `issuer_name`
    - `serial_number`
    - `not_before`
    - `not_after`
    - `public_key`
    - `extensions`
    - `algorithm`


    - **@returns**: _dict_
    {.returns}


  .free() {#ssl.SSL.free}

  : Frees this SSL and all associated resources.




  .get\_pointer() {#ssl.SSL.get_pointer}

  : Returns the raw OpenSSl SSL pointer.


    - **@returns**: _ptr_
    {.returns}




_class_ **TLSSocket** {#ssl.TLSSocket .class}

: TLS enabled Socket version powered by OpenSSL.


    __@printable__
    {.class-props}

  **.host** &#x279D; _string_
  : This property holds the host bound, to be bound to or connected to by the current socket.
    Whenever a host is not given, the host will default to localhost.

  **.port** &#x279D; _number_
  : The port currently bound or connected to by the socket.

  **.family** &#x279D; _number_
  : The socket family (which must be one of the `AF_` variables).
    The default family for the socket is AF_INET.

  **.type** &#x279D; _number_
  : The type of socket stream used by the socket.
    The default socket type is `SOCK_STREAM`.

  **.protocol** &#x279D; _number_
  : The current operating protocol of the socket that controls the 
    underlying behavior of the socket. The default is `IPPROTO_TCP`.

  **.id** &#x279D; _number_
  : The file descriptor id of the current socket on the host machine.

  **.is\_client** &#x279D; _bool_
  : `true` when the socket is a client to a server socket, `false` otherwise.

  **.is\_bound** &#x279D; _bool_
  : `true` when the socket is bound to a given port on the device, `false` 
    otherwise.

  **.is\_connected** &#x279D; _bool_
  : `true` when the socket is connected to a server socket, `false` otherwise.

  **.is\_listening** &#x279D; _bool_
  : `true` when the socket is currently listening on a host device port as a 
    server, `false` otherwise.

  **.is\_closed** &#x279D; _bool_
  : `true` when the socket is closed, `false` otherwise.

  **.is\_shutdown** &#x279D; _bool_
  : `true` when the socket is shutdown, `false` otherwise.

  **.is\_blocking** &#x279D; _bool_
  : `true` when the socket is running in a blocking mode, `false` otherwise.

  **.shutdown\_reason** &#x279D; _number_
  : The property holds the reason for which the last `shutdown` operation 
    was called or `-1` if `shutdown` was never requested.

  **.send\_timeout** &#x279D; _number_
  : The amount of time in milliseconds that the socket waits before it 
    terminates a `send` operation. This is equal to the `SO_SNDTIMEO`.

  **.receive\_timeout** &#x279D; _number_
  : The amount of time in milliseconds that the socket waits before it 
    terminates a `receive` operation. This is equal to the `SO_RCVTIMEO`.


  .TLSSocket(_socket_, _context_, _ssl_) &#x279D; _Constructor_ {#ssl.TLSSocket.TLSSocket}

  : ssl.TLSSocket constructor


    - **@params**:
      - _Socket_ **socket**
      - _SSLContext?_ **context**
      - _SSL?_ **ssl**

    {.params}


  .connect(_host_, _port_, _timeout_) {#ssl.TLSSocket.connect}

  : Initiates a connection to the given host on the specified port. If host is `nil`, it will 
    connect on to the current hostn specified on the socket.


    - **@params**:
      - _string_ **host**
      - _int_ **port**
      - _int?_ **timeout** : Default is 300,000ms (i.e. 300 seconds)


    {.params}
    - **@returns**: _bool_
    {.returns}


  .bind(_port_, _host_) {#ssl.TLSSocket.bind}

  : Binds this socket to the given port on the given host. If host is `nil` or not specified, it will connect 
    on to the current hostn specified on the socket.


    - **@params**:
      - _int_ **port**
      - _string?_ **host**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .send(_message_, _flags_) {#ssl.TLSSocket.send}

  : Sends the specified message to the socket. When this methods accepts a file as a message, 
    the file is read and the resultant bytes of the file content is streamed to the socket.


    > **@notes**:
    > 
    > - the flags parameter is currently redundant and is kept only to remain compatible with future plans for this method.

    - **@params**:
      - _string|bytes|file_ **message**
      - _int?_ **flags**

    {.params}
    - **@returns**: _number greater than -1 if successful indicating the total number of bytes sent or -1 if it fails._
    {.returns}


  .receive(_length_, _flags_) {#ssl.TLSSocket.receive}

  : Receives bytes of the given length from the socket. If the length is not given, it default length of 
    -1 indicating that the total available data on the socket stream will be read. 
    If no data is available for read on the socket, the socket will wait to receive data or until the 
    `receive_timeout` which is also equal to the `SO_RCVTIMEO` setting of the socket has elapsed before or 
    until it has received the total number of bytes required (whichever comes first).


    > **@notes**:
    > 
    > - the flags parameter is currently redundant and is kept only to remain compatible with future plans for this method.

    - **@params**:
      - _int?_ **length**
      - _int?_ **flags**

    {.params}
    - **@returns**: _string_
    {.returns}


  .read(_length_) {#ssl.TLSSocket.read}

  : Reads bytes of the given length from the socket. If the length is not given, it default length of 
    -1 indicating that the total available data on the socket stream will be read. 
    
    > This method differs from `receive()` in that it does not check for a socket having data to 
    > read or not and will block until data of _length_ have been read or no more data is available for 
    > reading.


    > **@notes**:
    > 
    > - Only use this function after a call to `receive()` has succeeded.

    - **@params**:
      - _int?_ **length** : Default value is 1024.


    {.params}
    - **@returns**: _string_
    {.returns}


  .listen(_queue_length_) {#ssl.TLSSocket.listen}

  : Listen for connections on a socket
    
    This method puts the socket in a state where it is willing to accept incoming connections and creates 
    a queue limit of `queue_length` for incoming connections. If a connection request arrives with 
    the queue full, the client may receive an error with an indication of `ECONNREFUSED`. 
    Alternatively, if the underlying protocol supports retransmission, the request may be ignored 
    so that retries may succeed.
    
    When the `queue_length` is omitted or set to -1, the method will use the default queue limit of
    the current platform which is usually equal to `SOMAXCONN`.


    > **@notes**:
    > 
    > - listen() call applies only to sockets of type `SOCK_STREAM` (which is the default).

    - **@params**:
      - _int?_ **queue_length** : Default value is `SOMAXCONN`.


    {.params}
    - **@returns**: _bool_
    {.returns}


  .accept() {#ssl.TLSSocket.accept}

  : Accepts a connection on a socket
    
    This method extracts the first connection request on the queue of pending connections, creates a new socket 
    with the same properties of the current socket, and allocates a new file descriptor for the socket.  If no 
    pending connections are present on the queue, and the socket is not marked as non-blocking, accept() blocks 
    the caller until a connection is present.  If the socket is marked non-blocking and no pending connections 
    are present on the queue, accept() returns an error as described below.  
    
    The accepted socket may not be used to accept more connections.  The original socket remains open.


    - **@returns**: _TLSSocket_
    {.returns}


  .close() {#ssl.TLSSocket.close}

  : Closes the socket.


    - **@returns**: _bool_
    {.returns}


  .shutdown() {#ssl.TLSSocket.shutdown}

  : The shutdown() call causes all or part of a full-duplex connection on the socket associated with 
    socket to be shut down.


    - **@returns**: _bool_
    {.returns}


  .set\_option(_option_, _value_) {#ssl.TLSSocket.set_option}

  : Sets the options of the current socket.


    > **@notes**:
    > 
    > - Only `SO_` variables are valid option types.

    - **@params**:
      - _int_ **option**
      - _any_ **value**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .get\_option(_option_) {#ssl.TLSSocket.get_option}

  : Gets the options set on the current socket.


    - **@params**:
      - _int_ **option**

    {.params}
    - **@returns**: _any_
    {.returns}


  .set\_blocking(_mode_) {#ssl.TLSSocket.set_blocking}

  : Sets if the socket should operate in blocking or non-blocking mode. `true` for blocking 
    (default) and `false` for non-blocking.


    - **@params**:
      - _bool_ **mode**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .info() {#ssl.TLSSocket.info}

  : Returns a dictionary containing the address, port and family of the current socket or an 
    empty dictionary if the socket information could not be retrieved.


    - **@returns**: _dictionary_
    {.returns}


  .get\_socket() {#ssl.TLSSocket.get_socket}

  : Returns the underlying Socket instance.


    - **@returns**: _Socket_
    {.returns}


  .get\_context() {#ssl.TLSSocket.get_context}

  : Returns the underlying SSLContext instance.


    - **@returns**: _SSLContext_
    {.returns}


  .get\_ssl() {#ssl.TLSSocket.get_ssl}

  : Returns the underlying SSL instance


    - **@returns**: _SSL_
    {.returns}


  .set\_context(_context_) {#ssl.TLSSocket.set_context}

  : Sets the underlying SSL context to use.


    - **@params**:
      - _SSLContext_ **context**

    {.params}




_class_ **BIO** {#ssl.BIO .class}

: SSL Binary Input/Output implementation



  .BIO(_method_) &#x279D; _Constructor_ {#ssl.BIO.BIO}

  : @param ptr method


    > **@notes**:
    > 
    > - Method must be a valid SSL BIO_ method



  .set\_ssl(_ssl_, _option_) {#ssl.BIO.set_ssl}

  : Sets the working SSL instance for this BIO.


    > **@notes**:
    > 
    > - Option must be one of the BIO constants if given.

    - **@params**:
      - _SSL_ **ssl**
      - _int?_ **option** : Default value is `BIO_NOCLOSE`


    {.params}


  .set\_conn\_hostname(_name_) {#ssl.BIO.set_conn_hostname}

  : Sets the hostname for the current connected BIO socket.


    - **@params**:
      - _string_ **name**

    {.params}


  .set\_accept\_tname(_name_) {#ssl.BIO.set_accept_tname}

  : Sets the address name for the current accepted BIO socket.


    - **@params**:
      - _string_ **name**

    {.params}


  .set\_conn\_address(_address_) {#ssl.BIO.set_conn_address}

  : Sets the address for the current connected BIO socket.


    - **@params**:
      - _string_ **address**

    {.params}


  .set\_conn\_port(_port_) {#ssl.BIO.set_conn_port}

  : Sets the port for the current connected BIO socket.


    - **@params**:
      - _int|string_ **port**

    {.params}


  .set\_accept\_port(_port_) {#ssl.BIO.set_accept_port}

  : Sets the port for the current accepted BIO socket.


    - **@params**:
      - _int|string_ **port**

    {.params}


  .set\_conn\_family(_family_) {#ssl.BIO.set_conn_family}

  : Sets the socket family for the current connected BIO socket.


    - **@params**:
      - _int_ **family**

    {.params}


  .set\_accept\_family(_family_) {#ssl.BIO.set_accept_family}

  : Sets the socket family for the current accepted BIO socket.


    - **@params**:
      - _int_ **family**

    {.params}


  .get\_conn\_hostname() {#ssl.BIO.get_conn_hostname}

  : Returns the hostname for the current connected BIO socket.


    - **@returns**: _string_
    {.returns}


  .get\_accept\_name() {#ssl.BIO.get_accept_name}

  : Returns the hostname for the current accepted BIO socket.


    - **@returns**: _string_
    {.returns}


  .get\_conn\_address() {#ssl.BIO.get_conn_address}

  : Returns the address for the current connected BIO socket.


    - **@returns**: _string_
    {.returns}


  .get\_conn\_port() {#ssl.BIO.get_conn_port}

  : Returns the port for the current connected BIO socket.


    - **@returns**: _string_
    {.returns}


  .get\_accept\_port() {#ssl.BIO.get_accept_port}

  : Returns the port for the current accepted BIO socket.


    - **@returns**: _string_
    {.returns}


  .get\_conn\_family() {#ssl.BIO.get_conn_family}

  : Returns the family for the current connected BIO socket.


    - **@returns**: _int_
    {.returns}


  .get\_accept\_family() {#ssl.BIO.get_accept_family}

  : Returns the family for the current accepted BIO socket.


    - **@returns**: _int_
    {.returns}


  .get\_fd() {#ssl.BIO.get_fd}

  : Returns the current socket file descriptor.
    It returns `-1` on failure or a positive integer on success.


    - **@returns**: _number_
    {.returns}


  .set\_fd(_fd_, _opt_) {#ssl.BIO.set_fd}

  : Sets the socket file descriptor for this BIO


    - **@params**:
      - _int_ **fd**
      - _int?_ **opt** : Default value is `BIO_NOCLOSE`


    {.params}


  .set\_non\_blocking(_is_blocking_) {#ssl.BIO.set_non_blocking}

  : Converts the BIO into a non-blocking I/O stream if b is `true`, otherwise 
    converts it into a blocking stream.


    - **@params**:
      - _bool?_ **is_blocking** : Default value is `true`.


    {.params}


  .push(_bio_) {#ssl.BIO.push}

  : It appends bio, which may be a single BIO or a chain of BIOs, 
    to the current BIO stack (unless the current pinter is `nil`). 
    It then makes a control call on BIO _bio_ and returns it.


    - **@params**:
      - _BIO_ **bio**

    {.params}
    - **@returns**: _self_
    {.returns}


  .pop() {#ssl.BIO.pop}

  : Removes this BIO from any chain is is part of




  .write(_data_) {#ssl.BIO.write}

  : Writes data to the current I/O stream and returns the total bytes written.


    - **@params**:
      - _string|bytes_ **data**

    {.params}
    - **@returns**: _int_
    {.returns}


  .read(_length_) {#ssl.BIO.read}

  : Reads data off the I/O and returns it.


    - **@params**:
      - _int?_ **length** : Default value is `1024`


    {.params}
    - **@returns**: _string_
    {.returns}


  .should\_retry() {#ssl.BIO.should_retry}

  : Returns `true` if this BIO needs to retry its last operation. 
    `false` otherwise.


    - **@returns**: _bool_
    {.returns}


  .do\_connect() {#ssl.BIO.do_connect}

  : Attempts to establish a connection to the host.


    - **@returns**: _int_
    {.returns}


  .do\_accept() {#ssl.BIO.do_accept}

  : Attempts to accept the connected socket.


    - **@returns**: _int_
    {.returns}


  .error(_code_) {#ssl.BIO.error}

  : Returns the last SSL error number.


    - **@params**:
      - _int?_ **code**

    {.params}
    - **@returns**: _int_
    {.returns}


  .error\_string() {#ssl.BIO.error_string}

  : Returns the last SSL error as string.


    - **@returns**: _string_
    {.returns}


  .free() {#ssl.BIO.free}

  : Frees this BIO and all associated resources.




  .get\_pointer() {#ssl.BIO.get_pointer}

  : Returns the raw OpenSSl BIO pointer.


    - **@returns**: _ptr_
    {.returns}




_class_ **SSLBIO** < _BIO_ {#ssl.SSLBIO .class}

: SSLBIO is a generic BIO for SSL I/O


  .SSLBIO() &#x279D; _Constructor_ {#ssl.SSLBIO.SSLBIO}

  : ssl.SSLBIO constructor






_class_ **ConnectBIO** < _BIO_ {#ssl.ConnectBIO .class}

: ConnectBIO is a generic BIO for new secured connections


  .ConnectBIO() &#x279D; _Constructor_ {#ssl.ConnectBIO.ConnectBIO}

  : ssl.ConnectBIO constructor






_class_ **AcceptedBIO** < _BIO_ {#ssl.AcceptedBIO .class}

: AcceptedBIO is a generic BIO for accepting new secured 
  connections from a TLS server


  .AcceptedBIO() &#x279D; _Constructor_ {#ssl.AcceptedBIO.AcceptedBIO}

  : ssl.AcceptedBIO constructor






_class_ **SSLContext** {#ssl.SSLContext .class}

: SSL context representation class


  .SSLContext(_method_) &#x279D; _Constructor_ {#ssl.SSLContext.SSLContext}

  : ssl.SSLContext constructor


    > **@notes**:
    > 
    > - Method must be a valid SSL method pointer.

    - **@params**:
      - _ptr_ **method**

    {.params}


  .set\_verify(_mode_, _disable_) {#ssl.SSLContext.set_verify}

  : Enables or disables the verification flags for the given mode on the context.


    > **@notes**:
    > 
    > - The verification of certificates can be controlled by a set of logically or'ed mode flags.

    > - If the mode is SSL_VERIFY_NONE none of the other flags may be set.

    - **@params**:
      - _int_ **mode**
      - _bool?_ **disable** - Default: false


    {.params}


  .set\_verify\_locations(_locations_) {#ssl.SSLContext.set_verify_locations}

  : Sets the default locations for trusted CA certificates.


    - **@params**:
      - _string_ **locations**

    {.params}


  .load\_certs(_cert_file_, _private_key_file_) {#ssl.SSLContext.load_certs}

  : Loads the given SSL/TLS certificate pairs for the given SSL/TLS context.


    - **@params**:
      - _string|file_ **cert_file**
      - _string|file_ **private_key_file**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .set\_ciphers(_ciphers_) {#ssl.SSLContext.set_ciphers}

  : Sets the list of allowed ciphers. This list must be colon (:) separated.


    - **@params**:
      - _string_ **ciphers**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .free() {#ssl.SSLContext.free}

  : Frees this Context and all associated resources




  .get\_pointer() {#ssl.SSLContext.get_pointer}

  : Returns the raw OpenSSl SSL_CTX pointer.


    - **@returns**: _ptr_
    {.returns}




_class_ **TLSContext** < _SSLContext_ {#ssl.TLSContext .class}

: TLSContext is a specialized Context providing generic TLS support 
  for both client and server mode.


  .TLSContext() &#x279D; _Constructor_ {#ssl.TLSContext.TLSContext}

  : ssl.TLSContext constructor






_class_ **TLSClientContext** < _SSLContext_ {#ssl.TLSClientContext .class}

: TLSClientContext is a specialized Context for supporting TLS clients.


  .TLSClientContext() &#x279D; _Constructor_ {#ssl.TLSClientContext.TLSClientContext}

  : ssl.TLSClientContext constructor






_class_ **TLSServerContext** < _SSLContext_ {#ssl.TLSServerContext .class}

: TLSServerContext is a specialized Context for supporting TLS servers.


  .TLSServerContext() &#x279D; _Constructor_ {#ssl.TLSServerContext.TLSServerContext}

  : ssl.TLSServerContext constructor






_class_ **SSLv23Context** < _SSLContext_ {#ssl.SSLv23Context .class}

: SSLv23Context is a specialized Context providing generic SSLv23 support 
  for both client and server mode.


  .SSLv23Context() &#x279D; _Constructor_ {#ssl.SSLv23Context.SSLv23Context}

  : ssl.SSLv23Context constructor






_class_ **SSLv23ClientContext** < _SSLContext_ {#ssl.SSLv23ClientContext .class}

: SSLv23ClientContext is a specialized Context for supporting SSLv23 clients.


  .SSLv23ClientContext() &#x279D; _Constructor_ {#ssl.SSLv23ClientContext.SSLv23ClientContext}

  : ssl.SSLv23ClientContext constructor






_class_ **SSLv23ServerContext** < _SSLContext_ {#ssl.SSLv23ServerContext .class}

: SSLv23ServerContext is a specialized Context for supporting SSLv23 servers.


  .SSLv23ServerContext() &#x279D; _Constructor_ {#ssl.SSLv23ServerContext.SSLv23ServerContext}

  : ssl.SSLv23ServerContext constructor






