# curl

## Fields

**version** &#8674; _string_
:  The libcurl version.


## Functions

get\_time(_date_string_) {#curl.get_time}

: Returns the number of seconds since the Epoch, January 1st 1970 00:00:00 in 
  the UTC time zone, for the date and time that the date_string parameter specifies.
  
  **PARSING DATES AND TIMES**
  
  A "date" is a string containing several items separated by whitespace.
  The order of the items is immaterial.  A date string may contain many
  flavors of items:
  
  - **Calendar date**
     Can be specified several ways. Month names can only be three-letter english 
     abbreviations, numbers can be zero-prefixed and the year may use 2 or 4 digits.  
     
     Examples: 06 Nov 1994, 06-Nov-94 and Nov-94 6.
  
  - **Time of the day**
     This string specifies the time on a given day. You must specify it with 6 digits 
     with two colons: HH:MM:SS. To not include the time in a date string, will make the 
     function assume 00:00:00.
  
     Example: 18:19:21.
  
  - **Time zone**
     Specifies international time zone. There are a few acronyms supported, but in 
     general you should instead use the specific relative time compared to UTC. 
     Supported formats include: -1200, MST, +0100.
  
  - **Day of the week items**
     Specifies a day of the week. Days of the week may be spelled out in full (using 
     english): Sunday, Monday, etc or they may be abbreviated to their first three 
     letters. This is usually not info that adds anything.
  
  - **Pure numbers**
     If a decimal number of the form YYYYMMDD appears, then YYYY is read as the year, 
     MM as the month number and DD as the day of the month, for the specified calendar 
     date.
  
  **EXAMPLES**
  
  ```sh
  Sun, 06 Nov 1994 08:49:37 GMT
  Sunday, 06-Nov-94 08:49:37 GMT
  Sun Nov  6 08:49:37 1994
  06 Nov 1994 08:49:37 GMT
  06-Nov-94 08:49:37 GMT
  Nov  6 08:49:37 1994
  06 Nov 1994 08:49:37
  06-Nov-94 08:49:37
  1994 Nov 6 08:49:37
  GMT 08:49:37 06-Nov-94 Sunday
  94 6 Nov 08:49:37
  1994 Nov 6
  06-Nov-94
  Sun Nov 6 94
  1994.Nov.6
  Sun/Nov/6/94/GMT
  Sun, 06 Nov 1994 08:49:37 CET
  06 Nov 1994 08:49:37 EST
  Sun, 12 Sep 2004 15:05:58 -0700
  Sat, 11 Sep 2004 21:32:11 +0200
  20040912 15:05:58 -0700
  20040911 +0200
  ```
  
  **STANDARDS**
  
  This parser was written to handle date formats specified in RFC 822 (including the 
  update in RFC 1123) using time zone name or time zone delta and RFC 850 (obsoleted 
  by RFC 1036) and ANSI C's asctime() format. These formats are the only ones RFC 7231 
  says HTTP applications may use.
  
  
  
  @static


  - **@params**:
    - _string_ **date_string**

  {.params}
  - **@returns**: _number_



## Classes

_class_ **Info** {#curl.Info .class}

: cURL request and response informations for `get_info()`


  **.EFFECTIVE\_URL** &#8674; _static_
  :  Gets the last used effective URL. If follow redirects is enabled, 
    it may very well not be the same value you set in the original request.

  **.RESPONSE\_CODE** &#8674; _static_
  :  The last received HTTP, FTP or SMTP response code. The value will be 
    zero if no server response code has been received.

  **.TOTAL\_TIME** &#8674; _static_
  :  The total time in seconds for the previous transfer, including name resolving, 
    TCP connect etc. The value represents the time in seconds, including fractions.

  **.NAMELOOKUP\_TIME** &#8674; _static_
  :  The total time in seconds from the start until the name resolving was completed.

  **.CONNECT\_TIME** &#8674; _static_
  :  The total time in seconds from the start until the connection to the remote host 
    (or proxy) was completed.

  **.PRETRANSFER\_TIME** &#8674; _static_
  :  The time, in seconds, it took from the start until a file transfer is just about 
    to begin.
    
    This time-stamp includes all pre-transfer commands and negotiations that are 
    specific to the particular protocol(s) involved. It includes the sending of the 
    protocol- specific protocol instructions that triggers a transfer.

  **.SIZE\_UPLOAD** &#8674; _static_
  :  The total amount of bytes that were uploaded.

  **.SIZE\_DOWNLOAD** &#8674; _static_
  :  The total amount of bytes that were  downloaded.  The amount is only for the 
    latest transfer and will be reset again for each new transfer. This counts actual 
    payload data, what's also commonly called body. All meta and header data are 
    excluded and will not be counted in this number.

  **.SPEED\_DOWNLOAD** &#8674; _static_
  :  The average download speed that curl measured for the complete download. Measured 
    in bytes/second.

  **.SPEED\_UPLOAD** &#8674; _static_
  :  The average upload speed that curl measured for the complete upload. Measured 
    in bytes/second.

  **.HEADER\_SIZE** &#8674; _static_
  :  The total size of all the headers received. Measured in number of bytes.

  **.REQUEST\_SIZE** &#8674; _static_
  :  The total size of the issued requests. This is so far only for HTTP requests.

  **.SSL\_VERIFYRESULT** &#8674; _static_
  :  The result of the server SSL certificate verification that was requested (using 
    the `Options.SSL_VERIFYPEER` option).

  **.FILETIME** &#8674; _static_
  :  The remote time of the retrieved document (in number of seconds since 1 jan 1970 
    in the GMT/UTC time zone). If you get -1, it can be because of many reasons (it might 
    be unknown, the server might hide it or the server doesn't support the command that 
    tells document time etc) and the time of the document is unknown.
    
    You _MUST_ to collect this information before the transfer is made, by using the 
    `Options.FILETIME` option to `set_option()` or you will unconditionally get a -1 back.

  **.CONTENT\_LENGTH\_DOWNLOAD** &#8674; _static_
  :  The content-length of the download. This is the value read from the `Content-Length:` 
    field. It is -1 if the size isn't known.

  **.CONTENT\_LENGTH\_UPLOAD** &#8674; _static_
  :  The content-length of the upload. It is -1 if the size isn't known.

  **.STARTTRANSFER\_TIME** &#8674; _static_
  :  The time, in seconds, it took from the start until the first byte is received by 
    `curl`. This includes `PRETRANSFER_TIME` and also the time the server needs to 
    calculate the result.

  **.CONTENT\_TYPE** &#8674; _static_
  :  The content-type of the downloaded object. This is the value read from the 
    `Content-Type:` field. If you get `nil`, it means that the server didn't send a 
    valid Content-Type header or that the protocol used doesn't support this.

  **.REDIRECT\_TIME** &#8674; _static_
  :  The total time, in seconds, it took for all redirection steps include name lookup, 
    connect, pretransfer and transfer before final transaction was started.

  **.REDIRECT\_COUNT** &#8674; _static_
  :  The total number of redirections that were actually followed.

  **.HTTP\_CONNECTCODE** &#8674; _static_
  :  The last received HTTP proxy response code to a CONNECT request. The returned value 
    will be zero if no such response code was available.

  **.HTTPAUTH\_AVAIL** &#8674; _static_
  :  A bitmask indicating the authentication method(s) available according to the 
    previous response.

  **.PROXYAUTH\_AVAIL** &#8674; _static_
  :  A bitmask indicating the authentication method(s) available according to the 
    previous response.

  **.OS\_ERRNO** &#8674; _static_
  :  The errno variable from a connect failure.  Note that the value is only set on 
    failure, it is not reset upon a successful operation. The number is OS and system 
    specific.

  **.NUM\_CONNECTS** &#8674; _static_
  :  How many new connections `curl` had to create to achieve the previous transfer 
    (only the successful connects are counted). Combined with `REDIRECT_COUNT` you are 
    able to know how many times `curl` successfully reused existing connection(s) or not.

  **.COOKIELIST** &#8674; _static_
  :  A list of all cookies curl knows (expired ones, too). If there are no cookies, an 
    empty list is returned.
    
    
    > Cookies that were imported in the Set-Cookie format without a domain name may not 
    > exported by this option.

  **.FTP\_ENTRY\_PATH** &#8674; _static_
  :  A string holding the path of the entry path. That is the initial path `curl` ended up 
    in when logging on to the remote FTP server. This value is `nil` if something is wrong.

  **.REDIRECT\_URL** &#8674; _static_
  :  The URL a redirect would take you to if you would enable `FOLLOWLOCATION`. This can 
    come very handy if you think using the built-in `curl` redirect logic isn't good
    enough for you but you would still prefer to avoid implementing all the magic of 
    figuring out the new URL.

  **.PRIMARY\_IP** &#8674; _static_
  :  A string holding the IP address of the most recent connection done with this `curl` 
    handle.

  **.APPCONNECT\_TIME** &#8674; _static_
  :  The time, in seconds, it took from the start until the SSL/SSH connect/handshake to 
    the remote host was completed.  This time is most often very near to the 
    `PRETRANSFER_TIME` time, except for cases such as HTTP pipelining where the pretransfer
    time can be delayed due to waits in line for the pipeline and more.

  **.CERTINFO** &#8674; _static_
  :  Lists with info about the certificate chain, assuming you had `Options.CERTINFO` 
    enabled when the request was made. Information in each entry of the list is provided 
    in a series of data in the format "name:content" where the content is for the specific 
    named data.

  **.CONDITION\_UNMET** &#8674; _static_
  :  The number `1` if the condition provided in the previous request didn't match 
    (see `Options.TIMECONDITION`). Alas, if this returns a `1` you know that the 
    reason you didn't get data in return is because it didn't fulfill the condition. 
    This value will be zero if the condition was met. This can also return `1` if the 
    server responded with a 304 HTTP status code, for example after sending a custom 
    "If-Match-" header.
     @static

  **.RTSP\_SESSION\_ID** &#8674; _static_
  :  A string holding the most recent RTSP Session ID.
    
    
    > Applications wishing to resume an RTSP session on another connection should 
    > retrieve this info before closing the active connection.

  **.RTSP\_CLIENT\_CSEQ** &#8674; _static_
  :  The next CSeq that will be used by the application.

  **.RTSP\_SERVER\_CSEQ** &#8674; _static_
  :  The next CSeq that is expected by the application.
    
    
    > Applications wishing to resume an RTSP session on another connection should retrieve 
    > this info before closing the active connection.

  **.RTSP\_CSEQ\_RECV** &#8674; _static_
  :  The most recently received CSeq from the server.

  **.PRIMARY\_PORT** &#8674; _static_
  :  The destination port of the most recent connection done with the `curl` instance.

  **.LOCAL\_IP** &#8674; _static_
  :  A string holding the IP address of the local end of most recent connection done 
    with the `curl` instance.

  **.LOCAL\_PORT** &#8674; _static_
  :  The local port number of the most recent connection done with the `curl` instance.

  **.HTTP\_VERSION** &#8674; _static_
  :  The HTTP version used in the last http connection.

  **.PROXY\_SSL\_VERIFYRESULT** &#8674; _static_
  :  The result of the certificate verification that was requested (using the 
    `Options.PROXY_SSL_VERIFYPEER` option.

  **.PROTOCOL** &#8674; _static_
  :  The protocol used in the last request.

  **.SCHEME** &#8674; _static_
  :  A string holding the URL scheme used for the most recent connection done with 
    this `curl` instance.

  **.TOTAL\_TIME\_T** &#8674; _static_
  :  The total time in microseconds for the previous transfer, including name resolving, 
    TCP connect etc.

  **.NAMELOOKUP\_TIME\_T** &#8674; _static_
  :  The total time in microseconds from the start until the name resolving was completed.

  **.CONNECT\_TIME\_T** &#8674; _static_
  :  The total time in microseconds from the start until the connection to the remote 
    host (or proxy) was completed.

  **.PRETRANSFER\_TIME\_T** &#8674; _static_
  :  The total time in microseconds from the start until the file transfer is just about 
    to begin. This includes all pre-transfer commands and negotiations that are specific 
    to the particular protocol(s) involved. It does not involve the sending of the 
    protocol- specific request that triggers a transfer.

  **.STARTTRANSFER\_TIME\_T** &#8674; _static_
  :  The total time in microseconds from the start until the first byte is received by 
    `curl`. This includes `PRETRANSFER_TIME_T` and also the time the server needs to 
    calculate the result.

  **.REDIRECT\_TIME\_T** &#8674; _static_
  :  The total time in microseconds it took for all redirection steps include name lookup,
    connect, pretransfer and transfer before final transaction was started. It contains 
    the complete execution time for  multiple redirections.

  **.APPCONNECT\_TIME\_T** &#8674; _static_
  :  The total time in microseconds from the start until the SSL/SSH connect/handshake 
    to the remote host was completed.  This time is most often very near to the 
    `PRETRANSFER_TIME_T` time, except for cases such as HTTP pipelining where the 
    pretransfer time can be delayed due to waits in line for the pipeline and more.

  **.RETRY\_AFTER** &#8674; _static_
  :  The number of seconds the HTTP server suggests the client should wait until the 
    next request is issued. 
    
    
    
    > While the HTTP header might contain a fixed date string, the `RETRY_AFTER` will 
    > always return number of seconds to wait - or zero if there was no header or the 
    > header couldn't be parsed.




_class_ **CurlMime** {#curl.CurlMime .class}

: cURL Mime object for multipart-data forms and POST requests.


  .CurlMime(_curl_) &#8674; Constructor {#curl.CurlMime.CurlMime}

  : @pram {Curl} curl




  .add(_name_, _value_) {#curl.CurlMime.add}

  : Adds a new mime part with the given name and value.


    - **@params**:
      - _string_ **name**
      - _any_ **value**

    {.params}
    - **@returns**: _bool_


  .add\_as(_value_, _type_) {#curl.CurlMime.add_as}

  : Adds a new mime part with the given data and type.


    - **@params**:
      - _any_ **value**
      - _string_ **type**

    {.params}
    - **@returns**: _bool_


  .add\_data(_data_) {#curl.CurlMime.add_data}

  : Adds a new mime part with the given data.


    - **@params**:
      - _any_ **data**

    {.params}
    - **@returns**: _bool_


  .add\_file(_name_, _value_) {#curl.CurlMime.add_file}

  : Adds a new mime part with the given name and file.


    - **@params**:
      - _string_ **name**
      - _string|instance_ **value**

    {.params}
    - **@returns**: _bool_


  .add\_mime(_mime_, _type_) {#curl.CurlMime.add_mime}

  : Adds a new mime subpart with the given mime.


    - **@params**:
      - _CurlMime_ **mime**
      - _string_ **type**

    {.params}
    - **@returns**: _bool_


  .set\_encoding(_encoding_) {#curl.CurlMime.set_encoding}

  : Sets the encoding with which the mime will be transfered.


    - **@params**:
      - _string_ **encoding**

    {.params}


  .get\_pointer() {#curl.CurlMime.get_pointer}

  : Returns the raw pointer object to the underlying libcurl mime implementation.






_class_ **CurlList** {#curl.CurlList .class}

: cURL list interface.


  .CurlList(_items_) {#curl.CurlList.CurlList}

  : @constrctor


    - **@params**:
      - _list[string]_ **items**

    {.params}


  .close() {#curl.CurlList.close}

  : Close and disposes the pointer to the list




  .get\_pointer() {#curl.CurlList.get_pointer}

  : Returns the raw pointer object to the underlying libcurl list implementation.






_class_ **Curl** {#curl.Curl .class}

: cURL class


  .Curl() &#8674; Constructor {#curl.Curl.Curl}

  : 

  .set\_option(_option_, _value_) {#curl.Curl.set_option}

  : This function is used to tell `curl` how to behave. By setting the
    appropriate options, the application can change `curl`'s behavior.  
    All options are set with an option followed by a parameter. That parameter
    can be a number, boolean, string, or an object pointer, depending on what 
    the specific option expects. Read this `cURL` manual carefully as bad input 
    values may cause `curl` to behave badly!  You can only set one option in each 
    function call. A typical application uses many `set_option()` calls in the 
    setup phase.
    
    Options set with this function call are valid for all forthcoming
    transfers performed using this instance.  The options are not in any way
    reset between transfers, so if you want subsequent transfers with
    different options, you must change them between the transfers. You can
    optionally reset all options back to internal default with `reset()`.


    > **@notes**:
    > 
    > - Strings passed to `curl` as arguments, must not exceed 8MB in size.

    > - The order in which the options are set does not matter.

    - **@params**:
      - _Option_ **option**
      - _any_ **value**

    {.params}
    - **@returns**: _boolean_


  .get\_info(_info_) {#curl.Curl.get_info}

  : Requests internal information from the `curl` session with this function.
    Use this function AFTER performing a transfer if you want to get transfer 
    related data.


    - **@params**:
      - _Info_ **info**

    {.params}
    - **@returns**: _string|number|list_


  .escape(_str_) {#curl.Curl.escape}

  : This function converts the given input string to a URL encoded string and
    returns that as a new allocated string. All input characters that are not
    a-z, A-Z, 0-9, '-', '.', '_' or '~' are converted to their "URL escaped"
    version (%NN where NN is a two-digit hexadecimal number).


    > **@notes**:
    > 
    > - This function does not accept a strings longer than 8MB.

    - **@params**:
      - _string_ **str**

    {.params}
    - **@returns**: _string_


  .unescape(_str_) {#curl.Curl.unescape}

  : This function converts the given URL encoded input string to a "plain
    string" and returns that in an allocated memory area. All input characters 
    that are URL encoded (%XX where XX is a two-digit hexadecimal number) are 
    converted to their decoded versions.


    - **@params**:
      - _string_ **str**

    {.params}
    - **@returns**: _string_


  .send() {#curl.Curl.send}

  : Performs the entire request in a blocking manner and returns when done, or 
    if it failed. It returns a dictionary containing the `headers` and `body` key.
    
    
    > You must never call this function simultaneously from two places using
    > the same instance. Let the function return first before invoking it
    > another time.


    - **@returns**: _dict_


  .reset() {#curl.Curl.reset}

  : Re-initializes the instace to the default values. This puts back the
    instance to the same state as it was in when it was just created.
    
    > It keeps live connections, the Session ID cache, the DNS cache, the
    > cookies , the shares or the alt-svc cache.




  .close() {#curl.Curl.close}

  : Closes the current Curl instance.
    
    This might close all connections this instance has used and possibly has
    kept open until now - unless it was attached to a multi handle while
    doing the transfers. Don't call this function if you intend to transfer
    more files, re-using Curl instances is a key to good performance.


    > **@notes**:
    > 
    > - Calling a function on the instance after this function has been called is illegal



  .get\_pointer() {#curl.Curl.get_pointer}

  : Returns the raw pointer object to the underlying libcurl.






_class_ **Auth** {#curl.Auth .class}

: Auth values for `Options.HTTPAUTH` and `Options.PROXYAUTH`


  **.NONE** &#8674; _static_
  :  No HTTP authentication

  **.BASIC** &#8674; _static_
  :  HTTP Basic authentication (default)

  **.DIGEST** &#8674; _static_
  :  HTTP Digest authentication

  **.NEGOTIATE** &#8674; _static_
  :  HTTP Negotiate (SPNEGO) authentication

  **.GSSNEGOTIATE** &#8674; _static_
  :  Alias for CURLAUTH_NEGOTIATE (deprecated)

  **.NTLM** &#8674; _static_
  :  HTTP NTLM authentication

  **.DIGEST\_IE** &#8674; _static_
  :  HTTP Digest authentication with IE flavour

  **.NTLM\_WB** &#8674; _static_
  :  HTTP NTLM authentication delegated to winbind helper

  **.BEARER** &#8674; _static_
  :  HTTP Bearer token authentication

  **.ONLY** &#8674; _static_
  :  Use together with a single other type to force no authentication or 
    just that single type.

  **.ANY** &#8674; _static_
  :  All fine types set

  **.ANYSAFE** &#8674; _static_
  :  All fine types except Basic

  **.SSH\_ANY** &#8674; _static_
  :  All types of SSH authentication supported by the server

  **.SSH\_NONE** &#8674; _static_
  :  No SSH allowed

  **.SSH\_PUBLICKEY** &#8674; _static_
  :  Public/private key files for SSH authentication.

  **.SSH\_PASSWORD** &#8674; _static_
  :  Password for SSH authentication.

  **.SSH\_HOST** &#8674; _static_
  :  Host key files for SSH authentication.

  **.SSH\_KEYBOARD** &#8674; _static_
  :  Keyboard interactive SSH authentication.

  **.SSH\_AGENT** &#8674; _static_
  :  Agent (ssh-agent, pageant, etc.) for SSH authentication.

  **.SSH\_GSSAPI** &#8674; _static_
  :  gssapi (kerberos, etc.) for SSH authentication.

  **.SSH\_DEFAULT** &#8674; _static_
  :  The default SSH authentication (same as ANY).




_class_ **UseSSL** {#curl.UseSSL .class}

: cURL request options for `set_option()`


  **.NONE** &#8674; _static_
  :  Do not attempt to use SSL.

  **.TRY** &#8674; _static_
  :  Try using SSL, proceed anyway otherwise.

  **.CONTROL** &#8674; _static_
  :  Use SSL for the control connection or fail.

  **.ALL** &#8674; _static_
  :  Use SSL for all communication or fail




_class_ **FileType** {#curl.FileType .class}

: cURL file types


  **.FILE** &#8674; _static_
  :  File

  **.DIRECTORY** &#8674; _static_
  :  Directory

  **.SYMLINK** &#8674; _static_
  :  Symbolic Link

  **.DEVICE\_CHAR** &#8674; _static_
  :  

  **.NAMEDPIPE** &#8674; _static_
  :  Named Pipe

  **.SOCKET** &#8674; _static_
  :  Socket

  **.DOOR** &#8674; _static_
  :  Door. This is only possible on Sun Solaris now




_class_ **Option** {#curl.Option .class}

: cURL request options for `set_option()`


  **.URL** &#8674; _static_
  :  The full URL to get/put

  **.PORT** &#8674; _static_
  :  Port number to connect to, if other than default.

  **.PROXY** &#8674; _static_
  :  Name of proxy to use.

  **.USERPWD** &#8674; _static_
  :  "user:password;options" to use when fetching.

  **.PROXYUSERPWD** &#8674; _static_
  :  "user:password" to use with proxy.

  **.RANGE** &#8674; _static_
  :  Range to get, specified as an ASCII string.

  **.ERRORBUFFER** &#8674; _static_
  :  Buffer to receive error messages in, must be at least CURL_ERROR_SIZE
    bytes big.

  **.TIMEOUT** &#8674; _static_
  :  Time-out the read operation after this amount of seconds

  **.INFILESIZE** &#8674; _static_
  :  If the CURLOPT_INFILE is used, this can be used to inform libcurl about
    how large the file being sent really is. That allows better error
    checking and better verifies that the upload was successful. -1 means
    unknown size.
    For large file support, there is also a _LARGE version of the key
    which takes an off_t type, allowing platforms with larger off_t
    sizes to handle larger files.  See below for INFILESIZE_LARGE.

  **.POSTFIELDS** &#8674; _static_
  :  POST static input fields.

  **.REFERER** &#8674; _static_
  :  Set the referrer page (needed by some CGIs)

  **.FTPPORT** &#8674; _static_
  :  Set the FTP PORT string (interface name, named or numerical IP address)
           Use i.e '-' to use default address.

  **.USERAGENT** &#8674; _static_
  :  Set the User-Agent string (examined by some CGIs)

  **.LOW\_SPEED\_LIMIT** &#8674; _static_
  :  Set the "low speed limit"

  **.LOW\_SPEED\_TIME** &#8674; _static_
  :  Set the "low speed time"

  **.RESUME\_FROM** &#8674; _static_
  :  Set the continuation offset.
    Note there is also a _LARGE version of this key which uses
    off_t types, allowing for large file offsets on platforms which
    use larger-than-32-bit off_t's.  Look below for RESUME_FROM_LARGE.

  **.COOKIE** &#8674; _static_
  :  Set cookie in request:

  **.HTTPHEADER** &#8674; _static_
  :  This points to a list of HTTP header strings. This
    list is also used for RTSP (in spite of its name)

  **.HTTPPOST** &#8674; _static_
  :  This points to a linked list of post entries.

  **.SSLCERT** &#8674; _static_
  :  name of the file keeping your private SSL-certificate

  **.KEYPASSWD** &#8674; _static_
  :  password for the SSL or SSH private key

  **.CRLF** &#8674; _static_
  :  send TYPE parameter?

  **.QUOTE** &#8674; _static_
  :  send linked-list of QUOTE commands

  **.COOKIEFILE** &#8674; _static_
  :  point to a file to read the initial cookies from, also enables
    "cookie awareness"

  **.SSLVERSION** &#8674; _static_
  :  What version to specifically try to use.
    See CURL_SSLVERSION defines below.

  **.TIMECONDITION** &#8674; _static_
  :  What kind of HTTP time condition to use, see defines

  **.TIMEVALUE** &#8674; _static_
  :  Time to use with the above condition. Specified in number of seconds
    since 1 Jan 1970

  **.CUSTOMREQUEST** &#8674; _static_
  :  Custom request, for customizing the get command like
    HTTP: DELETE, TRACE and others
    FTP: to use a different list command

  **.STDERR** &#8674; _static_
  :  FILE handle to use instead of stderr

  **.POSTQUOTE** &#8674; _static_
  :  send linked-list of post-transfer QUOTE commands

  **.VERBOSE** &#8674; _static_
  :  talk a lot

  **.HEADER** &#8674; _static_
  :  throw the header out too

  **.NOPROGRESS** &#8674; _static_
  :  shut off the progress meter

  **.NOBODY** &#8674; _static_
  :  use HEAD to get http document

  **.FAILONERROR** &#8674; _static_
  :  no output on http error codes >= 400

  **.UPLOAD** &#8674; _static_
  :  this is an upload

  **.POST** &#8674; _static_
  :  HTTP POST method

  **.DIRLISTONLY** &#8674; _static_
  :  bare names when listing directories

  **.APPEND** &#8674; _static_
  :  Append instead of overwrite on upload!

  **.NETRC** &#8674; _static_
  :  Specify whether to read the user+password from the .netrc or the URL.
    This must be one of the CURL_NETRC_ enums below. 
     @static

  **.FOLLOWLOCATION** &#8674; _static_
  :  use Location: Luke!

  **.TRANSFERTEXT** &#8674; _static_
  :  transfer data in text/ASCII format

  **.PUT** &#8674; _static_
  :  HTTP PUT

  **.AUTOREFERER** &#8674; _static_
  :  We want the referrer field set automatically when following locations

  **.PROXYPORT** &#8674; _static_
  :  Port of the proxy, can be set in the proxy string as well with:
    "[host]:[port]"

  **.POSTFIELDSIZE** &#8674; _static_
  :  size of the POST input data, if strlen() is not good to use

  **.HTTPPROXYTUNNEL** &#8674; _static_
  :  tunnel non-http operations through a HTTP proxy

  **.INTERFACE** &#8674; _static_
  :  Set the interface string to use as outgoing network interface

  **.KRBLEVEL** &#8674; _static_
  :  Set the krb4/5 security level, this also enables krb4/5 awareness.  This
    is a string, 'clear', 'safe', 'confidential' or 'private'.  If the string
    is set but doesn't match one of these, 'private' will be used.

  **.SSL\_VERIFYPEER** &#8674; _static_
  :  Set if we should verify the peer in ssl handshake, set 1 to verify.

  **.CAINFO** &#8674; _static_
  :  The CApath or CAfile used to validate the peer certificate
    this option is used only if SSL_VERIFYPEER is true

  **.MAXREDIRS** &#8674; _static_
  :  Maximum number of http redirects to follow

  **.FILETIME** &#8674; _static_
  :  Pass a long set to 1 to get the date of the requested document (if
    possible)! Pass a zero to shut it off.

  **.TELNETOPTIONS** &#8674; _static_
  :  This points to a linked list of telnet options

  **.MAXCONNECTS** &#8674; _static_
  :  Max amount of cached alive connections

  **.FRESH\_CONNECT** &#8674; _static_
  :  Set to explicitly use a new connection for the upcoming transfer.
    Do not use this unless you're absolutely sure of this, as it makes the
    operation slower and is less friendly for the network.

  **.FORBID\_REUSE** &#8674; _static_
  :  Set to explicitly forbid the upcoming transfer's connection to be re-used
    when done. Do not use this unless you're absolutely sure of this, as it
    makes the operation slower and is less friendly for the network.

  **.CONNECTTIMEOUT** &#8674; _static_
  :  Time-out connect operations after this amount of seconds, if connects are
    OK within this time, then fine... This only aborts the connect phase.

  **.HTTPGET** &#8674; _static_
  :  Set this to force the HTTP request to get back to GET. Only really usable
    if POST, PUT or a custom request have been used first.

  **.SSL\_VERIFYHOST** &#8674; _static_
  :  Set if we should verify the Common name from the peer certificate in ssl
    handshake, set 1 to check existence, 2 to ensure that it matches the
    provided hostname.

  **.COOKIEJAR** &#8674; _static_
  :  Specify which file name to write all known cookies in after completed
    operation. Set file name to "-" (dash) to make it go to stdout.

  **.SSL\_CIPHER\_LIST** &#8674; _static_
  :  Specify which SSL ciphers to use

  **.HTTP\_VERSION** &#8674; _static_
  :  Specify which HTTP version to use! This must be set to one of the
    CURL_HTTP_VERSION enums set below. 
     @static

  **.FTP\_USE\_EPSV** &#8674; _static_
  :  Specifically switch on or off the FTP engine's use of the EPSV command. By
    default, that one will always be attempted before the more traditional
    PASV command.

  **.SSLCERTTYPE** &#8674; _static_
  :  type of the file keeping your SSL-certificate ("DER", "PEM", "ENG")

  **.SSLKEY** &#8674; _static_
  :  name of the file keeping your private SSL-key

  **.SSLKEYTYPE** &#8674; _static_
  :  type of the file keeping your private SSL-key ("DER", "PEM", "ENG")

  **.SSLENGINE** &#8674; _static_
  :  crypto engine for the SSL-sub system

  **.SSLENGINE\_DEFAULT** &#8674; _static_
  :  set the crypto engine for the SSL-sub system as default
    the param has no meaning...

  **.DNS\_USE\_GLOBAL\_CACHE** &#8674; _static_
  :  DEPRECATED, do not use!

  **.DNS\_CACHE\_TIMEOUT** &#8674; _static_
  :  DNS cache timeout

  **.PREQUOTE** &#8674; _static_
  :  send linked-list of pre-transfer QUOTE commands

  **.COOKIESESSION** &#8674; _static_
  :  mark this as start of a cookie session

  **.CAPATH** &#8674; _static_
  :  The CApath directory used to validate the peer certificate
    this option is used only if SSL_VERIFYPEER is true

  **.BUFFERSIZE** &#8674; _static_
  :  Instruct libcurl to use a smaller receive buffer

  **.NOSIGNAL** &#8674; _static_
  :  Instruct libcurl to not use any signal/alarm handlers, even when using
    timeouts. This option is useful for multi-threaded applications.
    See libcurl-the-guide for more background information.

  **.SHARE** &#8674; _static_
  :  Provide a CURLShare for mutexing non-ts data

  **.PROXYTYPE** &#8674; _static_
  :  indicates type of proxy. accepted values are CURLPROXY_HTTP (default),
    CURLPROXY_HTTPS, CURLPROXY_SOCKS4, CURLPROXY_SOCKS4A and
    CURLPROXY_SOCKS5.

  **.ACCEPT\_ENCODING** &#8674; _static_
  :  Set the Accept-Encoding string. Use this to tell a server you would like
    the response to be compressed. Before 7.21.6, this was known as
    CURLOPT_ENCODING

  **.PRIVATE** &#8674; _static_
  :  Set pointer to private data

  **.HTTP200ALIASES** &#8674; _static_
  :  Set aliases for HTTP 200 in the HTTP Response header

  **.UNRESTRICTED\_AUTH** &#8674; _static_
  :  Continue to send authentication (user+password) when following locations,
    even when hostname changed. This can potentially send off the name
    and password to whatever host the server decides.

  **.FTP\_USE\_EPRT** &#8674; _static_
  :  Specifically switch on or off the FTP engine's use of the EPRT command (
    it also disables the LPRT attempt). By default, those ones will always be
    attempted before the good old traditional PORT command.

  **.HTTPAUTH** &#8674; _static_
  :  Set this to a bitmask value to enable the particular authentications
    methods you like. Use this in combination with CURLOPT_USERPWD.
    Note that setting multiple bits may cause extra network round-trips.

  **.FTP\_CREATE\_MISSING\_DIRS** &#8674; _static_
  :  FTP Option that causes missing dirs to be created on the remote server.
    In 7.19.4 we introduced the convenience enums for this option using the
    CURLFTP_CREATE_DIR prefix.

  **.PROXYAUTH** &#8674; _static_
  :  Set this to a bitmask value to enable the particular authentications
    methods you like. Use this in combination with CURLOPT_PROXYUSERPWD.
    Note that setting multiple bits may cause extra network round-trips.

  **.FTP\_RESPONSE\_TIMEOUT** &#8674; _static_
  :  FTP option that changes the timeout, in seconds, associated with
    getting a response.  This is different from transfer timeout time and
    essentially places a demand on the FTP server to acknowledge commands
    in a timely manner.

  **.SERVER\_RESPONSE\_TIMEOUT** &#8674; _static_
  :  This option that changes the timeout, in seconds, associated with
    getting a response from a server.

  **.IPRESOLVE** &#8674; _static_
  :  Set this option to one of the CURL_IPRESOLVE_ defines (see below) to
     tell libcurl to use those IP versions only. This only has effect on
    systems with support for more than one, i.e IPv4 _and_ IPv6.

  **.MAXFILESIZE** &#8674; _static_
  :  Set this option to limit the size of a file that will be downloaded from
    an HTTP or FTP server.
    
    > There is also _LARGE version which adds large file support for
    platforms which have larger off_t sizes.  See MAXFILESIZE_LARGE below.

  **.INFILESIZE\_LARGE** &#8674; _static_
  :  See the comment for INFILESIZE above, but in short, specifies
    the size of the file being uploaded.  -1 means unknown.

  **.RESUME\_FROM\_LARGE** &#8674; _static_
  :  Sets the continuation offset.  There is also a CURLOPTTYPE_LONG version
    of this; look above for RESUME_FROM.

  **.MAXFILESIZE\_LARGE** &#8674; _static_
  :  Sets the maximum size of data that will be downloaded from
    an HTTP or FTP server.  See MAXFILESIZE above for the LONG version.

  **.NETRC\_FILE** &#8674; _static_
  :  Set this option to the file name of your .netrc file you want libcurl
    to parse (using the CURLOPT_NETRC option). If not set, libcurl will do
    a poor attempt to find the user's home directory and check for a .netrc
    file in there.

  **.USE\_SSL** &#8674; _static_
  :  Enable SSL/TLS for FTP, pick one of:
    CURLUSESSL_TRY     - try using SSL, proceed anyway otherwise
    CURLUSESSL_CONTROL - SSL for the control connection or fail
    CURLUSESSL_ALL     - SSL for all communication or fail

  **.POSTFIELDSIZE\_LARGE** &#8674; _static_
  :  The _LARGE version of the standard POSTFIELDSIZE option

  **.TCP\_NODELAY** &#8674; _static_
  :  Enable/disable the TCP Nagle algorithm

  **.FTPSSLAUTH** &#8674; _static_
  :  When FTP over SSL/TLS is selected (with CURLOPT_USE_SSL), this option
    can be used to change libcurl's default action which is to first try
    "AUTH SSL" and then "AUTH TLS" in this order, and proceed when a OK
    response has been received.
    
    Available parameters are:
    CURLFTPAUTH_DEFAULT - let libcurl decide
    CURLFTPAUTH_SSL     - try "AUTH SSL" first, then TLS
    CURLFTPAUTH_TLS     - try "AUTH TLS" first, then SSL

  **.FTP\_ACCOUNT** &#8674; _static_
  :  null-terminated string for pass on to the FTP server when asked for
    "account" info

  **.COOKIELIST** &#8674; _static_
  :  feed cookie into cookie engine

  **.IGNORE\_CONTENT\_LENGTH** &#8674; _static_
  :  ignore Content-Length

  **.FTP\_SKIP\_PASV\_IP** &#8674; _static_
  :  Set to non-zero to skip the IP address received in a 227 PASV FTP server
    response. Typically used for FTP-SSL purposes but is not restricted to
    that. libcurl will then instead use the same IP address it used for the
    control connection.

  **.FTP\_FILEMETHOD** &#8674; _static_
  :  Select "file method" to use when doing FTP, see the curl ftpmethod
    above.

  **.LOCALPORT** &#8674; _static_
  :  Local port number to bind the socket to

  **.LOCALPORTRANGE** &#8674; _static_
  :  Number of ports to try, including the first one set with LOCALPORT.
    Thus, setting it to 1 will make no additional attempts but the first.

  **.CONNECT\_ONLY** &#8674; _static_
  :  no transfer, set up connection and let application use the socket by
    extracting it with CURLINFO_LASTSOCKET

  **.MAX\_SEND\_SPEED\_LARGE** &#8674; _static_
  :  limit-rate: maximum number of bytes per second to send

  **.MAX\_RECV\_SPEED\_LARGE** &#8674; _static_
  :  limit-rate: maximum number of bytes per second to receive

  **.FTP\_ALTERNATIVE\_TO\_USER** &#8674; _static_
  :  Pointer to command string to send if USER/PASS fails.

  **.SSL\_SESSIONID\_CACHE** &#8674; _static_
  :  set to 0 to disable session ID re-use for this transfer, default is
    enabled (== 1)

  **.SSH\_AUTH\_TYPES** &#8674; _static_
  :  allowed SSH authentication methods

  **.SSH\_PUBLIC\_KEYFILE** &#8674; _static_
  :  Used by scp/sftp to do public key authentication

  **.SSH\_PRIVATE\_KEYFILE** &#8674; _static_
  :  Used by scp/sftp to do private key authentication

  **.FTP\_SSL\_CCC** &#8674; _static_
  :  Send CCC (Clear Command Channel) after authentication

  **.TIMEOUT\_MS** &#8674; _static_
  :  Same as TIMEOUT, but with ms resolution

  **.CONNECTTIMEOUT\_MS** &#8674; _static_
  :  Same as CONNECTTIMEOUT, but with ms resolution

  **.HTTP\_TRANSFER\_DECODING** &#8674; _static_
  :  set to zero to disable the libcurl's decoding and thus pass the raw body
    data to the application even when it is encoded/compressed via transfter encoding

  **.HTTP\_CONTENT\_DECODING** &#8674; _static_
  :  set to zero to disable the libcurl's decoding and thus pass the raw body
    data to the application even when it is encoded/compressed via content encoding

  **.NEW\_FILE\_PERMS** &#8674; _static_
  :  Permission used when creating new files on the remote
    server for protocols that support it, SFTP/SCP/FILE

  **.NEW\_DIRECTORY\_PERMS** &#8674; _static_
  :  Permission used when creating new directories on the remote
    server for protocols that support it, SFTP/SCP/FILE

  **.POSTREDIR** &#8674; _static_
  :  Set the behavior of POST when redirecting. Values must be set to one
    of CURL_REDIR defines below. This used to be called CURLOPT_POST301 
     @static

  **.SSH\_HOST\_PUBLIC\_KEY\_MD5** &#8674; _static_
  :  used by scp/sftp to verify the host's public key

  **.COPYPOSTFIELDS** &#8674; _static_
  :  POST volatile input fields.

  **.PROXY\_TRANSFER\_MODE** &#8674; _static_
  :  set transfer mode (;type=<a|i>) when doing FTP via an HTTP proxy

  **.CRLFILE** &#8674; _static_
  :  CRL file

  **.ISSUERCERT** &#8674; _static_
  :  Issuer certificate

  **.ADDRESS\_SCOPE** &#8674; _static_
  :  (IPv6) Address scope

  **.CERTINFO** &#8674; _static_
  :  Collect certificate chain info and allow it to get retrievable with
    CURLINFO_CERTINFO after the transfer is complete.

  **.USERNAME** &#8674; _static_
  :  "name" (username) to use when fetching.

  **.PASSWORD** &#8674; _static_
  :  "pwd" (password) to use when fetching.

  **.PROXYUSERNAME** &#8674; _static_
  :  "name" (username) to use with Proxy when fetching.

  **.PROXYPASSWORD** &#8674; _static_
  :  "pwd" (password) to use with Proxy when fetching.

  **.NOPROXY** &#8674; _static_
  :  Comma separated list of hostnames defining no-proxy zones. These should
    match both hostnames directly, and hostnames within a domain. For
    example, local.com will match local.com and www.local.com, but NOT
    notlocal.com or www.notlocal.com. For compatibility with other
    implementations of this, .local.com will be considered to be the same as
    local.com. A single is the only valid wildcard, and effectively
     disables the use of proxy.

  **.TFTP\_BLKSIZE** &#8674; _static_
  :  block size for TFTP transfers

  **.SOCKS5\_GSSAPI\_NEC** &#8674; _static_
  :  Socks Service

  **.PROTOCOLS** &#8674; _static_
  :  set the bitmask for the protocols that are allowed to be used for the
    transfer, which thus helps the app which takes URLs from users or other
    external inputs and want to restrict what protocol(s) to deal
    with. Defaults to CURLPROTO_ALL.

  **.REDIR\_PROTOCOLS** &#8674; _static_
  :  set the bitmask for the protocols that libcurl is allowed to follow to,
    as a subset of the CURLOPT_PROTOCOLS ones. That means the protocol needs
    to be set in both bitmasks to be allowed to get redirected to.

  **.SSH\_KNOWNHOSTS** &#8674; _static_
  :  set the SSH knownhost file name to use

  **.MAIL\_FROM** &#8674; _static_
  :  set the SMTP mail originator

  **.MAIL\_RCPT** &#8674; _static_
  :  set the list of SMTP mail receiver(s)

  **.FTP\_USE\_PRET** &#8674; _static_
  :  FTP: send PRET before PASV

  **.RTSP\_REQUEST** &#8674; _static_
  :  RTSP request method (OPTIONS, SETUP, PLAY, etc...)

  **.RTSP\_SESSION\_ID** &#8674; _static_
  :  The RTSP session identifier

  **.RTSP\_STREAM\_URI** &#8674; _static_
  :  The RTSP stream URI

  **.RTSP\_TRANSPORT** &#8674; _static_
  :  The Transport: header to use in RTSP requests

  **.RTSP\_CLIENT\_CSEQ** &#8674; _static_
  :  Manually initialize the client RTSP CSeq for this handle

  **.RTSP\_SERVER\_CSEQ** &#8674; _static_
  :  Manually initialize the server RTSP CSeq for this handle

  **.WILDCARDMATCH** &#8674; _static_
  :  Turn on wildcard matching

  **.RESOLVE** &#8674; _static_
  :  send linked-list of name:port:address sets

  **.TLSAUTH\_USERNAME** &#8674; _static_
  :  Set a username for authenticated TLS

  **.TLSAUTH\_PASSWORD** &#8674; _static_
  :  Set a password for authenticated TLS

  **.TLSAUTH\_TYPE** &#8674; _static_
  :  Set authentication type for authenticated TLS

  **.TRANSFER\_ENCODING** &#8674; _static_
  :  Set to 1 to enable the "TE:" header in HTTP requests to ask for
    compressed transfer-encoded responses. Set to 0 to disable the use of TE:
    in outgoing requests. The current default is 0, but it might change in a
    future libcurl release.
    
    libcurl will ask for the compressed methods it knows of, and if that
    isn't any, it will not ask for transfer-encoding at all even if this
    option is set to 1.

  **.GSSAPI\_DELEGATION** &#8674; _static_
  :  allow GSSAPI credential delegation

  **.DNS\_SERVERS** &#8674; _static_
  :  Set the name servers to use for DNS resolution

  **.ACCEPTTIMEOUT\_MS** &#8674; _static_
  :  Time-out accept operations (currently for FTP only) after this amount
    of milliseconds.

  **.TCP\_KEEPALIVE** &#8674; _static_
  :  Set TCP keepalive

  **.TCP\_KEEPIDLE** &#8674; _static_
  :  non-universal keepalive idle time (Linux, AIX, HP-UX, more)

  **.TCP\_KEEPINTVL** &#8674; _static_
  :  non-universal keepalive interval (Linux, AIX, HP-UX, more)

  **.SSL\_OPTIONS** &#8674; _static_
  :  Enable/disable specific SSL features with a bitmask, see CURLSSLOPT_ 
     @static

  **.MAIL\_AUTH** &#8674; _static_
  :  Set the SMTP auth originator

  **.SASL\_IR** &#8674; _static_
  :  Enable/disable SASL initial response

  **.XOAUTH2\_BEARER** &#8674; _static_
  :  The XOAUTH2 bearer token

  **.DNS\_INTERFACE** &#8674; _static_
  :  Set the interface string to use as outgoing network
    interface for DNS requests.
    Only supported by the c-ares DNS backend

  **.DNS\_LOCAL\_IP4** &#8674; _static_
  :  Set the local IPv4 address to use for outgoing DNS requests.
    Only supported by the c-ares DNS backend

  **.DNS\_LOCAL\_IP6** &#8674; _static_
  :  Set the local IPv6 address to use for outgoing DNS requests.
    Only supported by the c-ares DNS backend

  **.LOGIN\_OPTIONS** &#8674; _static_
  :  Set authentication options directly

  **.SSL\_ENABLE\_NPN** &#8674; _static_
  :  Enable/disable TLS NPN extension (http2 over ssl might fail without)

  **.SSL\_ENABLE\_ALPN** &#8674; _static_
  :  Enable/disable TLS ALPN extension (http2 over ssl might fail without)

  **.EXPECT\_100\_TIMEOUT\_MS** &#8674; _static_
  :  Time to wait for a response to a HTTP request containing an
    Expect: 100-continue header before sending the data anyway.

  **.PROXYHEADER** &#8674; _static_
  :  This points to a list of headers used for proxy requests only.

  **.HEADEROPT** &#8674; _static_
  :  Pass in a bitmask of "header options"

  **.PINNEDPUBLICKEY** &#8674; _static_
  :  The public key in DER form used to validate the peer public key
           this option is used only if SSL_VERIFYPEER is true

  **.UNIX\_SOCKET\_PATH** &#8674; _static_
  :  Path to Unix domain socket

  **.SSL\_VERIFYSTATUS** &#8674; _static_
  :  Set if we should verify the certificate status.

  **.SSL\_FALSESTART** &#8674; _static_
  :  Set if we should enable TLS false start.

  **.PATH\_AS\_IS** &#8674; _static_
  :  Do not squash dot-dot sequences

  **.PROXY\_SERVICE\_NAME** &#8674; _static_
  :  Proxy Service Name

  **.SERVICE\_NAME** &#8674; _static_
  :  Service Name

  **.PIPEWAIT** &#8674; _static_
  :  Wait/don't wait for pipe/mutex to clarify

  **.DEFAULT\_PROTOCOL** &#8674; _static_
  :  Set the protocol used when curl is given a URL without a protocol

  **.STREAM\_WEIGHT** &#8674; _static_
  :  Set stream weight, 1 - 256 (default is 16)

  **.STREAM\_DEPENDS** &#8674; _static_
  :  Set stream dependency on another CURL handle

  **.STREAM\_DEPENDS\_E** &#8674; _static_
  :  Set E-xclusive stream dependency on another CURL handle

  **.TFTP\_NO\_OPTIONS** &#8674; _static_
  :  Do not send any tftp option requests to the server

  **.CONNECT\_TO** &#8674; _static_
  :  Linked-list of host:port:connect-to-host:connect-to-port,
           overrides the URL's host:port (only for the network layer)

  **.TCP\_FASTOPEN** &#8674; _static_
  :  Set TCP Fast Open

  **.KEEP\_SENDING\_ON\_ERROR** &#8674; _static_
  :  Continue to send data if the server responds early with an
    HTTP status code >= 300

  **.PROXY\_CAINFO** &#8674; _static_
  :  The CApath or CAfile used to validate the proxy certificate
    this option is used only if PROXY_SSL_VERIFYPEER is true

  **.PROXY\_CAPATH** &#8674; _static_
  :  The CApath directory used to validate the proxy certificate
    this option is used only if PROXY_SSL_VERIFYPEER is true

  **.PROXY\_SSL\_VERIFYPEER** &#8674; _static_
  :  Set if we should verify the proxy in ssl handshake,
    set 1 to verify.

  **.PROXY\_SSL\_VERIFYHOST** &#8674; _static_
  :  Set if we should verify the Common name from the proxy certificate in ssl
    handshake, set 1 to check existence, 2 to ensure that it matches
    the provided hostname.

  **.PROXY\_SSLVERSION** &#8674; _static_
  :  What version to specifically try to use for proxy.
    See CURL_SSLVERSION defines below.

  **.PROXY\_TLSAUTH\_USERNAME** &#8674; _static_
  :  Set a username for authenticated TLS for proxy

  **.PROXY\_TLSAUTH\_PASSWORD** &#8674; _static_
  :  Set a password for authenticated TLS for proxy

  **.PROXY\_TLSAUTH\_TYPE** &#8674; _static_
  :  Set authentication type for authenticated TLS for proxy

  **.PROXY\_SSLCERT** &#8674; _static_
  :  name of the file keeping your private SSL-certificate for proxy

  **.PROXY\_SSLCERTTYPE** &#8674; _static_
  :  type of the file keeping your SSL-certificate ("DER", "PEM", "ENG") for
    proxy

  **.PROXY\_SSLKEY** &#8674; _static_
  :  name of the file keeping your private SSL-key for proxy

  **.PROXY\_SSLKEYTYPE** &#8674; _static_
  :  type of the file keeping your private SSL-key ("DER", "PEM", "ENG") for
    proxy

  **.PROXY\_KEYPASSWD** &#8674; _static_
  :  password for the SSL private key for proxy

  **.PROXY\_SSL\_CIPHER\_LIST** &#8674; _static_
  :  Specify which SSL ciphers to use for proxy

  **.PROXY\_CRLFILE** &#8674; _static_
  :  CRL file for proxy

  **.PROXY\_SSL\_OPTIONS** &#8674; _static_
  :  Enable/disable specific SSL features with a bitmask for proxy, see
    CURLSSLOPT_ 
     @static

  **.PRE\_PROXY** &#8674; _static_
  :  Name of pre proxy to use.

  **.PROXY\_PINNEDPUBLICKEY** &#8674; _static_
  :  The public key in DER form used to validate the proxy public key
    this option is used only if PROXY_SSL_VERIFYPEER is true

  **.ABSTRACT\_UNIX\_SOCKET** &#8674; _static_
  :  Path to an abstract Unix domain socket

  **.SUPPRESS\_CONNECT\_HEADERS** &#8674; _static_
  :  Suppress proxy CONNECT response headers from user callbacks

  **.REQUEST\_TARGET** &#8674; _static_
  :  The request target, instead of extracted from the URL

  **.SOCKS5\_AUTH** &#8674; _static_
  :  bitmask of allowed auth methods for connections to SOCKS5 proxies

  **.SSH\_COMPRESSION** &#8674; _static_
  :  Enable/disable SSH compression

  **.MIMEPOST** &#8674; _static_
  :  Post MIME data.

  **.READDATA** &#8674; _static_
  :  The data that will be used as the body of the request.

  **.TIMEVALUE\_LARGE** &#8674; _static_
  :  Time to use with the CURLOPT_TIMECONDITION. Specified in number of
    seconds since 1 Jan 1970.

  **.HAPPY\_EYEBALLS\_TIMEOUT\_MS** &#8674; _static_
  :  Head start in milliseconds to give happy eyeballs.

  **.HAPROXYPROTOCOL** &#8674; _static_
  :  send HAProxy PROXY protocol header?

  **.DNS\_SHUFFLE\_ADDRESSES** &#8674; _static_
  :  shuffle addresses before use when DNS returns multiple

  **.TLS13\_CIPHERS** &#8674; _static_
  :  Specify which TLS 1.3 ciphers suites to use

  **.PROXY\_TLS13\_CIPHERS** &#8674; _static_
  :  Specify which TLS 1.3 ciphers suites to use with a proxy

  **.DISALLOW\_USERNAME\_IN\_URL** &#8674; _static_
  :  Disallow specifying username/login in URL.

  **.DOH\_URL** &#8674; _static_
  :  DNS-over-HTTPS URL

  **.UPLOAD\_BUFFERSIZE** &#8674; _static_
  :  Preferred buffer size to use for uploads

  **.UPKEEP\_INTERVAL\_MS** &#8674; _static_
  :  Time in ms between connection upkeep calls for long-lived connections.

  **.CURLU** &#8674; _static_
  :  Specify URL using CURL URL API.

  **.HTTP09\_ALLOWED** &#8674; _static_
  :  set this to 1L to allow HTTP/0.9 responses or 0L to disallow

  **.ALTSVC\_CTRL** &#8674; _static_
  :  alt-svc control bitmask

  **.ALTSVC** &#8674; _static_
  :  alt-svc cache file name to possibly read from/write to

  **.MAXAGE\_CONN** &#8674; _static_
  :  maximum age of a connection to consider it for reuse (in seconds)

  **.SASL\_AUTHZID** &#8674; _static_
  :  SASL authorisation identity




