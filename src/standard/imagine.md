# imagine

## Fields

_imagine_.**QUANT\_DEFAULT** &#x279D; _number_
: Default (`QUANT_LIQ` if libimagequant is available, `QUANT_JQUANT` otherwise).

_imagine_.**QUANT\_JQUANT** &#x279D; _number_
: libjpeg's old median cut. Fast, but only uses 16-bit color.

_imagine_.**QUANT\_NEUQUANT** &#x279D; _number_
: NeuQuant - approximation using Kohonen neural network.

_imagine_.**QUANT\_LIQ** &#x279D; _number_
: A combination of algorithms used in libimagequant aiming for the highest quality at cost of speed.

_imagine_.**ARC\_ARC** &#x279D; _number_
: Produces a rounded edge.

_imagine_.**ARC\_PIE** &#x279D; _number_
: Same as ARC_ARC.

_imagine_.**ARC\_CHORD** &#x279D; _number_
: Connects the starting and ending angles with a straight line.

_imagine_.**ARC\_NO\_FILL** &#x279D; _number_
: Indicates that the arc or chord should be outlined, not filled.

_imagine_.**ARC\_NO\_EDGE** &#x279D; _number_
: Used together with ARC_NO_FILL, indicates that the beginning and 
  ending angles should be connected to the center; this is a good 
  way to outline (rather than fill) a 'pie slice'.

_imagine_.**CROP\_DEFAULT** &#x279D; _number_
: Same as CROP_TRANSPARENT

_imagine_.**CROP\_TRANSPARENT** &#x279D; _number_
: Crop using the transparent color

_imagine_.**CROP\_BLACK** &#x279D; _number_
: Crop black borders

_imagine_.**CROP\_WHITE** &#x279D; _number_
: Crop white borders

_imagine_.**CROP\_SIDES** &#x279D; _number_
: Crop using colors of the 4 corners

_imagine_.**CMP\_IMAGE** &#x279D; _number_
: Actual image IS different

_imagine_.**CMP\_NUM\_COLORS** &#x279D; _number_
: Number of colors in pallette differ

_imagine_.**CMP\_COLOR** &#x279D; _number_
: Image colors differ

_imagine_.**CMP\_SIZE\_X** &#x279D; _number_
: Image width differs

_imagine_.**CMP\_SIZE\_Y** &#x279D; _number_
: Image heights differ

_imagine_.**CMP\_TRANSPARENT** &#x279D; _number_
: Transparent color differs

_imagine_.**CMP\_BACKGROUND** &#x279D; _number_
: Background color differs

_imagine_.**CMP\_INTERLACE** &#x279D; _number_
: Interlaced setting differs

_imagine_.**CMP\_TRUECOLOR** &#x279D; _number_
: Truecolor vs palette differs

_imagine_.**BLUR\_SELECTIVE** &#x279D; _number_
: Blurs the image using the Gaussian method.

_imagine_.**BLUR\_GAUSSIAN** &#x279D; _number_
: Blurs the image.

_imagine_.**FLIP\_BOTH** &#x279D; _number_
: Flip an image vertically and horizontally

_imagine_.**FLIP\_HORIZONTAL** &#x279D; _number_
: Flip an image horizontally

_imagine_.**FLIP\_VERTICAL** &#x279D; _number_
: Flip an image vertically

_imagine_.**FONT\_SMALL** &#x279D; _ptr_
: A small ISO-8859-2 raster font (5x8 pixels).

_imagine_.**FONT\_REGULAR** &#x279D; _ptr_
: The regular ISO-8859-2 raster font (6x13 pixels)

_imagine_.**FONT\_MEDIUM** &#x279D; _ptr_
: A medium bold ISO-8859-2 raster font (7x13 pixels).

_imagine_.**FONT\_LARGE** &#x279D; _ptr_
: A large ISO-8859-2 raster font (8x16 pixels).

_imagine_.**FONT\_EXTRALARGE** &#x279D; _ptr_
: An extra-large ISO-8859-2 raster font (9x15 pixels).

_imagine_.**COLOR\_STYLED** &#x279D; _number_
: Use the current style, see `set_style()`

_imagine_.**COLOR\_BRUSHED** &#x279D; _number_
: Use the current brush, see `set_brush()`

_imagine_.**COLOR\_STYLED\_BRUSHED** &#x279D; _number_
: Use the current style and brush

_imagine_.**COLOR\_TILED** &#x279D; _number_
: Use the current tile, see `set_tile()`

_imagine_.**COLOR\_TRANSPARENT** &#x279D; _number_
: Indicate transparency, what is not the same as the transparent 
  color index; used for lines only

_imagine_.**COLOR\_ANTI\_ALISED** &#x279D; _number_
: Draw anti aliased

_imagine_.**INTERP\_DEFAULT** &#x279D; _number_
: Default (Same as INTERP_BELL)

_imagine_.**INTERP\_BELL** &#x279D; _number_
: Bell

_imagine_.**INTERP\_BESSEL** &#x279D; _number_
: Bessel

_imagine_.**INTERP\_BILINEAR\_FIXED** &#x279D; _number_
: Fixed point bilinear

_imagine_.**INTERP\_BICUBIC** &#x279D; _number_
: Bicubic

_imagine_.**INTERP\_BICUBIC\_FIXED** &#x279D; _number_
: Fixed point bicubic integer

_imagine_.**INTERP\_BLACKMAN** &#x279D; _number_
: Blackman

