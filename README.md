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

Arrays are 1-indexed using asdf numbers.

### Syntax
Constants don't exist outside of declaration, you have to declare a variable using `d` before you can use it

#### Implemented
Format | Description
--- | ---
d s/d [name] [value]; | declare a string or digit
d a [name] [type] [value] | declare an array with initial element at index `s`
a [digit 1] [digit 2 ] [digit 3]; | add digits 2+3 and store in 1
a [array] [var]; | append to array
s [digit 1] [digit 2 ] [digit 3]; | subtract digits 2-3 and store in 1
s [str] [digit] [digit (opt)];	| slice substring
[name];	| return value of variable
f [digit] [array]; | fetch value at index from array

#### Todo
Format | Description
--- | ---
s [digit] [str]; | get string length
a [digit] [array] [var]; | add to array at index
d [digit] [array]; | delete element at index
f [name] [digit x] [digit y] ... ; | for name = x; name < y; name++; 	declares `name` as a digit and runs everything before semicolon
f [name] [name] [array] ... ; | for i, v in array; declares `name`s as keys and runs everything before semicolon
s [digit] ; | skip the provided number of digits back in the stack
