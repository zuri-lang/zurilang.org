# socket
This module provides access to the underlying system socket management 
implementations. It is meant to be used to provide more controlled and 
specific operating system features and for implementing various standard 
and custom network protocols and specifications for which Zuri does not 
provide a built-in implementation for.

This module defines a lot of constant that whose value complies with the 
operating system specification and they should be used instead of a finite 
value wherever available as values for these constants can change across 
different OS implementations.

### What's a Socket

Sockets are bidirectional communication medias for information exchange between
various processes within the same machine or different machines.

There are three important concepts that must important to know when working with 
sockets.

1. `Family`: This refer to the general group of sockets that a specific 
protocol handled by a socket belongs to. This is any of the `AF_` constants.
2. `Types`: The type of communication between the two processes involved. And can 
only be one of `SOCK_STREAM` or `SOCK_DGRAM`.
3. `Protocol`: This is to identify the variant protocol on which one or more 
network protocols are based on. Typically `0` or any of the `IP_` constants.

A simple socket may be instantiated as follows:

```zuri
import socket { Socket }
var sock = Socket()
```
> The `{ Socket }` in the import statement means we are only importing the `Socket` 
> class and not the entire `socket` module. Other examples here will skip the assume 
> you are importing just what you need out of the package but will not show the import 
> statement.

The example above instantiates a socket without any arguments, and it is equivalent to:

```zuri
Socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
```

You can establish a connection with another socket with a known address and port 
as follows:

```zuri
var socket = Socket()
socket.connect('127.0.0.1', 4000)
```

The above example connects to the process listening at port 4000 on host with IP 
address 127.0.0.1. A connection is a pre-requisite to writing or reading from a socket.

After connecting to a socket, you can read and write data as follows:

```zuri
var socket = Socket()
socket.connect('127.0.0.1', 4000)

var message_from_client = socket.receive()
socket.send('You sent: ' + message_from_client)
```

The above example simply replies the client with `You sent: ` + whatever the client 
actually sent.

Due to resource limitations, its good practice to always ensure to close sockets when 
done with it. Doing this is pretty simple.

```zuri
socket.close()
```

## Fields

