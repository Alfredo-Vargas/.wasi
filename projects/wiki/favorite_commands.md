# Git Commands
## Stage related commands
To stage/unstage all staged files
```console
git add -u
git reset
```
## Branch related commands
To list local branches and local + remote branches:
```console
git branch 
git branch -a
```
To change to another branch and to create and change to another branch:
```console
git checkout <branch-name>
git checkout -b <branch-name>
```

## Push related commands
To push from a local repo for the first time to an existing remote repo
```console
git push origin <branch-name>
```
To push a local created branch to a non existing remote branch 
```console
git push -u origin <new-branch-name>
```

## Remove related commands
To just remove a file from a repository
```console
git rm -r --cached <file-name>
```

# Neovim 
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
View a text file in hex mode
```
:%!xxd
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

# Tmux
My prefix
```console
<C-t>
```
To list tmux session and attach to one given its name
```console
tmux ls
tmux attach -t <session-name>
```
To kill a particular session and a server
```console
tmux kill-session -t <session-name>
tmux kill-server
```
To detach from a session
```console
prefix d
```
To split a window (vim-like)
```console
prefix s,v
```
To kill all panes but one
```console
prefix e
```
To list all sessions
```console
prefix <M-s>
```
To change tmux layouts
```console
prefix <M-#>
```
To have a preview of current windows and to go back
```console
prefix w
q
```
To reload tmux configuration
```console
prefix r
```
To resize panes
```console
prefix <C-h,j,k,l>
```
To switch to tmux vi mode, paste copied and exit vi mode
```console
<C-]>
<C-[>
<C-c>
```

# Shell shortcuts
Paste previous argument
```console
<M-.>
```
Cut to beginning and to end
```console
<C-u>
<C-k>
```
Reset shell and retry previous command as sudo
```console
reset
sudo !!
```

# Dwm
Multiple tags can be displayed if selected with their respective numbers!
```console
<C-#>
```
To switch from windows up and down
```console
<S-w,s>
```
To switch from tags left or right
```console
<S-a,d>
```






