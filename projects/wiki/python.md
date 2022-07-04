###### This is a guide from with the most recently learned commands 
###### By Alfredo Vargas.

# Error Handling
- `raise ValueError("Meaningful meassage")` : Value error to be raised after custom condition
- `assert number > 0, f"number greater than 0 expected, got: {number}` : Feedback printed when assertion is false (Use assertion during development but never on production, as optimization flag during compile time disable them).
- Example with `try-except block`
```python
def Guess(participants):
    my_participant_dict = {}
    for participant in participants:
        my_participant_dict[participant] = random.randint(1, 9)
    try:
        if my_participant_dict['Larry'] == 9:
            return True
        else:
            return False
    except:
        return None

participants = ['Cathy','Fred','Jack','Tom']
print(Guess(participants))
None
```

# OS Module
- `os.rename(), os.create(), os.path.exists(), os.remove(), os.path.getmtime(), os.isfile(), os.path.abspath(), os.path.getsize()` : are some common used functions
- `os.getcwd(), os.mkdir(), os.chdir(), os.rmdir(), os.listdir(), os.path.isdir(), os.path.join()` : more common used functions
- Get Unix time stamp from a file:
```python
import datetime
timestamp = os.path.getmtime("file.ext")
datetime.datetime.fromtimestamp(timestamp)
```

# Regular Expressions
- Test your regex on the following link: [regex101](https://regex101.com)
- Use raw strings in Python to avoid collisions of Python and re module scape characters `\`. E.g: `r"\n"`
- `.` matches any char except newline (unless DOTALL flag is specified)
- `^`, `$`, `*`, `+`, `?`, matches beginning, end, 0 or more, 1 or more, 0 or 1
- `RE <.*>` with string `'<a> b <c>'` will match the whole string, but `RE<.*?>` will match only `<a>`
- `a{6}` will match six `a` characters. `{ }` specifies the number of repetitions
- `a{3,5}` will match from 3 to 5 `a` characters. Omitting first bound implies zero, omitting second bound implies infinity
- `\d` matches digit, `\D` matches not a digit
- `\w` matches word, `\W` matches not a word
- `\s` matches space, `\S` matches not space
- `\b` word boundary, `\B` not a word boundary
- `[ ]` character class, `( )` group
- `(?<=RE)` to specify a regular that precedes the one we are interested in
- `re.search`, `re.findall`, `re.split`, `re.replace` and `re.sub` are the possible functions to use with regular expressions
## Examples:
1. Letter `a` or `A` have to be present at least twice. See how $\{1,\} \equiv +$
```python
re.search(r".*[a|A]{1,}.*"[a|A]{1,}.*", string)
re.search(r".*[a|A]+.*"[a|A]+.*", string)
```
2. Check if the string looks like a normal sentence, meaning that it starts with an uppercase letter, followed by at least some lowercase letters or a space, and ends w:  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE

Copyright (c)  Author. All rights reserved.

Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
Everyone is permitted to copy and distribute verbatim or modified
copies of this license document, and changing it is allowed as long
as the name is changed.

  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
  0. You just DO WHAT THE FUCK YOU WANT TO.ith a period, question mark, or exclamation point. 
```python
re.search(r"^[A-Z][a-z\s]*[.?!]$", string)
```
3. The time format of a 12-hour clock, is as follows: the hour is between 1 and 12, with no leading zero, followed by a colon, then minutes between 00 and 59, then an optional space, and then AM or PM, in upper or lower case
```python
re.search(r"^[1-9][0-2]?:[0-5][0-9]\s?[am$|pm$|AM$|PM$]", string)
```
4. Capturing Groups
```python
result = re.search(r"^(\w*), (\w*)$", "Lovelace, Ada")
print(result.groups())
('Lovelace', 'Ada')
print(result[0])
Lovelace, Ada
print(result[1])
Lovelace
print(result[2])
Ada
```

5. Using word limits `\b` to indicate that we want full words:
```python
print(re.findall(r"\b[a-zA-Z]{5}\b", "A scary ghost appeared"))
['scary', 'ghost']
```

6. Split Example
```python
re.split(r"([.?!])", "One sentence. Another one? And the last one!")
['One sentence', '.', ' Another one', '?', ' And the last one', '!', '']
```

7. Substitution Example
```python
re.sub(r"[\w.%+-]+@[\w.-]+", "[REDACTED]", "Received an email for go_nuts95@my.example.com")
'Received an email for [REDACTED]'
```
```python
re.sub(r"^([\w .-]*), ([\w .-]*)$", r"\2 \1", "Lovelace, Ada")
'Ada Lovelace'
```

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

# Classes
## Special Methods
- `def __init__(self, ...):` : It is the constructor used to create an instance
- `def __str__(self):` : It is the customized print of the class
- `help(ClassName)` : Will open the help related to that class. The help string are written between triple double quotes (indented at the same level of the block that is documented).
- Inheritance in Python:
```python
class Fruit:
  def __init__(self, color, flavor):
    self.color = color
    self.flavor = flavor
class Apple(Fruit):
  pass
```
- Composition : One needs to initialize mutable attributes in the constructor to avoid all instances to have the same attributes
```python
class Repository:
  def __init__(self):
    self.packages = {}
  def add_package(self, package):
    self.packages[package.name] = package
  def total_size(self):
    result = 0
    for package in self.package.values():
      result += package.size
    return result

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
- `isinstance(object, type)` : to check if the object is instance of a particular type

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
- `list.sort(), sorted(list), sorted(list, key=len)` : changes original list, creates a new sorted list with a given key
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

