# Numbers

In Zuri, all numeric types have just one type &mdash; **number**. 

Numbers in Zuri are just like you will expect in any programming language. 
The `number` type can hold integer, floating-point, real, hexadecimal, 
octal and binary numbers. 

For example:

```zuri-repl
%> echo 21 # integer
21
%> echo 50.6 # floating-point number
50.6
%> echo -103 # real number
-103
%> echo 0xF1ABC3 # hexadecimal number
15838147
%> echo 0c476 # octal number
318
%> echo 0b1101 # binary number
13
```

## Reference

- [Numbers](#numbers)
  - [Reference](#reference)
  - [Arithmetic Operations](#arithmetic-operations)
  - [Relational (Comparison) Operators](#relational-comparison-operators)
  - [Logical Operator](#logical-operator)
  - [Bitwise Operations](#bitwise-operations)
  - [Operator Precedence](#operator-precedence)


## Arithmetic Operations

Numbers can be used in expressions and all arithmetic operators works on `Number` just as you would expect
in any other language. Parenthesis `()` can be used to group expression together as well. The 
operators `+`, `-`, `*`, `/` work exactly as you expect them to work.

For example:

```zuri-repl
%> 5 + 6
11
%> 21 + 7 - 8
20
%> 3 * 4 + 5
17
%> 16 / 4
4
%> (30 / 3) * 4
40
%> (2 / 11) * ((21 / 3) + ((4 / 3) - (16 / 5)))
0.9333333333333332
```

To do floor division and get an integer result (discarding any fractional result) you can use 
the `//` operator, to get the remainder of a division, use the `%` operator. Use the `**` operator 
to calculate powers.

For example:

```zuri-repl
%> 17 / 5 # normal divison returns a floating-point number
3.4
%> 17 // 5 # floor division discards the fractional part
3
%> 17 % 5 # returns the reminder after the division
2
%> 3 ** 2 # 3 squared
9
%> 2 ** 5 # 2 to the power of 5
32
%> 2 ** 0.5 # 2 raise to power half i.e. square root of 2
1.414213562373095
```


## Relational (Comparison) Operators

Zuri also supports greater-than (`>`) and less-than (`<`) comparison of Numbers as well as
equality comparison using equal-to (`==`), not-equal-to (`!=`) as well as complex ones including
greater-or-equal-to (`>=`) and less-or-equal-to (`<`).

For example:

```zuri-repl
%> 10 > 5
true
%> 21 < 4
false
%> 12 >= 9
true
%> 56 <= 58
true
%> 31 == 31.0
true
%> 46.000 != 46.00
false
```


## Logical Operator

There are three (`3`) logical operators in Zuri &mdash; `and`, `or`, `!`, and all object types including Numbers support 
all logical operators.

For example:

```zuri-repl
%> 5 > -1 or 4 < 6
true
%> 11 > 4 and 21 < 18
false
%> !5
false
%> !(51 > 5)
false
%> !(21 < 40 and 11 > 13)
true
```

## Bitwise Operations

Zuri supports all standard bitwise operations and they look the same as they appear in any other
programming language. If you are coming from a language such as Java, then it's important to note
that due to how Zuri represents numbers internally, zuri does not support the unsigned left shift operator (`<<<`). 

Every bitwise operator except the NOT (`~`) operator operates on binary information (i.e. on two 
objects). The operators are as follows:

| Operator | Name         | Description |
|----------|--------------|-------------|
| x `&` y  | AND          | Does a "bitwise and". |
| x `\|` y  | OR           | Does a "bitwise or". |
| x `^` y  | Exclusive OR | Returns the complement of _x_. This is the same as _-x - 1_. |
| `~`x     | NOT          | Does a "bitwise exclusive or". |
| x `>>` y | Right Shift  | Returns _x_ with the bits shifted to the right by _y_ places. |
| x `<<` y | Left Shift   | Returns _x_ with the bits shifted to the left by _y_ places. |
| x `>>>` y | Right Unsigned Shift  | Returns a number whose binary representation is _x_ shifted by _y_. |

For example:

```zuri-repl
%> 10 & 2
2
%> 10 | 4
14
%> 10 ^ 4
14
%> 10 >> 2
2
%> 10 << 2
40
%> ~10
-11
```


## Operator Precedence

The following table lists all operators from highest precedence to lowest in Zuri.


| Precedence | Operators |
|------------|-----------|
| Postfix*      | `++`, `--` |
| Unary      | `-x`, `+x`, `~`, `!` |
| Mulplicative | `*`, `/`, `%`, `**`, `//` |
| Additive | `+`, `-` |
| Range | `..` |
| Shift | `<<`, `>>`, `>>>` |
| Bitwise AND | `&` |
| Bitwise XOR | `^` |
| Bitwise OR | `|` |
| Relational | `<`, `>`, `<=`, `>=` |
| Equality | `==`, `!=` |
| Logical and | `and` |
| Logical or | `or` |
| Tenary | `?`, `:` |
| Assignment | `=`, `&=`, `\|=`, `*=`, `+=`, `-=`, `/=`, `**=`, `%=`, `>>=`, `<<=`, `>>>=`, `^=`, `//=` |

<br>

Generally, in programming certain operators tend to appear more frequently than others; 
for example, the assignment operator (`=`) is far more common than the right shift operator (`>>`). 
With that in mind, the rest of the tutorial will focus more on the operators that you're most 
likely to use on a regular basis and since most other will be used by great men who know exactly 
what they are doing, we have chosen common syntaxes seen across multiple programming languages 
enough that this legends will be sure to not need another lesson on how to use them.


<br><br>

[Previous Topic](./comments) | [Next Topic](./strings)