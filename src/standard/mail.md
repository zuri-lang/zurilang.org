# mail

The module provides interfaces for sending and reading electronic mails and provides 
implementation for the SMTP, IMAP and POP3 mail exchange protocols.

## Properties

- **TLS\_NONE**:

  Do not attempt to use SSL.

- **TLS\_TRY**:

  Try using SSL, proceed as normal otherwise. Note that server 
may close the connection if the negotiation does not succeed.

- **TLS\_CONTROL**:

  Require SSL for the control connection or fail.

- **TLS\_ALL**:

  Require SSL for all communication or fail.


## Functions

#### parse(message)

Parses email messages and return an instance of Mail representing it.

##### Parameters

- _string_ **message**

##### Returns

- Mail



#### smtp(options)

Returns a new instance of SMTP {Transport} with the given __options__.

##### Parameters

- _{dict?}_ **options**: See {Transport}

##### Returns

- Transport



#### pop3(options) &#8674; Exported

Returns a new instance of the POP3 class with the given options (if any) passed 
to the constructor.

##### Returns

- POP3



#### imap(options) &#8674; Exported

Returns a new instance of the Imap class with the given options (if any) passed 
to the constructor.

##### Returns

- Imap



#### message() &#8674; Exported

Returns a new instance of {Message}.

##### Returns

- Message



## Classes

### _class_ Attachment

Attachment class is used to hold the information of attachments in the 
message.



#### Properties

 - __@printable__
 - __@serializable__

#### Methods

#### Attachment(headers, content) &#8674; Constructor



##### Parameters

- _dict_ **headers**
- _string_ **content**



### _class_ Mail

The Mail class represents a mail message as a blade object with the following 
properties.

- __headers__: A dictionary containing the key/value pair contained in the 
   mail message header.
- __body__: A dictionary containing the different segments of a mail body such
   as its plain text and html counterpart.
- __attachments__: A list of attachments contained in the Mail message.



#### Properties

 - __@printable__
 - __@serializable__

#### Methods

#### Mail(headers, body, attachments) &#8674; Constructor



##### Parameters

- _dict_ **headers**
- _dict_ **body**
- _list[Attachment]_ **attachments**



### _class_ Transport

Transport class can be used to send email messages through an SMTP server.

The class constructor takes a single argument options, which should be a 
dictionary containing various options for the connection. If the options 
are not provided or are not a dictionary, the constructor will raise an 
exception. 

The class uses the options to set various properties such as the host and 
port of the SMTP server, the username and password for authentication, and 
various options for connecting to the server such as the use of TLS, and 
timeout.

#### Methods

#### Transport(options) &#8674; Constructor

The Transport class accepts a dictionary that can be used to configure how 
it behaves. The dictionary can contain one or more of the following.

- __host__: The host address of the SMTP server. (Default: localhost)
- __port__: The port number of the SMTP server. (Default: 465)
- __username__: The access username for the SMTP user.
- __password__: The password for the connection user.
- __tls__: The TLS mode of the connection. One of {TLS_TRY} (default), {TLS_CONTROL}, 
   {TLS_ALL} or {TLS_NONE}.
- __debug__: Whether to print debug information or not. (Default: false)
- __verify_peer__: If the peer certificate should be verified or not. (Default: false)
- __verify_host__: If the host certificate should be verified or not. (Default: false)
- __proxy__: The address of the proxy server if any.
- __proxy_username__: The username for the proxy connection.
- __proxy_password__: The password for the user of the proxy connection.
- __verify_proxy_peer__: If the peer certificate of the proxy should be verified or 
   not. (Default: The value of __verify_peer__)
- __verify_proxy_host__: If the host certificate of the proxy should be verified or 
   not. (Default: The value of __verify_host__)
- __timeout__: The request timeout in milliseconds. (Default: 30,000)

##### Parameters

- _dict?_ **options**


#### add\_message(message)

Adds an email message to the list of messages to be sent.

##### Parameters

- _Message_ **message**

##### Returns

- Transport

#### test\_connection()

Tests the connection to the SMTP server

##### Returns

- bool

#### verify(address)

Verifies an email address

##### Parameters

- _string_ **address**

##### Returns

- bool

#### send()

Send the email messages and returns `true` if the message was successfully 
sent or `false` otherwise.

##### Returns

- bool



### _class_ POP3

The POP3 class provides an interface for connecting to an POP3 (Post Office Protocol) server 
and interacting with the server via the POP3 protocol.

This class includes operations for creating, deleting, and renaming mailboxes, checking for new 
messages, permanently removing messages, setting and clearing flags searching, and selective 
fetching of message attributes, texts, and portions.

