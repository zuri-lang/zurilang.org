# ast
Provides interface for parsing Blade code into Abstract Syntax Trees.

## Functions

#### parse(source, path)

Parses a given source code and outputs Blade AST objects.

##### Parameters

- _string_ **source**
- _string?_ **path**

##### Returns

- ParseResult



#### json(source, path)

Parses the give source code and outputs a JSON representation of 
it's AST structure.

##### Parameters

- _string_ **source**
- _string?_ **path**

##### Returns

- string



## Classes

### _class_ ParseResult

Represents the result of an ast parse operation.



#### Properties

 - __@printable__
 - __@serializable__
 - __@iterable__

#### Methods

#### append(item)

Adds a new item to the parse result

##### Parameters

- _Expr|Decl|Defn|Stmt_ **item**


#### length()

Returns the length of items in the parsed result.

##### Returns

- number

#### get(index)

Returns the item at the given ParseResult index or throws exception if out of range.

##### Parameters

- _int_ **index**

##### Returns

- Expr|Decl|Defn|Stmt

#### to\_list()

Returns the items in the ParseResult as a list object.

##### Returns

- list[Expr|Decl|Defn|Stmt]



### _class_ Scanner

Blade source code scanner.



#### Properties

 - __@printable__

#### Fields

- **has\_error** &#8674; _readonly_ _bool_:

  Reports if an error was encountered in the scaner.

- **source** &#8674; _readonly_ _string_:

  The string to being scanned.

#### Methods

#### Scanner(source, file) &#8674; Constructor



##### Parameters

- _string_ **source**


#### scan()

Scans the source and returns a list of tokens.

##### Returns

- list[Token]



### _class_ Token

Blade source code token.



#### Properties

 - __@printable__
 - __@serializable__

#### Methods

#### Token(type, literal, line, file) &#8674; Constructor



##### Parameters

- _number_ **type**
- _string_ **literal**
- _number_ **line**



### _class_ ParseException < _Exception_

Exception raised for errors during parsing.

#### Methods

#### ParseException(message, token) &#8674; Constructor



##### Parameters

- _string_ **message**
- _Token_ **token**



### _class_ Stmt

base Stmt class



### _class_ EchoStmt < _Stmt_

Echo Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### EchoStmt(value) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **value**



### _class_ ExprStmt < _Stmt_

Expr Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### ExprStmt(expr) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **expr**



### _class_ IfStmt < _Stmt_

If Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### IfStmt(condition, truth, falsy) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **condition**
- _Stmt|any|nil_ **truth**
- _Stmt|any|nil_ **falsy**



### _class_ IterStmt < _Stmt_

Iter Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### IterStmt(declaration, condition, iterator, body) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **declaration**
- _Stmt|any|nil_ **condition**
- _Stmt|any|nil_ **iterator**
- _Stmt|any|nil_ **body**



### _class_ WhileStmt < _Stmt_

While Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### WhileStmt(condition, body) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **condition**
- _Stmt|any|nil_ **body**



### _class_ DoWhileStmt < _Stmt_

DoWhile Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### DoWhileStmt(body, condition) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **body**
- _Stmt|any|nil_ **condition**



### _class_ ForStmt < _Stmt_

For Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### ForStmt(vars, iterable, body) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **vars**
- _Stmt|any|nil_ **iterable**
- _Stmt|any|nil_ **body**



### _class_ ContinueStmt < _Stmt_

Continue Stmt representation.



#### Properties

 - __@serializable__



### _class_ BreakStmt < _Stmt_

Break Stmt representation.



#### Properties

 - __@serializable__



### _class_ RaiseStmt < _Stmt_

Raise Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### RaiseStmt(exception) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **exception**



### _class_ ReturnStmt < _Stmt_

Return Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### ReturnStmt(value) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **value**



### _class_ AssertStmt < _Stmt_

Assert Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### AssertStmt(expr, message) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **expr**
- _Stmt|any|nil_ **message**



### _class_ UsingStmt < _Stmt_

Using Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### UsingStmt(expr, cases, default_case) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **expr**
- _Stmt|any|nil_ **cases**
- _Stmt|any|nil_ **default_case**



### _class_ ImportStmt < _Stmt_

Import Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### ImportStmt(path, elements) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **path**
- _Stmt|any|nil_ **elements**



### _class_ CatchStmt < _Stmt_

Catch Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### CatchStmt(body, var_name) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **body**
- _Stmt|any|nil_ **var_name**



### _class_ CommentStmt < _Stmt_

Comment Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### CommentStmt(data) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **data**



### _class_ BlockStmt < _Stmt_

Block Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### BlockStmt(body) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **body**



### _class_ AssignStmt < _Stmt_