_socket_.**SOCK\_STREAM** {#socket.SOCK_STREAM}
: stream socket

_socket_.**SOCK\_DGRAM** {#socket.SOCK_DGRAM}
: datagram socket

_socket_.**SOCK\_RAW** {#socket.SOCK_RAW}
: raw-protocol interface

_socket_.**SOCK\_RDM** {#socket.SOCK_RDM}
: reliably-delivered message

_socket_.**SOCK\_SEQPACKET** {#socket.SOCK_SEQPACKET}
: sequenced packet stream

_socket_.**SO\_DEBUG** {#socket.SO_DEBUG}
: Turn on debugging info recording

_socket_.**SO\_ACCEPTCONN** {#socket.SO_ACCEPTCONN}
: Socket has had listen()

_socket_.**SO\_REUSEADDR** {#socket.SO_REUSEADDR}
: Allow local address reuse

_socket_.**SO\_KEEPALIVE** {#socket.SO_KEEPALIVE}
: Keep connections alive

_socket_.**SO\_DONTROUTE** {#socket.SO_DONTROUTE}
: Just use interface addresses

_socket_.**SO\_BROADCAST** {#socket.SO_BROADCAST}
: Permit sending of broadcast msgs

_socket_.**SO\_USELOOPBACK** {#socket.SO_USELOOPBACK}
: Bypass hardware when possible

_socket_.**SO\_LINGER** {#socket.SO_LINGER}
: Linger on close if data present (in ticks)

_socket_.**SO\_OOBINLINE** {#socket.SO_OOBINLINE}
: Leave received OOB data in line

_socket_.**SO\_REUSEPORT** {#socket.SO_REUSEPORT}
: Allow local address & port reuse

_socket_.**SO\_TIMESTAMP** {#socket.SO_TIMESTAMP}
: Timestamp received dgram traffic

_socket_.**SO\_SNDBUF** {#socket.SO_SNDBUF}
: Send buffer size

_socket_.**SO\_RCVBUF** {#socket.SO_RCVBUF}
: Receive buffer size

_socket_.**SO\_SNDLOWAT** {#socket.SO_SNDLOWAT}
: Send low-water mark

_socket_.**SO\_RCVLOWAT** {#socket.SO_RCVLOWAT}
: Receive low-water mark

_socket_.**SO\_SNDTIMEO** {#socket.SO_SNDTIMEO}
: Send timeout

_socket_.**SO\_RCVTIMEO** {#socket.SO_RCVTIMEO}
: Receive timeout

_socket_.**SO\_ERROR** {#socket.SO_ERROR}
: Get error status and clear

_socket_.**SO\_TYPE** {#socket.SO_TYPE}
: Get socket type

_socket_.**SOL\_SOCKET** {#socket.SOL_SOCKET}
: Options for socket level

_socket_.**AF\_UNSPEC** {#socket.AF_UNSPEC}
: Unspecified

_socket_.**AF\_UNIX** {#socket.AF_UNIX}
: Local to host (pipes)

_socket_.**AF\_LOCAL** {#socket.AF_LOCAL}
: Backward compatibility with AF_UNIX

_socket_.**AF\_INET** {#socket.AF_INET}
: Internetwork: UDP, TCP, etc.

_socket_.**AF\_IMPLINK** {#socket.AF_IMPLINK}
: Arpanet imp addresses

_socket_.**AF\_PUP** {#socket.AF_PUP}
: PUP protocols: e.g. BSP

_socket_.**AF\_CHAOS** {#socket.AF_CHAOS}
: MIT CHAOS protocols

_socket_.**AF\_NS** {#socket.AF_NS}
: XEROX NS protocols

_socket_.**AF\_ISO** {#socket.AF_ISO}
: ISO protocols

_socket_.**AF\_OSI** {#socket.AF_OSI}
: ISO protocols (same as AF_ISO)

_socket_.**AF\_ECMA** {#socket.AF_ECMA}
: European computer manufacturers

_socket_.**AF\_DATAKIT** {#socket.AF_DATAKIT}
: Datakit protocols

_socket_.**AF\_CCITT** {#socket.AF_CCITT}
: CCITT protocols, X.25 etc

_socket_.**AF\_SNA** {#socket.AF_SNA}
: IBM SNA

_socket_.**AF\_DECnet** {#socket.AF_DECnet}
: DECnet

_socket_.**AF\_DLI** {#socket.AF_DLI}
: DEC Direct data link interface

_socket_.**AF\_LAT** {#socket.AF_LAT}
: LAT

_socket_.**AF\_HYLINK** {#socket.AF_HYLINK}
: NSC Hyperchannel

_socket_.**AF\_APPLETALK** {#socket.AF_APPLETALK}
: Apple Talk

_socket_.**AF\_INET6** {#socket.AF_INET6}
: IPv6

_socket_.**IPPROTO\_IP** {#socket.IPPROTO_IP}
: IPPROTO_IP

_socket_.**IPPROTO\_ICMP** {#socket.IPPROTO_ICMP}
: IPPROTO_ICMP

_socket_.**IPPROTO\_IGMP** {#socket.IPPROTO_IGMP}
: IPPROTO_IGMP

_socket_.**IPPROTO\_IPIP** {#socket.IPPROTO_IPIP}
: IPPROTO_IPIP

_socket_.**IPPROTO\_TCP** {#socket.IPPROTO_TCP}
: IPPROTO_TCP

_socket_.**IPPROTO\_EGP** {#socket.IPPROTO_EGP}
: IPPROTO_EGP

_socket_.**IPPROTO\_PUP** {#socket.IPPROTO_PUP}
: IPPROTO_PUP

_socket_.**IPPROTO\_UDP** {#socket.IPPROTO_UDP}
: IPPROTO_UDP

_socket_.**IPPROTO\_IDP** {#socket.IPPROTO_IDP}
: IPPROTO_IDP

_socket_.**IPPROTO\_TP** {#socket.IPPROTO_TP}
: IPPROTO_TP

_socket_.**IPPROTO\_DCCP** {#socket.IPPROTO_DCCP}
: IPPROTO_DCCP

_socket_.**IPPROTO\_IPV6** {#socket.IPPROTO_IPV6}
: IPPROTO_IPV6

_socket_.**IPPROTO\_RSVP** {#socket.IPPROTO_RSVP}
: IPPROTO_RSVP

_socket_.**IPPROTO\_GRE** {#socket.IPPROTO_GRE}
: IPPROTO_GRE

_socket_.**IPPROTO\_ESP** {#socket.IPPROTO_ESP}
: IPPROTO_ESP

_socket_.**IPPROTO\_AH** {#socket.IPPROTO_AH}
: IPPROTO_AH

_socket_.**IPPROTO\_MTP** {#socket.IPPROTO_MTP}
: IPPROTO_MTP

_socket_.**IPPROTO\_BEETPH** {#socket.IPPROTO_BEETPH}
: IPPROTO_BEETPH

_socket_.**IPPROTO\_ENCAP** {#socket.IPPROTO_ENCAP}
: IPPROTO_ENCAP

_socket_.**IPPROTO\_PIM** {#socket.IPPROTO_PIM}
: IPPROTO_PIM

_socket_.**IPPROTO\_COMP** {#socket.IPPROTO_COMP}
: IPPROTO_COMP

_socket_.**IPPROTO\_SCTP** {#socket.IPPROTO_SCTP}
: IPPROTO_SCTP

_socket_.**IPPROTO\_UDPLITE** {#socket.IPPROTO_UDPLITE}
: IPPROTO_UDPLITE

_socket_.**IPPROTO\_MPLS** {#socket.IPPROTO_MPLS}
: IPPROTO_MPLS

_socket_.**IPPROTO\_RAW** {#socket.IPPROTO_RAW}
: IPPROTO_RAW

_socket_.**IPPROTO\_MAX** {#socket.IPPROTO_MAX}
: IPPROTO_MAX

_socket_.**SHUT\_RD** {#socket.SHUT_RD}
: Shut down the reading side

_socket_.**SHUT\_WR** {#socket.SHUT_WR}
: Shut down the writing side

_socket_.**SHUT\_RDWR** {#socket.SHUT_RDWR}
: Shut down both sides

_socket_.**SOMAXCONN** {#socket.SOMAXCONN}
: Maximum queue length specifiable by listen.

_socket_.**IP\_ANY** &#x279D; _string_ {#socket.IP_ANY}
: The non-designated address used to represent "no particular address"
  (also referred to as "any address")

_socket_.**IP\_LOCAL** &#x279D; _string_ {#socket.IP_LOCAL}
: The loopback address (also known as localhost).


## Functions

_socket_.get\_address\_info(_address_, _type_, _family_) {#socket.get_address_info}

: Returns ip and name information of a given address.


  - **@params**:
    - _number_ **address**
    - _string?_ **type** Default value is `http`

    - _int?_ **family** Default value is [AF_INET]


  {.params}
  - **@returns**: _dictionary_
  {.returns}



_socket_.socket(_family_, _type_, _protocol_) &#x279D; _Exported_ {#socket.socket}

: Returns a new instance of a Socket.


  - **@params**:
    - _number_ **family**
    - _number?_ **type**
    - _number?_ **protocol**

  {.params}
  - **@returns**: _Socket_
  {.returns}



## Classes

_class_ **SocketException** < _Exception_ {#socket.SocketException .class}

: The SocketException class is the general Exception type thrown from sockets




_class_ **Socket** {#socket.Socket .class}

: The Socket class provides interface for working with Socket clients
  and servers.


    __@printable__
    {.class-props}

  **.host** &#x279D; _string_ {#socket.Socket.host}
  : This property holds the host bound, to be bound to or connected to by the current socket.
    Whenever a host is not given, the host will default to localhost.

  **.port** &#x279D; _int_ {#socket.Socket.port}
  : The port currently bound or connected to by the socket.

  **.family** &#x279D; _int_ {#socket.Socket.family}
  : The socket family (which must be one of the `AF_` variables).
    The default family for the socket is AF_INET.

  **.type** &#x279D; _int_ {#socket.Socket.type}
  : The type of socket stream used by the socket.
    The default socket type is `SOCK_STREAM`.

  **.protocol** &#x279D; _int_ {#socket.Socket.protocol}
  : The current operating protocol of the socket that controls the 
    underlying behavior of the socket. The default is `IPPROTO_TCP`.

  **.id** &#x279D; _int_ {#socket.Socket.id}
  : The file descriptor id of the current socket on the host machine.

  **.is\_client** &#x279D; _bool_ {#socket.Socket.is_client}
  : `true` when the socket is a client to a server socket, `false` otherwise.

  **.is\_bound** &#x279D; _bool_ {#socket.Socket.is_bound}
  : `true` when the socket is bound to a given port on the device, `false` 
    otherwise.

  **.is\_connected** &#x279D; _bool_ {#socket.Socket.is_connected}
  : `true` when the socket is connected to a server socket, `false` otherwise.

  **.is\_listening** &#x279D; _bool_ {#socket.Socket.is_listening}
  : `true` when the socket is currently listening on a host device port as a 
    server, `false` otherwise.

  **.is\_closed** &#x279D; _bool_ {#socket.Socket.is_closed}
  : `true` when the socket is closed, `false` otherwise.

  **.is\_shutdown** &#x279D; _bool_ {#socket.Socket.is_shutdown}
  : `true` when the socket is shutdown, `false` otherwise.

  **.is\_blocking** &#x279D; _bool_ {#socket.Socket.is_blocking}
  : `true` when the socket is running in a blocking mode, `false` otherwise.

  **.shutdown\_reason** &#x279D; _int_ {#socket.Socket.shutdown_reason}
  : The property holds the reason for which the last `shutdown` operation 
    was called or `-1` if `shutdown` was never requested.

  **.send\_timeout** &#x279D; _int_ {#socket.Socket.send_timeout}
  : The amount of time in milliseconds that the socket waits before it 
    terminates a `send` operation. This is equal to the `SO_SNDTIMEO`.

  **.receive\_timeout** &#x279D; _int_ {#socket.Socket.receive_timeout}
  : The amount of time in milliseconds that the socket waits before it 
    terminates a `receive` operation. This is equal to the `SO_RCVTIMEO`.


  .Socket(_family_, _type_, _protocol_, _id_) &#x279D; _Constructor_ {#socket.Socket.Socket}

  : socket.Socket constructor


    - **@params**:
      - _number_ **family**
      - _number?_ **type**
      - _number?_ **protocol**

    {.params}


  .connect(_host_, _port_, _timeout_) {#socket.Socket.connect}

  : Initiates a connection to the given host on the specified port. If host is `nil`, it will 
    connect on to the current hostn specified on the socket.


    - **@params**:
      - _string_ **host**
      - _int_ **port**
      - _int?_ **timeout** Defaults to 300,000ms (i.e. 300 seconds)


    {.params}
    - **@returns**: _bool_
    {.returns}


  .bind(_port_, _host_) {#socket.Socket.bind}

  : Binds this socket to the given port on the given host. If host is `nil` or not specified, it will connect 
    on to the current hostn specified on the socket.


    - **@params**:
      - _int_ **port**
      - _string?_ **host**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .send(_message_, _flags_) {#socket.Socket.send}

  : Sends the specified message to the socket. When this methods accepts a file as a message, 
    the file is read and the resultant bytes of the file content is streamed to the socket.


    - **@params**:
      - _string|file|bytes|?_ **message**
      - _int?_ **flags** Not currently used.


    {.params}
    - **@returns**: _number greater than -1 if successful indicating the total number of bytes sent or -1 if it fails._
    {.returns}


  .receive(_length_, _flags_) {#socket.Socket.receive}

  : Receives bytes of the given length from the socket. If the length is not given, it default length of 
    -1 indicating that the total available data on the socket stream will be read. 
    If no data is available for read on the socket, the socket will wait to receive data or until the 
    `receive_timeout` which is also equal to the `SO_RCVTIMEO` setting of the socket has elapsed before or 
    until it has received the total number of bytes required (whichever comes first).


    - **@params**:
      - _int?_ **length**
      - _int?_ **flags** Not currently used.


    {.params}
    - **@returns**: _string_
    {.returns}


  .read(_length_) {#socket.Socket.read}

  : Reads bytes of the given length from the socket. If the length is not given, it default length of 
    -1 indicating that the total available data on the socket stream will be read. 
    
    > This method differs from `receive()` in that it does not check for a socket having data to 
    > read or not and will block until data of _length_ have been read or no more data is available for 
    > reading.


    > **@notes**:
    > 
    > - Only use this function after a call to `receive()` has succeeded.

    - **@params**:
      - _int?_ **length** Default value is `1024`


    {.params}
    - **@returns**: _string_
    {.returns}


  .listen(_queue_length_) {#socket.Socket.listen}

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
    > - listen() call applies only to sockets of type `SOCK_STREAM` (which is the default)

    - **@params**:
      - _int?_ **queue_length**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .accept() {#socket.Socket.accept}

  : Accepts a connection on a socket
    
    This method extracts the first connection request on the queue of pending connections, creates a new socket 
    with the same properties of the current socket, and allocates a new file descriptor for the socket.  If no 
    pending connections are present on the queue, and the socket is not marked as non-blocking, accept() blocks 
    the caller until a connection is present.  If the socket is marked non-blocking and no pending connections 
    are present on the queue, accept() returns an error as described below.  
    
    The accepted socket may not be used to accept more connections.
    The original socket remains open.


    - **@returns**: _Socket_
    {.returns}


  .close() {#socket.Socket.close}

  : Closes the socket.


    - **@returns**: _bool_
    {.returns}


  .shutdown(_how_) {#socket.Socket.shutdown}

  : The shutdown() call causes all or part of a full-duplex connection on the socket associated with 
    socket to be shut down.  If how is `SHUT_RD`, further receives will be disallowed.  If how is `SHUT_WR`, 
    further sends will be disallowed.  If how is `SHUT_RDWR`, further sends and receives will be disallowed.
    
    When _how_ is not specified, it defaults to `SHUT_RD`.


    - **@params**:
      - _int?_ **how**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .set\_option(_option_, _value_) {#socket.Socket.set_option}

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


  .get\_option(_option_) {#socket.Socket.get_option}

  : Gets the options set on the current socket


    - **@params**:
      - _int_ **option**

    {.params}
    - **@returns**: _any_
    {.returns}


  .set\_blocking(_mode_) {#socket.Socket.set_blocking}

  : Sets if the socket should operate in blocking or non-blocking mode. `true` for blocking 
    (default) and `false` for non-blocking.


    - **@params**:
      - _bool_ **mode**

    {.params}


  .info() {#socket.Socket.info}

  : Returns a dictionary containing the address, ipv6, port and family of the current 
    socket or an empty dictionary if the socket information could not be retrieved.


    - **@returns**: _dictionary_
    {.returns}




