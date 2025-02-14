# socket
This module provides access to the underlying system socket management 
implementations. It is meant to be used to provide more controlled and 
specific operating system features and for implementing various standard 
and custom network protocols and specifications for which Blade does not 
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

```blade
import socket { Socket }
var sock = Socket()
```
> The `{ Socket }` in the import statement means we are only importing the `Socket` 
> class and not the entire `socket` module. Other examples here will skip the assume 
> you are importing just what you need out of the package but will not show the import 
> statement.

The example above instantiates a socket without any arguments, and it is equivalent to:

```blade
Socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
```

You can establish a connection with another socket with a known address and port 
as follows:

```blade
var socket = Socket()
socket.connect('127.0.0.1', 4000)
```

The above example connects to the process listening at port 4000 on host with IP 
address 127.0.0.1. A connection is a pre-requisite to writing or reading from a socket.

After connecting to a socket, you can read and write data as follows:

```blade
var socket = Socket()
socket.connect('127.0.0.1', 4000)

var message_from_client = socket.receive()
socket.send('You sent: ' + message_from_client)
```

The above example simply replies the client with `You sent: ` + whatever the client 
actually sent.

Due to resource limitations, its good practice to always ensure to close sockets when 
done with it. Doing this is pretty simple.

```blade
socket.close()
```

## Fields

**SOCK\_STREAM**
:  stream socket

**SOCK\_DGRAM**
:  datagram socket

**SOCK\_RAW**
:  raw-protocol interface

**SOCK\_RDM**
:  reliably-delivered message

**SOCK\_SEQPACKET**
:  sequenced packet stream

**SO\_DEBUG**
:  Turn on debugging info recording

**SO\_ACCEPTCONN**
:  Socket has had listen()

**SO\_REUSEADDR**
:  Allow local address reuse

**SO\_KEEPALIVE**
:  Keep connections alive

**SO\_DONTROUTE**
:  Just use interface addresses

**SO\_BROADCAST**
:  Permit sending of broadcast msgs

**SO\_USELOOPBACK**
:  Bypass hardware when possible

**SO\_LINGER**
:  Linger on close if data present (in ticks)

**SO\_OOBINLINE**
:  Leave received OOB data in line

**SO\_REUSEPORT**
:  Allow local address & port reuse

**SO\_TIMESTAMP**
:  Timestamp received dgram traffic

**SO\_SNDBUF**
:  Send buffer size

**SO\_RCVBUF**
:  Receive buffer size

**SO\_SNDLOWAT**
:  Send low-water mark

**SO\_RCVLOWAT**
:  Receive low-water mark

**SO\_SNDTIMEO**
:  Send timeout

**SO\_RCVTIMEO**
:  Receive timeout

**SO\_ERROR**
:  Get error status and clear

**SO\_TYPE**
:  Get socket type

**SOL\_SOCKET**
:  Options for socket level

**AF\_UNSPEC**
:  Unspecified

**AF\_UNIX**
:  Local to host (pipes)

**AF\_LOCAL**
:  Backward compatibility with AF_UNIX

**AF\_INET**
:  Internetwork: UDP, TCP, etc.

**AF\_IMPLINK**
:  Arpanet imp addresses

**AF\_PUP**
:  PUP protocols: e.g. BSP

**AF\_CHAOS**
:  MIT CHAOS protocols

**AF\_NS**
:  XEROX NS protocols

**AF\_ISO**
:  ISO protocols

**AF\_OSI**
:  ISO protocols (same as AF_ISO)

**AF\_ECMA**
:  European computer manufacturers

**AF\_DATAKIT**
:  Datakit protocols

**AF\_CCITT**
:  CCITT protocols, X.25 etc

**AF\_SNA**
:  IBM SNA

**AF\_DECnet**
:  DECnet

**AF\_DLI**
:  DEC Direct data link interface

**AF\_LAT**
:  LAT

**AF\_HYLINK**
:  NSC Hyperchannel

**AF\_APPLETALK**
:  Apple Talk