_imagine_.**INTERP\_BOX** &#x279D; _number_
: Box

_imagine_.**INTERP\_BSPLINE** &#x279D; _number_
: BSpline

_imagine_.**INTERP\_CATMULLROM** &#x279D; _number_
: Catmullrom

_imagine_.**INTERP\_GAUSSIAN** &#x279D; _number_
: Gaussian

_imagine_.**INTERP\_GENERALIZED\_CUBIC** &#x279D; _number_
: Generalized cubic

_imagine_.**INTERP\_HERMITE** &#x279D; _number_
: Hermite

_imagine_.**INTERP\_HAMMING** &#x279D; _number_
: Hamming

_imagine_.**INTERP\_HANNING** &#x279D; _number_
: Hannig

_imagine_.**INTERP\_MITCHELL** &#x279D; _number_
: Mitchell

_imagine_.**INTERP\_NEAREST\_NEIGHBOUR** &#x279D; _number_
: Nearest neighbour interpolation

_imagine_.**INTERP\_POWER** &#x279D; _number_
: Power

_imagine_.**INTERP\_QUADRATIC** &#x279D; _number_
: Quadratic

_imagine_.**INTERP\_SINC** &#x279D; _number_
: Sinc

_imagine_.**INTERP\_TRIANGLE** &#x279D; _number_
: Triangle

_imagine_.**INTERP\_WEIGHTED4** &#x279D; _number_
: 4 pixels weighted bilinear interpolation

_imagine_.**INTERP\_LINEAR** &#x279D; _number_
: bilinear interpolation

_imagine_.**LANCZOS3** &#x279D; _number_
: Lanczos 3

_imagine_.**LANCZOS8** &#x279D; _number_
: Lanczos 8

_imagine_.**BLACKMAN\_BESSEL** &#x279D; _number_
: Blackman Bessel

_imagine_.**BLACKMAN\_SINC** &#x279D; _number_
: Blackman Sinc

_imagine_.**QUADRATIC\_BSPLINE** &#x279D; _number_
: Quadratic BSpline

_imagine_.**CUBIC\_SPLINE** &#x279D; _number_
: Cubic Spline

_imagine_.**COSINE** &#x279D; _number_
: Cosine

_imagine_.**WELSH** &#x279D; _number_
: Welsh


## Functions

