# template

The template module contains classes and functions for working with Blade's `wire` 
templates. Wire templating is an extensible template system built on standard HTML5. 
In fact, any valid HTML5 document is also a valid Wire template. Wire builds atop 
the existing HTML5 language to provide template support for Web development in Blade 
and makes extensive use of HTML attributes for condition and looping.

Wire templates allow creation of custom HTML elements (such as the builtin `<include />` 
tag that allows for inlining other template files in a template file.). It's a simple 
yet effective system of dynamic programming and the flow altogether feels like writing 
in a frontend framework such as VueJS.

### Basic Usage

```blade
import template

var tpl = template()
echo tpl.render('mytemplate')
```

Or to render from a string

```blade
echo tpl.render_string('<p>{{ name }}</p>', {name: 'Hello World'})
```

The last example above will render the following:

```wire
<p>Hello World</p>
```

### Comments

Wire inherits HTMLs comments using the same syntax `<!-- ... -->`. It is important to note 
that Wire does not render comments in the output HTML. For web applications, this helps you 
to write server side comments in your Wire files without it getting to the frontend since 
Wire is backend code.

For example, the code below should return an empty string.

```blade
tpl.render_string('<!-- HTML or Wire comment? -->')
```

### Variables

Variables in Wire templates are names surrounded by `{{` and `}}` pair. For example, to print 
the value of a variable _myvar_ passed into [[Template.render]] or [[Template.render_string]] 
in the template, you can do it like this.

```wire
<div>{{ myvar }}</div>
```

> **NOTE:** 
> - The `<div>` and `</div>` surround the variable and are not part of the variable.
> - The spaces around the variable are just formatting and are not required.

The exception to this is when passing a variable to a reserved attribute such as `x-key`. 
In this case, you'll need to omit the surrounding braces. 

For example:

```wire
<div x-for="myvar" x-key="mykey"></div>
```

As shown in the example above, variables can occur anywhere in a Wire template including in 
element attributes.

To print the exact characters `{{ myvar }}` if that's what you actually mean and stop if from 
being interpreted as a variable, you'll need to escape the first `{` with the percent sign `%`. 

For example:

```wire
<div>%{{ myvar }}</>
```

The example above will return the following:

```wire
<div>{{ myvar }}</div>
```

### Expressions and Modifiers

Expressions in Wire are a feature that allows modification of value directly in the template. 
An __Expression__ is value that has been modified by passing it through a functions called 
__Modifiers__ using the pipe (`|`) character. Wire comes with a lot of built-in functions for 
creating expressions and they are all described at below.

For example:

```wire
<div>{{ name|length }}</div>
```

In the example above, the name variable was expressed as its length by passing it into through 
the _length_ modifier function. If _name_ contains the value `John Doe`, then the value printed 
will be `8`.