**AF\_INET6**
:  IPv6

**IPPROTO\_IP**
:  IPPROTO_IP

**IPPROTO\_ICMP**
:  IPPROTO_ICMP

**IPPROTO\_IGMP**
:  IPPROTO_IGMP

**IPPROTO\_IPIP**
:  IPPROTO_IPIP

**IPPROTO\_TCP**
:  IPPROTO_TCP

**IPPROTO\_EGP**
:  IPPROTO_EGP

**IPPROTO\_PUP**
:  IPPROTO_PUP

**IPPROTO\_UDP**
:  IPPROTO_UDP

**IPPROTO\_IDP**
:  IPPROTO_IDP

**IPPROTO\_TP**
:  IPPROTO_TP

**IPPROTO\_DCCP**
:  IPPROTO_DCCP

**IPPROTO\_IPV6**
:  IPPROTO_IPV6

**IPPROTO\_RSVP**
:  IPPROTO_RSVP

**IPPROTO\_GRE**
:  IPPROTO_GRE

**IPPROTO\_ESP**
:  IPPROTO_ESP

**IPPROTO\_AH**
:  IPPROTO_AH

**IPPROTO\_MTP**
:  IPPROTO_MTP

**IPPROTO\_BEETPH**
:  IPPROTO_BEETPH

**IPPROTO\_ENCAP**
:  IPPROTO_ENCAP

**IPPROTO\_PIM**
:  IPPROTO_PIM

**IPPROTO\_COMP**
:  IPPROTO_COMP

**IPPROTO\_SCTP**
:  IPPROTO_SCTP

**IPPROTO\_UDPLITE**
:  IPPROTO_UDPLITE

**IPPROTO\_MPLS**
:  IPPROTO_MPLS

**IPPROTO\_RAW**
:  IPPROTO_RAW

**IPPROTO\_MAX**
:  IPPROTO_MAX

**SHUT\_RD**
:  Shut down the reading side

**SHUT\_WR**
:  Shut down the writing side

**SHUT\_RDWR**
:  Shut down both sides

**SOMAXCONN**
:  Maximum queue length specifiable by listen.

**IP\_ANY** &#8674; _string_
:  The non-designated address used to represent "no particular address"
  (also referred to as "any address")

**IP\_LOCAL** &#8674; _string_
:  The loopback address (also known as localhost).


## Functions

