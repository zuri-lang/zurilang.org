# ast
Provides interface for parsing Blade code into Abstract Syntax Trees.

## Functions

_ast_.parse(_source_, _path_) {#ast.parse}

: Parses a given source code and outputs Blade AST objects.


  - **@params**:
    - _string_ **source**
    - _string?_ **path**

  {.params}
  - **@returns**: _ParseResult_
  {.returns}



_ast_.json(_source_, _path_) {#ast.json}

: Parses the give source code and outputs a JSON representation of 
  it's AST structure.


  - **@params**:
    - _string_ **source**
    - _string?_ **path**

  {.params}
  - **@returns**: _string_
  {.returns}



## Classes

_class_ **ParseResult** {#ast.ParseResult .class}

: Represents the result of an ast parse operation.


    __@printable__, __@serializable__, __@iterable__
    {.class-props}


  .append(_item_) {#ast.ParseResult.append}

  : Adds a new item to the parse result


    - **@params**:
      - _Expr|Decl|Defn|Stmt_ **item**

    {.params}


  .length() {#ast.ParseResult.length}

  : Returns the length of items in the parsed result.


    - **@returns**: _number_
    {.returns}


  .get(_index_) {#ast.ParseResult.get}

  : Returns the item at the given ParseResult index or throws exception if out of range.


    - **@params**:
      - _int_ **index**

    {.params}
    - **@returns**: _Expr|Decl|Defn|Stmt_
    {.returns}


  .to\_list() {#ast.ParseResult.to_list}

  : Returns the items in the ParseResult as a list object.


    - **@returns**: _list[Expr|Decl|Defn|Stmt]_
    {.returns}




_class_ **Scanner** {#ast.Scanner .class}

: Blade source code scanner.


    __@printable__
    {.class-props}

  **.has\_error** &#x279D; _readonly_ _bool_ {#ast.Scanner.has_error}
  : Reports if an error was encountered in the scaner.

  **.source** &#x279D; _readonly_ _string_ {#ast.Scanner.source}
  : The string to being scanned.


  .Scanner(_source_, _file_) &#x279D; _Constructor_ {#ast.Scanner.Scanner}

  : ast.Scanner constructor


    - **@params**:
      - _string_ **source**

    {.params}


  .scan() {#ast.Scanner.scan}

  : Scans the source and returns a list of tokens.


    - **@returns**: _list[Token]_
    {.returns}




_class_ **Token** {#ast.Token .class}

: Blade source code token.


    __@printable__, __@serializable__
    {.class-props}

  .Token(_type_, _literal_, _line_, _file_) &#x279D; _Constructor_ {#ast.Token.Token}

  : ast.Token constructor


    - **@params**:
      - _number_ **type**
      - _string_ **literal**
      - _number_ **line**

    {.params}




_class_ **ParseException** < _Exception_ {#ast.ParseException .class}

: Exception raised for errors during parsing.


  .ParseException(_message_, _token_) &#x279D; _Constructor_ {#ast.ParseException.ParseException}

  : ast.ParseException constructor


    - **@params**:
      - _string_ **message**
      - _Token_ **token**

    {.params}




_class_ **Stmt** {#ast.Stmt .class}

: base Stmt class




_class_ **EchoStmt** < _Stmt_ {#ast.EchoStmt .class}

: Echo Stmt representation.


    __@serializable__
    {.class-props}

  .EchoStmt(_value_) &#x279D; _Constructor_ {#ast.EchoStmt.EchoStmt}

  : ast.EchoStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **value**

    {.params}




_class_ **ExprStmt** < _Stmt_ {#ast.ExprStmt .class}

: Expr Stmt representation.


    __@serializable__
    {.class-props}

  .ExprStmt(_expr_) &#x279D; _Constructor_ {#ast.ExprStmt.ExprStmt}

  : ast.ExprStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **expr**

    {.params}




_class_ **IfStmt** < _Stmt_ {#ast.IfStmt .class}

: If Stmt representation.


    __@serializable__
    {.class-props}

  .IfStmt(_condition_, _truth_, _falsy_) &#x279D; _Constructor_ {#ast.IfStmt.IfStmt}

  : ast.IfStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **condition**
      - _Stmt|any|nil_ **truth**
      - _Stmt|any|nil_ **falsy**

    {.params}




_class_ **IterStmt** < _Stmt_ {#ast.IterStmt .class}

: Iter Stmt representation.


    __@serializable__
    {.class-props}

  .IterStmt(_declaration_, _condition_, _iterator_, _body_) &#x279D; _Constructor_ {#ast.IterStmt.IterStmt}

  : ast.IterStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **declaration**
      - _Stmt|any|nil_ **condition**
      - _Stmt|any|nil_ **iterator**
      - _Stmt|any|nil_ **body**

    {.params}




_class_ **WhileStmt** < _Stmt_ {#ast.WhileStmt .class}

: While Stmt representation.


    __@serializable__
    {.class-props}

  .WhileStmt(_condition_, _body_) &#x279D; _Constructor_ {#ast.WhileStmt.WhileStmt}

  : ast.WhileStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **condition**
      - _Stmt|any|nil_ **body**

    {.params}




_class_ **DoWhileStmt** < _Stmt_ {#ast.DoWhileStmt .class}

: DoWhile Stmt representation.


    __@serializable__
    {.class-props}

  .DoWhileStmt(_body_, _condition_) &#x279D; _Constructor_ {#ast.DoWhileStmt.DoWhileStmt}

  : ast.DoWhileStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **body**
      - _Stmt|any|nil_ **condition**

    {.params}




_class_ **ForStmt** < _Stmt_ {#ast.ForStmt .class}

: For Stmt representation.


    __@serializable__
    {.class-props}

  .ForStmt(_vars_, _iterable_, _body_) &#x279D; _Constructor_ {#ast.ForStmt.ForStmt}

  : ast.ForStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **vars**
      - _Stmt|any|nil_ **iterable**
      - _Stmt|any|nil_ **body**

    {.params}




_class_ **ContinueStmt** < _Stmt_ {#ast.ContinueStmt .class}

: Continue Stmt representation.


    __@serializable__
    {.class-props}



_class_ **BreakStmt** < _Stmt_ {#ast.BreakStmt .class}

: Break Stmt representation.


    __@serializable__
    {.class-props}



_class_ **RaiseStmt** < _Stmt_ {#ast.RaiseStmt .class}

: Raise Stmt representation.


    __@serializable__
    {.class-props}

  .RaiseStmt(_exception_) &#x279D; _Constructor_ {#ast.RaiseStmt.RaiseStmt}

  : ast.RaiseStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **exception**

    {.params}




_class_ **ReturnStmt** < _Stmt_ {#ast.ReturnStmt .class}

: Return Stmt representation.


    __@serializable__
    {.class-props}

  .ReturnStmt(_value_) &#x279D; _Constructor_ {#ast.ReturnStmt.ReturnStmt}

  : ast.ReturnStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **value**

    {.params}




_class_ **AssertStmt** < _Stmt_ {#ast.AssertStmt .class}

: Assert Stmt representation.


    __@serializable__
    {.class-props}

  .AssertStmt(_expr_, _message_) &#x279D; _Constructor_ {#ast.AssertStmt.AssertStmt}

  : ast.AssertStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **expr**
      - _Stmt|any|nil_ **message**

    {.params}




_class_ **UsingStmt** < _Stmt_ {#ast.UsingStmt .class}

: Using Stmt representation.


    __@serializable__
    {.class-props}

  .UsingStmt(_expr_, _cases_, _default_case_) &#x279D; _Constructor_ {#ast.UsingStmt.UsingStmt}

  : ast.UsingStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **expr**
      - _Stmt|any|nil_ **cases**
      - _Stmt|any|nil_ **default_case**

    {.params}




_class_ **ImportStmt** < _Stmt_ {#ast.ImportStmt .class}

: Import Stmt representation.


    __@serializable__
    {.class-props}

  .ImportStmt(_path_, _elements_) &#x279D; _Constructor_ {#ast.ImportStmt.ImportStmt}

  : ast.ImportStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **path**
      - _Stmt|any|nil_ **elements**

    {.params}




_class_ **CatchStmt** < _Stmt_ {#ast.CatchStmt .class}

: Catch Stmt representation.


    __@serializable__
    {.class-props}

  .CatchStmt(_body_, _var_name_) &#x279D; _Constructor_ {#ast.CatchStmt.CatchStmt}

  : ast.CatchStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **body**
      - _Stmt|any|nil_ **var_name**

    {.params}




_class_ **CommentStmt** < _Stmt_ {#ast.CommentStmt .class}

: Comment Stmt representation.


    __@serializable__
    {.class-props}

  .CommentStmt(_data_) &#x279D; _Constructor_ {#ast.CommentStmt.CommentStmt}

  : ast.CommentStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **data**

    {.params}




_class_ **BlockStmt** < _Stmt_ {#ast.BlockStmt .class}

: Block Stmt representation.


    __@serializable__
    {.class-props}

  .BlockStmt(_body_) &#x279D; _Constructor_ {#ast.BlockStmt.BlockStmt}

  : ast.BlockStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **body**

    {.params}




_class_ **AssignStmt** < _Stmt_ {#ast.AssignStmt .class}

: Assign Stmt representation.


    __@serializable__
    {.class-props}

  .AssignStmt(_expr_, _type_, _value_) &#x279D; _Constructor_ {#ast.AssignStmt.AssignStmt}

  : ast.AssignStmt constructor


    - **@params**:
      - _Stmt|any|nil_ **expr**
      - _Stmt|any|nil_ **type**
      - _Stmt|any|nil_ **value**

    {.params}




_class_ **Defn** {#ast.Defn .class}

: base Defn class





_class_ **DocDefn** < _Defn_ {#ast.DocDefn .class}

: Doc Defn representation.


    __@serializable__
    {.class-props}

  .DocDefn(_data_) &#x279D; _Constructor_ {#ast.DocDefn.DocDefn}

  : ast.DocDefn constructor


    - **@params**:
      - _Defn|any|nil_ **data**

    {.params}




_class_ **Parser** {#ast.Parser .class}

: Parses raw Blade tokens and produces an Abstract Syntax Tree.


    __@printable__
    {.class-props}

  .Parser(_tokens_, _path_) &#x279D; _Constructor_ {#ast.Parser.Parser}

  : ast.Parser constructor


    - **@params**:
      - _list[Token]_ **tokens**
      - _string?_ **path**

    {.params}


  .parse() {#ast.Parser.parse}

  : Parses the raw source tokens passed into relevant class and
    outputs a stream of AST objects that can be one of
    Expr (expressions), Stmt (statements) or Decl (declarations).


    - **@returns**: _ParseResult_
    {.returns}




_class_ **Decl** {#ast.Decl .class}

: base Decl class





_class_ **VarDecl** < _Decl_ {#ast.VarDecl .class}

: Var Decl representation.


    __@serializable__
    {.class-props}

  .VarDecl(_name_, _value_) &#x279D; _Constructor_ {#ast.VarDecl.VarDecl}

  : ast.VarDecl constructor


    - **@params**:
      - _Decl|any|nil_ **name**
      - _Decl|any|nil_ **value**

    {.params}




_class_ **FunctionDecl** < _Decl_ {#ast.FunctionDecl .class}

: Function Decl representation.


    __@serializable__
    {.class-props}

  .FunctionDecl(_name_, _params_, _body_) &#x279D; _Constructor_ {#ast.FunctionDecl.FunctionDecl}

  : ast.FunctionDecl constructor


    - **@params**:
      - _Decl|any|nil_ **name**
      - _Decl|any|nil_ **params**
      - _Decl|any|nil_ **body**

    {.params}




_class_ **MethodDecl** < _Decl_ {#ast.MethodDecl .class}

: Method Decl representation.


    __@serializable__
    {.class-props}

  .MethodDecl(_name_, _params_, _body_, _is_static_) &#x279D; _Constructor_ {#ast.MethodDecl.MethodDecl}

  : ast.MethodDecl constructor


    - **@params**:
      - _Decl|any|nil_ **name**
      - _Decl|any|nil_ **params**
      - _Decl|any|nil_ **body**
      - _Decl|any|nil_ **is_static**

    {.params}




_class_ **PropertyDecl** < _Decl_ {#ast.PropertyDecl .class}

: Property Decl representation.


    __@serializable__
    {.class-props}

  .PropertyDecl(_name_, _value_, _is_static_) &#x279D; _Constructor_ {#ast.PropertyDecl.PropertyDecl}

  : ast.PropertyDecl constructor


    - **@params**:
      - _Decl|any|nil_ **name**
      - _Decl|any|nil_ **value**
      - _Decl|any|nil_ **is_static**

    {.params}




_class_ **ClassDecl** < _Decl_ {#ast.ClassDecl .class}

: Class Decl representation.


    __@serializable__
    {.class-props}

  .ClassDecl(_name_, _superclass_, _properties_, _methods_) &#x279D; _Constructor_ {#ast.ClassDecl.ClassDecl}

  : ast.ClassDecl constructor


    - **@params**:
      - _Decl|any|nil_ **name**
      - _Decl|any|nil_ **superclass**
      - _Decl|any|nil_ **properties**
      - _Decl|any|nil_ **methods**

    {.params}




_class_ **Expr** {#ast.Expr .class}

: base Expr class




_class_ **BinaryExpr** < _Expr_ {#ast.BinaryExpr .class}

: Binary Expr representation.


    __@serializable__
    {.class-props}

  .BinaryExpr(_left_, _op_, _right_) &#x279D; _Constructor_ {#ast.BinaryExpr.BinaryExpr}

  : ast.BinaryExpr constructor


    - **@params**:
      - _Expr|any|nil_ **left**
      - _Expr|any|nil_ **op**
      - _Expr|any|nil_ **right**

    {.params}




_class_ **GroupExpr** < _Expr_ {#ast.GroupExpr .class}

: Group Expr representation.


    __@serializable__
    {.class-props}

  .GroupExpr(_expression_) &#x279D; _Constructor_ {#ast.GroupExpr.GroupExpr}

  : ast.GroupExpr constructor


    - **@params**:
      - _Expr|any|nil_ **expression**

    {.params}




_class_ **LiteralExpr** < _Expr_ {#ast.LiteralExpr .class}

: Literal Expr representation.


    __@serializable__
    {.class-props}

  .LiteralExpr(_value_) &#x279D; _Constructor_ {#ast.LiteralExpr.LiteralExpr}

  : ast.LiteralExpr constructor


    - **@params**:
      - _Expr|any|nil_ **value**

    {.params}




_class_ **IdentifierExpr** < _Expr_ {#ast.IdentifierExpr .class}

: Identifier Expr representation.


    __@serializable__
    {.class-props}

  .IdentifierExpr(_value_) &#x279D; _Constructor_ {#ast.IdentifierExpr.IdentifierExpr}

  : ast.IdentifierExpr constructor


    - **@params**:
      - _Expr|any|nil_ **value**

    {.params}




_class_ **UnaryExpr** < _Expr_ {#ast.UnaryExpr .class}

: Unary Expr representation.


    __@serializable__
    {.class-props}

  .UnaryExpr(_op_, _right_) &#x279D; _Constructor_ {#ast.UnaryExpr.UnaryExpr}

  : ast.UnaryExpr constructor


    - **@params**:
      - _Expr|any|nil_ **op**
      - _Expr|any|nil_ **right**

    {.params}




_class_ **ConditionExpr** < _Expr_ {#ast.ConditionExpr .class}

: Condition Expr representation.


    __@serializable__
    {.class-props}

  .ConditionExpr(_expr_, _truth_, _falsy_) &#x279D; _Constructor_ {#ast.ConditionExpr.ConditionExpr}

  : ast.ConditionExpr constructor


    - **@params**:
      - _Expr|any|nil_ **expr**
      - _Expr|any|nil_ **truth**
      - _Expr|any|nil_ **falsy**

    {.params}




_class_ **CallExpr** < _Expr_ {#ast.CallExpr .class}

: Call Expr representation.


    __@serializable__
    {.class-props}

  .CallExpr(_callee_, _args_) &#x279D; _Constructor_ {#ast.CallExpr.CallExpr}

  : ast.CallExpr constructor


    - **@params**:
      - _Expr|any|nil_ **callee**
      - _Expr|any|nil_ **args**

    {.params}




_class_ **GetExpr** < _Expr_ {#ast.GetExpr .class}

: Get Expr representation.


    __@serializable__
    {.class-props}

  .GetExpr(_expr_, _name_) &#x279D; _Constructor_ {#ast.GetExpr.GetExpr}

  : ast.GetExpr constructor


    - **@params**:
      - _Expr|any|nil_ **expr**
      - _Expr|any|nil_ **name**

    {.params}




_class_ **SetExpr** < _Expr_ {#ast.SetExpr .class}

: Set Expr representation.


    __@serializable__
    {.class-props}

  .SetExpr(_expr_, _name_, _value_) &#x279D; _Constructor_ {#ast.SetExpr.SetExpr}

  : ast.SetExpr constructor


    - **@params**:
      - _Expr|any|nil_ **expr**
      - _Expr|any|nil_ **name**
      - _Expr|any|nil_ **value**

    {.params}




_class_ **IndexExpr** < _Expr_ {#ast.IndexExpr .class}

: Index Expr representation.


    __@serializable__
    {.class-props}

  .IndexExpr(_args_) &#x279D; _Constructor_ {#ast.IndexExpr.IndexExpr}

  : ast.IndexExpr constructor


    - **@params**:
      - _Expr|any|nil_ **args**

    {.params}




_class_ **ListExpr** < _Expr_ {#ast.ListExpr .class}

: List Expr representation.


    __@serializable__
    {.class-props}

  .ListExpr(_items_) &#x279D; _Constructor_ {#ast.ListExpr.ListExpr}

  : ast.ListExpr constructor


    - **@params**:
      - _Expr|any|nil_ **items**

    {.params}




_class_ **DictExpr** < _Expr_ {#ast.DictExpr .class}

: Dict Expr representation.


    __@serializable__
    {.class-props}

  .DictExpr(_keys_, _values_) &#x279D; _Constructor_ {#ast.DictExpr.DictExpr}

  : ast.DictExpr constructor


    - **@params**:
      - _Expr|any|nil_ **keys**
      - _Expr|any|nil_ **values**

    {.params}




_class_ **InterpolationExpr** < _Expr_ {#ast.InterpolationExpr .class}

: Interpolation Expr representation.


    __@serializable__
    {.class-props}

  .InterpolationExpr(_data_) &#x279D; _Constructor_ {#ast.InterpolationExpr.InterpolationExpr}

  : ast.InterpolationExpr constructor


    - **@params**:
      - _Expr|any|nil_ **data**

    {.params}




