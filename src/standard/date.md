# date

This modules provides Blade's implementation of date and time
manipulation methods. This module implements civil dates as well as julian dates.

### Definitions

- The calendar date (`class Date`) is a particular day of a calendar year, 
identified by its ordinal number within a calendar month within that year.

- The Julian date number (`jd`) is in elapsed days and time since noon 
(Greenwich Mean Time) on January 1, 4713 BCE (in the Julian calendar).

## Properties

- **MIN\_YEAR** &#8674; _number_:

  Minimum year supported.

- **MAX\_YEAR** &#8674; _number_:

  Maximum year supported.

- **MIN\_DAY** &#8674; _number_:

  Minimum day supported.

- **MAX\_DAY** &#8674; _number_:

  Maximum day supported.

- **MIN\_MONTH** &#8674; _number_:

  Minimum month supported.

- **MAX\_MONTH** &#8674; _number_:

  Maximum year supported.

- **MAX\_HOUR** &#8674; _number_:

  Maximum hour supported.

- **MAX\_MINUTE** &#8674; _number_:

  Maximum minute supported.

- **MAX\_SECONDS** &#8674; _number_:

  Maximum seconds supported.


## Functions

#### gmtime()

Returns a dictionary representing the current time without
timezone adjustment.

Example,

```blade-repl
%> echo date.gmtime()
{year: 2022, month: 3, day: 5, week_day: 6, year_day: 63, hour: 17, minute: 30, 
seconds: 55, microseconds: 620290, is_dst: false, zone: UTC, gmt_offset: 0}
```

##### Returns

- dictionary



#### localtime()

Returns a dictionary representing the current time after
adjusting for the current timezone

Example:

```blade-repl
%> echo date.localtime()
{year: 2022, month: 3, day: 5, week_day: 6, year_day: 63, hour: 18, minute: 18, 
seconds: 35, microseconds: 598166, is_dst: false, zone: WAT, gmt_offset: 3600}
```

##### Returns

- dictionary



#### mktime(year, month, day, hour, minute, seconds, is_dst)

Convert the broken-out time into a time value with the same encoding as 
that of the values returned by the time() function (that is, seconds
 from the Epoch, UTC) according to the timezone settings.

<br>
Example:

```blade-repl
%> import date
%> echo date.mktime(2021, 2, 12, 13, 43, 11, false)
1613133791
```

##### Parameters

- _number_ **year**
- _number_ **month**
- _number_ **day**
- _number_ **hour**
- _number_ **minute**
- _number_ **seconds**
- _bool_ **is_dst**

##### Returns

- number



#### from\_time(time)

Returns a date object from a unix timestamp.

Example,

```blade-repl
%> to_string(date.from_time(time()))
'<Date year: 2022, month: 3, day: 5, hour: 18, minute: 34, seconds: 1>'
```

##### Parameters

- _number_ **time**

##### Returns

- Date
##### Notes

- Time must be in seconds.



#### from\_jd(jdate)

Returns a date instance representing the julian date.

Example,

```blade-repl
%> to_string(date.from_jd(22063))
'<Date year: 2022, month: 3, day: 5, hour: 18, minute: 35, seconds: 0>'
```

##### Parameters

- _number_ **jdate**

##### Returns

- number



#### date(year, month, day, hour, minute, seconds) &#8674; Exported

Returns a new `Date` instance representing the given system date or the current date if no argument is specified.

##### Parameters

- _number?_ **year**
- _number?_ **month**
- _number?_ **day**
- _number?_ **hour**
- _number?_ **minute**
- _number?_ **seconds**
- _bool?_ **is_dst**

##### Returns

- Date



## Classes

### _class_ Date

Date and Time manipulation class

A date here refers to a calendar datetime consisting of year, month, day, hour, 
minute and seconds. 

The `Date` class manages both Date and DateTime and this 
module does not make any distinction between the two as Date is a subset of 
DateTime.

Example,

```blade-repl
%> import date
%> var d = date(2021)
%> to_string(d)
'<Date year: 2021, month: 1, day: 1, hour: 0, minute: 0, seconds: 0>'
%> d = date()
%> to_string(d)
'<Date year: 2022, month: 3, day: 5, hour: 19, minute: 25, seconds: 58>'
```



#### Properties

 - __@printable__
 - __@serializable__

#### Methods

#### Date(year, month, day, hour, minute, seconds, microseconds) &#8674; Constructor



##### Parameters

- _number?_ **year**
- _number?_ **month**
- _number?_ **day**
- _number?_ **hour**
- _number?_ **minute**
- _number?_ **seconds**
- _number?_ **microseconds**
- _bool?_ **is_dst**

##### Notes

- All arguments are optional
- When no argument is given, the date will be set to the current system date.

#### is\_leap()

Returns true if the year is a leap year or false otherwise.

Example,

