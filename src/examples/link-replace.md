# Link Replace

Replaces links in a text with HTML anchor tags.


```zuri
var data = 'http://www.google.com
http://google.com

<p>http://www.google.com<p>

this is a normal sentence. let\'s hope it\'s ok.

<a href="http://www.google.com">www.google.com</a>'

echo data.replace(
  '/((?<!href=")https?:\/\/[^\s\<]+)/',
  '<a href="$0" target="_blank">$0</a>'
)
```