# mime
This module provides functions that allow easy mime type detection from files. 
It offers support for detecting file type based on name or file headers and it 
is completely extensible so that you can add declarations for your own custom 
file types.

_See defined functions for example._

## Functions

_mime_.detect\_from\_name(_name_) {#mime.detect_from_name}

: Detects the mimetype of a file based on the
  extension defined in it's path.
  
  Example,
  
  ```blade
  import mime
  echo mime.detect_from_name('myimage.png')
  ```


  > **@notes**:
  > 
  > - For popular files such as Jpeg and Pngs, calling this method directly is more efficient and provides a faster lookup.

  - **@params**:
    - _string_ **name**

  {.params}
  - **@returns**: _string_
  {.returns}



_mime_.detect\_from\_header(_file_) {#mime.detect_from_header}

: Detects the mimetype of a file based on it's file header.
  When multiple file formats share very similar or shadowing
  file headers (such as the relationship between Zip files and Docx files),
  this method will perform an extension before returning it's result.
  
  Example,
  
  ```blade
  import mime
  var f = file('my_file.ext', 'rb')
  echo mime.detect_from_header(f)
  ```


  > **@notes**:
  > 
  > - For dealing with files without extension, or where the accuracy of the file extension cannot be trusted, this method provides a more efficient lookup.

  > - This method may produce slightly more rigorous results

  > - This method requires that the file must be opened in binary mode.

  - **@params**:
    - _file_ **file**

  {.params}
  - **@returns**: _string_
  {.returns}



_mime_.detect(_file_) {#mime.detect}

: Performs mimetype detection on a file.
  
  this method is capable of detecting file mimetypes even
  in the absence of an extension.
  If the file is opened in binary mode, it first attempt the more
  accurate header check. If the header check returns a generic result 
  (i.e. application/octet-stream), it performs an extension lookup.
  
  Example,
  
  ```blade
  import mime
  var f = file('myfile', 'rb')
  
  # using 'rb' here for two reasons: 
  # 1. Our file has no extension, so extension based detection is impossible
  # 2. We want more accuracy by having Mime check file headers
  
  echo mime.detect(f)
  ```


  > **@notes**:
  > 
  > - this method gives the best result, but slightly slower than a direct lookup of name or header.

  - **@params**:
    - _file_ **file**

  {.params}
  - **@returns**: _string_
  {.returns}



_mime_.extend(_extension_, _format_) {#mime.extend}

: Extends the mime module with support for files with the given _extension_ as 
  defined in the given _format_.
  
  Example,
  
  ```blade-repl
  %> import mime
  %> mime.detect_from_name('myfile.ppk')
  'application/octet-stream'
  %> mime.extend('.ppk', mime.MimeFormat('file/ppk'))
  true
  %> mime.detect_from_name('myfile.ppk')
  'file/ppk'
  ```


  > **@notes**:
  > 
  > - the extension MUST start with `.`

  - **@params**:
    - _string_ **extension**
    - _MimeFormat_ **format**

  {.params}
  - **@returns**: _bool_
  {.returns}



## Classes

_class_ **MimeFormat** {#mime.MimeFormat .class}

: Mime format representation class.


  .MimeFormat(_mimetype_, _header_) &#x279D; _Constructor_ {#mime.MimeFormat.MimeFormat}

  : mime.MimeFormat constructor


    > **@notes**:
    > 
    > - only the first 16 bytes of a file header will be used.

    - **@params**:
      - _string_ **mimetype**
      - _list|bytes|nil_ **header**

    {.params}




