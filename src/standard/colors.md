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

## Fields

_colors_.**style** &#x279D; _dictionary_ {#colors.style}
: ANSI font styles available for console applications.

_colors_.**text\_color** &#x279D; _dictionary_ {#colors.text_color}
: Standard ANSI text colors available for console applications.

_colors_.**background** &#x279D; _dictionary_ {#colors.background}
: Standard ANSI background colors available for console applications.


## Functions

_colors_.text(_value_, _color_, _bg_) {#colors.text}

: Returns a terminal printable text with the given color (or style) and background if given.


  > **@notes**:
  > 
  > - The color argument can be replace with a style.

  - **@params**:
    - _string_ **value**
    - _int?_ **color**
    - _int?_ **bg**

  {.params}
  - **@returns**: _string_
  {.returns}



_colors_.rgb\_to\_ansi256(_r_, _g_, _b_) {#colors.rgb_to_ansi256}

: Converts RGB color to ASI-256 color number.


  - **@params**:
    - _int_ **r**
    - _int_ **g**
    - _int_ **b**

  {.params}
  - **@returns**: _number_
  {.returns}



_colors_.ansi256\_to\_ansi(_code_) {#colors.ansi256_to_ansi}

: Converts ANSI-256 color number to ANSI-16 color number.


  - **@params**:
    - _int_ **code**

  {.params}
  - **@returns**: _number_
  {.returns}



_colors_.hex\_to\_rgb(_h_) {#colors.hex_to_rgb}

: Converts the hexadecimal string _h_ to its RGBA component


  - **@params**:
    - _string_ **h**

  {.params}
  - **@returns**: _list_
  {.returns}



_colors_.hex\_to\_ansi256(_color_) {#colors.hex_to_ansi256}

: Converts the given hexadecimal color to its ANSI-256 number.


  - **@params**:
    - _string_ **color**

  {.params}
  - **@returns**: _number_
  {.returns}



_colors_.hex\_to\_ansi(_color_) {#colors.hex_to_ansi}

: Converts the given hexadecimal color to its ANSI-16 number.


  > **@notes**:
  > 
  > - For use with `text()`, this should be preferred over `hex_to_ansi256`

  - **@params**:
    - _string_ **color**

  {.params}
  - **@returns**: _number_
  {.returns}



_colors_.hex(_color_) {#colors.hex}

: Converts the given hexadecimal color to its terminal compatible color.


  > **@notes**:
  > 
  > - For use with `text()`, this should be preferred over `hex_to_ansi256` and `hex_to_ansi`

  > - _color_ can include the '#' character. E.g. `#ff0`.

  - **@params**:
    - _string_ **color**

  {.params}
  - **@returns**: _number_
  {.returns}



_colors_.rgb(_r_, _g_, _b_) {#colors.rgb}

: Converts the given RGB color to its terminal compatible color.


  - **@params**:
    - _number_ **r**
    - _number_ **g**
    - _number_ **b**

  {.params}
  - **@returns**: _number_
  {.returns}



_colors_.hsl(_h_, _s_, _l_) {#colors.hsl}

: Converts the given HSL color to its terminal compatible color.


  - **@params**:
    - _number_ **h**
    - _number_ **s**
    - _number_ **l**

  {.params}
  - **@returns**: _number_
  {.returns}



_colors_.hsv(_h_, _s_, _v_) {#colors.hsv}

: Converts the given HSV color to its terminal compatible color.


  - **@params**:
    - _number_ **h**
    - _number_ **s**
    - _number_ **v**

  {.params}
  - **@returns**: _number_
  {.returns}



_colors_.hwb(_h_, _w_, _b_) {#colors.hwb}

: Converts the given HWB color to its terminal compatible color.


  - **@params**:
    - _number_ **h**
    - _number_ **w**
    - _number_ **b**

  {.params}
  - **@returns**: _number_
  {.returns}



_colors_.cmyk(_c_, _m_, _y_, _k_) {#colors.cmyk}

: Converts the given CMYK color to its terminal compatible color.


  - **@params**:
    - _number_ **c**
    - _number_ **m**
    - _number_ **y**
    - _number_ **k**

  {.params}
  - **@returns**: _number_
  {.returns}



_colors_.xyz(_x_, _y_, _z_) {#colors.xyz}

: Converts the given XYZ color to its terminal compatible color.


  - **@params**:
    - _number_ **x**
    - _number_ **y**
    - _number_ **z**

  {.params}
  - **@returns**: _number_
  {.returns}



_colors_.rgb\_to\_hex(_r_, _g_, _b_, _a_) {#colors.rgb_to_hex}

: Converts a RGB components into its corresponding hexadecimal color.


  - **@params**:
    - _int_ **r**
    - _int_ **g**
    - _int_ **b**
    - _int?_ **a**

  {.params}
  - **@returns**: _string_
  {.returns}



_colors_.rgb\_to\_hsl(_r_, _g_, _b_) {#colors.rgb_to_hsl}

: Converts a RGB color into its corresponding HSL components.


  - **@params**:
    - _int_ **r**
    - _int_ **g**
    - _int_ **b**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.rgb\_to\_hsv(_r_, _g_, _b_) {#colors.rgb_to_hsv}

: Converts a RGB color into its corresponding HSV components.


  - **@params**:
    - _int_ **r**
    - _int_ **g**
    - _int_ **b**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.rgb\_to\_hwb(_r_, _g_, _b_) {#colors.rgb_to_hwb}

: Converts a RGB color into its corresponding HWB components.


  - **@params**:
    - _int_ **r**
    - _int_ **g**
    - _int_ **b**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.rgb\_to\_cmyk(_r_, _g_, _b_) {#colors.rgb_to_cmyk}

: Converts a RGB color into its corresponding CMYK components.


  - **@params**:
    - _int_ **r**
    - _int_ **g**
    - _int_ **b**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.rgb\_to\_xyz(_r_, _g_, _b_) {#colors.rgb_to_xyz}

: Converts a RGB color into its corresponding XYZ color space components.


  - **@params**:
    - _int_ **r**
    - _int_ **g**
    - _int_ **b**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.rgb\_to\_lab(_r_, _g_, _b_) {#colors.rgb_to_lab}

: Converts a RGB color into its corresponding LAB color components.


  - **@params**:
    - _int_ **r**
    - _int_ **g**
    - _int_ **b**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.hsl\_to\_rgb(_h_, _s_, _l_) {#colors.hsl_to_rgb}

: Converts a HSL color into its corresponding RGB color components.


  - **@params**:
    - _number_ **h**
    - _number_ **s**
    - _number_ **l**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.hsl\_to\_hsv(_h_, _s_, _l_) {#colors.hsl_to_hsv}

: Converts a HSL color into its corresponding HSV color components.


  - **@params**:
    - _number_ **h**
    - _number_ **s**
    - _number_ **l**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.hsv\_to\_rgb(_h_, _s_, _v_) {#colors.hsv_to_rgb}

: Converts a HSV color into its corresponding RGB color components.


  - **@params**:
    - _number_ **h**
    - _number_ **s**
    - _number_ **v**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.hsv\_to\_hsl(_h_, _s_, _v_) {#colors.hsv_to_hsl}

: Converts a HSV color into its corresponding HSL color components.


  - **@params**:
    - _number_ **h**
    - _number_ **s**
    - _number_ **v**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.hwb\_to\_rgb(_h_, _w_, _b_) {#colors.hwb_to_rgb}

: Converts a HWB color into its corresponding RGB color components.


  - **@params**:
    - _number_ **h**
    - _number_ **w**
    - _number_ **b**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.cmyk\_to\_rgb(_c_, _m_, _y_, _k_) {#colors.cmyk_to_rgb}

: Converts a CMYK color into its corresponding RGB color components.


  - **@params**:
    - _number_ **c**
    - _number_ **m**
    - _number_ **y**
    - _number_ **k**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



_colors_.xyz\_to\_rgb(_x_, _y_, _z_) {#colors.xyz_to_rgb}

: Converts a XYZ color into its corresponding RGB color components.


  - **@params**:
    - _number_ **x**
    - _number_ **y**
    - _number_ **z**

  {.params}
  - **@returns**: _list[float]_
  {.returns}