_imagine_.true\_color(_r_, _g_, _b_, _a_) {#imagine.true_color}

: Compose a truecolor value from its components.
  
   @param number? r - The red channel (0-255) - Default: 0
   @param number? g - The green channel (0-255) - Default: 0
   @param number? b - The blue channel (0-255) - Default: 0
   @param number? a - The alpha channel (0-127, where 127 is 
       fully transparent, and 0 is completely opaque) 
       - Default: 0.


  - **@returns**: _number_
  {.returns}



_imagine_.decompose(_color_) {#imagine.decompose}

: Decomposes an Image true color number into it's respective 
  RGBA components.
  
  The function returns a dictionary that contains the following 
  decomposed items:
  
  - `r` - The red channel value
  - `g` - The green channel value
  - `b` - The blue channel value
  - `a` - The alpha channel value


  - **@params**:
    - _number_ **color**

  {.params}
  - **@returns**: _dict_
  {.returns}



## Classes

_class_ **ImageResource** {#imagine.ImageResource .class}

: The ImageResource class represents a loaded image and exposes all 
  the image processing, metadata and manipulation functions.



  .use(_callback_) {#imagine.ImageResource.use}

  : Invokes the given callback with the image as a parameter and 
    automatically closes the image once the callback returns. 
    Leaving images in open can quickly lead to resource exhaustion 
    especially when working with multiple images. The `use()` 
    method is recommended over manually closing images as it 
    ensures that an image is always closed and not forgotten in 
    memory.


    - **@params**:
      - _function(1)_ **callback**

    {.params}


  .close() {#imagine.ImageResource.close}

  : Closes an image and frees all associated resources.


    > **@notes**:
    > 
    > - an image can no longer be used once it is closed.



  .meta() {#imagine.ImageResource.meta}

  : Returns metadata information about the image.
    
    Metadata contains:
    - `width`: The width of the image (in pixels).
    - `height`: The height of the image (in pixels).
    - `colors`: The number of colors in the image.
    - `res_x`: The horizontal resolution in DPI.
    - `res_y`: The vertical resolution in DPI.
    - `interpolation`: The method of interpolation used on the image.
    - `true_color`: True if the image uses true colors, false otherwise.
    - `interlaced`: True if the image is interlaced, false otherwise.


    - **@returns**: _dict_
    {.returns}


  .set\_pixel(_x_, _y_, _color_) {#imagine.ImageResource.set_pixel}

  : Sets the pixel indicated by _x_ and _y_ coordinate in the image to 
    the given _color_.


    - **@params**:
      - _number_ **x**
      - _number_ **y**
      - _number_ **color**

    {.params}


  .get\_pixel(_x_, _y_) {#imagine.ImageResource.get_pixel}

  : Returns the color at the give pixel indicated by _x_ and _y_ 
    coordinate in the image.


    - **@params**:
      - _number_ **x**
      - _number_ **y**

    {.params}
    - **@returns**: _number_
    {.returns}


  .line(_x1_, _y1_, _x2_, _y2_, _color_) {#imagine.ImageResource.line}

  : Draws a line between x1,y1 and x2, y2.The line is drawn using 
    the color index specified. Note that color index can be a color 
    returned by `allocate_color()` or one of `set_style()`, or
    `set_brush()`.


    - **@params**:
      - _number_ **x1**
      - _number_ **y1**
      - _number_ **x2**
      - _number_ **y2**
      - _number_ **color**

    {.params}


  .dashed\_line(_x1_, _y1_, _x2_, _y2_, _color_) {#imagine.ImageResource.dashed_line}

  : Draws a dashed line between x1,y1 and x2, y2.The line is drawn using 
    the color specified. Note that color index can be a color returned 
    by `allocate_color()` or one of `set_style()`, or `set_brush()`.


    - **@params**:
      - _number_ **x1**
      - _number_ **y1**
      - _number_ **x2**
      - _number_ **y2**
      - _number_ **color**

    {.params}


  .rectangle(_x1_, _y1_, _x2_, _y2_, _color_) {#imagine.ImageResource.rectangle}

  : Draws a rectangle with the upper left (x1, y1) then lower right (y1,y2) 
    corners specified, using the color specified.


    - **@params**:
      - _number_ **x1**
      - _number_ **y1**
      - _number_ **x2**
      - _number_ **y2**
      - _number_ **color**

    {.params}


  .filled\_rectangle(_x1_, _y1_, _x2_, _y2_, _color_) {#imagine.ImageResource.filled_rectangle}

  : Draws a solid rectangle with the upper left (x1, y1) then lower 
    right (y1,y2) corners specified, using the color specified.


    - **@params**:
      - _number_ **x1**
      - _number_ **y1**
      - _number_ **x2**
      - _number_ **y2**
      - _number_ **color**

    {.params}


  .safe\_bound(_x_, _y_) {#imagine.ImageResource.safe_bound}

  : Returns true if the coordinate represented by _x_ and _y_ 
    is within the bounds of the image.


    - **@params**:
      - _number_ **x**
      - _number_ **y**

    {.params}


  .char(_x_, _y_, _char_, _font_, _color_) {#imagine.ImageResource.char}

  : Draws a single character.


    - **@params**:
      - _number_ **x** - The x coordinate of the upper left pixel.

      - _number_ **y** - The y coordinate of the upper left pixel.

      - _char_ **text** - The character.

      - _font_ **font** - The raster font.

      - _number_ **color** - The color.


    {.params}


  .char\_vert(_x_, _y_, _char_, _font_, _color_) {#imagine.ImageResource.char_vert}

  : Draws a single character vertically.


    - **@params**:
      - _number_ **x** - The x coordinate of the upper left pixel.

      - _number_ **y** - The y coordinate of the upper left pixel.

      - _char_ **text** - The character.

      - _font_ **font** - The raster font.

      - _number_ **color** - The color.


    {.params}


  .string(_x_, _y_, _text_, _font_, _color_) {#imagine.ImageResource.string}

  : Draws a character string.


    - **@params**:
      - _number_ **x** - The x coordinate of the upper left pixel.

      - _number_ **y** - The y coordinate of the upper left pixel.

      - _string_ **text** - The character string.

      - _font_ **font** - The raster font.

      - _number_ **color** - The color.


    {.params}


  .string\_vert(_x_, _y_, _text_, _font_, _color_) {#imagine.ImageResource.string_vert}

  : Draws a character string vertically.


    - **@params**:
      - _number_ **x** - The x coordinate of the upper left pixel.

      - _number_ **y** - The y coordinate of the upper left pixel.

      - _string_ **text** - The character string.

      - _font_ **font** - The raster font.

      - _number_ **color** - The color.


    {.params}


  .polygon(_points_, _color_) {#imagine.ImageResource.polygon}

  : Draws a polygon with the vertices specified by _points_, in the 
    specified by _color_. There must be at least three points.
    
    Point must be a list of lists where each list contains two numbers 
    for the x and y coordinates. It is required that there must be at 
    least three points.


    - **@params**:
      - _list[list]_ **points**
      - _number_ **color**

    {.params}


  .open\_polygon(_points_, _color_) {#imagine.ImageResource.open_polygon}

  : Draws an open polygon with the vertices specified by _points_, in 
    the specified by _color_. There must be at least three points.
    
    Point must be a list of lists where each list contains two numbers 
    for the x and y coordinates. It is required that there must be at 
    least three points.


    - **@params**:
      - _list[list]_ **points**
      - _number_ **color**

    {.params}


  .filled\_polygon(_points_, _color_) {#imagine.ImageResource.filled_polygon}

  : Fills a polygon with the vertices specified by _points_, in the 
    specified by _color_. There must be at least three points.
    
    Point must be a list of lists where each list contains two numbers 
    for the x and y coordinates. It is required that there must be at 
    least three points.


    - **@params**:
      - _list[list]_ **points**
      - _number_ **color**

    {.params}


  .arc(_x_, _y_, _width_, _height_, _start_, _end_, _color_) {#imagine.ImageResource.arc}

  : Draws a partial ellipse centered at the given point, with the 
    specified width and height in pixels. The arc begins at the 
    position in degrees specified by _start_ and ends at the 
    position specified by _end_. The arc is drawn in the color 
    specified by the last argument. A circle can be drawn by 
    beginning from 0 degrees and ending at 360 degrees, with width 
    and height being equal. `end` must be greater than `start`. 
    Values greater than 360 are interpreted modulo 360.


    - **@params**:
      - _number_ **x**
      - _number_ **y**
      - _number_ **width**
      - _number_ **height**
      - _number_ **start**
      - _number_ **end**
      - _number_ **color**

    {.params}


  .filled\_arc(_x_, _y_, _width_, _height_, _start_, _end_, _color_, _style_) {#imagine.ImageResource.filled_arc}

  : Fills a partial ellipse centered at the given point, with the 
    specified width and height in pixels using the specified style. 
    The arc begins at the position in degrees specified by _start_ 
    and ends at the position specified by _end_. The arc is drawn 
    in the color specified by the last argument. A circle can be 
    drawn by beginning from 0 degrees and ending at 360 degrees, 
    with width and height being equal. `end` must be greater than 
    `start`. Values greater than 360 are interpreted modulo 360. 
    
    Style must be one or more of ARC_ constants or'ed together.
     E.g. `ARC_NO_FILL | ARC_NO_EDGE`.
    
    When style is not given, it defaults to `ARC_PIE`.


    - **@params**:
      - _number_ **x**
      - _number_ **y**
      - _number_ **width**
      - _number_ **height**
      - _number_ **start**
      - _number_ **end**
      - _number_ **color**
      - _number_ **style**

    {.params}


  .ellipse(_x_, _y_, _width_, _height_, _color_) {#imagine.ImageResource.ellipse}

  : Draws a full ellipse centered at the given point, with the 
    specified width, height, and color.


    - **@params**:
      - _number_ **x**
      - _number_ **y**
      - _number_ **width**
      - _number_ **height**
      - _number_ **color**

    {.params}


  .filled\_ellipse(_x_, _y_, _width_, _height_, _color_) {#imagine.ImageResource.filled_ellipse}

  : Fills a full ellipse centered at the given point, with the 
    specified width, height, and color.


    - **@params**:
      - _number_ **x**
      - _number_ **y**
      - _number_ **width**
      - _number_ **height**
      - _number_ **color**

    {.params}


  .allocate\_color(_r_, _g_, _b_, _a_) {#imagine.ImageResource.allocate_color}

  : Returns the given color allocated from the image palette. 
    Any of R, G, B, or A can be omitted or set to nil in which case 
    they'll default to zero.


    - **@params**:
      - _number?_ **r**
      - _number?_ **g**
      - _number?_ **b**
      - _number?_ **a**

    {.params}
    - **@returns**: _number_
    {.returns}


  .closest\_color(_r_, _g_, _b_, _a_) {#imagine.ImageResource.closest_color}

  : Returns the closes color based on the image to the color specified by 
    `r`, `g`, `b`, and `a`. A slightly different color with the same 
    transparency beats the exact same color with radically different 
    transparency.


    - **@params**:
      - _number_ **r**
      - _number_ **g**
      - _number_ **b**
      - _number_ **a**

    {.params}
    - **@returns**: _number_
    {.returns}


  .closest\_color\_hwb(_r_, _g_, _b_) {#imagine.ImageResource.closest_color_hwb}

  : Same as `closes_color()` but uses an alternative algorithm and does 
    not account for transparency.


    - **@params**:
      - _number_ **r**
      - _number_ **g**
      - _number_ **b**

    {.params}
    - **@returns**: _number_
    {.returns}


  .exact\_color(_r_, _g_, _b_, _a_) {#imagine.ImageResource.exact_color}

  : Returns an exact match only, including alpha when specified.


    - **@params**:
      - _number_ **r**
      - _number_ **g**
      - _number_ **b**
      - _number_ **a**

    {.params}
    - **@returns**: _number_
    {.returns}


  .resolve\_color(_r_, _g_, _b_, _a_) {#imagine.ImageResource.resolve_color}

  : Resolves color in the image based on `exact_color()` and `closest_color()` 
    and return the one that matches the image best.


    - **@params**:
      - _number_ **r**
      - _number_ **g**
      - _number_ **b**
      - _number_ **a**

    {.params}
    - **@returns**: _number_
    {.returns}


  .deallocate\_color(_color_) {#imagine.ImageResource.deallocate_color}

  : Deallocates a color previously allocated from the image.


    - **@params**:
      - _number_ **color**

    {.params}


  .color\_transparent(_color_) {#imagine.ImageResource.color_transparent}

  : Specifies a color index (if a palette image) or an RGB color (if a 
    truecolor image) which should be considered 100% transparent. FOR 
    TRUECOLOR IMAGES, THIS IS IGNORED IF AN ALPHA CHANNEL IS BEING SAVED. 
    Use `save_apha(false)` to turn off the saving of a full alpha 
    channel in a truecolor image. Note that this function is usually 
    compatible with older browsers that do not understand full alpha 
    channels well.


    - **@params**:
      - _number_ **color**

    {.params}


  .palette\_copy(_image_) {#imagine.ImageResource.palette_copy}

  : Copies the palatte from a paletted image to this image.


    - **@params**:
      - _ImageResource_ **image**

    {.params}


  .color\_replace(_src_, _dest_) {#imagine.ImageResource.color_replace}

  : Replaces every occurrence of color _src_ in the image with the 
    color _dest_.


    - **@params**:
      - _number_ **src**
      - _number_ **dest**

    {.params}
    - **@returns**: _bool_
    {.returns}


  .fill(_x_, _y_, _color_) {#imagine.ImageResource.fill}

  : Flood fills the image with the given _color_ starting are 
    the coordinates given by _x_ and _y_.


    - **@params**:
      - _number_ **x**
      - _number_ **y**
      - _number_ **color**

    {.params}


  .fill\_to\_border(_x_, _y_, _border_, _color_) {#imagine.ImageResource.fill_to_border}

  : Flood fills the image with the given _color_ starting are 
    the coordinates given by _x_ and _y_ and using the color 
    specified by border to fill its borders.


    - **@params**:
      - _number_ **x**
      - _number_ **y**
      - _number_ **color**

    {.params}


  .copy(_src_, _dst_x_, _dst_y_, _src_x_, _src_y_, _width_, _height_) {#imagine.ImageResource.copy}

  : Copy a part of image _src_ onto this image starting at the x,y c
    oordinates src_x, src_y with the source width and height. The 
    portion defined will be copied onto the x,y coordinates, dst_x 
    and dst_y.


    - **@params**:
      - _ImageResource_ **src**
      - _number_ **dst_x**
      - _number_ **dst_y**
      - _number_ **src_x**
      - _number_ **src_y**
      - _number_ **width**
      - _number_ **height**

    {.params}


  .copy\_merge(_src_, _dst_x_, _dst_y_, _src_x_, _src_y_, _width_, _height_, _pct_) {#imagine.ImageResource.copy_merge}

  : Copy and merge a part of image _src_ onto this image starting 
    at the x,y coordinates src_x, src_y with the source width and 
    height. The portion defined will be copied onto the x,y 
    coordinates, dst_x and dst_y.
    
    The two images will be merged according to pct which can range 
    from 0 to 100. When pct = 0, no action is taken, when 100 this 
    function behaves identically to `copy()` for pallete images, 
    except for ignoring alpha components, while it implements 
    alpha transparency for true colour images.


    - **@params**:
      - _ImageResource_ **src**
      - _number_ **dst_x**
      - _number_ **dst_y**
      - _number_ **src_x**
      - _number_ **src_y**
      - _number_ **width**
      - _number_ **height**
      - _number_ **pct**

    {.params}


  .copy\_merge\_gray(_src_, _dst_x_, _dst_y_, _src_x_, _src_y_, _width_, _height_, _pct_) {#imagine.ImageResource.copy_merge_gray}

  : Same as `copy_merge()` except that when merging it preserves the 
    hue of the source by converting the destination pixels to gray scale 
    before the copy operation.


    - **@params**:
      - _ImageResource_ **src**
      - _number_ **dst_x**
      - _number_ **dst_y**
      - _number_ **src_x**
      - _number_ **src_y**
      - _number_ **width**
      - _number_ **height**
      - _number_ **pct**

    {.params}


  .copy\_resized(_src_, _x_, _y_, _src_x_, _src_y_, _width_, _height_, _src_width_, _src_height_) {#imagine.ImageResource.copy_resized}

  : Copy a resized area defined by src_x, src_y, src_width, and 
    src_height from the image _src_ to the area defined by x, y, 
    width, height on this image.
    
    If the source and destination coordinates and width and heights 
    differ, appropriate stretching or shrinking of the image fragment
    will be performed. 
    
    The coordinates refer to the upper left corner. 
    
    This function can be used to copy regions within the same image 
    (if this image is the same as _src_) but if the regions overlap 
    the results will be unpredictable.


    - **@params**:
      - _ImageResource_ **src**
      - _number_ **x**
      - _number_ **y**
      - _number_ **src_x**
      - _number_ **src_y**
      - _number_ **width**
      - _number_ **height**
      - _number_ **src_width**
      - _number_ **src_height**

    {.params}


  .copy\_resampled(_src_, _x_, _y_, _src_x_, _src_y_, _width_, _height_, _src_width_, _src_height_) {#imagine.ImageResource.copy_resampled}

  : Copy a resized area defined by src_x, src_y, src_width, and 
    src_height from the image _src_ to the area defined by x, y, 
    width, height on this image. Unlike `copy_resized()`, it 
    smoothly interpolates pixel values so that, in particular, 
    reducing the size of an image still retains a great deal of 
    clarity.
    
    If the source and destination coordinates and width and heights 
    differ, appropriate stretching or shrinking of the image fragment
    will be performed. 
    
    The coordinates refer to the upper left corner. 
    
    This function can be used to copy regions within the same image 
    (if this image is the same as _src_) but if the regions overlap 
    the results will be unpredictable.


    - **@params**:
      - _ImageResource_ **src**
      - _number_ **x**
      - _number_ **y**
      - _number_ **src_x**
      - _number_ **src_y**
      - _number_ **width**
      - _number_ **height**
      - _number_ **src_width**
      - _number_ **src_height**

    {.params}


  .copy\_rotated(_src_, _x_, _y_, _src_x_, _src_y_, _src_width_, _src_height_, _angle_) {#imagine.ImageResource.copy_rotated}

  : Similar to `copy_resized()` with an added rotation to the copied image. 
    Destination is the _center_ of the rotated copy. Angle is in degrees, 
    same as `arc()`. 
    
    Floating point destination center coordinates allow accurate rotation of 
    objects of odd-numbered width or height.
    
    The rotation angle is interpreted as the number of degrees to rotate the 
    image anticlockwise.


    - **@params**:
      - _ImageResource_ **src**
      - _number_ **x**
      - _number_ **y**
      - _number_ **src_x**
      - _number_ **src_y**
      - _number_ **src_width**
      - _number_ **src_height**
      - _number_ **angle**

    {.params}


  .clone() {#imagine.ImageResource.clone}

  : Clones this image resource.


    - **@returns**: _ImageResource_
    {.returns}


  .set\_brush(_brush_) {#imagine.ImageResource.set_brush}

  : Sets the brush image to be used by all line drawing functions for 
    this image.
    
    A "brush" is an image used to draw wide, shaped strokes in another image. 
    Just as a paintbrush is not a single point, a brush image need not be a 
    single pixel. Any image resource can be used as a brush, and by setting 
    the transparent color index of the brush image with `color_transparent()`, 
    a brush of any shape can be created. 
    
    All line-drawing functions, such as gdImageLine and `polygon()`, will use 
    the current brush if the special "color" `COLOR_BRUSHED` or 
    `COLOR_STYLED_BRUSHED` is used when calling them.
    
    >*NOTE:** 
     > 
    > You need not take special action when you are finished with a 
    > brush, but if you close the brush image (or let the GC close it), 
    > you must not use the `COLOR_BRUSHED` or `COLOR_STYLED_BRUSHED` colors 
    > until you have set a new brush image.


    - **@params**:
      - _ImageResource_ **brush**

    {.params}


  .set\_tile(_tile_) {#imagine.ImageResource.set_tile}

  : Sets the tile image to be used by all region filling functions.
    
    A tile is an image used to fill an area with a repeated pattern. Any image 
    resource can be used as a tile, and by setting the transparent color index 
    of the tile image with `color_transparent()`, a tile that allows certain 
    parts of the underlying area to shine through can be created. All 
    region-filling functions, such as `fill()` and `filled_polygon()`, will use 
    the current tile if the special "color" `COLOR_TILED` is used when calling 
    them.
    
    You can set any image resource to be the tile. If the tile image does not have 
    the same color map as the first image, any colors missing from the first image 
    will be allocated. If not enough colors can be allocated, the closest colors 
    already available will be used. This allows arbitrary GIFs to be used as tile 
    images. It also means, however, that you should not set a tile unless you will 
    actually use it; if you set a rapid succession of different tile images, you can 
    quickly fill your color map, and the results will not be optimal.
    
    You need not take any special action when you are finished with a tile. As for 
    any other image, if you will not be using the tile image for any further purpose, 
    you should call `close()`. You must not use the color `COLOR_TILED` if the current 
    tile has been closed; you can of course set a new tile to replace it.


    - **@params**:
      - _ImageResource_ **tile**

    {.params}


  .set\_antialiased(_color_, _dont_blend_) {#imagine.ImageResource.set_antialiased}

  : Set the color for subsequent anti-aliased drawing and whether to blend the 
    color or not.


    - **@params**:
      - _number_ **color**
      - _bool_ **dont_blend**

    {.params}


  .set\_thickness(_thickness_) {#imagine.ImageResource.set_thickness}

  : Sets the thickness in pixels for following lines drawn when drawing lines, 
    ellipses, rectangles, polygons and so forth.


    - **@params**:
      - _number_ **thickness**

    {.params}


  .interlace(_enable_) {#imagine.ImageResource.interlace}

  : Sets whether an image is interlaced. If the `enabled` parameter is not 
    given, it defaults to true.


    - **@params**:
      - _bool?_ **enable**

    {.params}


  .alpha\_blending(_enable_) {#imagine.ImageResource.alpha_blending}

  : Toggles between two different blending modes of drawing on truecolor images. 
    
    In blending mode, the alpha channel component of the color supplied to all 
    drawing function, such as `set_pixel()` determines how much of the underlying 
    color should be allowed to shine through. As a result, the module 
    automatically blends the existing color at that point with the drawing color, 
    and stores the result in the image. The resulting pixel is opaque. 
    
    In non-blending mode, the drawing color is copied literally with its alpha 
    channel information, replacing the destination pixel. Blending mode is not 
    available when drawing on palette images.
    
    If the `enabled` parameter is not given, it defaults to true.


    - **@params**:
      - _bool_ **enable**

    {.params}


  .flip(_mode_) {#imagine.ImageResource.flip}

  : Flips the image horizontally, vertically, or in both direction as specified 
    in mode. `mode` must be one of the `FLIP_` constants. When no mode is set, 
     mode defaults to `FLIP_BOTH`.


    - **@params**:
      - _number?_ **mode**

    {.params}


  .crop(_x_, _y_, _width_, _height_) {#imagine.ImageResource.crop}

  : Returns a new imaged cropped from the rectangular area specified by x, y, 
    width, and height in this image.


    - **@params**:
      - _number_ **x**
      - _number_ **y**
      - _number_ **width**
      - _number_ **height**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .auto\_crop(_mode_) {#imagine.ImageResource.auto_crop}

  : Crop an image automatically using one of the `CROP_` modes. If `mode` 
     is not give, it defaults to `CROP_DEFAULT`.


    - **@params**:
      - _number?_ **mode**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .scale(_width_, _height_, _method_) {#imagine.ImageResource.scale}

  : Scale an image using the given new width and height with the 
    interpolation algorithm. If height is not given, the height 
    will be automatcially calculated from the new width to maitain 
    aspect ratio. 
    
    If the interpolation method is not given, it defaults to 
    `INTERP_BILINEAR_FIXED`.
    
    This method returns a new image rather than modify this image.


    - **@params**:
      - _number_ **width**
      - _number?_ **height**
      - _number?_ **method**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .rotate(_angle_, _bg_color_, _method_) {#imagine.ImageResource.rotate}

  : Creates a new image rotated counter-clockwise by the requested angle using 
    the given interpolation method.  Non-square angles will add a border with 
    bgcolor.


    - **@params**:
      - _number_ **angle**
      - _number_ **bg_color**
      - _number?_ **method**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .save\_alpha(_save_) {#imagine.ImageResource.save_alpha}

  : Sets the save alpha flag
    
    The save alpha flag specifies whether the alpha channel of the pixels should
    be saved. This is supported only for image formats that support full alpha
    transparency, e.g. PNG.


    - **@params**:
      - _bool_ **save**

    {.params}


  .pixelate(_block_size_, _mode_) {#imagine.ImageResource.pixelate}

  : Applies pixelation effect to the image based on the block 
    size and given effect mode.


    - **@params**:
      - _number_ **block_size**
      - _number_ **mode**

    {.params}


  .scatter(_sub_, _plus_, _colors_) {#imagine.ImageResource.scatter}

  : Applies scatter effect to an image using the _sub_ and _plus_ to 
    control the strength of the scatter and colors to indicate the 
    colors it should be restricted to.


    - **@params**:
      - _number_ **sub**
      - _number_ **plus**
      - _list<number>_ **colors**

    {.params}


  .smooth(_weight_) {#imagine.ImageResource.smooth}

  : Makes an image smooter based on the specified weight. If 
    weight is not given, it defaults to `1`.


    - **@params**:
      - _number_ **weight**

    {.params}


  .mean\_removal() {#imagine.ImageResource.mean_removal}

  : Uses mean removal to achieve a "sketchy" effect.




  .emboss() {#imagine.ImageResource.emboss}

  : Embosses the image.




  .blur(_type_) {#imagine.ImageResource.blur}

  : Applies a blur to the image. If the type is not given, a 
    Guassian blur will be applied.


    - **@params**:
      - _number_ **type**

    {.params}


  .detect\_edge() {#imagine.ImageResource.detect_edge}

  : Uses edge detection to highlight the edges in the image.




  .grayscale() {#imagine.ImageResource.grayscale}

  : Converts the image into grayscale by changing the red, green 
    and blue components to their weighted sum using the same 
    coefficients as the REC.601 luma (Y') calculation. The alpha 
    components are retained. For palette images the result may 
    differ due to palette limitations.




  .negate() {#imagine.ImageResource.negate}

  : Reverses all colors of the image to create a negative image.




  .color(_r_, _g_, _b_, _a_) {#imagine.ImageResource.color}

  : Same as `grayscale()` except this allows you to specify the 
    output color.


    - **@params**:
      - _number_ **r**
      - _number_ **g**
      - _number_ **b**
      - _number_ **a**

    {.params}


  .contrast(_contrast_) {#imagine.ImageResource.contrast}

  : Changes the contrast of the image based on the level set 
    in _contrast_.


    - **@params**:
      - _number_ **contrast**

    {.params}


  .brightness(_brightness_) {#imagine.ImageResource.brightness}

  : Changes the brightness of the image based on the level set 
    in _brightness_.


    - **@params**:
      - _number_ **brightness**

    {.params}


  .set\_clip(_x1_, _y1_, _x2_, _y2_) {#imagine.ImageResource.set_clip}

  : Sets the rectangular clipping region beyond which no pixels 
    will be drawn in the image.


    - **@params**:
      - _number_ **x1**
      - _number_ **y1**
      - _number_ **x2**
      - _number_ **y2**

    {.params}


  .get\_clip() {#imagine.ImageResource.get_clip}

  : Returns the clipping region in the image. See `set_clip()`.
    
    The function returns a list containing four numbers that 
    indicates the x1, y1, x2, and y2 of the clipping region in 
    the image.


    - **@returns**: _list<number>_
    {.returns}


  .set\_resolution(_res_x_, _res_y_) {#imagine.ImageResource.set_resolution}

  : Sets the resolution of the the image across both axis.


    - **@params**:
      - _number_ **res_x**
      - _number_ **res_y**

    {.params}


  .true\_color\_to\_palette(_dither_, _colors_wanted_) {#imagine.ImageResource.true_color_to_palette}

  : Convert a true color image to a palette image. 
    
    The first parameter `dither` controls whether the image 
    should be dithered which results in a more speckled image but 
    with better color approximation. 
    
    The second argument `colors_wanted` controls the number of 
    colors that should be kept in the palette.


    - **@params**:
      - _bool_ **dither**
      - _number_ **colors_wanted**

    {.params}
    - **@returns**: _bool - `true` if successful, otherwise `false`._
    {.returns}


  .palette\_to\_true\_color() {#imagine.ImageResource.palette_to_true_color}

  : Converts a palette based image to true color.


    - **@returns**: _bool - `true` if successful, otherwise `false`._
    {.returns}


  .match\_color(_image_) {#imagine.ImageResource.match_color}

  : Makes the colors of the palette version of an image more closely 
    match the true color version. This function should be given a 
    true color image as the function will attempt to make the color 
    of the image given if the current image is a paletted image.


    - **@params**:
      - _ImageResource_ **image**

    {.params}
    - **@returns**: _bool - `true` if successful, otherwise `false`._
    {.returns}


  .compare(_image_) {#imagine.ImageResource.compare}

  : Check whether two images are idential.
    
    This check includes a size, transparency, interlace, color profile, 
    and a pixel by pixel check.
    
    If the images are completely identical, the method returns a zero 
    (`0`). Otherwise, it returns a number greater than 0. The number 
    returned can be tested againt the various `CMP_` constants to test 
     for any of the conditions.
    
    For example,
    
    ```blade
    var result = image1.compare(image2)
    
    var both_transparent = !(result & CMP_TRANSPARENT)
    var same_width = !(result & CMP_SIZE_X)
    ```


    - **@params**:
      - _ImageResource_ **image**

    {.params}
    - **@returns**: _number_
    {.returns}


  .export\_png(_dest_, _quality_) {#imagine.ImageResource.export_png}

  : Saves the image to file with the PNG format.
    
    Quality level: 0-10, where 9 is NO COMPRESSION at all,
    9 is FASTEST but produces larger files, 0 provides the best
    compression (smallest files) but takes a long time to compress, and
    10 selects the default compiled into the zlib library.


    - **@params**:
      - _string|file_ **dest**
      - _number_ **quality**

    {.params}


  .export\_jpeg(_dest_, _quality_) {#imagine.ImageResource.export_jpeg}

  : Saves the image to file with the JPEG format.
    
    Quality level: 100 is highest quality (there is always 
    a little loss with JPEG). 0 is lowest. 10 is about the 
    lowest useful setting.


    - **@params**:
      - _string|file_ **dest**
      - _number_ **quality**

    {.params}


  .export\_bmp(_dest_, _quality_) {#imagine.ImageResource.export_bmp}

  : Saves the image to file with the BMP format.
    
    Quality level: 100 is highest quality (there is always 
    a little loss with BMP). 0 is lowest. 10 is about the 
    lowest useful setting.


    - **@params**:
      - _string|file_ **dest**
      - _number_ **quality**

    {.params}


  .export\_wbmp(_dest_, _foreground_) {#imagine.ImageResource.export_wbmp}

  : Saves the image to file with the WBMP format using the 
    given foreground color.


    - **@params**:
      - _string|file_ **dest**
      - _number_ **foreground**

    {.params}


  .export\_webp(_dest_, _quantization_) {#imagine.ImageResource.export_webp}

  : Saves the image to file with the WEBP format using the 
    given quantization.


    - **@params**:
      - _string|file_ **dest**
      - _number_ **quantization**

    {.params}


  .export\_tiff(_dest_) {#imagine.ImageResource.export_tiff}

  : Saves the image to file with the TIFF format.


    - **@params**:
      - _string|file_ **dest**

    {.params}


  .export\_avif(_dest_, _quality_, _speed_) {#imagine.ImageResource.export_avif}

  : Saves the image to file with the JPEG format.
    
    Quality level: 100 is highest quality (there is always 
    a little loss with JPEG). 0 is lowest. 10 is about the 
    lowest useful setting.


    - **@params**:
      - _string|file_ **dest**
      - _number_ **quality**
      - _number_ **speed** - Default = 1


    {.params}


  .get\_pointer() {#imagine.ImageResource.get_pointer}

  : Returns the raw image resource pointer.


    - **@returns**: _ptr_
    {.returns}




_class_ **Image** {#imagine.Image .class}

: The Image class is allows creating and opening of imnages in 
  any of the supported formats which includes `JPEG`, `PNG`, 
  `GIF`, `TIFF`, `BMP`, `WBMP`, `TGA`, `WEBP`, `AVIF`.


  .new(_width_, _height_, _use_true_colors_) {#imagine.Image.new}

  : Creates a palette-based image (up to 256 colors) or a truecolor 
    image (millions of colors) when `use_true_colors` is set to true.


    - **@params**:
      - _number_ **width**
      - _number_ **height**
      - _bool?_ **use_true_colors**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .from\_png(_src_) {#imagine.Image.from_png}

  : Creates an image from a PNG file. Truecolor PNG stays truecolor; 
    palette PNG stays palette-based.


    - **@params**:
      - _string|file_ **src**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .from\_jpeg(_src_) {#imagine.Image.from_jpeg}

  : Creates an image from a JPEG file.
    JPEG is always truecolor.


    - **@params**:
      - _string|file_ **src**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .from\_gif(_src_) {#imagine.Image.from_gif}

  : Creates an image from a GIF file.


    - **@params**:
      - _string|file_ **src**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .from\_bmp(_src_) {#imagine.Image.from_bmp}

  : Creates an image from a BMP file.


    - **@params**:
      - _string|file_ **src**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .from\_wbmp(_src_) {#imagine.Image.from_wbmp}

  : Creates an image from a WBMP file.


    - **@params**:
      - _string|file_ **src**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .from\_tga(_src_) {#imagine.Image.from_tga}

  : Creates an image from a TGA file.


    - **@params**:
      - _string|file_ **src**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .from\_tiff(_src_) {#imagine.Image.from_tiff}

  : Creates an image from a TIFF file.


    - **@params**:
      - _string|file_ **src**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .from\_webp(_src_) {#imagine.Image.from_webp}

  : Creates an image from a WEBP file.


    - **@params**:
      - _string|file_ **src**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .from\_avif(_src_) {#imagine.Image.from_avif}

  : Creates an image from a AVIF file.


    - **@params**:
      - _string|file_ **src**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}


  .from\_file(_src_) {#imagine.Image.from_file}

  : Creates an image from any supported image file.
    As long as the file type is supported by Imagine,
    the file type will automatically be detected.


    - **@params**:
      - _string|file_ **src**

    {.params}
    - **@returns**: _ImageResource_
    {.returns}