```blade-repl
%> date(2018).is_leap()
false
%> date(2020).is_leap()
true
```

##### Returns

- bool

#### days\_before\_month(month)

Returns the number of days in the year preceding the first
day of the month.

Example,

```blade-repl
%> date(2021, 5, 11).days_before_month(7)
142
```

##### Returns

- number

#### days\_before\_year(year)

Returns the number of days before January 1st of year.

Example,

```blade-repl
%> date(2021, 5, 11).days_before_year(2024)
811
```

##### Parameters

- _int_ **year**

##### Returns

- number

#### days\_in\_month()

Returns the number of days in month for the specified year.

Example,

```blade-repl
%> date(2021, 6).days_in_month()
30
```

##### Returns

- number

#### weekday()

Returns the numbered day of the week.

Example,

```blade-repl
%> date(2021, 5, 11).weekday()
2
```

##### Returns

- number

#### week\_number()

Returns the number of the current week in the year.

Example,

```blade-repl
%> date(2021, 5, 11).week_number()
19
```

##### Returns

- number

#### format(format)

Formats the current date based on the specified string

Blade's Date formatting table

Character | Description                                               | Example
----------|-----------------------------------------------------------|-----------------------------------
A         | uppercase Ante meridian and Post meridian                 | AM or PM
a         | lowercase Ante meridian and Post meridian                 | am or pm
d         | day of the month with leading zero                        | 01 to 31
D         | textual representation of a day, three letters            | Mon - Sun
j         | day of the month without leading zero                     | 1 to 31
l         | full textual representation of the day of the week        | Monday - Sunday
N         | ISO-8601 numeric representation of the day of the week    | 1 - 7
S         | English ordinal suffix for the day of the month           | st, nd, rd or th
w         | numeric representation of the day of the week             | 0 - 6
z         | the day of the year (starting from 0)                     | 0 - 365
W         | ISO-8601 week number of year, weeks starting on Monday    | E.g. 33 (the 33rd week of the year)
F         | full textual representation of a month                    | January - December
m         | numeric representation of a month, with leading zeros     | 01 - 12
n         | numeric representation of a month, without leading zeros  | 1 - 12
M         | short textual representation of a month, three letters    | Jan - Dec
t         | number of days in the given month                         | 28 - 31
L         | whether it's a leap year                                  | 1 if true, 0 otherwise
y         | two digit representation of a year                        | e.g. 09 or 99
Y         | full numeric representation of a year using 4 digits      | e.g. 2009 or 1999
h         | 12 hour format of an hour with leading zeros              | 01 - 12
H         | 24 hour format of an hour with leading zeros              | 01 - 24
g         | 12 hour format of an hour without leading zeros           | 1 - 12
G         | 24 hour format of an hour without leading zeros           | 1 - 24
i         | minutes with leading zero                                 | 00 - 59
s         | seconds with leading zero                                 | 00 - 59
u         | microseconds                                              | e.g. 987654
v         | milliseconds                                              | e.g. 987
e         | timezone identifier                                       | e.g. GMT, UTC, WAT
I         | whether or not the date is in daylight saving time        | 1 for true, 0 otherwise
O         | difference to GMT without colon between hours and minutes | e.g. +0100
P         | difference to GMT with colon between hours and minutes    | e.g. +01:00
Z         | timezone offset in seconds                                | -43200 - 50400
c         | ISO 8601 date                                             | e.g. 2020-03-04T15:19:21+00:00
r         | RFC 2822 formatted date                                   | e.g. Thu, 21 Dec 2000 16:01:07 +0200


Example,

```blade-repl
%> date().format('F d, Y g:i A')
'March 05, 2022 6:24 PM'
```

You can prevent a format character in the format string from being expanded by escaping it with a 
preceding backslash. If the character with a backslash is already a special sequence, you may need 
to also escape the backslash.

For example:

```blade-repl
%> date().format('l jS \o\\f F Y h:i:s A')
'Wednesday 17th of May 2021 01:39:08 PM'
```

##### Parameters

- _string_ **format**

##### Returns

- string

#### http()

Returns the HTTP date representation of the current date.

For example,

```blade-repl
%> date().http()
'Sat, 05 Mar 2022 06:23:32 GMT'
```

##### Returns

- string

#### jd()

Converts the current date to a julian day and time.

Example,

```blade-repl
%> date(2021, 5, 11).jd()
2459345
```

##### Returns

- number

#### unix\_time()

> @deprecated: - Use `to_time()` instead as it offers more precision.

Returns unix `mktime` equivalent of the current date.


@deprecated - Use `to_time()` instead as it offers more precision.

##### Returns

- number

#### to\_time()

Returns the Epoch timestamp in seconds for the given date.

##### Returns

- number

#### to\_string()

Returns a string representation of the date

##### Returns

- string

#### to\_dict()

Returns the date object as a dictionary.

##### Returns

- dict