#### Methods

#### POP3(options) &#8674; Constructor

The POP3 class accepts a dictionary that can be used to configure how 
it behaves. The dictionary can contain one or more of the following.

- __host__: The host address of the POP3 server. (Default: localhost)
- __port__: The port number of the POP3 server. (Default: 110)
- __username__: The access username for the POP3 user.
- __password__: The password for the connection user.
- __tls__: The TLS mode of the connection. One of {TLS_TRY} (default), {TLS_CONTROL}, 
   {TLS_ALL} or {TLS_NONE}.
- __debug__: Whether to print debug information or not. (Default: false)
- __verify_peer__: If the peer certificate should be verified or not. (Default: false)
- __verify_host__: If the host certificate should be verified or not. (Default: false)
- __proxy__: The address of the proxy server if any.
- __proxy_username__: The username for the proxy connection.
- __proxy_password__: The password for the user of the proxy connection.
- __verify_proxy_peer__: If the peer certificate of the proxy should be verified or 
   not. (Default: The value of __verify_peer__)
- __verify_proxy_host__: If the host certificate of the proxy should be verified or 
   not. (Default: The value of __verify_host__)
- __timeout__: The request timeout in milliseconds. (Default: 30,000)

##### Parameters

- _dict?_ **options**


#### exec(command, path, no_transfer)

Executes an POP3 command.




   as response response. Default `false`.

##### Parameters

- _string_ **command**: The command to execute.
- _string?_ **path**: The path segment of the request url.
- _bool?_ **no_transfer**: Set to `true` if the command will return the requested data 

##### Returns

- string The response from the server.

#### list(uid)

Returns a list of dictionaries containing the `uid` and `size` of each message in the 
mail if the _uid_ argument is not given or the content of the message identified by the 
given _uid_.

##### Parameters

- _number?_ **uid**

##### Returns

- list[dictionary]|string

#### uid\_list()

Returns a list of dictionaries containing the `uid` and `id` for every message in the mailbox 
based on their unique ids.

##### Returns

- list[dictionary]

#### retr(uid)

Retrieves the whole message with the specified _uid_.

##### Parameters

- _number_ **uid**

##### Returns

- string

#### stat()

Returns a dictionary containing the message `count` and `size` of the mailbox.

##### Returns

- dictionary

#### delete(uid)

Instructs the POP3 server to mark the message _uid_ as deleted. Any future reference 
to the message-number associated with the message in a POP3 command generates an error.  
The POP3 server does not actually delete the message until the POP3 session enters the 
UPDATE state.

##### Parameters

- _number_ **uid**


#### noop()

Does nothing. It merely ask the server to reply with a positive response.

##### Notes

- It's useful for a keep-alive.

#### rset()

Instructs the server to unmark any messages have been marked as deleted.


#### top(uid, count)

Retrieves the header for the message identified by `uid` plus `count` lines 
of the message after the header of message.

##### Parameters

- _number_ **uid**
- _number?_ **count**: (Default: 0)

##### Returns

- string

#### quit()

Closes the current POP3 session and disposes all associated network handles.


#### get\_handle()

Returns the raw handle to the underlying networking (curl) client.



### _class_ Imap

The Imap class provides an interface for connecting to an IMAP (Internet Mail Access Protocol) 
server and interacting with the server via the IMAP protocol.

This class includes operations for creating, deleting, and renaming mailboxes, checking for new 
messages, permanently removing messages, setting and clearing flags searching, and selective 
fetching of message attributes, texts, and portions.

#### Methods

#### Imap(options) &#8674; Constructor

The Imap class accepts a dictionary that can be used to configure how 
it behaves. The dictionary can contain one or more of the following.

- __host__: The host address of the Imap server. (Default: localhost)
- __port__: The port number of the Imap server. (Default: 143)
- __username__: The access username for the Imap user.
- __password__: The password for the connection user.
- __tls__: The TLS mode of the connection. One of {TLS_TRY} (default), {TLS_CONTROL}, 
   {TLS_ALL} or {TLS_NONE}.
- __debug__: Whether to print debug information or not. (Default: false)
- __verify_peer__: If the peer certificate should be verified or not. (Default: false)
- __verify_host__: If the host certificate should be verified or not. (Default: false)
- __proxy__: The address of the proxy server if any.
- __proxy_username__: The username for the proxy connection.
- __proxy_password__: The password for the user of the proxy connection.
- __verify_proxy_peer__: If the peer certificate of the proxy should be verified or 
   not. (Default: The value of __verify_peer__)
