# zip

The `zip` module contains classes and functions to make working with zip archives easy.

## Properties

- **ZIP\_FILE\_MAX** &#8674; _number_:

  The maximum size of a single file in a zip archive when zip64 is not used

- **ZIP\_FILE\_COUNT\_LIMIT** &#8674; _number_:

  The maximum number of files in a zip archive when zip64 is not used

- **ZIP\_MAX** &#8674; _number_:

  The maximum size of a zip archive when zip64 is not used

- **ZIP\_EXT** &#8674; _string_:

  The default zip file extension


## Functions

#### extract(file, destination, is_zip64)

Extracts the zip archive at the _file_ path to the given _destination_ directory. 
If _destination_ is not given, the file will be extracted into the current working 
directory.
This function returns `true` if the extraction was successful and `false` otherwise.

> **NOTE:**
> Set `is_zip64` to true if the size of the zip file exceeds `ZIP_MAX`.

##### Parameters

- _string_ **file**
- _string?_ **destination**: : Default value is `os.cwd()`.
- _bool?_ **is_zip64**: : Default value is `false`.

##### Returns

- bool



#### compress(path, destination, use_zip64)

Compresses the given path (file or directory) into the destination zip archive.


> When an exception is thrown because max size was exceeded, some files could
> have already been compressed. In this case, the zip archive will should still 
> be usable but not all desired files will be contained in it.

> **NOTE:**
> Set `use_zip64` to true when compressing files exceeding `ZIP_FILE_MAX` or 
> `ZIP_FILE_COUNT_LIMIT`

##### Parameters

- _string_ **file**
- _string?_ **destination**: : Default value is `os.cwd()`.
- _bool?_ **is_zip64**: : Default value is `false`.

##### Returns

- bool
##### Raises Exception

- Exception



## Classes

### _class_ ZipItem

ZipItem represents a single file or directory in a zip archive.

#### Fields

- **name** &#8674; _string_:

  Name of the file or directory

- **directory** &#8674; _string_:

  The directory in which the file or subdirectory belongs

- **compression\_method** &#8674; _string_:

  The compression method for this file

- **crc** &#8674; _string_:

  The crc32 checksum for the file

- **last\_modified** &#8674; _Date_:

  The last modified date for the file

- **compressed\_size** &#8674; _number_:

  The size of the file as compressed in the archive. You should note 
that this value is not often dependable

- **uncompressed\_size** &#8674; _number_:

  The size of the file when extracted from the archive

- **is\_encrypted** &#8674; _bool_:

  If this file is encrypted or not.

- **error** &#8674; _string_:

  Error encountered when attempting to read/extract the file

- **data** &#8674; _bytes_:

  The decompressed value of the zip item

#### Methods

#### from\_dict(dict)

Creates a new ZipItem from a dictionary.
The dictionary should contain the following keys:
- `name`: string
- `dir`: string &mdash; optional
- `compress_method`: number
- `crc`: number
- `filemtime`: number
- `size_compressed`: number
- `size_uncompressed`: number
- `encrypted`: boolean
- `error`: string &mdash; optional
- `data`: bytes

##### Parameters

- _dictionary_ **dict**

##### Returns

- ZipItem

#### export(base_dir)

Exports the ZipItem to file. If base_dir is given, the file will be 
exported into the base_dir and all ZipItem directories will be created 
inside of base_dir to reflect the ZipItem's original structure.

This function returns `true` if the operation succeeds or `false` otherwise.

##### Parameters

- _string?_ **base_dir**: : Default value is `os.cwd()`.

##### Returns

- bool



### _class_ ZipFile

ZipFile represents an instance of zip file.

#### Fields

- **name** &#8674; _string_:

  The name of the zip file

- **last\_modified** &#8674; _Date_:

  The last modified date for the zip file

- **time\_created** &#8674; _Date_:

  The time when the zip file was created

- **size** &#8674; _number_:

  The size of the zip file

- **handle** &#8674; _file_:

  The file handle for this zip file

- **files** &#8674; _List<ZipItem>_:

  A list of the ZipItems in the zip file

#### Methods

#### export(base_dir)

export([base_dir: string])

Exports the all files in the ZipFile to files on the machine. If base_dir is given, 
the files will be exported into the base_dir and all directories will be 
created inside of base_dir as is to reflect the ZipFile's original structure.

This function returns `true` if the operation succeeds or `false` otherwise.

##### Parameters

- _string?_ **base_dir**: : Default value is `os.cwd()`.

##### Returns

- bool



### _class_ ZipArchive

ZipArchive provides a class for zip archive creation, 
manipulation and extraction.

#### Methods

#### ZipArchive(path, use_zip_64) &#8674; Constructor



##### Parameters

- _string_ **path**
- _bool?_ **use_zip_64**: : Default value is `false`.


#### create\_dir(name)

Adds a directory to the zip with the given name.

##### Parameters

- _string_ **name**

##### Returns

- bool

#### create\_file(path, data, stat)

Adds a file to the path specified with the contents given data.

##### Parameters

- _string_ **path**
- _bytes|string_ **data**

##### Returns

- bool

#### add\_file(path, destination)

Adds an existing file to the archive. If destination is given, the 
file will be written to the destination path in the archive.

##### Parameters

- _string_ **path**
- _string?_ **destination**

##### Returns

- bool

#### add\_directory(directory, file_blacklist, ext_blacklist)

Adds the specified `directory` recursively to the archive and set's it path in the archive to `dir`.

- If `file_blacklist` is not empty, this function will ignore every file with a matching path.
- If `ext_blacklist` is not empty, this function will ignore every file with a matching.

##### Parameters

- _string_ **directory**
- _list_ **file_blacklist**: : Default value is `[]`
- _list_ **ext_blacklist**: : Default value is `[]`

##### Returns

- bool

#### read()

Reads the zip file in the specified path and returns a list of
ZipFile describing it's contents.

##### Parameters

- _string_ **path**

##### Returns

- ZipFile

#### save()

Saves the current Zip archive to file.

##### Parameters

- _string_ **filename**

##### Returns

- bool



