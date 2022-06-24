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