The built-in modifiers are documented under [Template Functions](#template-functions).

Some expression modifiers require that a value is passed. To pass value to a modifier, use the 
equal (`=`) sign. For example:

```wire
{{ name|is='Jane' }}
```

In this example, `Jane` is a string therefore it is quoted. You can also pass the name of another 
variable, a number or any of the constants `true`, `false`, and `nil` directly without the quotes.

For example:

```wire
{{ age|is=30.5 }}
```

### If... and If not...

Wire implements conditionals via the `x-if` and `x-not` attribute that can be attached to any HTML 
element. This attributes are never returned in the compiled HTML output and decides whether an
element will be printed or not. The `x-if` attribute evaluates a variable or expression and will only
print the element to which it is attached and its children if the result of the expression or variable 
evaluation returns a value that is boolean `true` in Blade. The `x-not` attribute does the reverse of
this (i.e. it only prints if the evaluation returns Blade boolean `false`).

```blade
tpl.render_string('<div x-if="name">Hello</div>')
```

The example above will return an empty string since the variable name was never declared. However, the 
reverse is the case if the attribute was `x-not`. 

For example:

```blade
tpl.render_string('<div x-not="name">Hello</div>')
```

The example above will return `<div>Hello</div>`.

### Loops

Wire templates support for loops is enabled via the `x-for` attribute that can be applied to any 
element. When the `x-for` attribute is present on an element, it must declare a corresponding `x-value` 
attribute that defines the name of the value variable within the loop. An optional `x-key` attribute 
may also be defined to define a variable name that will contain the value of the iteration index/key.

The _x-for_ attribute must declare a variable or expression that evaluates into an iterable (such as a 
string, list, dictionary etc.).

For example:

```blade
tpl.render_string('<div x-for="data">Ok</div>', {data: 0..3})
```

The code above will return the following:

```wire
<div>Ok</div><div>Ok</div><div>Ok</div>
```

> The original `<div>` was replicated three times without the `x-for` attribute. 
> __Wire attributes are applied to an element and their children not the children only.__

Here is an example using the `x-value` attribute to print the items in a list.

```blade
tpl.render_string('<div x-for="data" x-value="val">{{ val }}</div>', {data: ['apple', 'mango']})
```

The code above return

```wire
<div>apple</div><div>mango</div>
```

We could decide to print the index as well by adding a new variable using the `x-key` attribute.

```blade
tpl.render_string('<div x-for="data" x-value="val" x-key="key">
  <span>{{ key }}</span>
  <span>{{ value }}</span>
</div>', {data: ['apple', 'mango']})
```

Which will output

```wire
<div>
  <span>0</span>
  <span>apple</span>
</div><div>
  <span>1</span>
  <span>mango</span>
</div>
```

### Wiring templates

While most of the examples here use the `render_string()` function to give a practical approach 
to learning Wire templates, the `render()` function which allows rendering Wire templates from 
files is a more powerful and conventional method of using Wire templates. Not only because they 
allow loading templates from files, but also because they allow including other template files in 
a template file via the builtin `<include />` tag. The `include` tag allows wiring multiple Wires 
together to create a comprehensive UI layout hierarchy and is quite intuitive to use. 

Let's consider a simple use case: 

In a website for a client all pages UTF-8 enabled and are mobile first. This leaves room for a set 
of `<meta>` tags that will need to be on every page of the website and in practice it will soon 
become burdensome to have to keep repeating the `meta` tags across all page templates. To reduce
this code duplication, we can have a file located at the template root directory (See 
[[Template.set_root]]) that contains all shared `meta` tags as shown in the sample below and include 
this file in every other template.

```wire
<!-- templates/meta.html -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
```

This template can the be imported in another file with the `include` tag.

```wire
<!-- templates/layout.html -->
<include path="meta.html" />
```

The `include` tag has only one attribute which is always required and that is the `path` attribute. 
This attribute allows us to specify the path to a Wire template (or any HTML file for that matter) 
that will be rendered in the position the `include` tag currently occupies. Take note that in the 
example above the `path` argument did not start with "templates/". This is because when decoding the 
include path, the library first searches for files in the template root directory and if a matching 
file is found, that file will be rendered. If none is found, it will interpret the path as a relative 
path first then as an absolute path if no match is found. 

See [[Template.render]] for more information.

### Custom Modifiers

Apart from the built-in value modifiers, Wire templates allow you to add custom modifiers in a 
simple manner by registering them with the `register_function()` method. The example below 
shows an example custom modifier __reverse__ that reverses the original value as a string.

```blade
tpl.register_function('reverse', @(value) {
  return ''.join(to_list(value).reverse())
})
```

The modifier __reverse__ can then be used in a Wire template like this:

```blade
tpl.render_string('<div>{{ fruit|reverse }}</div>', {fruit: 'mango'})
```

And the output HTML from the above code will be

```wire
<div>ognam</div>
```

Modifier functions can also take a second argument which will receive any argument passed to the
modifier. This is best expressed with an example.

```blade
tpl.register_function('reverse_weird', @(value, arg) {
  return '${arg}: ' + ''.join(to_list(value).reverse())
})
```

This above modifier expects an argument that will be used to append the return string. While we 
acknowledge that this function/modifier is weird, it shows clearly how to create a modifier that 
takes an argument.

The code below shows how to pass an argument into the `reverse_weird` modifier from a template.

```wire
<p>{{ fruit|reverse_weird='Reversed' }}</p>
```

Yes I know. It's weird. But if we passed in the same argument as the last, the output will be

```wire
<p>Reversed: ognam</p>
```

Like regular Blade code, the argument will be `nil` if not passed and this is 
important information if you intend to leverage this for a library that will be used by other 
people. 

If we remove the argument to the modifier in the template above and simply call 
`fruit|reverse_weird`, the result will look like this:

```wire
<p>: ognam</p>
```

### Custom Tags

As with custom modifiers the template library allows you to create and process custom tags. 
An example of a custom tag is the `<include />` tag previously discussed. To declare a custom 
element and its behavior, you need to create a function that accepts two arguments and 
register it with the `register_element()` method. When your custom element is matched in a 
template, the registered function will be called with an instance of [[template.Template]] in the first 
argument and the {{html}} decoded template as the second argument. Your function must then 
return a string representing the processed tag or a valid HTML element Blade representation as 
defined by the {{html}} module. 

> NOTE: It's more memory efficient to modify and return the same element when returning an HTML
   representation.

The example below defines a custom tag _`link`_ that will always be rendered as an anchor 
(`<a>`) element with the class `link`.

```blade
tpl.register_element('link', @(this, el) {
  return '<a href="${el.attributes[0].value}">${el.attributes[1].value}</a>'
})
```

The simple tag defined above allows us to process the `<link />` tag in a Wire template. 
For example,

```wire
<link href="bladelang.com" text="Blade Website" />
```

The Wire template above will cause the following to be rendered.

```wire
<a href="bladelang.com">Blade Website</a>
```

Below is a more complex example that returns an HTML representation in Blade instead of a string.

```blade
tpl.register_element('link', @(this, el) {
  return {
    type: 'element',
    name: 'a',
    attributes: [
      { name: 'href', value: el.attributes[0].value }
    ],
    children: [
      { type: 'text', content: el.attributes[1].value }
    ]
  }
})
```

Both code achieve the same thing. However, the later format allows for a more flexible and programmatic 
output that the former and is the recommended approach wherever possible.

### Template Functions

Template functions in Wire are simply modifiers that do not process any value nor accept any argument 
(i.e. stand-alone modifiers) and are created in the same way as we create modifiers. However, they are 
invoked quite differently. To invoke a template function, you need to wrap them in a `{!` and `!}` pair. 

For example, consider the following template function defined to return the base url of a website.

```blade
tpl.register_function('base_url', @{
  return  'https://localhost:8000'
})
```

The function can be invoked as follows:

```blade
tpl.render_string('{! base_url !}')
```

The example above will return `https://localhost:8000`.

Like with the `{{` and `}}` pair for variables, if you really intend to write the `{!` and `!}` pair, 
you'll need to escape the first `{` with a `%` sign. For example, `%{! name !}` will render as
`{! name !}` without processing.

## Functions

_template_.length(_value_) {#template.length}

: Template function to return the length of an iterable.
  
  Example:
  
  ```wire
  {{ value|length }}
  ```
  
  If _value_ is **Example**, output will be **7**.





_template_.upper(_value_) {#template.upper}

: Template function to convert a string or an object's string representation 
  to upper case variant.
  
  Example:
  
  ```wire
  {{ value|upper }}
  ```
  
  If _value_ is **Example text**, output will be **EXAMPLE TEXT**.





_template_.lower(_value_) {#template.lower}

: Template function to convert a string or an object's string representation 
  to lower case variant.
  
  Example:
  
  ```wire
  {{ value|lower }}
  ```
  
  If _value_ is **I'm LOVING this**, output will be **i'm loving this**.





_template_.is(_value_, _expected_) {#template.is}

: Template function to check if object _value_ is same as the _expected_.
  
  Example:
  
  ```wire
  {{ value|is='Jane' }}
  ```
  
  If value was **Jane**, it will return `true`.
  
  You can also pass another variable name, a number or one of `true`, 
  `false`, and `nil` directly (without quotes).


  - **@params**:
    - _any_ **expected**

  {.params}



_template_.not(_value_, _expected_) {#template.not}

: Template function to check if object _value_ is NOT the same as _expected_.
  
  Example:
  
  ```wire
  {{ value|not=false }}
  ```
  
  If value was __true__, it will return `false`.
  
  It accepts the same set of parameters accepted by the `is` template modifier.


  - **@params**:
    - _any_ **expected**

  {.params}



_template_.empty(_value_) {#template.empty}

: Template function to check if an iterable is empty.
  
  Example:
  
  ```wire
  {{ value|empty }}
  ```
  
  If value is an _empty string_, it will return `true`.





_template_.reverse(_value_) {#template.reverse}

: Template function to reverse a string or the string representation of an object.
  
  Example:
  
  ```wire
  {{ value|reverse }}
  ```
  
  If value is **banana**, output will be **ananab**.





_template_.string(_value_) {#template.string}

: Template function to convert an object of any type to a string.
  
  Example:
  
  ```wire
  {{ value|string }}
  ```
  
  If value was a list `[1,2,3]`, output will be the string **[1, 2, 3]**.





_template_.trim(_value_) {#template.trim}

: Template function to trim a string.
  
  Example:
  
  ```wire
  {{ value|trim }}
  ```
  
  If value is `   Jane   `, output will be `Jane`.





_template_.title(_value_) {#template.title}

: Template function to convert a string to a title case.
  
  Example:
  
  ```wire
  {{ value|title }}
  ```
  
  If value is **jane IS a fine girl**, output will be **Jane Is A Fine Girl**.





_template_.alt(_value_, _alternative_) {#template.alt}

: Template function to return a default string value if the value 
  passed resolves to a Blade false expression. For example, when a 
  string is empty or nil.
  
  Example:
  
  ```wire
  {{ value|alt=30 }}
  ```
  
  If value is **-1**, out put will be **30**.


  - **@params**:
    - _string_ **alternative**

  {.params}



_template_.first(_value_) {#template.first}

: Template function to return the first item in an iterable.
  
  Example:
  
  ```wire
  {{ value|first }}
  ```
  
  If value is a list `['mango', 'apple', 'oranges']`, output will be **mango**.





_template_.last(_value_) {#template.last}

: Template function to return the last item in an iterable.
  
  Example:
  
  ```wire
  {{ value|last }}
  ```
  
  If value is a list `['mango', 'apple', 'oranges']`, output will be **oranges**.





_template_.line\_breaks(_value_) {#template.line_breaks}

: Template function to replace newlines with HTML line breaks.
  
  Example:
  
  ```wire
  {{ value|line_breaks }}
  ```
  
  If value is `Hello\nWorld`, output will be `Hello<br/>World`.





_template_.lpad(_value_, _count_) {#template.lpad}

: Template function to left pad a string.
  
  Example:
  
  ```wire
  {{ value|lpad=10 }}
  ```
  
  If value is `Jane`, output will be `      Jane`.


  - **@params**:
    - _number_ **count.**

  {.params}



_template_.rpad(_value_, _count_) {#template.rpad}

: Template function to right pad a string.
  
  Example:
  
  ```wire
  {{ value|rpad=10 }}
  ```
  
  If value is `Jane`, output will be `Jane      `.


  - **@params**:
    - _number_ **count.**

  {.params}



_template_.join(_value_, _glue_) {#template.join}

: Template function to join an iterable using a string glue.
  
  Example:
  
  ```wire
  {{ value|join='-' }}
  ```
  
  If value is a list `['a', 'b', 'c']`, output will be **a-b-c**.


  - **@params**:
    - _string_ **glue**

  {.params}



_template_.url\_encode(_value_) {#template.url_encode}

: Template function to return the url encoded value of a string.
  
  Example:
  
  ```wire
  {{ value|url_encode }}
  ```
  
  If value is **https://www.example.org/foo?a=b&c=d**, output will be **https://www.example.org/foo%3Fa%3Db&c%3Dd**.





_template_.json(_value_) {#template.json}

: Template string to return the JSON encoded string for a value.
  
  Example:
  
  ```wire
  {{ value|json }}
  ```
  
  If value is a dictionary `{name: 'Xavier'}`, output will be **{"name":"Xavier"}**.





_template_.template(_auto_init_) &#x279D; _Exported_ {#template.template}

: Default function exporting the [Template](/standard/Template#Template) class that allows function 
  initialization. See [Template](/standard/Template#Template).


  - **@params**:
    - _bool_ **auto_init**

  {.params}



## Classes

_class_ **Template** {#template.Template .class}

: Template string and file processing class.
  
  ##### Usage
  
  You can render templates directly from strings
  
  ```blade
  import template
  var tpl = template()
  
  tpl.render_string('{{ name }}', {name: 'John Doe'})
  ```
  
  Or from files located in your defined root directory. See [Template.set_root](/standard/Template#Template.set_root)
  
  ```blade
  tpl.render('my_template', {name: 'John Doe'})
  ```
  
  You can enable initialize your templates with the auto_init option to allow 
  [Template](/standard/Template#Template) create the root directory if it does not exist. The default root 
  directory is a directory "`templates`" in the current working directory.
  
  For example,
  
  ```blade
  var tpl = template(true)
  
  # Optionally set the root directory to another directory.
  tpl.set_root('/my/custom/path')
  ```
  
  The root directory will become the root search path for the `<include />` tag.
  
  The default extension for a template file is the `.html` extension. This extension 
  allows furnishes the interoperability between Blade's Wire templates and HTML5 since the
  former is based on the later anyway and allows us to leverage the already near 
  omnipresent support that HTML files have had over the years. This behavior can be 
  changed using the [Template.set_extension](/standard/Template#Template.set_extension) function to change the extension to any 
  desired string.
  
  For example,
  
  ```blade
  tpl.set_extension('.wire')
  
  # render a template from file
  tpl.render('welcome')
  ```
  
  This will cause [Template.render](/standard/Template#Template.render) to look for the file "`welcome.wire`" in the root 
  directory and will return an error if the file could not be found and no file matches 
  exactly "`welcome`" in the directory.



  .Template(_auto_init_) &#x279D; _Constructor_ {#template.Template.Template}

  : The constructor of the Template class.
    
    
       directory will be automatically created on [Template.set_root](/standard/Template#Template.set_root) or 
       [Template.render](/standard/Template#Template.render).


    - **@params**:
      - _bool_ **auto_init** : A boolean flag to control whether template root


    {.params}


  .set\_root(_path_) {#template.Template.set_root}

  : Set the template files root directory for [Template.render](/standard/Template#Template.render). Returns `true` if 
    the directory was automatically created (See [Template._auto_init](/standard/Template#Template._auto_init)) or `false` 
    if it wasn't.
    
    If your template contains or will contain an `<include />` tag, the path given 
    here will become the root of the include search path.


    - **@params**:
      - _string_ **path**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .set\_extension(_ext_) {#template.Template.set_extension}

  : Sets the default file extension to be used when [Template.render](/standard/Template#Template.render) and/or the 
    `<include />` tag searches for template files in the root directory when the path 
    given does not match an existing file and does not end with another extension.


    - **@params**:
      - _string_ **ext**

    {.params}


  .register\_function(_name_, _function_) {#template.Template.register_function}

  : Registers a function that can be used to process variables in the template. 
    The given function must accept a minimum of one argument which will receive
    the value of the value to be processed and at most two arguments, the second of 
    which will receive arguments passed to the function as a string.
    
    ##### Example
    
    ```blade
    def firstname_function(value) {
      return value.split(' ')[0]
    }
    
    tpl.register_function('firstname', firstname_function)
    ```
    
    The registered function can be used in the template to process variables.
    For example,
    
    ```wire
    <div>{{ my_user|firstname }}</div>
    ```


    - **@params**:
      - _string_ **name**
      - _function_ **function**

    {.params}


  .register\_element(_name_, _element_) {#template.Template.register_element}

  : Registers a custom HTML element for the template. The function passed must 
    take exactly two (2) arguments the first of which will receive the the
    template object itself and the second the HTML as an object of {{html}}.
    
    ##### Example
    
    ```blade
    def inline_input(wire, value) {
      return ...
    }
    
    tpl.register_element('inline-input', my_custom_function)
    ```
    
    The above registered element can then be used in the template. For example,
    
    ```wire
    <inline-input value="{{ my_var }}" />
    ```


    - **@params**:
      - _string_ **name**
      - _function(2)_ **element**

    {.params}


  .render\_string(_source_, _variables_, _path_) {#template.Template.render_string}

  : Process and render template contained in the given string. The variables 
    dictionary is used to pass variable data to the template being processed. 
    
    If a variable is required in the template and is missing in the variables 
    dictionary or the variables dictionary was not passed to the `render_string()` 
    call, the process dies with an Exception. The third argument allows specifying 
    the source file/path of the template being processed and will default to 
    `<source>` when not passed.
    
    The path argument may be of important if the string was read from a file or a 
    similar source to provide information on the source of wrong template data such as 
    line and column information.
    
    ##### Example
    
    ```blade
    tpl.render_string('<div>{{ name }}</div>', {name: 'Johnson'})
    ```
    
    The above template should return
    
    ```wire
    <div>Johnson</div>
    ```


    - **@params**:
      - _string_ **source**
      - _dict?_ **variables**
      - _string?_ **path**

    {.params}
    - **@returns**: _string_
    {.returns}


  .render(_path_, _variables_) {#template.Template.render}

  : Process and render template contained in the given template file. The template 
    path should be a path relative to the root directory (See [Template](/standard/Template#Template)) and may 
    or not carry any extension. If the template file uses the template _extension_ 
    (default: `.html`), the path argument may exclude the extension from the path
    altogether provided there is a file with a matching name that may or not have the 
    default extension (See [Template.set_extension](/standard/Template#Template.set_extension)). 
    
    The variables dictionary is used to pass variable data to the template being 
    processed and behaves exactly the same way as with [Template.render_string](/standard/Template#Template.render_string).
    
    ##### Example
    
    ```blade
    tpl.render('my_template')
    ```
    
    The above example renders the template as is and will raise if any variable is found in it.
    You can pass a variable the same way you do with [Template.render_string](/standard/Template#Template.render_string).


    - **@params**:
      - _string_ **path**
      - _dict?_ **variables**

    {.params}
    - **@returns**: _string_
    {.returns}