Assign Stmt representation.



#### Properties

 - __@serializable__

#### Methods

#### AssignStmt(expr, type, value) &#8674; Constructor



##### Parameters

- _Stmt|any|nil_ **expr**
- _Stmt|any|nil_ **type**
- _Stmt|any|nil_ **value**



### _class_ Defn

base Defn class



### _class_ DocDefn < _Defn_

Doc Defn representation.



#### Properties

 - __@serializable__

#### Methods

#### DocDefn(data) &#8674; Constructor



##### Parameters

- _Defn|any|nil_ **data**



### _class_ Parser

Parses raw Blade tokens and produces an Abstract Syntax Tree.



#### Properties

 - __@printable__

#### Methods

#### Parser(tokens, path) &#8674; Constructor



##### Parameters

- _list[Token]_ **tokens**
- _string?_ **path**


#### parse()

Parses the raw source tokens passed into relevant class and
outputs a stream of AST objects that can be one of
Expr (expressions), Stmt (statements) or Decl (declarations).

##### Returns

- ParseResult



### _class_ Decl

base Decl class



### _class_ VarDecl < _Decl_

Var Decl representation.



#### Properties

 - __@serializable__

#### Methods

#### VarDecl(name, value) &#8674; Constructor



##### Parameters

- _Decl|any|nil_ **name**
- _Decl|any|nil_ **value**



### _class_ FunctionDecl < _Decl_

Function Decl representation.



#### Properties

 - __@serializable__

#### Methods

#### FunctionDecl(name, params, body) &#8674; Constructor



##### Parameters

- _Decl|any|nil_ **name**
- _Decl|any|nil_ **params**
- _Decl|any|nil_ **body**



### _class_ MethodDecl < _Decl_

Method Decl representation.



#### Properties

 - __@serializable__

#### Methods

#### MethodDecl(name, params, body, is_static) &#8674; Constructor



##### Parameters

- _Decl|any|nil_ **name**
- _Decl|any|nil_ **params**
- _Decl|any|nil_ **body**
- _Decl|any|nil_ **is_static**



### _class_ PropertyDecl < _Decl_

Property Decl representation.



#### Properties

 - __@serializable__

#### Methods

#### PropertyDecl(name, value, is_static) &#8674; Constructor



##### Parameters

- _Decl|any|nil_ **name**
- _Decl|any|nil_ **value**
- _Decl|any|nil_ **is_static**



### _class_ ClassDecl < _Decl_

Class Decl representation.



#### Properties

 - __@serializable__

#### Methods

#### ClassDecl(name, superclass, properties, methods) &#8674; Constructor



##### Parameters

- _Decl|any|nil_ **name**
- _Decl|any|nil_ **superclass**
- _Decl|any|nil_ **properties**
- _Decl|any|nil_ **methods**



### _class_ Expr

base Expr class



### _class_ BinaryExpr < _Expr_

Binary Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### BinaryExpr(left, op, right) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **left**
- _Expr|any|nil_ **op**
- _Expr|any|nil_ **right**



### _class_ GroupExpr < _Expr_

Group Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### GroupExpr(expression) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **expression**



### _class_ LiteralExpr < _Expr_

Literal Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### LiteralExpr(value) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **value**



### _class_ IdentifierExpr < _Expr_

Identifier Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### IdentifierExpr(value) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **value**



### _class_ UnaryExpr < _Expr_

Unary Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### UnaryExpr(op, right) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **op**
- _Expr|any|nil_ **right**



### _class_ ConditionExpr < _Expr_

Condition Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### ConditionExpr(expr, truth, falsy) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **expr**
- _Expr|any|nil_ **truth**
- _Expr|any|nil_ **falsy**



### _class_ CallExpr < _Expr_

Call Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### CallExpr(callee, args) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **callee**
- _Expr|any|nil_ **args**



### _class_ GetExpr < _Expr_

Get Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### GetExpr(expr, name) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **expr**
- _Expr|any|nil_ **name**



### _class_ SetExpr < _Expr_

Set Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### SetExpr(expr, name, value) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **expr**
- _Expr|any|nil_ **name**
- _Expr|any|nil_ **value**



### _class_ IndexExpr < _Expr_

Index Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### IndexExpr(args) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **args**



### _class_ ListExpr < _Expr_

List Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### ListExpr(items) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **items**



### _class_ DictExpr < _Expr_

Dict Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### DictExpr(keys, values) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **keys**
- _Expr|any|nil_ **values**



### _class_ InterpolationExpr < _Expr_

Interpolation Expr representation.



#### Properties

 - __@serializable__

#### Methods

#### InterpolationExpr(data) &#8674; Constructor



##### Parameters

- _Expr|any|nil_ **data**



