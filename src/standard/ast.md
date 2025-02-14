# ast
Provides interface for parsing Blade code into Abstract Syntax Trees.

## Functions

parse(_source_, _path_) {#ast.parse}

: Parses a given source code and outputs Blade AST objects.


  - **@params**:
    - _string_ **source**
    - _string?_ **path**

  {.params}
  - **@returns**: _ParseResult_



json(_source_, _path_) {#ast.json}

: Parses the give source code and outputs a JSON representation of 
  it's AST structure.


  - **@params**:
    - _string_ **source**
    - _string?_ **path**

  {.params}
  - **@returns**: _string_



## Classes

_class_ **ParseResult** {#ast.ParseResult .class}

: Represents the result of an ast parse operation.


  ~ Properties

    - __@printable__
    - __@serializable__
    - __@iterable__


  .append(_item_) {#ast.ParseResult.append}

  : Adds a new item to the parse result


    - **@params**:
      - _Expr|Decl|Defn|Stmt_ **item**

    {.params}


  .length() {#ast.ParseResult.length}

  : Returns the length of items in the parsed result.


    - **@returns**: _number_


  .get(_index_) {#ast.ParseResult.get}

  : Returns the item at the given ParseResult index or throws exception if out of range.


    - **@params**:
      - _int_ **index**

    {.params}
    - **@returns**: _Expr|Decl|Defn|Stmt_


  .to\_list() {#ast.ParseResult.to_list}

  : Returns the items in the ParseResult as a list object.


    - **@returns**: _list[Expr|Decl|Defn|Stmt]_




_class_ **Scanner** {#ast.Scanner .class}

: Blade source code scanner.


  ~ Properties

    - __@printable__

  **.has\_error** &#8674; _readonly_ _bool_
  :  Reports if an error was encountered in the scaner.

  **.source** &#8674; _readonly_ _string_
  :  The string to being scanned.


  .Scanner(_source_, _file_) &#8674; Constructor {#ast.Scanner.Scanner}

  : - **@params**:
      - _string_ **source**

    {.params}


  .scan() {#ast.Scanner.scan}

  : Scans the source and returns a list of tokens.


    - **@returns**: _list[Token]_




_class_ **Token** {#ast.Token .class}

: Blade source code token.


  ~ Properties

    - __@printable__
    - __@serializable__

  .Token(_type_, _literal_, _line_, _file_) &#8674; Constructor {#ast.Token.Token}

  : - **@params**:
      - _number_ **type**
      - _string_ **literal**
      - _number_ **line**

    {.params}




_class_ **ParseException** < _Exception_ {#ast.ParseException .class}

: Exception raised for errors during parsing.


  .ParseException(_message_, _token_) &#8674; Constructor {#ast.ParseException.ParseException}

  : - **@params**:
      - _string_ **message**
      - _Token_ **token**

    {.params}




_class_ **Stmt** {#ast.Stmt .class}

: base Stmt class




_class_ **EchoStmt** < _Stmt_ {#ast.EchoStmt .class}

: Echo Stmt representation.


  ~ Properties

    - __@serializable__

  .EchoStmt(_value_) &#8674; Constructor {#ast.EchoStmt.EchoStmt}

  : - **@params**:
      - _Stmt|any|nil_ **value**

    {.params}




_class_ **ExprStmt** < _Stmt_ {#ast.ExprStmt .class}

: Expr Stmt representation.


  ~ Properties

    - __@serializable__

  .ExprStmt(_expr_) &#8674; Constructor {#ast.ExprStmt.ExprStmt}

  : - **@params**:
      - _Stmt|any|nil_ **expr**

    {.params}




_class_ **IfStmt** < _Stmt_ {#ast.IfStmt .class}

: If Stmt representation.


  ~ Properties

    - __@serializable__

  .IfStmt(_condition_, _truth_, _falsy_) &#8674; Constructor {#ast.IfStmt.IfStmt}

  : - **@params**:
      - _Stmt|any|nil_ **condition**
      - _Stmt|any|nil_ **truth**
      - _Stmt|any|nil_ **falsy**

    {.params}




_class_ **IterStmt** < _Stmt_ {#ast.IterStmt .class}

: Iter Stmt representation.


  ~ Properties

    - __@serializable__

  .IterStmt(_declaration_, _condition_, _iterator_, _body_) &#8674; Constructor {#ast.IterStmt.IterStmt}

  : - **@params**:
      - _Stmt|any|nil_ **declaration**
      - _Stmt|any|nil_ **condition**
      - _Stmt|any|nil_ **iterator**
      - _Stmt|any|nil_ **body**

    {.params}




_class_ **WhileStmt** < _Stmt_ {#ast.WhileStmt .class}

: While Stmt representation.


  ~ Properties

    - __@serializable__

  .WhileStmt(_condition_, _body_) &#8674; Constructor {#ast.WhileStmt.WhileStmt}

  : - **@params**:
      - _Stmt|any|nil_ **condition**
      - _Stmt|any|nil_ **body**

    {.params}




_class_ **DoWhileStmt** < _Stmt_ {#ast.DoWhileStmt .class}

: DoWhile Stmt representation.


  ~ Properties

    - __@serializable__

  .DoWhileStmt(_body_, _condition_) &#8674; Constructor {#ast.DoWhileStmt.DoWhileStmt}

  : - **@params**:
      - _Stmt|any|nil_ **body**
      - _Stmt|any|nil_ **condition**

    {.params}




_class_ **ForStmt** < _Stmt_ {#ast.ForStmt .class}

: For Stmt representation.


  ~ Properties

    - __@serializable__

  .ForStmt(_vars_, _iterable_, _body_) &#8674; Constructor {#ast.ForStmt.ForStmt}

  : - **@params**:
      - _Stmt|any|nil_ **vars**
      - _Stmt|any|nil_ **iterable**
      - _Stmt|any|nil_ **body**

    {.params}




_class_ **ContinueStmt** < _Stmt_ {#ast.ContinueStmt .class}

: Continue Stmt representation.


  ~ Properties

    - __@serializable__



_class_ **BreakStmt** < _Stmt_ {#ast.BreakStmt .class}

: Break Stmt representation.


  ~ Properties

    - __@serializable__



_class_ **RaiseStmt** < _Stmt_ {#ast.RaiseStmt .class}

: Raise Stmt representation.


  ~ Properties

    - __@serializable__

  .RaiseStmt(_exception_) &#8674; Constructor {#ast.RaiseStmt.RaiseStmt}

  : - **@params**:
      - _Stmt|any|nil_ **exception**

    {.params}




_class_ **ReturnStmt** < _Stmt_ {#ast.ReturnStmt .class}

: Return Stmt representation.


  ~ Properties

    - __@serializable__

  .ReturnStmt(_value_) &#8674; Constructor {#ast.ReturnStmt.ReturnStmt}

  : - **@params**:
      - _Stmt|any|nil_ **value**

    {.params}




_class_ **AssertStmt** < _Stmt_ {#ast.AssertStmt .class}

: Assert Stmt representation.


  ~ Properties

    - __@serializable__

  .AssertStmt(_expr_, _message_) &#8674; Constructor {#ast.AssertStmt.AssertStmt}

  : - **@params**:
      - _Stmt|any|nil_ **expr**
      - _Stmt|any|nil_ **message**

    {.params}




_class_ **UsingStmt** < _Stmt_ {#ast.UsingStmt .class}

: Using Stmt representation.


  ~ Properties

    - __@serializable__

  .UsingStmt(_expr_, _cases_, _default_case_) &#8674; Constructor {#ast.UsingStmt.UsingStmt}

  : - **@params**:
      - _Stmt|any|nil_ **expr**
      - _Stmt|any|nil_ **cases**
      - _Stmt|any|nil_ **default_case**

    {.params}




_class_ **ImportStmt** < _Stmt_ {#ast.ImportStmt .class}

: Import Stmt representation.


  ~ Properties

    - __@serializable__

  .ImportStmt(_path_, _elements_) &#8674; Constructor {#ast.ImportStmt.ImportStmt}

  : - **@params**:
      - _Stmt|any|nil_ **path**
      - _Stmt|any|nil_ **elements**

    {.params}




_class_ **CatchStmt** < _Stmt_ {#ast.CatchStmt .class}

: Catch Stmt representation.


  ~ Properties

    - __@serializable__

  .CatchStmt(_body_, _var_name_) &#8674; Constructor {#ast.CatchStmt.CatchStmt}

  : - **@params**:
      - _Stmt|any|nil_ **body**
      - _Stmt|any|nil_ **var_name**

    {.params}




_class_ **CommentStmt** < _Stmt_ {#ast.CommentStmt .class}

: Comment Stmt representation.


  ~ Properties

    - __@serializable__

  .CommentStmt(_data_) &#8674; Constructor {#ast.CommentStmt.CommentStmt}

  : - **@params**:
      - _Stmt|any|nil_ **data**

    {.params}




_class_ **BlockStmt** < _Stmt_ {#ast.BlockStmt .class}

: Block Stmt representation.


  ~ Properties

    - __@serializable__

  .BlockStmt(_body_) &#8674; Constructor {#ast.BlockStmt.BlockStmt}

  : - **@params**:
      - _Stmt|any|nil_ **body**

    {.params}




_class_ **AssignStmt** < _Stmt_ {#ast.AssignStmt .class}

: Assign Stmt representation.


  ~ Properties

    - __@serializable__

  .AssignStmt(_expr_, _type_, _value_) &#8674; Constructor {#ast.AssignStmt.AssignStmt}

  : - **@params**:
      - _Stmt|any|nil_ **expr**
      - _Stmt|any|nil_ **type**
      - _Stmt|any|nil_ **value**

    {.params}




_class_ **Defn** {#ast.Defn .class}

: base Defn class





_class_ **DocDefn** < _Defn_ {#ast.DocDefn .class}

: Doc Defn representation.


  ~ Properties

    - __@serializable__

  .DocDefn(_data_) &#8674; Constructor {#ast.DocDefn.DocDefn}

  : - **@params**:
      - _Defn|any|nil_ **data**

    {.params}




_class_ **Parser** {#ast.Parser .class}

: Parses raw Blade tokens and produces an Abstract Syntax Tree.


  ~ Properties

    - __@printable__

  .Parser(_tokens_, _path_) &#8674; Constructor {#ast.Parser.Parser}

  : - **@params**:
      - _list[Token]_ **tokens**
      - _string?_ **path**

    {.params}


  .parse() {#ast.Parser.parse}

  : Parses the raw source tokens passed into relevant class and
    outputs a stream of AST objects that can be one of
    Expr (expressions), Stmt (statements) or Decl (declarations).


    - **@returns**: _ParseResult_




_class_ **Decl** {#ast.Decl .class}

: base Decl class





_class_ **VarDecl** < _Decl_ {#ast.VarDecl .class}

: Var Decl representation.


  ~ Properties

    - __@serializable__

  .VarDecl(_name_, _value_) &#8674; Constructor {#ast.VarDecl.VarDecl}

  : - **@params**:
      - _Decl|any|nil_ **name**
      - _Decl|any|nil_ **value**

    {.params}




_class_ **FunctionDecl** < _Decl_ {#ast.FunctionDecl .class}

: Function Decl representation.


  ~ Properties

    - __@serializable__

  .FunctionDecl(_name_, _params_, _body_) &#8674; Constructor {#ast.FunctionDecl.FunctionDecl}

  : - **@params**:
      - _Decl|any|nil_ **name**
      - _Decl|any|nil_ **params**
      - _Decl|any|nil_ **body**

    {.params}




_class_ **MethodDecl** < _Decl_ {#ast.MethodDecl .class}

: Method Decl representation.


  ~ Properties

    - __@serializable__

  .MethodDecl(_name_, _params_, _body_, _is_static_) &#8674; Constructor {#ast.MethodDecl.MethodDecl}

  : - **@params**:
      - _Decl|any|nil_ **name**
      - _Decl|any|nil_ **params**
      - _Decl|any|nil_ **body**
      - _Decl|any|nil_ **is_static**

    {.params}




_class_ **PropertyDecl** < _Decl_ {#ast.PropertyDecl .class}

: Property Decl representation.


  ~ Properties

    - __@serializable__

  .PropertyDecl(_name_, _value_, _is_static_) &#8674; Constructor {#ast.PropertyDecl.PropertyDecl}

  : - **@params**:
      - _Decl|any|nil_ **name**
      - _Decl|any|nil_ **value**
      - _Decl|any|nil_ **is_static**

    {.params}




_class_ **ClassDecl** < _Decl_ {#ast.ClassDecl .class}

: Class Decl representation.


  ~ Properties

    - __@serializable__

  .ClassDecl(_name_, _superclass_, _properties_, _methods_) &#8674; Constructor {#ast.ClassDecl.ClassDecl}

  : - **@params**:
      - _Decl|any|nil_ **name**
      - _Decl|any|nil_ **superclass**
      - _Decl|any|nil_ **properties**
      - _Decl|any|nil_ **methods**

    {.params}




_class_ **Expr** {#ast.Expr .class}

: base Expr class




_class_ **BinaryExpr** < _Expr_ {#ast.BinaryExpr .class}

: Binary Expr representation.


  ~ Properties

    - __@serializable__

  .BinaryExpr(_left_, _op_, _right_) &#8674; Constructor {#ast.BinaryExpr.BinaryExpr}

  : - **@params**:
      - _Expr|any|nil_ **left**
      - _Expr|any|nil_ **op**
      - _Expr|any|nil_ **right**

    {.params}




_class_ **GroupExpr** < _Expr_ {#ast.GroupExpr .class}

: Group Expr representation.


  ~ Properties

    - __@serializable__

  .GroupExpr(_expression_) &#8674; Constructor {#ast.GroupExpr.GroupExpr}

  : - **@params**:
      - _Expr|any|nil_ **expression**

    {.params}




_class_ **LiteralExpr** < _Expr_ {#ast.LiteralExpr .class}

: Literal Expr representation.


  ~ Properties

    - __@serializable__

  .LiteralExpr(_value_) &#8674; Constructor {#ast.LiteralExpr.LiteralExpr}

  : - **@params**:
      - _Expr|any|nil_ **value**

    {.params}




_class_ **IdentifierExpr** < _Expr_ {#ast.IdentifierExpr .class}

: Identifier Expr representation.


  ~ Properties

    - __@serializable__

  .IdentifierExpr(_value_) &#8674; Constructor {#ast.IdentifierExpr.IdentifierExpr}

  : - **@params**:
      - _Expr|any|nil_ **value**

    {.params}




_class_ **UnaryExpr** < _Expr_ {#ast.UnaryExpr .class}

: Unary Expr representation.


  ~ Properties

    - __@serializable__

  .UnaryExpr(_op_, _right_) &#8674; Constructor {#ast.UnaryExpr.UnaryExpr}

  : - **@params**:
      - _Expr|any|nil_ **op**
      - _Expr|any|nil_ **right**

    {.params}




_class_ **ConditionExpr** < _Expr_ {#ast.ConditionExpr .class}

: Condition Expr representation.


  ~ Properties

    - __@serializable__

  .ConditionExpr(_expr_, _truth_, _falsy_) &#8674; Constructor {#ast.ConditionExpr.ConditionExpr}

  : - **@params**:
      - _Expr|any|nil_ **expr**
      - _Expr|any|nil_ **truth**
      - _Expr|any|nil_ **falsy**

    {.params}




_class_ **CallExpr** < _Expr_ {#ast.CallExpr .class}

: Call Expr representation.


  ~ Properties

    - __@serializable__

  .CallExpr(_callee_, _args_) &#8674; Constructor {#ast.CallExpr.CallExpr}

  : - **@params**:
      - _Expr|any|nil_ **callee**
      - _Expr|any|nil_ **args**

    {.params}




_class_ **GetExpr** < _Expr_ {#ast.GetExpr .class}

: Get Expr representation.


  ~ Properties

    - __@serializable__

  .GetExpr(_expr_, _name_) &#8674; Constructor {#ast.GetExpr.GetExpr}

  : - **@params**:
      - _Expr|any|nil_ **expr**
      - _Expr|any|nil_ **name**

    {.params}




_class_ **SetExpr** < _Expr_ {#ast.SetExpr .class}

: Set Expr representation.


  ~ Properties

    - __@serializable__

  .SetExpr(_expr_, _name_, _value_) &#8674; Constructor {#ast.SetExpr.SetExpr}

  : - **@params**:
      - _Expr|any|nil_ **expr**
      - _Expr|any|nil_ **name**
      - _Expr|any|nil_ **value**

    {.params}




_class_ **IndexExpr** < _Expr_ {#ast.IndexExpr .class}

: Index Expr representation.


  ~ Properties

    - __@serializable__

  .IndexExpr(_args_) &#8674; Constructor {#ast.IndexExpr.IndexExpr}

  : - **@params**:
      - _Expr|any|nil_ **args**

    {.params}




_class_ **ListExpr** < _Expr_ {#ast.ListExpr .class}

: List Expr representation.


  ~ Properties

    - __@serializable__

  .ListExpr(_items_) &#8674; Constructor {#ast.ListExpr.ListExpr}

  : - **@params**:
      - _Expr|any|nil_ **items**

    {.params}




_class_ **DictExpr** < _Expr_ {#ast.DictExpr .class}

: Dict Expr representation.


  ~ Properties

    - __@serializable__

  .DictExpr(_keys_, _values_) &#8674; Constructor {#ast.DictExpr.DictExpr}

  : - **@params**:
      - _Expr|any|nil_ **keys**
      - _Expr|any|nil_ **values**

    {.params}




_class_ **InterpolationExpr** < _Expr_ {#ast.InterpolationExpr .class}

: Interpolation Expr representation.


  ~ Properties

    - __@serializable__

  .InterpolationExpr(_data_) &#8674; Constructor {#ast.InterpolationExpr.InterpolationExpr}

  : - **@params**:
      - _Expr|any|nil_ **data**

    {.params}




