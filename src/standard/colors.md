# colors
This module provides functionalities for color conversion and manipulation.
This module also provides functionalities that enable cross-platform colored terminal outputs
that will allow you create beautiful console apps that are user friendly.
RGB conversion to other colors that return a floating point or a list of floating points do so
to allow users get absolute precision since its really easy for callers to do a `math.round()`
on the components of the resulting list.
### Example
The example below uses this module to create a success message that will print correctly
on almost all terminals (Only Windows 10 version 1901+ supported. All linux and OSX
terminals are supported). Try it out!
```blade
import colors
colors.text('Successful!', colors.text_color.green)
```
The `text()` function can be nested. For example,
```blade
colors.text(colors.text('Successful!', colors.style.bold), colors.text_color.green)
```
The module also features multiple functions for color conversion. For example,
```blade-repl
%> import colors
%> colors.rgb_to_cmyk(103, 13, 69)
[0, 87.37864077669903, 33.00970873786409, 59.6078431372549]
```
The terminal colors also have simple wrappers that allow supplied colors to `text()`
from various color formats. For example, we can specify the color from the HTML
hexadecimal color.
```blade
import colors
colors.text('Colored text!', colors.hex('#fc0'))
```

## Properties

- **style** &#8674; _dictionary_:

  ANSI font styles available for console applications.

- **text\_color** &#8674; _dictionary_:

  Standard ANSI text colors available for console applications.

- **background** &#8674; _dictionary_:

  Standard ANSI background colors available for console applications.


## Functions

#### text(value, color, bg)

Returns a terminal printable text with the given color (or style) and background if given.

##### Parameters

- _string_ **value**
- _int?_ **color**
- _int?_ **bg**

##### Returns

- string
##### Notes

- The color argument can be replace with a style.



#### rgb\_to\_ansi256(r, g, b)

Converts RGB color to ASI-256 color number.

##### Parameters

- _int_ **r**
- _int_ **g**
- _int_ **b**

##### Returns

- number



#### ansi256\_to\_ansi(code)

Converts ANSI-256 color number to ANSI-16 color number.

##### Parameters

- _int_ **code**

##### Returns

- number



#### hex\_to\_rgb(h)

Converts the hexadecimal string _h_ to its RGBA component

##### Parameters

- _string_ **h**

##### Returns

- list



#### hex\_to\_ansi256(color)

Converts the given hexadecimal color to its ANSI-256 number.

##### Parameters

- _string_ **color**

##### Returns

- number



#### hex\_to\_ansi(color)

Converts the given hexadecimal color to its ANSI-16 number.

##### Parameters

- _string_ **color**

##### Returns

- number
##### Notes

- For use with `text()`, this should be preferred over `hex_to_ansi256`



#### hex(color)

Converts the given hexadecimal color to its terminal compatible color.

##### Parameters

- _string_ **color**

##### Returns

- number
##### Notes

- For use with `text()`, this should be preferred over `hex_to_ansi256` and `hex_to_ansi`
- _color_ can include the '#' character. E.g. `#ff0`.



#### rgb(r, g, b)

Converts the given RGB color to its terminal compatible color.

##### Parameters

- _number_ **r**
- _number_ **g**
- _number_ **b**

##### Returns

- number



#### hsl(h, s, l)

Converts the given HSL color to its terminal compatible color.

##### Parameters

- _number_ **h**
- _number_ **s**
- _number_ **l**

##### Returns

- number



#### hsv(h, s, v)

Converts the given HSV color to its terminal compatible color.

##### Parameters

- _number_ **h**
- _number_ **s**
- _number_ **v**

##### Returns

- number



#### hwb(h, w, b)

Converts the given HWB color to its terminal compatible color.

##### Parameters

- _number_ **h**
- _number_ **w**
- _number_ **b**

##### Returns

- number



#### cmyk(c, m, y, k)

Converts the given CMYK color to its terminal compatible color.

##### Parameters

- _number_ **c**
- _number_ **m**
- _number_ **y**
- _number_ **k**

##### Returns

- number



#### xyz(x, y, z)

Converts the given XYZ color to its terminal compatible color.

##### Parameters

- _number_ **x**
- _number_ **y**
- _number_ **z**

##### Returns

- number



#### rgb\_to\_hex(r, g, b, a)

Converts a RGB components into its corresponding hexadecimal color.

##### Parameters

- _int_ **r**
- _int_ **g**
- _int_ **b**
- _int?_ **a**

##### Returns

- string



#### rgb\_to\_hsl(r, g, b)

Converts a RGB color into its corresponding HSL components.

##### Parameters

- _int_ **r**
- _int_ **g**
- _int_ **b**

##### Returns

- list[float]



#### rgb\_to\_hsv(r, g, b)

Converts a RGB color into its corresponding HSV components.

##### Parameters

- _int_ **r**
- _int_ **g**
- _int_ **b**

##### Returns

- list[float]



#### rgb\_to\_hwb(r, g, b)

Converts a RGB color into its corresponding HWB components.

##### Parameters

- _int_ **r**
- _int_ **g**
- _int_ **b**

##### Returns

- list[float]



#### rgb\_to\_cmyk(r, g, b)

Converts a RGB color into its corresponding CMYK components.

##### Parameters

- _int_ **r**
- _int_ **g**
- _int_ **b**

##### Returns

- list[float]



#### rgb\_to\_xyz(r, g, b)

Converts a RGB color into its corresponding XYZ color space components.

##### Parameters

- _int_ **r**
- _int_ **g**
- _int_ **b**

##### Returns

- list[float]



#### rgb\_to\_lab(r, g, b)

Converts a RGB color into its corresponding LAB color components.

##### Parameters

- _int_ **r**
- _int_ **g**
- _int_ **b**

##### Returns

- list[float]



#### hsl\_to\_rgb(h, s, l)

Converts a HSL color into its corresponding RGB color components.

##### Parameters

- _number_ **h**
- _number_ **s**
- _number_ **l**

##### Returns

- list[float]



#### hsl\_to\_hsv(h, s, l)

Converts a HSL color into its corresponding HSV color components.

##### Parameters

- _number_ **h**
- _number_ **s**
- _number_ **l**

##### Returns

- list[float]



#### hsv\_to\_rgb(h, s, v)

Converts a HSV color into its corresponding RGB color components.

##### Parameters

- _number_ **h**
- _number_ **s**
- _number_ **v**

##### Returns

- list[float]



#### hsv\_to\_hsl(h, s, v)

Converts a HSV color into its corresponding HSL color components.

##### Parameters

- _number_ **h**
- _number_ **s**
- _number_ **v**

##### Returns

- list[float]



#### hwb\_to\_rgb(h, w, b)

Converts a HWB color into its corresponding RGB color components.

##### Parameters

- _number_ **h**
- _number_ **w**
- _number_ **b**

##### Returns

- list[float]



#### cmyk\_to\_rgb(c, m, y, k)

Converts a CMYK color into its corresponding RGB color components.

##### Parameters

- _number_ **c**
- _number_ **m**
- _number_ **y**
- _number_ **k**

##### Returns

- list[float]



#### xyz\_to\_rgb(x, y, z)

Converts a XYZ color into its corresponding RGB color components.

##### Parameters

- _number_ **x**
- _number_ **y**
- _number_ **z**

##### Returns

- list[float]



