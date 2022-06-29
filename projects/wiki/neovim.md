# Several Vim/Neovim Commands

## Go commands
- `gqq` : Makes a paragraph by inserting `CR` to making a paragraph not to have lines longer than 80 chars.
- `guu` : Makes the line uncapitalized.
- `gUU` : Makes the line capitalized
- `~` : Changes capitalization of single letter.
- `g~` : Changes capitalization of single line.
- `gd` : Goes to the file given by the current string (path).
- `gv` : Goes to last selected item.
- `J` : Joins the lines.
- `gJ` : Joins selected lines without spaces.
- `g&` : Make last substitution global.

## Interesting commands
- `:%!xxd` : view a text file in hex mode
- `:%!xxd -r` : change view back from hex mode
- `echo "this is a test" | nvim -` : makes neovim to read from stdin
- `:windo diffthis` : to make a diff of the two buffers opened in a window
- `:diffoff` : to close a diff of the two buffers opened in a window
- `neovim -d <file1> <file2>` : to open two files in neovim using diff mode
- `:g!/foo/d` : to delete lines which have the word "foo"
- `:g/^\s*$/d` : to delete lines which are empty of have spaces

## Tabs
- `<C-w-T` : open current buffer in a new tab
- `gt` : walks among tabs

## Buffer Navigation
- `<S-h>` : move on buffer to the left
- `<S-l>` : move on buffer to the right
- `<C-q>` : close current buffer

## Exiting Commands
- `ZQ` : To quit without saving
- `ZZ` : To quit saving
## Moving current cursor line
- `zt` : to place line to the top
- `zz` : to place line to the center
- `zb` : to place line to the bottom
## Paragraphs Block Commands
- `>ap` : to indent around paragraph
- `<ap` : to dedent around paragraph

## Cmp Commands
- `:CmpStatus`
- `:CmptabnineHub`

## Language Server Protocol
- `:LspInfo` : to see current attach lsp clients
- `:LspInstallInfo` : to install update delete current lsp client
- `gd` : go to definition
- `gD` : go to declaration
- `gi` : go to implementation
- `K` : show description
- `K` : show description
- `[d` : previous diagnosis
- `]d` : next diagnosis

## Packer Commands
- Packer Compile
- Packer Sync

## Tree-Sitter Commands
- `TSInstall <language_name>`

## Setting Commands
- `:! <cmd command>` : for a quick shell command
- `:w !sudo tee %` : to save a file opened in mode _read-only_.

# Vim/Neovim Configurations
## Transparency
- Set background transparent for darkplus theme to true:
```console
nvim ~/.local/share/nvim/site/pack/packer/start/darkplus.nvim/lua/darkplus/config.lua
```
- `TransparentToggle` : to toggle transparency on and off

## Allow the adapter to attach to the run-in-terminal
- Yama is a linux security module. Depending on the settings it ensures that a process cannot access the memory/state of another process. That's usually a good thing, but for debuggin can get in the way. 
- [Yama](https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html)
Quick Fix:
```
echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope ?
```

## Icons and Emojis
Visit the following link: [emoji](https://emojipedia.org)
