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

### Vim Magic Wands

- `!!` : use the magic wand with whatever binary script whose output you wanna put inside current buffer
- `%!xdd` : to see the hex values of current buffer
- `%!xdd -r` : to change back from hex back to text values of current buffer

### Vim Retrieve Info from current buffer

- `set fileencoding` : to check the file encoding of current buffer

---

### Vim Commands

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

- `Q` : close current buffer
- `zz` : center cursor in current buffer
- `zt` : places cursor to the top of current buffer
- `zb` : places cursor to the bottom of current buffer

---

### Special Functions

- `F1` : executes the command: `:e ~/Notes/`, opens that particular directory (must exist)
- `F3` : executes `:e .`, meaning opens your home directory
