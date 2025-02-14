# sqlite
SQLite is a lightweight disk/memory based database that does not require
a server or third party applications. It allows users to work with the
database using its sigtly variant version of the Structured Query Lanaguage.
For this reason, it is a perfect fit for embeded and highly portable database
applications. It can be used as a prototyping database from which an application
can be migrated to a more robust database system such as Oracle.
This module provides an interface to working with SQLite databases and is
compartible with SQLite3.
The `open()` function is the entry point to this module and must be called to create
a valid SQLite3 connection to a valid database. The following example shows how to
create a connection to a database.
```blade
import sqlite
var con = sqlite.open('test.db')
```
The above code opens a connection to the database file `test.db` in the current directory.
Any valid file path is acceptable here. You can also open a kind of connection a database
that is stored completely in virtual memory, allowing you to use SQLite like an in-memory
database (albeit relational). The following example shows how to open a that make SQLite
behave like an in-memory database.
```blade
import sqlite
var con = sqlite.open()
```
Once a connection has been established, you can use the connection to run all sorts of
queries. For example, you can run queries that do not return a result set (for example,
a `CREATE TABLE` query) using the `exec()` function as shown in the example below.
```blade
# Create a new table
con.exec('CREATE TABLE users (id integer primary key, name text, gender text)')
# Insert data into the table
# This isn't exactly the most optimal way to do it but you get the idea. Right?
con.exec('INSERT INTO users (id, name, gender) VALUES (0, "James", "Male")')
con.exec('INSERT INTO users (id, name, gender) VALUES (1, "Lilith", "Female")')
con.exec('INSERT INTO users (id, name, gender) VALUES (2, "Candy", "Non-Binary")')
```
This function will return `true` if the query was successful or `false` if it failed.
You can retrieve the ID of the last insert query in the above command for example using
the `last_insert_id()` function. For example,
```blade
con.last_insert_id()
# 2
```
On the other hand, there are two ways to run queries that return a dataset.
### Using the `query()` method.
This function returns a `SQLite3Cursor` that allows you iterate through the dataset
and do as you wish with them. For example,
```blade
var result = con.query('SELECT * FROM users')
```
There are two ways to loop through this result set. The first way is to use the `has_next()`
function. This function automatically moves the cursor to the next datarow in the result set
and return `true` or `false` when there are no more rows in the result set.
```blade
while result.has_next() {
  var name = result.get(1)
  var gender = result.get(2)
  echo 'Name = ${name}, Gender = ${gender}'
}
# ---- result ----------
Name = James, Gender = Male
Name = Lilith, Gender = Female
Name = Candy, Gender = Non-Binary
```
Once `has_next()` returns true, you'll be able to get the value of the different columns in
the result run using the `get()` method of the SQLite3Cursor by passing their ordinal position
as an argument to the function.
Another way to get the result entries in a SQLite3Cursor is obviously using the `for` loop as
the class implements the _iterable_ decorators (as indicated in the class documentation below).
For example,
```blade
for row in result {
  echo 'Name = ${row.name}, Gender = ${row.gender}'
}
# ---- result ----------
Name = James, Gender = Male
Name = Lilith, Gender = Female
Name = Candy, Gender = Non-Binary
```
> Much shorter right? Care should be taken though as a few of our tests have shown that for
> result sets with a large number of columns, the first option (using `while`) might be slightly
> faster for performace critical applications. However, no realworld dataset has been testd.
### Using the `fetch()` method.
The second way to run queries that return a result set is to use the `fetch()` function.
Unlike the `query()` function that allows you to lazily access the resultset of a SQL query,
the `fetch()` function retrieves all results into a dictionary as a flat object. This function
is useful for returning all the data in the resultset.
For example,
```blade
con.fetch('SELECT * FROM users')
# ---- result ---------
[
  {
    id: 0,
    name: James,
    gender: Male
  },
  {
    id: 1,
    name: Lilith,
    gender: Female
  },
  {
    id: 2,
    name: Candy,
    gender: Non-Binary
  }
]
```
### Parameterized Queries
This module provides support for parameterized queries and as such offer protection against
SQL injection. An example of a parameterized query is show below.
```blade
%> con.fetch('SELECT * FROM users WHERE name = ?', [ 'James' ])
# ---- result ---------
[
  {
    id: 0,
    name: James,
    gender: Male
  }
]
```
You can also used a dictionary as an argument instead of a list for named parameterized
queries. When you do this, the order or count of the parameters will not matter. Instead,
parameters will be matched based on their value in the dictionary. For example,
```blade
con.fetch(
  'select * from users where name = :name and id = :id',
  {
    ':id': 0,
    ':name': 'James',
  }
)
# ---- result ---------
[
  {
    id: 0,
    name: James,
    gender: Male
  }
]
```
It is also a very good practice to always close your connection once done with it.
This is really simple.
```blade
con.close()
```
_See below for more info_

## Functions

