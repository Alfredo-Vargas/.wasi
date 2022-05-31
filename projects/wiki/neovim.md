# Turn on background transparency
Set background transparent to true in Neovim located in:
```console
nvim ~/.local/share/nvim/site/pack/packer/start/darkplus.nvim/lua/darkplus/config.lua
```

# Allow the adapter to attach to the runInTerminal
Yama is a linux security module. Depending on the settings
it ensures that a process cannot access the memory/state of another process.
That's usually a good thing, but for debuggin can get in the way.
[Yama](https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html)
Quick Fix:
```
echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope ?
```

# Icons and Emojis
Visit the following link:
[emoji](https://emojipedia.org)

# To save on a file on readonly mode
```console
:w !sudo tee %
```

## Setting Commands
Quick shell command
```
:! <cmd command>
```
Compile and Sync Packer
```console
:Packer Compile
:Packer Sync
```

## Comment (to change to general purpose <C-/>)
Comment a line `gcc`, block `gcb`, append `gcA`, before `gcO`, after `gco` and a word `gcw`

## Explorer
```console
<C-b>
```

## Buffers
Navigate and close current buffer
```console
<S-h> or <S-l>
<C-q>
```

## Language Server Protocol
To view attached `Lsp` clients and install or remove them
```console
:LspInfo
:LspInstallInfo
```
Go to definition `gd`, go to declaration `gD`, go to implementation `gi`, show description `K`.
Previous diagnosis `[d`, next diagnosis `]d`.

## Practical commands
View a text file in hex mode and go back to normal text
```
:%!xxd
:%!xxd -r
```
To center current cursor to the middle of the screen `zz`
To make neovim to read from stdin
```console
echo "this is a test" | nvim -
```
To make a diff of the current two buffers opened (in two windows) and disable it
```console
:windo diffthis
:diffoff
```
Open two files in diff mode
```console
neovim -d <file1> <file2>
```
Go to definition and return to previous tag stack
```console
gd
<C-t>
```
To close a window
```console
ZQ
```
To delete lines except the ones which have the word: "foo"
```console
:g!/foo/d
```
To delete lines which are empty or have spaces
```console
:g/^\s*$/d
```
