###### This is a guide from the most common used commands for Machine Learning Engineering
###### By Alfredo Vargas.

# Regular Expressions
- Use raw strings in Python to avoid collisions of Python and re module scape characters `\`. E.g: `r"\n"`
- `.` matches any char except space (unless DOTALL flag is specified)
- `^`, `$`, `*`, `+`, `?`, matches beginning, end, 0 or more, 1 or more, 0 or 1
- `RE <.*>` with string `'<a> b <c>'` will match the whole string, but `RE<.*?>` will match only `<a>`
- `a{6}` will match six `a` characters
- `a{3,5}` will match from 3 to 5 `a` characters. Omitting first bound implies zero, omitting second bound implies infinity
- `(?<=RE)` to specify a regular that precedes the one we are interested in

# File related commands
- Preferable use `with open`, beware that open returns a text io object and that read returns a whole string. Use zip to convert two lists to a dictionary:
```python
import json
import re

regex_given = r"<your regular expression>"
set_from_entries = []
number_list = []

with open("text.txt", "r,w,a") as text_io_object:
  buffer_string = text_io_object.read()
  list_based_on_regex = re.findall(regex_given, buffer_string)
  set_from_entries = list(set(list_based_on_regex))
  for entry in set_from_entries:
    number = list_based_on_regex.count(entry)
    number_list.append(number)

entries_dict = dict(zip(set_from_entries, number_list))

with open("output.json", "w") as outfile:
  json.dump(entries_dict, outfile)
```

# Recursion
## Example
```python
def sum_positive_numbers(n):
  if n < 2:
    return 1
  return n + sum_positive_numbers(n - 1)
 ```

# Strings
- References from: [link](https://docs.python.org/3/library/stdtypes.html#string-methods)
## Basic methods
- `string.upper` or `string.lower` returns the uppercase or lowercase version
- `string.index("i")` : returns the index position of char `"i"`
- `" yes ".strip()` : gets rid of the white spaces. `lstrip()` and `rstrip()` can also be used
- `tabitha.count("a")` : gets the number of occurrences of `"a"` in the string
- `"123".isnumeric()` : returns a boolean
- `"separator".join(["string1", "string2", ...])` : joins the strings on the list by the given separator
- `long_string.split(separator)` : splits the string given the separator
- `sentence.replace(word, word.upper())` : change a single word from a string to uppercase

## Formatting output
- C-like Formatting
```python
print("Your lucky number is {number}, {name}.".format(name=name, number=len(name)*3))
```
- Table formatting, `>` aligns to the right and `<` aligns to the left
```python
def to_celsius(x):
  return (x-32)*5/9

for x in range(0,101, 10):
  print("{:>3} F | {:>6}.2f C".format(x, to_celsius(x)))
```
- Printing using placeholders
```python
first = "apple"
second = "banana"
third = "carrot"
formatted_string = "{0} {2} {1}".format(first, second, third)
print(formatted_string)  # Outputs: apple carrot banana
```

# Lists
## Basic commands
- `list.insert(index_number, "New data")` : insertion by index
- `list_comprehension = [x for x in range(n + 1) if x % 2 != 0]` : Odd numbers using list comprehension
- For loop using enumeration
```python
winners = ["Ashley", "Dylan", "Reese"]
for index, person in enumerate(winners):
  print("{} - {}".format(index + 1, person))
```

# Tuples
- `hours, minutes, seconds = result` : where result is a tuple with three values

# Dictionaries
- `"given key" in my_dict` : returns True or False
- Looping through keys and values:
```python
for key, value in dict.items():
  key = ...
  value = ...
```

# Pydoc
- Every install of python comes with this service that can generate a web-server for your documentation.
```
console
python -m pydoc
python -m pydoc math
python -m pydoc pow
python -m -k ftp
python -m pydoc -k sql
python -m pydoc -b
```
# Numpy
- Web API documentation: [numpy doc](https://numpy.org/doc/stable/index.html)
- Using the most widely adopted abbreviation: `import numpy as np`
- We create two vector arrays, first one by declaring the min and max values and how many elements will have. The second vector will be derived from the first one where $f(x)$ is just a linear function. E.g. $f(x) = a * x + b$ with both $a$ and $b$ constants.
```console
x = np.linsapce(start, end, how_many)
y = f(x)
```

# Scikit-learn
- Web API documentation: [scikit-learn doc](https://scikit-learn.org/stable/user_guide.html)

# TensorFlow
- Web API documentation: [tensor-flow doc](https://www.tensorflow.org/api_docs/python/tf/all_symbols)

