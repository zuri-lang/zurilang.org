# mail

The module provides interfaces for sending and reading electronic mails and provides 
implementation for the SMTP, IMAP and POP3 mail exchange protocols.

## Fields

_mail_.**TLS\_NONE**
: Do not attempt to use SSL.

_mail_.**TLS\_TRY**
: Try using SSL, proceed as normal otherwise. Note that server 
  may close the connection if the negotiation does not succeed.

_mail_.**TLS\_CONTROL**
: Require SSL for the control connection or fail.

_mail_.**TLS\_ALL**
: Require SSL for all communication or fail.


## Functions

_mail_.parse(_message_) {#mail.parse}

: Parses email messages and return an instance of Mail representing it.


  - **@params**:
    - _string_ **message**

  {.params}
  - **@returns**: _Mail_
  {.returns}



_mail_.smtp(_options_) {#mail.smtp}

: Returns a new instance of SMTP {Transport} with the given __options__.


  - **@params**:
    - _{dict?}_ **options** See {Transport}


  {.params}
  - **@returns**: _Transport_
  {.returns}



_mail_.pop3(_options_) &#x279D; _Exported_ {#mail.pop3}

: Returns a new instance of the POP3 class with the given options (if any) passed 
  to the constructor.


  - **@returns**: _POP3_
  {.returns}



_mail_.imap(_options_) &#x279D; _Exported_ {#mail.imap}

: Returns a new instance of the Imap class with the given options (if any) passed 
  to the constructor.


  - **@returns**: _Imap_
  {.returns}



_mail_.message() &#x279D; _Exported_ {#mail.message}

: Returns a new instance of {Message}.


  - **@returns**: _Message_
  {.returns}



## Classes

_class_ **Attachment** {#mail.Attachment .class}

: Attachment class is used to hold the information of attachments in the 
  message.


    __@printable__, __@serializable__
    {.class-props}


  .Attachment(_headers_, _content_) &#x279D; _Constructor_ {#mail.Attachment.Attachment}

  : mail.Attachment constructor


    - **@params**:
      - _dict_ **headers**
      - _string_ **content**

    {.params}




_class_ **Mail** {#mail.Mail .class}

: The Mail class represents a mail message as a blade object with the following 
  properties.


    __@printable__, __@serializable__
    {.class-props}

  .Mail(_headers_, _body_, _attachments_) &#x279D; _Constructor_ {#mail.Mail.Mail}

  : mail.Mail constructor


    - **@params**:
      - _dict_ **headers** : A dictionary containing the key/value pair contained in the mail message header.

      - _dict_ **body** : A dictionary containing the different segments of a mail body such as its plain text and html counterpart.

      - _list[Attachment]_ **attachments** : A list of attachments contained in the Mail message.


    {.params}




_class_ **Transport** {#mail.Transport .class}

: Transport class can be used to send email messages through an SMTP server.
  
  The class constructor takes a single argument options, which should be a 
  dictionary containing various options for the connection. If the options 
  are not provided or are not a dictionary, the constructor will raise an 
  exception. 
  
  The class uses the options to set various properties such as the host and 
  port of the SMTP server, the username and password for authentication, and 
  various options for connecting to the server such as the use of TLS, and 
  timeout.



  .Transport(_options_) &#x279D; _Constructor_ {#mail.Transport.Transport}

  : The Transport class accepts a dictionary that can be used to configure how 
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


    - **@params**:
      - _dict?_ **options**

    {.params}


  .add\_message(_message_) {#mail.Transport.add_message}

  : Adds an email message to the list of messages to be sent.


    - **@params**:
      - _Message_ **message**

    {.params}
    - **@returns**: _Transport_
    {.returns}


  .test\_connection() {#mail.Transport.test_connection}

  : Tests the connection to the SMTP server


    - **@returns**: _bool_
    {.returns}


  .verify(_address_) {#mail.Transport.verify}

  : Verifies an email address


    - **@params**:
      - _string_ **address**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .send() {#mail.Transport.send}

  : Send the email messages and returns `true` if the message was successfully 
    sent or `false` otherwise.


    - **@returns**: _bool_
    {.returns}




_class_ **POP3** {#mail.POP3 .class}

: The POP3 class provides an interface for connecting to an POP3 (Post Office Protocol) server 
  and interacting with the server via the POP3 protocol.
  
  This class includes operations for creating, deleting, and renaming mailboxes, checking for new 
  messages, permanently removing messages, setting and clearing flags searching, and selective 
  fetching of message attributes, texts, and portions.



  .POP3(_options_) &#x279D; _Constructor_ {#mail.POP3.POP3}

  : The POP3 class accepts a dictionary that can be used to configure how 
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


    - **@params**:
      - _dict?_ **options**

    {.params}


  .exec(_command_, _path_, _no_transfer_) {#mail.POP3.exec}

  : Executes an POP3 command.
    
    
    
    
       as response response. Default `false`.


    - **@params**:
      - _string_ **command** The command to execute.

      - _string?_ **path** The path segment of the request url.

      - _bool?_ **no_transfer** Set to `true` if the command will return the requested data 


    {.params}
    - **@returns**: _string The response from the server._
    {.returns}


  .list(_uid_) {#mail.POP3.list}

  : Returns a list of dictionaries containing the `uid` and `size` of each message in the 
    mail if the _uid_ argument is not given or the content of the message identified by the 
    given _uid_.


    - **@params**:
      - _number?_ **uid**

    {.params}
    - **@returns**: _list[dictionary]|string_
    {.returns}


  .uid\_list() {#mail.POP3.uid_list}

  : Returns a list of dictionaries containing the `uid` and `id` for every message in the mailbox 
    based on their unique ids.


    - **@returns**: _list[dictionary]_
    {.returns}


  .retr(_uid_) {#mail.POP3.retr}

  : Retrieves the whole message with the specified _uid_.


    - **@params**:
      - _number_ **uid**

    {.params}
    - **@returns**: _string_
    {.returns}


  .stat() {#mail.POP3.stat}

  : Returns a dictionary containing the message `count` and `size` of the mailbox.


    - **@returns**: _dictionary_
    {.returns}


  .delete(_uid_) {#mail.POP3.delete}

  : Instructs the POP3 server to mark the message _uid_ as deleted. Any future reference 
    to the message-number associated with the message in a POP3 command generates an error.  
    The POP3 server does not actually delete the message until the POP3 session enters the 
    UPDATE state.


    - **@params**:
      - _number_ **uid**

    {.params}


  .noop() {#mail.POP3.noop}

  : Does nothing. It merely ask the server to reply with a positive response.


    > **@notes**:
    > 
    > - It's useful for a keep-alive.



  .rset() {#mail.POP3.rset}

  : Instructs the server to unmark any messages have been marked as deleted.




  .top(_uid_, _count_) {#mail.POP3.top}

  : Retrieves the header for the message identified by `uid` plus `count` lines 
    of the message after the header of message.


    - **@params**:
      - _number_ **uid**
      - _number?_ **count** (Default: 0)


    {.params}
    - **@returns**: _string_
    {.returns}


  .quit() {#mail.POP3.quit}

  : Closes the current POP3 session and disposes all associated network handles.




  .get\_handle() {#mail.POP3.get_handle}

  : Returns the raw handle to the underlying networking (curl) client.






_class_ **Imap** {#mail.Imap .class}

: The Imap class provides an interface for connecting to an IMAP (Internet Mail Access Protocol) 
  server and interacting with the server via the IMAP protocol.
  
  This class includes operations for creating, deleting, and renaming mailboxes, checking for new 
  messages, permanently removing messages, setting and clearing flags searching, and selective 
  fetching of message attributes, texts, and portions.



  .Imap(_options_) &#x279D; _Constructor_ {#mail.Imap.Imap}

  : The Imap class accepts a dictionary that can be used to configure how 
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


    - **@params**:
      - _dict?_ **options**

    {.params}


  .exec(_command_, _path_) {#mail.Imap.exec}

  : Executes an IMAP command.


    - **@params**:
      - _string_ **command** The command to execute.

      - _string?_ **path** The path segment of the request url.


    {.params}
    - **@returns**: _string The response from the server._
    {.returns}


  .get\_dirs(_path_) {#mail.Imap.get_dirs}

  : Gets a list of the mailbox directories on the server.


    - **@params**:
      - _string?_ **path**

    {.params}
    - **@returns**: _list_
    {.returns}


  .get\_subscribed\_dirs() {#mail.Imap.get_subscribed_dirs}

  : Gets a list of mailbox directories subscribed to by the current 
    user on the server.


    - **@returns**: _list_
    {.returns}


  .select(_name_) {#mail.Imap.select}

  : Instructs the server that the client now wishes to select a particular mailbox or folder 
    with the name _name_, and any commands that relate to a folder should assume this folder 
    as the target of that command. For example, an INBOX or a subfolder such as, 
    "To Do.This Weekend". Once a mailbox is selected, the state of the connection becomes 
    "Selected".
    
    @see https://www.marshallsoft.com/ImapSearch.htm for more help.


    - **@params**:
      - _string_ **name**

    {.params}
    - **@returns**: _dictionary_
    {.returns}


  .examine(_name_) {#mail.Imap.examine}

  : This function does the exact same thing as `select()`, except that it selects the folder 
    in read-only mode, meaning that no changes can be effected on the folder.


    - **@params**:
      - _string_ **name**

    {.params}
    - **@returns**: _dictionary_
    {.returns}


  .create(_name_) {#mail.Imap.create}

  : Creates a new mailbox or folder with the given name.


    - **@params**:
      - _string_ **name**

    {.params}
    - **@returns**: _list_
    {.returns}


  .delete(_name_) {#mail.Imap.delete}

  : Deletes the mailbox or folder with the given name.


    - **@params**:
      - _string_ **name**

    {.params}
    - **@returns**: _list_
    {.returns}


  .rename(_old_name_, _new_name_) {#mail.Imap.rename}

  : Renames a mailbox or folder with the name `old_name` to a the name `new_name`.


    - **@params**:
      - _string_ **old_name**
      - _string_ **new_name**

    {.params}
    - **@returns**: _list_
    {.returns}


  .subscribe(_name_) {#mail.Imap.subscribe}

  : Adds the specified mailbox name to the server's set of "active" or "subscribed" 
    mailboxes for the current user as returned by `lsub()` and returns `true` if 
    successful or `false` otherwise.


    - **@params**:
      - _string_ **name**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .unsubscribe(_name_) {#mail.Imap.unsubscribe}

  : Removes the specified mailbox name from the server's set of "active" or "subscribed" 
    mailboxes for the current user as returned by `lsub()` and returns `true` if successful 
    or `false` otherwise.


    - **@params**:
      - _string_ **name**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .list(_name_, _pattern_) {#mail.Imap.list}

  : Returns a subset of names from the complete set of all names available to the client. 
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


    - **@params**:
      - _string_ **name**
      - _string?_ **pattern**

    {.params}
    - **@returns**: _list_
    {.returns}


  .lsub(_name_, _pattern_) {#mail.Imap.lsub}

  : Same as the `list()` function except that it returns a subset of names.


    - **@params**:
      - _string_ **name**
      - _string?_ **pattern**

    {.params}
    - **@returns**: _list_
    {.returns}


  .status(_name_, _attrs_) {#mail.Imap.status}

  : Requests the status of the indicated mailbox. 
    
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


    - **@params**:
      - _string_ **name**
      - _string_ **attrs**

    {.params}
    - **@returns**: _bool|string_
    {.returns}


  .append(_folder_, _message_) {#mail.Imap.append}

  : Appends messages to a mailbox directories such as INBOX or top-level folders 
    and returns `true` if it succeeds or `false` otherwise.
    
    > NOTE:
       This isn’t a copy/move command, you must supply a full message body to 
       append.


    - **@params**:
      - _string_ **folder**
      - _Message_ **message**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .check() {#mail.Imap.check}

  : Requests a checkpoint of the currently selected mailbox.  A checkpoint refers to 
    any implementation-dependent housekeeping associated with the mailbox (e.g., 
    resolving the server's in-memory state of the mailbox with the state on its disk) 
    that is not normally executed as part of each command.  A checkpoint MAY take a 
    non-instantaneous amount of real time to complete.  
    
    If a server implementation has no such housekeeping considerations, `check()` is 
    equivalent to NOOP.


    - **@returns**: _bool_
    {.returns}


  .close() {#mail.Imap.close}

  : Permanently removes all messages that have the `\Deleted` flag set from the currently 
    selected mailbox, and returns to the authenticated state from the selected state.
    
    No messages are removed, and no error is given, if the mailbox is selected by an 
    `examine()` or is otherwise selected read-only.


    - **@returns**: _bool_
    {.returns}


  .expunge(_path_) {#mail.Imap.expunge}

  : Clears the deleted messages in a mailbox folder and returns `true` on 
    success or `false` otherwise.


    - **@params**:
      - _string_ **path**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .search(_query_, _folder_) {#mail.Imap.search}

  : Finds all occurrences of the __query__ in the specified __folder__ and 
    return a list of message UIDs that matches the search query.
    
    The __query__ can contain a message sequence set and a number of search 
    criteria keywords including flags such as ANSWERED, DELETED, DRAFT, FLAGGED, 
    NEW, RECENT and SEEN. For more information about the search criteria please
    see RFC-3501 section 6.4.4 for more details.
    
    When __query__ is empty, it defaults to `NEW`. __folder__ defaults to `INBOX`
     when empty.
    
    @see: https://datatracker.ietf.org/doc/html/rfc9051#section-6.4.4 for more.


    - **@params**:
      - _string?_ **query**
      - _string?_ **folder**

    {.params}


  .fetch(_uid_, _path_) {#mail.Imap.fetch}

  : Retrieves a message with the give __uid__ in the specified mailbox __path__. If 
    the __uid__ is not given, it attempts to retrieve the message with a UID of 1. If 
    __path__ is not given, it will attempt to retrieve the message from the `INBOX` 
    folder.


    - **@params**:
      - _number?_ **uid**
      - _string?_ **path**

    {.params}


  .copy(_id_, _destination_, _path_) {#mail.Imap.copy}

  : Copies the specified message(s) to the end of the specified destination mailbox.


    > **@notes**:
    > 
    > - COPYUID responses are not yet supported

    - **@returns**: _bool_
    {.returns}


  .store(_id_, _command_, _flags_) {#mail.Imap.store}

  : Alters data associated with a message in the mailbox.
    
    
       suffix of `.SILENT`.
    @see https://datatracker.ietf.org/doc/html/rfc9051#section-6.4.6 for more.


    > **@notes**:
    > 
    > - command must be one of `FLAGS`, `+FLAGS`, or `-FLAGS`, optionally with a 

    - **@returns**: _bool_
    {.returns}


  .quit() {#mail.Imap.quit}

  : Closes the current IMAP session and disposes all associated network handles.




  .get\_handle() {#mail.Imap.get_handle}

  : Returns the raw handle to the underlying networking (curl) client.






_class_ **Message** {#mail.Message .class}

: Message class can be used to construct an email message. 
  
  The class has several methods that can be used to set various properties 
  of the email message.



  .Message() &#x279D; _Constructor_ {#mail.Message.Message}

  : mail.Message constructor




  .from(_from_) {#mail.Message.from}

  : Set the sender of the email message.


    - **@params**:
      - _string_ **from**

    {.params}
    - **@returns**: _self_
    {.returns}


  .to(_to_) {#mail.Message.to}

  : Add one or more recipients to the email message.


    - **@params**:
      - _string|list[string]_ **to**

    {.params}
    - **@returns**: _self_
    {.returns}


  .cc(_cc_) {#mail.Message.cc}

  : Add one or more Cc recipients to the email message.


    - **@params**:
      - _string|list[string]_ **cc**

    {.params}
    - **@returns**: _self_
    {.returns}


  .bcc(_bcc_) {#mail.Message.bcc}

  : Add one or more Bcc recipients to the email message.


    - **@params**:
      - _string|list[string]_ **bcc**

    {.params}
    - **@returns**: _self_
    {.returns}


  .reply\_to(_to_) {#mail.Message.reply_to}

  : Add a reply-to address to the email message.


    - **@params**:
      - _string_ **to**

    {.params}
    - **@returns**: _self_
    {.returns}


  .subject(_subject_) {#mail.Message.subject}

  : Set the subject of the email message.


    - **@params**:
      - _string_ **subject**

    {.params}
    - **@returns**: _self_
    {.returns}


  .header(_header_) {#mail.Message.header}

  : Add one or more headers to the email message.


    - **@params**:
      - _string|list|dict_ **header**

    {.params}
    - **@returns**: _self_
    {.returns}


  .attachment(_path_, _name_) {#mail.Message.attachment}

  : Add one or more attachments to the email message.


    - **@params**:
      - _string_ **path**
      - _string_ **name** (Optional)


    {.params}
    - **@returns**: _self_
    {.returns}


  .text(_text_) {#mail.Message.text}

  : Set the plain text body of the email message.


    - **@params**:
      - _string_ **text**

    {.params}
    - **@returns**: _self_
    {.returns}


  .html(_html_) {#mail.Message.html}

  : Set the html body of the email.


    - **@params**:
      - _string_ **html**

    {.params}
    - **@returns**: _self_
    {.returns}