get\_address\_info(_address_, _type_, _family_) {#socket.get_address_info}

: Returns ip and name information of a given address.


  - **@params**:
    - _number_ **address**
    - _string?_ **type** : Default value is `http`

    - _int?_ **family** : Default value is [AF_INET]


  {.params}
  - **@returns**: _dictionary_



socket(_family_, _type_, _protocol_) &#8674; Exported {#socket.socket}

: Returns a new instance of a Socket.


  - **@params**:
    - _number_ **family**
    - _number?_ **type**
    - _number?_ **protocol**

  {.params}
  - **@returns**: _Socket_



## Classes

_class_ **SocketException** < _Exception_ {#socket.SocketException .class}

: The SocketException class is the general Exception type thrown from sockets




_class_ **Socket** {#socket.Socket .class}

: The Socket class provides interface for working with Socket clients
  and servers.


  ~ Properties

    - __@printable__

  **.host** &#8674; _string_
  :  This property holds the host bound, to be bound to or connected to by the current socket.
    Whenever a host is not given, the host will default to localhost.

  **.port** &#8674; _int_
  :  The port currently bound or connected to by the socket.

  **.family** &#8674; _int_
  :  The socket family (which must be one of the `AF_` variables).
    The default family for the socket is AF_INET.

  **.type** &#8674; _int_
  :  The type of socket stream used by the socket.
    The default socket type is `SOCK_STREAM`.

  **.protocol** &#8674; _int_
  :  The current operating protocol of the socket that controls the 
    underlying behavior of the socket. The default is `IPPROTO_TCP`.

  **.id** &#8674; _int_
  :  The file descriptor id of the current socket on the host machine.

  **.is\_client** &#8674; _bool_
  :  `true` when the socket is a client to a server socket, `false` otherwise.

  **.is\_bound** &#8674; _bool_
  :  `true` when the socket is bound to a given port on the device, `false` 
    otherwise.

  **.is\_connected** &#8674; _bool_
  :  `true` when the socket is connected to a server socket, `false` otherwise.

  **.is\_listening** &#8674; _bool_
  :  `true` when the socket is currently listening on a host device port as a 
    server, `false` otherwise.

  **.is\_closed** &#8674; _bool_
  :  `true` when the socket is closed, `false` otherwise.

  **.is\_shutdown** &#8674; _bool_
  :  `true` when the socket is shutdown, `false` otherwise.

  **.is\_blocking** &#8674; _bool_
  :  `true` when the socket is running in a blocking mode, `false` otherwise.

  **.shutdown\_reason** &#8674; _int_
  :  The property holds the reason for which the last `shutdown` operation 
    was called or `-1` if `shutdown` was never requested.

  **.send\_timeout** &#8674; _int_
  :  The amount of time in milliseconds that the socket waits before it 
    terminates a `send` operation. This is equal to the `SO_SNDTIMEO`.

  **.receive\_timeout** &#8674; _int_
  :  The amount of time in milliseconds that the socket waits before it 
    terminates a `receive` operation. This is equal to the `SO_RCVTIMEO`.


  .Socket(_family_, _type_, _protocol_, _id_) &#8674; Constructor {#socket.Socket.Socket}

  : - **@params**:
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
      - _int?_ **timeout** : Defaults to 300,000ms (i.e. 300 seconds)


    {.params}
    - **@returns**: _bool_


  .bind(_port_, _host_) {#socket.Socket.bind}

  : Binds this socket to the given port on the given host. If host is `nil` or not specified, it will connect 
    on to the current hostn specified on the socket.


    - **@params**:
      - _int_ **port**
      - _string?_ **host**

    {.params}
    - **@returns**: _bool_


  .send(_message_, _flags_) {#socket.Socket.send}

  : Sends the specified message to the socket. When this methods accepts a file as a message, 
    the file is read and the resultant bytes of the file content is streamed to the socket.


    - **@params**:
      - _string|file|bytes|?_ **message**
      - _int?_ **flags** : Not currently used.


    {.params}
    - **@returns**: _number greater than -1 if successful indicating the total number of bytes sent or -1 if it fails._


  .receive(_length_, _flags_) {#socket.Socket.receive}

  : Receives bytes of the given length from the socket. If the length is not given, it default length of 
    -1 indicating that the total available data on the socket stream will be read. 
    If no data is available for read on the socket, the socket will wait to receive data or until the 
    `receive_timeout` which is also equal to the `SO_RCVTIMEO` setting of the socket has elapsed before or 
    until it has received the total number of bytes required (whichever comes first).


    - **@params**:
      - _int?_ **length**
      - _int?_ **flags** : Not currently used.


    {.params}
    - **@returns**: _string_


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
      - _int?_ **length** : Default value is `1024`


    {.params}
    - **@returns**: _string_


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


  .close() {#socket.Socket.close}

  : Closes the socket.


    - **@returns**: _bool_


  .shutdown(_how_) {#socket.Socket.shutdown}

  : The shutdown() call causes all or part of a full-duplex connection on the socket associated with 
    socket to be shut down.  If how is `SHUT_RD`, further receives will be disallowed.  If how is `SHUT_WR`, 
    further sends will be disallowed.  If how is `SHUT_RDWR`, further sends and receives will be disallowed.
    
    When _how_ is not specified, it defaults to `SHUT_RD`.


    - **@params**:
      - _int?_ **how**

    {.params}
    - **@returns**: _bool_


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


  .get\_option(_option_) {#socket.Socket.get_option}

  : Gets the options set on the current socket


    - **@params**:
      - _int_ **option**

    {.params}
    - **@returns**: _any_


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