open(_path_) {#sqlite.open}

: Returns an handle to a sqlite3 database. If _path_ is not given, 
  it will create an in-memory sqlite database.


  - **@params**:
    - _string?_ **path**

  {.params}
  - **@returns**: _SQLite3_



## Classes

_class_ **SQLite3** {#sqlite.SQLite3 .class}

: SQLite3 management class


  **.path**
  :  The path to the SQLite3 file
    @default = :memory:


  .SQLite3(_path_) &#8674; Constructor {#sqlite.SQLite3.SQLite3}

  : > **@notes**:
    > 
    > - The database doesn't need to exist.

    - **@params**:
      - _string_ **path**

    {.params}


  .open() {#sqlite.SQLite3.open}

  : Opens the handle to a database file




  .close() {#sqlite.SQLite3.close}

  : Closes the handle to the database and return `true` if successfully
    closed or `false` otherwise.


    - **@returns**: _boolean_


  .exec(_query_, _params_) {#sqlite.SQLite3.exec}

  : Executes a query string as is and returns `true` if the
    query was executed or `false` otherwise.
    
    
    
    
    
    
    @throws SQLiteException if an error occured


    > **@notes**:
    > 
    > - this method does not return a query result

    > - this method takes optional params like `query()` (see below).

    - **@params**:
      - _string_ **query**
      - _list|dict|nil_ **params**

    {.params}
    - **@returns**: _boolean_


  .last\_insert\_id() {#sqlite.SQLite3.last_insert_id}

  : The id of the last insert operation.
    
    Returns: `-1` if the last insert failed, 
      `0` if no insert statement has been executed or 
      A number greater than 0 if it succeeded
     
    
    @throws SQLiteException if database is not opened


    - **@returns**: _number_


  .query(_sql_, _params_) {#sqlite.SQLite3.query}

  : query(sql: string [, params: list | dict])
    
    Executes and sql query and returns the result of the execution.
    
    1. Pass a list as _params_ if you have unnamed parameterized queries.
    
    For example,
    
    ```blade
    sqlite.query('SELECT FROM users WHERE id = ? AND name = ?', [3, 'James'])
     ```
    2. Or pass a dictionary as _params_ if you use named paramters
    
    For Example,
    
    ```blade
    sqlite.query(
      'SELECT FROM user WHERE id = :id AND name = :name', 
       {':id': 1, ':name': 'James'}
    )
    ```
    
    
    
    
    @throws SQLiteException if an error occured.


    - **@params**:
      - _string_ **sql**
      - _list|dict|nil_ **params**

    {.params}
    - **@returns**: _SQLite3Cursor_


  .fetch(_sql_, _params_) {#sqlite.SQLite3.fetch}

  : Runs an SQL query and returns the result as a list of dictionaries.


    > **@notes**:
    > 
    > - if the result is empty or the query is not a SELECT, it returns an empty list.

    - **@params**:
      - _string_ **sql**
      - _list|dict|nil_ **params**

    {.params}
    - **@returns**: _list[dictionary]_




_class_ **SQLiteException** < _Exception_ {#sqlite.SQLiteException .class}

: General Exception for SQLite




_class_ **SQLite3Cursor** {#sqlite.SQLite3Cursor .class}

: A cursor for navigation through sql results


  ~ Properties

    - __@iterable__

  **.connection** &#8674; _readonly_
  :  The SQLite3 connection that owns this cursor

  **.row\_count** &#8674; _readonly_
  :  The number of rows in the cursor

  **.modified\_count** &#8674; _readonly_
  :  This value hold the number of rows modified, inserted or deleted by the the query that 
    owns this cursor provided the query is one of INSERT, UPDATE or DELETE statement.
    Executing any other type of SQL statement does not change this value from 0.
    
    Only changes made directly by the INSERT, UPDATE or DELETE statement are considered 
    - auxiliary changes caused by triggers, foreign key actions or REPLACE constraint 
    resolution are not counted.
    
    Changes to a view that are intercepted by INSTEAD OF triggers are not counted. 
    The value returned by `modified_count` immediately after an INSERT, UPDATE or DELETE 
    statement run on a view is always zero. Only changes made to real tables are counted.
    
    
    
    > If a separate thread makes changes on the same database connection at the exact time 
    > the original query was also making a change, the result of this value will become 
    > undependable.

  **.columns** &#8674; _readonly_
  :  A list of the columns available in the result set.


  .SQLite3Cursor(_db_, _cursor_) &#8674; Constructor {#sqlite.SQLite3Cursor.SQLite3Cursor}

  : > **@notes**:
    > 
    > - SQLite3Cursor should NEVER be maually instantiated.

    - **@params**:
      - _SQLite3_ **db**
      - _ptr_ **cursor**

    {.params}


  .close() {#sqlite.SQLite3Cursor.close}

  : Closes the cursor and prevents further reading.


    - **@returns**: _bool_


  .has\_next() {#sqlite.SQLite3Cursor.has_next}

  : Returns `true` if there are more rows in the result set not yet retrieved, 
    otherwise it returns `false`.


    - **@returns**: _boolean_


  .get(_index_) {#sqlite.SQLite3Cursor.get}

  : Returns the value of the column matching the index in the current result set.
    
    
    
    
    
    
    @throws SQLiteException if no matching column can be found.


    > **@notes**:
    > 
    > - If index is a number, it returns the value in the column at the given index. 

    > - Index must be lower than columns.length() in this case.

    > - If index is a string, it returns the value in the column with the given name.

    - **@params**:
      - _number|string_ **index**

    {.params}
    - **@returns**: _string_