- __verify_proxy_host__: If the host certificate of the proxy should be verified or 
   not. (Default: The value of __verify_host__)
- __timeout__: The request timeout in milliseconds. (Default: 30,000)

##### Parameters

- _dict?_ **options**


#### exec(command, path)

Executes an IMAP command.

##### Parameters

- _string_ **command**: The command to execute.
- _string?_ **path**: The path segment of the request url.

##### Returns

- string The response from the server.

#### get\_dirs(path)

Gets a list of the mailbox directories on the server.

##### Parameters

- _string?_ **path**

##### Returns

- list

#### get\_subscribed\_dirs()

Gets a list of mailbox directories subscribed to by the current 
user on the server.

##### Returns

- list

#### select(name)

Instructs the server that the client now wishes to select a particular mailbox or folder 
with the name _name_, and any commands that relate to a folder should assume this folder 
as the target of that command. For example, an INBOX or a subfolder such as, 
"To Do.This Weekend". Once a mailbox is selected, the state of the connection becomes 
"Selected".

@see https://www.marshallsoft.com/ImapSearch.htm for more help.

##### Parameters

- _string_ **name**

##### Returns

- dictionary

#### examine(name)

This function does the exact same thing as `select()`, except that it selects the folder 
in read-only mode, meaning that no changes can be effected on the folder.

##### Parameters

- _string_ **name**

##### Returns

- dictionary

#### create(name)

Creates a new mailbox or folder with the given name.

##### Parameters

- _string_ **name**

##### Returns

- list

#### delete(name)

Deletes the mailbox or folder with the given name.

##### Parameters

- _string_ **name**

##### Returns

- list

#### rename(old_name, new_name)

Renames a mailbox or folder with the name `old_name` to a the name `new_name`.

##### Parameters

- _string_ **old_name**
- _string_ **new_name**

##### Returns

- list

#### subscribe(name)

Adds the specified mailbox name to the server's set of "active" or "subscribed" 
mailboxes for the current user as returned by `lsub()` and returns `true` if 
successful or `false` otherwise.

##### Parameters

- _string_ **name**

##### Returns

- bool

#### unsubscribe(name)

Removes the specified mailbox name from the server's set of "active" or "subscribed" 
mailboxes for the current user as returned by `lsub()` and returns `true` if successful 
or `false` otherwise.

##### Parameters

- _string_ **name**

##### Returns

- bool

#### list(name, pattern)

Returns a subset of names from the complete set of all names available to the client. 
Zero or more dictionaries are returned, containing the name attributes, hierarchy delimiter, 
and name. 

An empty ("" string) _name_ argument indicates that the mailbox name is interpreted 
as by SELECT. A non-empty _name_ argument is the name of a mailbox or a level of mailbox 
hierarchy, and indicates the context in which the mailbox name is interpreted. 

An empty ("" string) pattern argument is a special request to return the hierarchy delimiter 
and the root name of the name given in the reference.

The pattern character `` is a wildcard, and matches zero or more characters at this position.  
 The character `%` is similar to ``, but it does not match a hierarchy delimiter.  If the `%` 
 wildcard is the last character of a pattern argument, matching levels of hierarchy are also 
returned.  If these levels of hierarchy are not also selectable mailboxes, they are returned 
with the `\Noselect` pattern attribute.

The special name `INBOX` is included in the output from `list()`, if `INBOX` is supported by 
the server for the current user and if the uppercase string "INBOX" matches the interpreted 
reference and pattern arguments with wildcards as described above.  The criteria for omitting 
INBOX is whether `select('INBOX')` will return failure; it is not relevant whether the user's 
real INBOX resides on the server or another.

##### Parameters

- _string_ **name**
- _string?_ **pattern**

##### Returns

- list

#### lsub(name, pattern)

Same as the `list()` function except that it returns a subset of names.

##### Parameters

- _string_ **name**
- _string?_ **pattern**

##### Returns

- list

#### status(name, attrs)

Requests the status of the indicated mailbox. 

It is important to know that unlike the LIST command, the STATUS command is not 
guaranteed to be fast in its response.  Under certain circumstances, it can be 
quite slow.

`attrs` values being one of:

- `MESSAGES`: The number of messages in the mailbox.
- `RECENT`: The number of messages with the \Recent flag set.
- `UIDNEXT`: The next unique identifier value of the mailbox.
- `UIDVALIDITY`: The unique identifier validity value of the mailbox.
- `UNSEEN`: The number of messages which do not have the \Seen flag set.

