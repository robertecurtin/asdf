# asdf
a unique, terse language

### Types

Type name | Description
--- | ---
a | Array
s | String
d | Digit

Strings can consist of any number of the characters `a`, `s`, `d`, and `f`.

Digits are positive integer values, and are represented in base 4 by strings using the digits `a`, `s`, `d`, and `f`

asdf | decimal
--- | ---
a | 0
s | 1
d | 2
f | 3
sa | 4
sd | 6
saa | 8
fdsa | 228

### Planned syntax
Constants don't exist, you have to declare a variable using `d` before you can use it

#### Implemented
Format | Description
--- | ---
d s/d [name] [value]; | declare a string or digit
d a [name] [type] [value] ([type] [value]...) | declare an array with initial element(s)
a [digit 1] [digit 2 ] [digit 3]; | add digits 2+3 and store in 1
s [digit 1] [digit 2 ] [digit 3]; | subtract
s [str] [digit] [digit (opt)];	| slice substring
[name];	| return value of variable

#### Todo
Format | Description
--- | ---
s [digit] [str]; | get string length
a [array] [var]; | add to array
a [index] [array] [var]; | add to array at index
d [index] [array]; | delete element at index
f [index] [array]; | fetch value at index from array
f [name] [digit x] [digit y] ... ; | for name = x; name < y; name++; 	declares `name` as a digit and runs everything before semicolon
f [name] [name] [array] ... ; | for i, v in array
