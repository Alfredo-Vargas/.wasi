## VI, VIM, NVIM Commands

### LSP related

- `A-k` : show LSP lines
- `F11` : LSP buffer references
- `F12` : LSP definitions

---

### Tree Sitter related

- `F7` : TS Under Cursor
- `F8` : TS Playground

---

### Plugins related

- `siw<char>` : to surround inner word by the passed char
- `<C-z>` : to go to zen mode

### Vim Magic Wands or Buffer Insertions

- `:r !ls` : puts the output of the `ls` command on the current buffer
- `!!` : use the magic wand with whatever binary script whose output you wanna put inside current buffer
- `%!xdd` : to see the hex values of current buffer
- `%!xdd -r` : to change back from hex back to text values of current buffer
- `:r <filename>` : to insert the contents of the given filename in the current buffer

---

### Vim Commands

- `di<char>` : delete all inside of that is surrounded by `<char>`
- `:'<,'>w <newfile>` : to save selection to a new file
- `set fileencoding` : to check the file encoding of current buffer
- `<C-g>` : to see current file info and cursor position
- `a`
- `:term` : to open a terminal in a buffer not in pop up window
- `C-0` : opens terminal in a pop up window
- `A-t` : open current buffer in a new Tab
- `g-T` : to switch Tabs
- `A-y` : close Tabs
- `ZZ` : to save buffer if modified and quit vim. Alternative `:x`
- `ZQ` : to quit vim without saving buffer modifications

---

### Git Related

- `A-g` : show git branches

---

### Buffer Manipulation/Navigation

- `U` : changes to uppercase the selection
- `u` : changes to lowercase the selection
- `Q` : close current buffer
- `zz` : center cursor in current buffer
- `zt` : places cursor to the top of current buffer
- `zb` : places cursor to the bottom of current buffer

---

### Special Functions

- `F1` : executes the command: `:e ~/Notes/`, opens that particular directory (must exist)
- `F3` : executes `:e .`, meaning opens your home directory
