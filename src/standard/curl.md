# curl

## Fields

_curl_.**version** &#x279D; _string_
: The libcurl version.


## Functions

_curl_.get\_time(_date_string_) {#curl.get_time}

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
  {.returns}



## Classes

_class_ **Info** {#curl.Info .class}

: cURL request and response informations for `get_info()`


  _static_ .**.EFFECTIVE\_URL** &#x279D;
  : Gets the last used effective URL. If follow redirects is enabled, 
    it may very well not be the same value you set in the original request.

  _static_ .**.RESPONSE\_CODE** &#x279D;
  : The last received HTTP, FTP or SMTP response code. The value will be 
    zero if no server response code has been received.

  _static_ .**.TOTAL\_TIME** &#x279D;
  : The total time in seconds for the previous transfer, including name resolving, 
    TCP connect etc. The value represents the time in seconds, including fractions.

  _static_ .**.NAMELOOKUP\_TIME** &#x279D;
  : The total time in seconds from the start until the name resolving was completed.

  _static_ .**.CONNECT\_TIME** &#x279D;
  : The total time in seconds from the start until the connection to the remote host 
    (or proxy) was completed.

  _static_ .**.PRETRANSFER\_TIME** &#x279D;
  : The time, in seconds, it took from the start until a file transfer is just about 
    to begin.
    
    This time-stamp includes all pre-transfer commands and negotiations that are 
    specific to the particular protocol(s) involved. It includes the sending of the 
    protocol- specific protocol instructions that triggers a transfer.

  _static_ .**.SIZE\_UPLOAD** &#x279D;
  : The total amount of bytes that were uploaded.

  _static_ .**.SIZE\_DOWNLOAD** &#x279D;
  : The total amount of bytes that were  downloaded.  The amount is only for the 
    latest transfer and will be reset again for each new transfer. This counts actual 
    payload data, what's also commonly called body. All meta and header data are 
    excluded and will not be counted in this number.

  _static_ .**.SPEED\_DOWNLOAD** &#x279D;
  : The average download speed that curl measured for the complete download. Measured 
    in bytes/second.

  _static_ .**.SPEED\_UPLOAD** &#x279D;
  : The average upload speed that curl measured for the complete upload. Measured 
    in bytes/second.

  _static_ .**.HEADER\_SIZE** &#x279D;
  : The total size of all the headers received. Measured in number of bytes.

  _static_ .**.REQUEST\_SIZE** &#x279D;
  : The total size of the issued requests. This is so far only for HTTP requests.

  _static_ .**.SSL\_VERIFYRESULT** &#x279D;
  : The result of the server SSL certificate verification that was requested (using 
    the `Options.SSL_VERIFYPEER` option).

  _static_ .**.FILETIME** &#x279D;
  : The remote time of the retrieved document (in number of seconds since 1 jan 1970 
    in the GMT/UTC time zone). If you get -1, it can be because of many reasons (it might 
    be unknown, the server might hide it or the server doesn't support the command that 
    tells document time etc) and the time of the document is unknown.
    
    You _MUST_ to collect this information before the transfer is made, by using the 
    `Options.FILETIME` option to `set_option()` or you will unconditionally get a -1 back.

  _static_ .**.CONTENT\_LENGTH\_DOWNLOAD** &#x279D;
  : The content-length of the download. This is the value read from the `Content-Length:` 
    field. It is -1 if the size isn't known.

  _static_ .**.CONTENT\_LENGTH\_UPLOAD** &#x279D;
  : The content-length of the upload. It is -1 if the size isn't known.

  _static_ .**.STARTTRANSFER\_TIME** &#x279D;
  : The time, in seconds, it took from the start until the first byte is received by 
    `curl`. This includes `PRETRANSFER_TIME` and also the time the server needs to 
    calculate the result.

  _static_ .**.CONTENT\_TYPE** &#x279D;
  : The content-type of the downloaded object. This is the value read from the 
    `Content-Type:` field. If you get `nil`, it means that the server didn't send a 
    valid Content-Type header or that the protocol used doesn't support this.

  _static_ .**.REDIRECT\_TIME** &#x279D;
  : The total time, in seconds, it took for all redirection steps include name lookup, 
    connect, pretransfer and transfer before final transaction was started.

  _static_ .**.REDIRECT\_COUNT** &#x279D;
  : The total number of redirections that were actually followed.

  _static_ .**.HTTP\_CONNECTCODE** &#x279D;
  : The last received HTTP proxy response code to a CONNECT request. The returned value 
    will be zero if no such response code was available.

  _static_ .**.HTTPAUTH\_AVAIL** &#x279D;
  : A bitmask indicating the authentication method(s) available according to the 
    previous response.

  _static_ .**.PROXYAUTH\_AVAIL** &#x279D;
  : A bitmask indicating the authentication method(s) available according to the 
    previous response.

  _static_ .**.OS\_ERRNO** &#x279D;
  : The errno variable from a connect failure.  Note that the value is only set on 
    failure, it is not reset upon a successful operation. The number is OS and system 
    specific.

  _static_ .**.NUM\_CONNECTS** &#x279D;
  : How many new connections `curl` had to create to achieve the previous transfer 
    (only the successful connects are counted). Combined with `REDIRECT_COUNT` you are 
    able to know how many times `curl` successfully reused existing connection(s) or not.

  _static_ .**.COOKIELIST** &#x279D;
  : A list of all cookies curl knows (expired ones, too). If there are no cookies, an 
    empty list is returned.
    
    
    > Cookies that were imported in the Set-Cookie format without a domain name may not 
    > exported by this option.

  _static_ .**.FTP\_ENTRY\_PATH** &#x279D;
  : A string holding the path of the entry path. That is the initial path `curl` ended up 
    in when logging on to the remote FTP server. This value is `nil` if something is wrong.

  _static_ .**.REDIRECT\_URL** &#x279D;
  : The URL a redirect would take you to if you would enable `FOLLOWLOCATION`. This can 
    come very handy if you think using the built-in `curl` redirect logic isn't good
    enough for you but you would still prefer to avoid implementing all the magic of 
    figuring out the new URL.

  _static_ .**.PRIMARY\_IP** &#x279D;
  : A string holding the IP address of the most recent connection done with this `curl` 
    handle.

  _static_ .**.APPCONNECT\_TIME** &#x279D;
  : The time, in seconds, it took from the start until the SSL/SSH connect/handshake to 
    the remote host was completed.  This time is most often very near to the 
    `PRETRANSFER_TIME` time, except for cases such as HTTP pipelining where the pretransfer
    time can be delayed due to waits in line for the pipeline and more.

  _static_ .**.CERTINFO** &#x279D;
  : Lists with info about the certificate chain, assuming you had `Options.CERTINFO` 
    enabled when the request was made. Information in each entry of the list is provided 
    in a series of data in the format "name:content" where the content is for the specific 
    named data.

  _static_ .**.CONDITION\_UNMET** &#x279D;
  : The number `1` if the condition provided in the previous request didn't match 
    (see `Options.TIMECONDITION`). Alas, if this returns a `1` you know that the 
    reason you didn't get data in return is because it didn't fulfill the condition. 
    This value will be zero if the condition was met. This can also return `1` if the 
    server responded with a 304 HTTP status code, for example after sending a custom 
    "If-Match-" header.
     @static

  _static_ .**.RTSP\_SESSION\_ID** &#x279D;
  : A string holding the most recent RTSP Session ID.
    
    
    > Applications wishing to resume an RTSP session on another connection should 
    > retrieve this info before closing the active connection.

  _static_ .**.RTSP\_CLIENT\_CSEQ** &#x279D;
  : The next CSeq that will be used by the application.

  _static_ .**.RTSP\_SERVER\_CSEQ** &#x279D;
  : The next CSeq that is expected by the application.
    
    
    > Applications wishing to resume an RTSP session on another connection should retrieve 
    > this info before closing the active connection.

  _static_ .**.RTSP\_CSEQ\_RECV** &#x279D;
  : The most recently received CSeq from the server.

  _static_ .**.PRIMARY\_PORT** &#x279D;
  : The destination port of the most recent connection done with the `curl` instance.

  _static_ .**.LOCAL\_IP** &#x279D;
  : A string holding the IP address of the local end of most recent connection done 
    with the `curl` instance.

  _static_ .**.LOCAL\_PORT** &#x279D;
  : The local port number of the most recent connection done with the `curl` instance.

  _static_ .**.HTTP\_VERSION** &#x279D;
  : The HTTP version used in the last http connection.

  _static_ .**.PROXY\_SSL\_VERIFYRESULT** &#x279D;
  : The result of the certificate verification that was requested (using the 
    `Options.PROXY_SSL_VERIFYPEER` option.

  _static_ .**.PROTOCOL** &#x279D;
  : The protocol used in the last request.

  _static_ .**.SCHEME** &#x279D;
  : A string holding the URL scheme used for the most recent connection done with 
    this `curl` instance.

  _static_ .**.TOTAL\_TIME\_T** &#x279D;
  : The total time in microseconds for the previous transfer, including name resolving, 
    TCP connect etc.

  _static_ .**.NAMELOOKUP\_TIME\_T** &#x279D;
  : The total time in microseconds from the start until the name resolving was completed.

  _static_ .**.CONNECT\_TIME\_T** &#x279D;
  : The total time in microseconds from the start until the connection to the remote 
    host (or proxy) was completed.

  _static_ .**.PRETRANSFER\_TIME\_T** &#x279D;
  : The total time in microseconds from the start until the file transfer is just about 
    to begin. This includes all pre-transfer commands and negotiations that are specific 
    to the particular protocol(s) involved. It does not involve the sending of the 
    protocol- specific request that triggers a transfer.

  _static_ .**.STARTTRANSFER\_TIME\_T** &#x279D;
  : The total time in microseconds from the start until the first byte is received by 
    `curl`. This includes `PRETRANSFER_TIME_T` and also the time the server needs to 
    calculate the result.

  _static_ .**.REDIRECT\_TIME\_T** &#x279D;
  : The total time in microseconds it took for all redirection steps include name lookup,
    connect, pretransfer and transfer before final transaction was started. It contains 
    the complete execution time for  multiple redirections.

  _static_ .**.APPCONNECT\_TIME\_T** &#x279D;
  : The total time in microseconds from the start until the SSL/SSH connect/handshake 
    to the remote host was completed.  This time is most often very near to the 
    `PRETRANSFER_TIME_T` time, except for cases such as HTTP pipelining where the 
    pretransfer time can be delayed due to waits in line for the pipeline and more.

  _static_ .**.RETRY\_AFTER** &#x279D;
  : The number of seconds the HTTP server suggests the client should wait until the 
    next request is issued. 
    
    
    
    > While the HTTP header might contain a fixed date string, the `RETRY_AFTER` will 
    > always return number of seconds to wait - or zero if there was no header or the 
    > header couldn't be parsed.




_class_ **CurlMime** {#curl.CurlMime .class}

: cURL Mime object for multipart-data forms and POST requests.


  .CurlMime(_curl_) &#x279D; _Constructor_ {#curl.CurlMime.CurlMime}

  : curl.CurlMime constructor


    - **@params**:
      - _[Curl](#curl.Curl)_ **curl**

    {.params}


  .add(_name_, _value_) {#curl.CurlMime.add}

  : Adds a new mime part with the given name and value.


    - **@params**:
      - _string_ **name**
      - _any_ **value**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .add\_as(_value_, _type_) {#curl.CurlMime.add_as}

  : Adds a new mime part with the given data and type.


    - **@params**:
      - _any_ **value**
      - _string_ **type**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .add\_data(_data_) {#curl.CurlMime.add_data}

  : Adds a new mime part with the given data.


    - **@params**:
      - _any_ **data**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .add\_file(_name_, _value_) {#curl.CurlMime.add_file}

  : Adds a new mime part with the given name and file.


    - **@params**:
      - _string_ **name**
      - _string|instance_ **value**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .add\_mime(_mime_, _type_) {#curl.CurlMime.add_mime}

  : Adds a new mime subpart with the given mime.


    - **@params**:
      - _[CurlMime](#curl.CurlMime)_ **mime**
      - _string_ **type**

    {.params}
    - **@returns**: _bool_
    {.returns}


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


  .Curl() &#x279D; _Constructor_ {#curl.Curl.Curl}

  : curl.Curl constructor




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
    {.returns}


  .get\_info(_info_) {#curl.Curl.get_info}

  : Requests internal information from the `curl` session with this function.
    Use this function AFTER performing a transfer if you want to get transfer 
    related data.


    - **@params**:
      - _[Info](#curl.Info)_ **info**

    {.params}
    - **@returns**: _string|number|list_
    {.returns}


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
    {.returns}


  .unescape(_str_) {#curl.Curl.unescape}

  : This function converts the given URL encoded input string to a "plain
    string" and returns that in an allocated memory area. All input characters 
    that are URL encoded (%XX where XX is a two-digit hexadecimal number) are 
    converted to their decoded versions.


    - **@params**:
      - _string_ **str**

    {.params}
    - **@returns**: _string_
    {.returns}


  .send() {#curl.Curl.send}

  : Performs the entire request in a blocking manner and returns when done, or 
    if it failed. It returns a dictionary containing the `headers` and `body` key.
    
    
    > You must never call this function simultaneously from two places using
    > the same instance. Let the function return first before invoking it
    > another time.


    - **@returns**: _dict_
    {.returns}


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


  _static_ .**.NONE** &#x279D;
  : No HTTP authentication

  _static_ .**.BASIC** &#x279D;
  : HTTP Basic authentication (default)

  _static_ .**.DIGEST** &#x279D;
  : HTTP Digest authentication

  _static_ .**.NEGOTIATE** &#x279D;
  : HTTP Negotiate (SPNEGO) authentication

  _static_ .**.GSSNEGOTIATE** &#x279D;
  : Alias for CURLAUTH_NEGOTIATE (deprecated)

  _static_ .**.NTLM** &#x279D;
  : HTTP NTLM authentication

  _static_ .**.DIGEST\_IE** &#x279D;
  : HTTP Digest authentication with IE flavour

  _static_ .**.NTLM\_WB** &#x279D;
  : HTTP NTLM authentication delegated to winbind helper

  _static_ .**.BEARER** &#x279D;
  : HTTP Bearer token authentication

  _static_ .**.ONLY** &#x279D;
  : Use together with a single other type to force no authentication or 
    just that single type.

  _static_ .**.ANY** &#x279D;
  : All fine types set

  _static_ .**.ANYSAFE** &#x279D;
  : All fine types except Basic

  _static_ .**.SSH\_ANY** &#x279D;
  : All types of SSH authentication supported by the server

  _static_ .**.SSH\_NONE** &#x279D;
  : No SSH allowed

  _static_ .**.SSH\_PUBLICKEY** &#x279D;
  : Public/private key files for SSH authentication.

  _static_ .**.SSH\_PASSWORD** &#x279D;
  : Password for SSH authentication.

  _static_ .**.SSH\_HOST** &#x279D;
  : Host key files for SSH authentication.

  _static_ .**.SSH\_KEYBOARD** &#x279D;
  : Keyboard interactive SSH authentication.

  _static_ .**.SSH\_AGENT** &#x279D;
  : Agent (ssh-agent, pageant, etc.) for SSH authentication.

  _static_ .**.SSH\_GSSAPI** &#x279D;
  : gssapi (kerberos, etc.) for SSH authentication.

  _static_ .**.SSH\_DEFAULT** &#x279D;
  : The default SSH authentication (same as ANY).




_class_ **UseSSL** {#curl.UseSSL .class}

: cURL request options for `set_option()`


  _static_ .**.NONE** &#x279D;
  : Do not attempt to use SSL.

  _static_ .**.TRY** &#x279D;
  : Try using SSL, proceed anyway otherwise.

  _static_ .**.CONTROL** &#x279D;
  : Use SSL for the control connection or fail.

  _static_ .**.ALL** &#x279D;
  : Use SSL for all communication or fail




_class_ **FileType** {#curl.FileType .class}

: cURL file types


  _static_ .**.FILE** &#x279D;
  : File

  _static_ .**.DIRECTORY** &#x279D;
  : Directory

  _static_ .**.SYMLINK** &#x279D;
  : Symbolic Link

  _static_ .**.DEVICE\_CHAR** &#x279D;
  : 

  _static_ .**.NAMEDPIPE** &#x279D;
  : Named Pipe

  _static_ .**.SOCKET** &#x279D;
  : Socket

  _static_ .**.DOOR** &#x279D;
  : Door. This is only possible on Sun Solaris now




_class_ **Option** {#curl.Option .class}

: cURL request options for `set_option()`


  _static_ .**.URL** &#x279D;
  : The full URL to get/put

  _static_ .**.PORT** &#x279D;
  : Port number to connect to, if other than default.

  _static_ .**.PROXY** &#x279D;
  : Name of proxy to use.

  _static_ .**.USERPWD** &#x279D;
  : "user:password;options" to use when fetching.

  _static_ .**.PROXYUSERPWD** &#x279D;
  : "user:password" to use with proxy.

  _static_ .**.RANGE** &#x279D;
  : Range to get, specified as an ASCII string.

  _static_ .**.ERRORBUFFER** &#x279D;
  : Buffer to receive error messages in, must be at least CURL_ERROR_SIZE
    bytes big.

  _static_ .**.TIMEOUT** &#x279D;
  : Time-out the read operation after this amount of seconds

  _static_ .**.INFILESIZE** &#x279D;
  : If the CURLOPT_INFILE is used, this can be used to inform libcurl about
    how large the file being sent really is. That allows better error
    checking and better verifies that the upload was successful. -1 means
    unknown size.
    For large file support, there is also a _LARGE version of the key
    which takes an off_t type, allowing platforms with larger off_t
    sizes to handle larger files.  See below for INFILESIZE_LARGE.

  _static_ .**.POSTFIELDS** &#x279D;
  : POST static input fields.

  _static_ .**.REFERER** &#x279D;
  : Set the referrer page (needed by some CGIs)

  _static_ .**.FTPPORT** &#x279D;
  : Set the FTP PORT string (interface name, named or numerical IP address)
           Use i.e '-' to use default address.

  _static_ .**.USERAGENT** &#x279D;
  : Set the User-Agent string (examined by some CGIs)

  _static_ .**.LOW\_SPEED\_LIMIT** &#x279D;
  : Set the "low speed limit"

  _static_ .**.LOW\_SPEED\_TIME** &#x279D;
  : Set the "low speed time"

  _static_ .**.RESUME\_FROM** &#x279D;
  : Set the continuation offset.
    Note there is also a _LARGE version of this key which uses
    off_t types, allowing for large file offsets on platforms which
    use larger-than-32-bit off_t's.  Look below for RESUME_FROM_LARGE.

  _static_ .**.COOKIE** &#x279D;
  : Set cookie in request:

  _static_ .**.HTTPHEADER** &#x279D;
  : This points to a list of HTTP header strings. This
    list is also used for RTSP (in spite of its name)

  _static_ .**.HTTPPOST** &#x279D;
  : This points to a linked list of post entries.

  _static_ .**.SSLCERT** &#x279D;
  : name of the file keeping your private SSL-certificate

  _static_ .**.KEYPASSWD** &#x279D;
  : password for the SSL or SSH private key

  _static_ .**.CRLF** &#x279D;
  : send TYPE parameter?

  _static_ .**.QUOTE** &#x279D;
  : send linked-list of QUOTE commands

  _static_ .**.COOKIEFILE** &#x279D;
  : point to a file to read the initial cookies from, also enables
    "cookie awareness"

  _static_ .**.SSLVERSION** &#x279D;
  : What version to specifically try to use.
    See CURL_SSLVERSION defines below.

  _static_ .**.TIMECONDITION** &#x279D;
  : What kind of HTTP time condition to use, see defines

  _static_ .**.TIMEVALUE** &#x279D;
  : Time to use with the above condition. Specified in number of seconds
    since 1 Jan 1970

  _static_ .**.CUSTOMREQUEST** &#x279D;
  : Custom request, for customizing the get command like
    HTTP: DELETE, TRACE and others
    FTP: to use a different list command

  _static_ .**.STDERR** &#x279D;
  : FILE handle to use instead of stderr

  _static_ .**.POSTQUOTE** &#x279D;
  : send linked-list of post-transfer QUOTE commands

  _static_ .**.VERBOSE** &#x279D;
  : talk a lot

  _static_ .**.HEADER** &#x279D;
  : throw the header out too

  _static_ .**.NOPROGRESS** &#x279D;
  : shut off the progress meter

  _static_ .**.NOBODY** &#x279D;
  : use HEAD to get http document

  _static_ .**.FAILONERROR** &#x279D;
  : no output on http error codes >= 400

  _static_ .**.UPLOAD** &#x279D;
  : this is an upload

  _static_ .**.POST** &#x279D;
  : HTTP POST method

  _static_ .**.DIRLISTONLY** &#x279D;
  : bare names when listing directories

  _static_ .**.APPEND** &#x279D;
  : Append instead of overwrite on upload!

  _static_ .**.NETRC** &#x279D;
  : Specify whether to read the user+password from the .netrc or the URL.
    This must be one of the CURL_NETRC_ enums below. 
     @static

  _static_ .**.FOLLOWLOCATION** &#x279D;
  : use Location: Luke!

  _static_ .**.TRANSFERTEXT** &#x279D;
  : transfer data in text/ASCII format

  _static_ .**.PUT** &#x279D;
  : HTTP PUT

  _static_ .**.AUTOREFERER** &#x279D;
  : We want the referrer field set automatically when following locations

  _static_ .**.PROXYPORT** &#x279D;
  : Port of the proxy, can be set in the proxy string as well with:
    "[host]:[port]"

  _static_ .**.POSTFIELDSIZE** &#x279D;
  : size of the POST input data, if strlen() is not good to use

  _static_ .**.HTTPPROXYTUNNEL** &#x279D;
  : tunnel non-http operations through a HTTP proxy

  _static_ .**.INTERFACE** &#x279D;
  : Set the interface string to use as outgoing network interface

  _static_ .**.KRBLEVEL** &#x279D;
  : Set the krb4/5 security level, this also enables krb4/5 awareness.  This
    is a string, 'clear', 'safe', 'confidential' or 'private'.  If the string
    is set but doesn't match one of these, 'private' will be used.

  _static_ .**.SSL\_VERIFYPEER** &#x279D;
  : Set if we should verify the peer in ssl handshake, set 1 to verify.

  _static_ .**.CAINFO** &#x279D;
  : The CApath or CAfile used to validate the peer certificate
    this option is used only if SSL_VERIFYPEER is true

  _static_ .**.MAXREDIRS** &#x279D;
  : Maximum number of http redirects to follow

  _static_ .**.FILETIME** &#x279D;
  : Pass a long set to 1 to get the date of the requested document (if
    possible)! Pass a zero to shut it off.

  _static_ .**.TELNETOPTIONS** &#x279D;
  : This points to a linked list of telnet options

  _static_ .**.MAXCONNECTS** &#x279D;
  : Max amount of cached alive connections

  _static_ .**.FRESH\_CONNECT** &#x279D;
  : Set to explicitly use a new connection for the upcoming transfer.
    Do not use this unless you're absolutely sure of this, as it makes the
    operation slower and is less friendly for the network.

  _static_ .**.FORBID\_REUSE** &#x279D;
  : Set to explicitly forbid the upcoming transfer's connection to be re-used
    when done. Do not use this unless you're absolutely sure of this, as it
    makes the operation slower and is less friendly for the network.

  _static_ .**.CONNECTTIMEOUT** &#x279D;
  : Time-out connect operations after this amount of seconds, if connects are
    OK within this time, then fine... This only aborts the connect phase.

  _static_ .**.HTTPGET** &#x279D;
  : Set this to force the HTTP request to get back to GET. Only really usable
    if POST, PUT or a custom request have been used first.

  _static_ .**.SSL\_VERIFYHOST** &#x279D;
  : Set if we should verify the Common name from the peer certificate in ssl
    handshake, set 1 to check existence, 2 to ensure that it matches the
    provided hostname.

  _static_ .**.COOKIEJAR** &#x279D;
  : Specify which file name to write all known cookies in after completed
    operation. Set file name to "-" (dash) to make it go to stdout.

  _static_ .**.SSL\_CIPHER\_LIST** &#x279D;
  : Specify which SSL ciphers to use

  _static_ .**.HTTP\_VERSION** &#x279D;
  : Specify which HTTP version to use! This must be set to one of the
    CURL_HTTP_VERSION enums set below. 
     @static

  _static_ .**.FTP\_USE\_EPSV** &#x279D;
  : Specifically switch on or off the FTP engine's use of the EPSV command. By
    default, that one will always be attempted before the more traditional
    PASV command.

  _static_ .**.SSLCERTTYPE** &#x279D;
  : type of the file keeping your SSL-certificate ("DER", "PEM", "ENG")

  _static_ .**.SSLKEY** &#x279D;
  : name of the file keeping your private SSL-key

  _static_ .**.SSLKEYTYPE** &#x279D;
  : type of the file keeping your private SSL-key ("DER", "PEM", "ENG")

  _static_ .**.SSLENGINE** &#x279D;
  : crypto engine for the SSL-sub system

  _static_ .**.SSLENGINE\_DEFAULT** &#x279D;
  : set the crypto engine for the SSL-sub system as default
    the param has no meaning...

  _static_ .**.DNS\_USE\_GLOBAL\_CACHE** &#x279D;
  : DEPRECATED, do not use!

  _static_ .**.DNS\_CACHE\_TIMEOUT** &#x279D;
  : DNS cache timeout

  _static_ .**.PREQUOTE** &#x279D;
  : send linked-list of pre-transfer QUOTE commands

  _static_ .**.COOKIESESSION** &#x279D;
  : mark this as start of a cookie session

  _static_ .**.CAPATH** &#x279D;
  : The CApath directory used to validate the peer certificate
    this option is used only if SSL_VERIFYPEER is true

  _static_ .**.BUFFERSIZE** &#x279D;
  : Instruct libcurl to use a smaller receive buffer

  _static_ .**.NOSIGNAL** &#x279D;
  : Instruct libcurl to not use any signal/alarm handlers, even when using
    timeouts. This option is useful for multi-threaded applications.
    See libcurl-the-guide for more background information.

  _static_ .**.SHARE** &#x279D;
  : Provide a CURLShare for mutexing non-ts data

  _static_ .**.PROXYTYPE** &#x279D;
  : indicates type of proxy. accepted values are CURLPROXY_HTTP (default),
    CURLPROXY_HTTPS, CURLPROXY_SOCKS4, CURLPROXY_SOCKS4A and
    CURLPROXY_SOCKS5.

  _static_ .**.ACCEPT\_ENCODING** &#x279D;
  : Set the Accept-Encoding string. Use this to tell a server you would like
    the response to be compressed. Before 7.21.6, this was known as
    CURLOPT_ENCODING

  _static_ .**.PRIVATE** &#x279D;
  : Set pointer to private data

  _static_ .**.HTTP200ALIASES** &#x279D;
  : Set aliases for HTTP 200 in the HTTP Response header

  _static_ .**.UNRESTRICTED\_AUTH** &#x279D;
  : Continue to send authentication (user+password) when following locations,
    even when hostname changed. This can potentially send off the name
    and password to whatever host the server decides.

  _static_ .**.FTP\_USE\_EPRT** &#x279D;
  : Specifically switch on or off the FTP engine's use of the EPRT command (
    it also disables the LPRT attempt). By default, those ones will always be
    attempted before the good old traditional PORT command.

  _static_ .**.HTTPAUTH** &#x279D;
  : Set this to a bitmask value to enable the particular authentications
    methods you like. Use this in combination with CURLOPT_USERPWD.
    Note that setting multiple bits may cause extra network round-trips.

  _static_ .**.FTP\_CREATE\_MISSING\_DIRS** &#x279D;
  : FTP Option that causes missing dirs to be created on the remote server.
    In 7.19.4 we introduced the convenience enums for this option using the
    CURLFTP_CREATE_DIR prefix.

  _static_ .**.PROXYAUTH** &#x279D;
  : Set this to a bitmask value to enable the particular authentications
    methods you like. Use this in combination with CURLOPT_PROXYUSERPWD.
    Note that setting multiple bits may cause extra network round-trips.

  _static_ .**.FTP\_RESPONSE\_TIMEOUT** &#x279D;
  : FTP option that changes the timeout, in seconds, associated with
    getting a response.  This is different from transfer timeout time and
    essentially places a demand on the FTP server to acknowledge commands
    in a timely manner.

  _static_ .**.SERVER\_RESPONSE\_TIMEOUT** &#x279D;
  : This option that changes the timeout, in seconds, associated with
    getting a response from a server.

  _static_ .**.IPRESOLVE** &#x279D;
  : Set this option to one of the CURL_IPRESOLVE_ defines (see below) to
     tell libcurl to use those IP versions only. This only has effect on
    systems with support for more than one, i.e IPv4 _and_ IPv6.

  _static_ .**.MAXFILESIZE** &#x279D;
  : Set this option to limit the size of a file that will be downloaded from
    an HTTP or FTP server.
    
    > There is also _LARGE version which adds large file support for
    platforms which have larger off_t sizes.  See MAXFILESIZE_LARGE below.

  _static_ .**.INFILESIZE\_LARGE** &#x279D;
  : See the comment for INFILESIZE above, but in short, specifies
    the size of the file being uploaded.  -1 means unknown.

  _static_ .**.RESUME\_FROM\_LARGE** &#x279D;
  : Sets the continuation offset.  There is also a CURLOPTTYPE_LONG version
    of this; look above for RESUME_FROM.

  _static_ .**.MAXFILESIZE\_LARGE** &#x279D;
  : Sets the maximum size of data that will be downloaded from
    an HTTP or FTP server.  See MAXFILESIZE above for the LONG version.

  _static_ .**.NETRC\_FILE** &#x279D;
  : Set this option to the file name of your .netrc file you want libcurl
    to parse (using the CURLOPT_NETRC option). If not set, libcurl will do
    a poor attempt to find the user's home directory and check for a .netrc
    file in there.

  _static_ .**.USE\_SSL** &#x279D;
  : Enable SSL/TLS for FTP, pick one of:
    CURLUSESSL_TRY     - try using SSL, proceed anyway otherwise
    CURLUSESSL_CONTROL - SSL for the control connection or fail
    CURLUSESSL_ALL     - SSL for all communication or fail

  _static_ .**.POSTFIELDSIZE\_LARGE** &#x279D;
  : The _LARGE version of the standard POSTFIELDSIZE option

  _static_ .**.TCP\_NODELAY** &#x279D;
  : Enable/disable the TCP Nagle algorithm

  _static_ .**.FTPSSLAUTH** &#x279D;
  : When FTP over SSL/TLS is selected (with CURLOPT_USE_SSL), this option
    can be used to change libcurl's default action which is to first try
    "AUTH SSL" and then "AUTH TLS" in this order, and proceed when a OK
    response has been received.
    
    Available parameters are:
    CURLFTPAUTH_DEFAULT - let libcurl decide
    CURLFTPAUTH_SSL     - try "AUTH SSL" first, then TLS
    CURLFTPAUTH_TLS     - try "AUTH TLS" first, then SSL

  _static_ .**.FTP\_ACCOUNT** &#x279D;
  : null-terminated string for pass on to the FTP server when asked for
    "account" info

  _static_ .**.COOKIELIST** &#x279D;
  : feed cookie into cookie engine

  _static_ .**.IGNORE\_CONTENT\_LENGTH** &#x279D;
  : ignore Content-Length

  _static_ .**.FTP\_SKIP\_PASV\_IP** &#x279D;
  : Set to non-zero to skip the IP address received in a 227 PASV FTP server
    response. Typically used for FTP-SSL purposes but is not restricted to
    that. libcurl will then instead use the same IP address it used for the
    control connection.

  _static_ .**.FTP\_FILEMETHOD** &#x279D;
  : Select "file method" to use when doing FTP, see the curl ftpmethod
    above.

  _static_ .**.LOCALPORT** &#x279D;
  : Local port number to bind the socket to

  _static_ .**.LOCALPORTRANGE** &#x279D;
  : Number of ports to try, including the first one set with LOCALPORT.
    Thus, setting it to 1 will make no additional attempts but the first.

  _static_ .**.CONNECT\_ONLY** &#x279D;
  : no transfer, set up connection and let application use the socket by
    extracting it with CURLINFO_LASTSOCKET

  _static_ .**.MAX\_SEND\_SPEED\_LARGE** &#x279D;
  : limit-rate: maximum number of bytes per second to send

  _static_ .**.MAX\_RECV\_SPEED\_LARGE** &#x279D;
  : limit-rate: maximum number of bytes per second to receive

  _static_ .**.FTP\_ALTERNATIVE\_TO\_USER** &#x279D;
  : Pointer to command string to send if USER/PASS fails.

  _static_ .**.SSL\_SESSIONID\_CACHE** &#x279D;
  : set to 0 to disable session ID re-use for this transfer, default is
    enabled (== 1)

  _static_ .**.SSH\_AUTH\_TYPES** &#x279D;
  : allowed SSH authentication methods

  _static_ .**.SSH\_PUBLIC\_KEYFILE** &#x279D;
  : Used by scp/sftp to do public key authentication

  _static_ .**.SSH\_PRIVATE\_KEYFILE** &#x279D;
  : Used by scp/sftp to do private key authentication

  _static_ .**.FTP\_SSL\_CCC** &#x279D;
  : Send CCC (Clear Command Channel) after authentication

  _static_ .**.TIMEOUT\_MS** &#x279D;
  : Same as TIMEOUT, but with ms resolution

  _static_ .**.CONNECTTIMEOUT\_MS** &#x279D;
  : Same as CONNECTTIMEOUT, but with ms resolution

  _static_ .**.HTTP\_TRANSFER\_DECODING** &#x279D;
  : set to zero to disable the libcurl's decoding and thus pass the raw body
    data to the application even when it is encoded/compressed via transfter encoding

  _static_ .**.HTTP\_CONTENT\_DECODING** &#x279D;
  : set to zero to disable the libcurl's decoding and thus pass the raw body
    data to the application even when it is encoded/compressed via content encoding

  _static_ .**.NEW\_FILE\_PERMS** &#x279D;
  : Permission used when creating new files on the remote
    server for protocols that support it, SFTP/SCP/FILE

  _static_ .**.NEW\_DIRECTORY\_PERMS** &#x279D;
  : Permission used when creating new directories on the remote
    server for protocols that support it, SFTP/SCP/FILE

  _static_ .**.POSTREDIR** &#x279D;
  : Set the behavior of POST when redirecting. Values must be set to one
    of CURL_REDIR defines below. This used to be called CURLOPT_POST301 
     @static

  _static_ .**.SSH\_HOST\_PUBLIC\_KEY\_MD5** &#x279D;
  : used by scp/sftp to verify the host's public key

  _static_ .**.COPYPOSTFIELDS** &#x279D;
  : POST volatile input fields.

  _static_ .**.PROXY\_TRANSFER\_MODE** &#x279D;
  : set transfer mode (;type=<a|i>) when doing FTP via an HTTP proxy

  _static_ .**.CRLFILE** &#x279D;
  : CRL file

  _static_ .**.ISSUERCERT** &#x279D;
  : Issuer certificate

  _static_ .**.ADDRESS\_SCOPE** &#x279D;
  : (IPv6) Address scope

  _static_ .**.CERTINFO** &#x279D;
  : Collect certificate chain info and allow it to get retrievable with
    CURLINFO_CERTINFO after the transfer is complete.

  _static_ .**.USERNAME** &#x279D;
  : "name" (username) to use when fetching.

  _static_ .**.PASSWORD** &#x279D;
  : "pwd" (password) to use when fetching.

  _static_ .**.PROXYUSERNAME** &#x279D;
  : "name" (username) to use with Proxy when fetching.

  _static_ .**.PROXYPASSWORD** &#x279D;
  : "pwd" (password) to use with Proxy when fetching.

  _static_ .**.NOPROXY** &#x279D;
  : Comma separated list of hostnames defining no-proxy zones. These should
    match both hostnames directly, and hostnames within a domain. For
    example, local.com will match local.com and www.local.com, but NOT
    notlocal.com or www.notlocal.com. For compatibility with other
    implementations of this, .local.com will be considered to be the same as
    local.com. A single is the only valid wildcard, and effectively
     disables the use of proxy.

  _static_ .**.TFTP\_BLKSIZE** &#x279D;
  : block size for TFTP transfers

  _static_ .**.SOCKS5\_GSSAPI\_NEC** &#x279D;
  : Socks Service

  _static_ .**.PROTOCOLS** &#x279D;
  : set the bitmask for the protocols that are allowed to be used for the
    transfer, which thus helps the app which takes URLs from users or other
    external inputs and want to restrict what protocol(s) to deal
    with. Defaults to CURLPROTO_ALL.

  _static_ .**.REDIR\_PROTOCOLS** &#x279D;
  : set the bitmask for the protocols that libcurl is allowed to follow to,
    as a subset of the CURLOPT_PROTOCOLS ones. That means the protocol needs
    to be set in both bitmasks to be allowed to get redirected to.

  _static_ .**.SSH\_KNOWNHOSTS** &#x279D;
  : set the SSH knownhost file name to use

  _static_ .**.MAIL\_FROM** &#x279D;
  : set the SMTP mail originator

  _static_ .**.MAIL\_RCPT** &#x279D;
  : set the list of SMTP mail receiver(s)

  _static_ .**.FTP\_USE\_PRET** &#x279D;
  : FTP: send PRET before PASV

  _static_ .**.RTSP\_REQUEST** &#x279D;
  : RTSP request method (OPTIONS, SETUP, PLAY, etc...)

  _static_ .**.RTSP\_SESSION\_ID** &#x279D;
  : The RTSP session identifier

  _static_ .**.RTSP\_STREAM\_URI** &#x279D;
  : The RTSP stream URI

  _static_ .**.RTSP\_TRANSPORT** &#x279D;
  : The Transport: header to use in RTSP requests

  _static_ .**.RTSP\_CLIENT\_CSEQ** &#x279D;
  : Manually initialize the client RTSP CSeq for this handle

  _static_ .**.RTSP\_SERVER\_CSEQ** &#x279D;
  : Manually initialize the server RTSP CSeq for this handle

  _static_ .**.WILDCARDMATCH** &#x279D;
  : Turn on wildcard matching

  _static_ .**.RESOLVE** &#x279D;
  : send linked-list of name:port:address sets

  _static_ .**.TLSAUTH\_USERNAME** &#x279D;
  : Set a username for authenticated TLS

  _static_ .**.TLSAUTH\_PASSWORD** &#x279D;
  : Set a password for authenticated TLS

  _static_ .**.TLSAUTH\_TYPE** &#x279D;
  : Set authentication type for authenticated TLS

  _static_ .**.TRANSFER\_ENCODING** &#x279D;
  : Set to 1 to enable the "TE:" header in HTTP requests to ask for
    compressed transfer-encoded responses. Set to 0 to disable the use of TE:
    in outgoing requests. The current default is 0, but it might change in a
    future libcurl release.
    
    libcurl will ask for the compressed methods it knows of, and if that
    isn't any, it will not ask for transfer-encoding at all even if this
    option is set to 1.

  _static_ .**.GSSAPI\_DELEGATION** &#x279D;
  : allow GSSAPI credential delegation

  _static_ .**.DNS\_SERVERS** &#x279D;
  : Set the name servers to use for DNS resolution

  _static_ .**.ACCEPTTIMEOUT\_MS** &#x279D;
  : Time-out accept operations (currently for FTP only) after this amount
    of milliseconds.

  _static_ .**.TCP\_KEEPALIVE** &#x279D;
  : Set TCP keepalive

  _static_ .**.TCP\_KEEPIDLE** &#x279D;
  : non-universal keepalive idle time (Linux, AIX, HP-UX, more)

  _static_ .**.TCP\_KEEPINTVL** &#x279D;
  : non-universal keepalive interval (Linux, AIX, HP-UX, more)

  _static_ .**.SSL\_OPTIONS** &#x279D;
  : Enable/disable specific SSL features with a bitmask, see CURLSSLOPT_ 
     @static

  _static_ .**.MAIL\_AUTH** &#x279D;
  : Set the SMTP auth originator

  _static_ .**.SASL\_IR** &#x279D;
  : Enable/disable SASL initial response

  _static_ .**.XOAUTH2\_BEARER** &#x279D;
  : The XOAUTH2 bearer token

  _static_ .**.DNS\_INTERFACE** &#x279D;
  : Set the interface string to use as outgoing network
    interface for DNS requests.
    Only supported by the c-ares DNS backend

  _static_ .**.DNS\_LOCAL\_IP4** &#x279D;
  : Set the local IPv4 address to use for outgoing DNS requests.
    Only supported by the c-ares DNS backend

  _static_ .**.DNS\_LOCAL\_IP6** &#x279D;
  : Set the local IPv6 address to use for outgoing DNS requests.
    Only supported by the c-ares DNS backend

  _static_ .**.LOGIN\_OPTIONS** &#x279D;
  : Set authentication options directly

  _static_ .**.SSL\_ENABLE\_NPN** &#x279D;
  : Enable/disable TLS NPN extension (http2 over ssl might fail without)

  _static_ .**.SSL\_ENABLE\_ALPN** &#x279D;
  : Enable/disable TLS ALPN extension (http2 over ssl might fail without)

  _static_ .**.EXPECT\_100\_TIMEOUT\_MS** &#x279D;
  : Time to wait for a response to a HTTP request containing an
    Expect: 100-continue header before sending the data anyway.

  _static_ .**.PROXYHEADER** &#x279D;
  : This points to a list of headers used for proxy requests only.

  _static_ .**.HEADEROPT** &#x279D;
  : Pass in a bitmask of "header options"

  _static_ .**.PINNEDPUBLICKEY** &#x279D;
  : The public key in DER form used to validate the peer public key
           this option is used only if SSL_VERIFYPEER is true

  _static_ .**.UNIX\_SOCKET\_PATH** &#x279D;
  : Path to Unix domain socket

  _static_ .**.SSL\_VERIFYSTATUS** &#x279D;
  : Set if we should verify the certificate status.

  _static_ .**.SSL\_FALSESTART** &#x279D;
  : Set if we should enable TLS false start.

  _static_ .**.PATH\_AS\_IS** &#x279D;
  : Do not squash dot-dot sequences

  _static_ .**.PROXY\_SERVICE\_NAME** &#x279D;
  : Proxy Service Name

  _static_ .**.SERVICE\_NAME** &#x279D;
  : Service Name

  _static_ .**.PIPEWAIT** &#x279D;
  : Wait/don't wait for pipe/mutex to clarify

  _static_ .**.DEFAULT\_PROTOCOL** &#x279D;
  : Set the protocol used when curl is given a URL without a protocol

  _static_ .**.STREAM\_WEIGHT** &#x279D;
  : Set stream weight, 1 - 256 (default is 16)

  _static_ .**.STREAM\_DEPENDS** &#x279D;
  : Set stream dependency on another CURL handle

  _static_ .**.STREAM\_DEPENDS\_E** &#x279D;
  : Set E-xclusive stream dependency on another CURL handle

  _static_ .**.TFTP\_NO\_OPTIONS** &#x279D;
  : Do not send any tftp option requests to the server

  _static_ .**.CONNECT\_TO** &#x279D;
  : Linked-list of host:port:connect-to-host:connect-to-port,
           overrides the URL's host:port (only for the network layer)

  _static_ .**.TCP\_FASTOPEN** &#x279D;
  : Set TCP Fast Open

  _static_ .**.KEEP\_SENDING\_ON\_ERROR** &#x279D;
  : Continue to send data if the server responds early with an
    HTTP status code >= 300

  _static_ .**.PROXY\_CAINFO** &#x279D;
  : The CApath or CAfile used to validate the proxy certificate
    this option is used only if PROXY_SSL_VERIFYPEER is true

  _static_ .**.PROXY\_CAPATH** &#x279D;
  : The CApath directory used to validate the proxy certificate
    this option is used only if PROXY_SSL_VERIFYPEER is true

  _static_ .**.PROXY\_SSL\_VERIFYPEER** &#x279D;
  : Set if we should verify the proxy in ssl handshake,
    set 1 to verify.

  _static_ .**.PROXY\_SSL\_VERIFYHOST** &#x279D;
  : Set if we should verify the Common name from the proxy certificate in ssl
    handshake, set 1 to check existence, 2 to ensure that it matches
    the provided hostname.

  _static_ .**.PROXY\_SSLVERSION** &#x279D;
  : What version to specifically try to use for proxy.
    See CURL_SSLVERSION defines below.

  _static_ .**.PROXY\_TLSAUTH\_USERNAME** &#x279D;
  : Set a username for authenticated TLS for proxy

  _static_ .**.PROXY\_TLSAUTH\_PASSWORD** &#x279D;
  : Set a password for authenticated TLS for proxy

  _static_ .**.PROXY\_TLSAUTH\_TYPE** &#x279D;
  : Set authentication type for authenticated TLS for proxy

  _static_ .**.PROXY\_SSLCERT** &#x279D;
  : name of the file keeping your private SSL-certificate for proxy

  _static_ .**.PROXY\_SSLCERTTYPE** &#x279D;
  : type of the file keeping your SSL-certificate ("DER", "PEM", "ENG") for
    proxy

  _static_ .**.PROXY\_SSLKEY** &#x279D;
  : name of the file keeping your private SSL-key for proxy

  _static_ .**.PROXY\_SSLKEYTYPE** &#x279D;
  : type of the file keeping your private SSL-key ("DER", "PEM", "ENG") for
    proxy

  _static_ .**.PROXY\_KEYPASSWD** &#x279D;
  : password for the SSL private key for proxy

  _static_ .**.PROXY\_SSL\_CIPHER\_LIST** &#x279D;
  : Specify which SSL ciphers to use for proxy

  _static_ .**.PROXY\_CRLFILE** &#x279D;
  : CRL file for proxy

  _static_ .**.PROXY\_SSL\_OPTIONS** &#x279D;
  : Enable/disable specific SSL features with a bitmask for proxy, see
    CURLSSLOPT_ 
     @static

  _static_ .**.PRE\_PROXY** &#x279D;
  : Name of pre proxy to use.

  _static_ .**.PROXY\_PINNEDPUBLICKEY** &#x279D;
  : The public key in DER form used to validate the proxy public key
    this option is used only if PROXY_SSL_VERIFYPEER is true

  _static_ .**.ABSTRACT\_UNIX\_SOCKET** &#x279D;
  : Path to an abstract Unix domain socket

  _static_ .**.SUPPRESS\_CONNECT\_HEADERS** &#x279D;
  : Suppress proxy CONNECT response headers from user callbacks

  _static_ .**.REQUEST\_TARGET** &#x279D;
  : The request target, instead of extracted from the URL

  _static_ .**.SOCKS5\_AUTH** &#x279D;
  : bitmask of allowed auth methods for connections to SOCKS5 proxies

  _static_ .**.SSH\_COMPRESSION** &#x279D;
  : Enable/disable SSH compression

  _static_ .**.MIMEPOST** &#x279D;
  : Post MIME data.

  _static_ .**.READDATA** &#x279D;
  : The data that will be used as the body of the request.

  _static_ .**.TIMEVALUE\_LARGE** &#x279D;
  : Time to use with the CURLOPT_TIMECONDITION. Specified in number of
    seconds since 1 Jan 1970.

  _static_ .**.HAPPY\_EYEBALLS\_TIMEOUT\_MS** &#x279D;
  : Head start in milliseconds to give happy eyeballs.

  _static_ .**.HAPROXYPROTOCOL** &#x279D;
  : send HAProxy PROXY protocol header?

  _static_ .**.DNS\_SHUFFLE\_ADDRESSES** &#x279D;
  : shuffle addresses before use when DNS returns multiple

  _static_ .**.TLS13\_CIPHERS** &#x279D;
  : Specify which TLS 1.3 ciphers suites to use

  _static_ .**.PROXY\_TLS13\_CIPHERS** &#x279D;
  : Specify which TLS 1.3 ciphers suites to use with a proxy

  _static_ .**.DISALLOW\_USERNAME\_IN\_URL** &#x279D;
  : Disallow specifying username/login in URL.

  _static_ .**.DOH\_URL** &#x279D;
  : DNS-over-HTTPS URL

  _static_ .**.UPLOAD\_BUFFERSIZE** &#x279D;
  : Preferred buffer size to use for uploads

  _static_ .**.UPKEEP\_INTERVAL\_MS** &#x279D;
  : Time in ms between connection upkeep calls for long-lived connections.

  _static_ .**.CURLU** &#x279D;
  : Specify URL using CURL URL API.

  _static_ .**.HTTP09\_ALLOWED** &#x279D;
  : set this to 1L to allow HTTP/0.9 responses or 0L to disallow

  _static_ .**.ALTSVC\_CTRL** &#x279D;
  : alt-svc control bitmask

  _static_ .**.ALTSVC** &#x279D;
  : alt-svc cache file name to possibly read from/write to

  _static_ .**.MAXAGE\_CONN** &#x279D;
  : maximum age of a connection to consider it for reuse (in seconds)

  _static_ .**.SASL\_AUTHZID** &#x279D;
  : SASL authorisation identity