`attrs` values may be separated by space. e.g. `status('INBOX', 'UIDNEXT MESSAGES')`.

##### Parameters

- _string_ **name**
- _string_ **attrs**

##### Returns

- bool|string

#### append(folder, message)

Appends messages to a mailbox directories such as INBOX or top-level folders 
and returns `true` if it succeeds or `false` otherwise.

> NOTE:
   This isn’t a copy/move command, you must supply a full message body to 
   append.

##### Parameters

- _string_ **folder**
- _Message_ **message**

##### Returns

- bool

#### check()

Requests a checkpoint of the currently selected mailbox.  A checkpoint refers to 
any implementation-dependent housekeeping associated with the mailbox (e.g., 
resolving the server's in-memory state of the mailbox with the state on its disk) 
that is not normally executed as part of each command.  A checkpoint MAY take a 
non-instantaneous amount of real time to complete.  

If a server implementation has no such housekeeping considerations, `check()` is 
equivalent to NOOP.

##### Returns

- bool

#### close()

Permanently removes all messages that have the `\Deleted` flag set from the currently 
selected mailbox, and returns to the authenticated state from the selected state.

No messages are removed, and no error is given, if the mailbox is selected by an 
`examine()` or is otherwise selected read-only.

##### Returns

- bool

#### expunge(path)

Clears the deleted messages in a mailbox folder and returns `true` on 
success or `false` otherwise.

##### Parameters

- _string_ **path**

##### Returns

- bool

#### search(query, folder)

Finds all occurrences of the __query__ in the specified __folder__ and 
return a list of message UIDs that matches the search query.

The __query__ can contain a message sequence set and a number of search 
criteria keywords including flags such as ANSWERED, DELETED, DRAFT, FLAGGED, 
NEW, RECENT and SEEN. For more information about the search criteria please
see RFC-3501 section 6.4.4 for more details.

When __query__ is empty, it defaults to `NEW`. __folder__ defaults to `INBOX`
 when empty.

@see: https://datatracker.ietf.org/doc/html/rfc9051#section-6.4.4 for more.

##### Parameters

- _string?_ **query**
- _string?_ **folder**


#### fetch(uid, path)

Retrieves a message with the give __uid__ in the specified mailbox __path__. If 
the __uid__ is not given, it attempts to retrieve the message with a UID of 1. If 
__path__ is not given, it will attempt to retrieve the message from the `INBOX` 
folder.

##### Parameters

- _number?_ **uid**
- _string?_ **path**


#### copy(id, destination, path)

Copies the specified message(s) to the end of the specified destination mailbox.

##### Returns

- bool
##### Notes

- COPYUID responses are not yet supported

#### store(id, command, flags)

Alters data associated with a message in the mailbox.


   suffix of `.SILENT`.
@see https://datatracker.ietf.org/doc/html/rfc9051#section-6.4.6 for more.

##### Returns

- bool
##### Notes

- command must be one of `FLAGS`, `+FLAGS`, or `-FLAGS`, optionally with a 

#### quit()

Closes the current IMAP session and disposes all associated network handles.


#### get\_handle()

Returns the raw handle to the underlying networking (curl) client.



### _class_ Message

Message class can be used to construct an email message. 

The class has several methods that can be used to set various properties 
of the email message.

#### Methods

#### Message() &#8674; Constructor




#### from(from)

Set the sender of the email message.

##### Parameters

- _string_ **from**

##### Returns

- self

#### to(to)

Add one or more recipients to the email message.

##### Parameters

- _string|list[string]_ **to**

##### Returns

- self

#### cc(cc)

Add one or more Cc recipients to the email message.

##### Parameters

- _string|list[string]_ **cc**

##### Returns

- self

#### bcc(bcc)

Add one or more Bcc recipients to the email message.

##### Parameters

- _string|list[string]_ **bcc**

##### Returns

- self

#### reply\_to(to)

Add a reply-to address to the email message.

##### Parameters

- _string_ **to**

##### Returns

- self

#### subject(subject)

Set the subject of the email message.

##### Parameters

- _string_ **subject**

##### Returns

- self

#### header(header)

Add one or more headers to the email message.

##### Parameters

- _string|list|dict_ **header**

##### Returns

- self

#### attachment(path, name)

Add one or more attachments to the email message.

##### Parameters

- _string_ **path**
- _string_ **name**: (Optional)

##### Returns

- self

#### text(text)

Set the plain text body of the email message.

##### Parameters

- _string_ **text**

##### Returns

- self

#### html(html)

Set the html body of the email.

##### Parameters

- _string_ **html**

##### Returns

- self



