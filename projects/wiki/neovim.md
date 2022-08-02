# Several Vim/Neovim Commands

## Markdown Plugin

- `Toc`
```
${toc}
[[toc]]
[toc]
[[_toc_]]
```
- `Plantum1`
``` plantuml
Bob -> Alice : hello
```
- `Katex`

$\sqrt{3x-1}+(1+x)^2$

$$\begin{array}{c}

\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} &
= \frac{4\pi}{c}\vec{\mathbf{j}}    \nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\

\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\

\nabla \cdot \vec{\mathbf{B}} & = 0

\end{array}$$

- `Mermaid`
``` mermaid
gantt
    dateFormat DD-MM-YYY
    axisFormat %m/%y

    title Example
    section example section
    activity :active, 01-02-2019, 03-08-2019
```
- `js-sequence-diagrams`
``` sequence-diagrams
Andrew->China: Says
Note right of China: China thinks\nabout it
China-->Andrew: How are you?
Andrew->>China: I am good thanks!
```
- `flowchart`
``` flowchart
st=>start: Start|past:>http://www.google.com[blank]
e=>end: End|future:>http://www.google.com
op1=>operation: My Operation|past
op2=>operation: Stuff|current
sub1=>subroutine: My Subroutine|invalid
cond=>condition: Yes
or No?|approved:>http://www.google.com
c2=>condition: Good idea|rejected
io=>inputoutput: catch something...|future

st->op1(right)->cond
cond(yes, right)->c2
cond(no)->sub1(left)->op1
c2(yes)->io->e
c2(no)->op2->e
```
- `dot`
``` dot
digraph G {

  subgraph cluster_0 {
    style=filled;
    color=lightgrey;
    node [style=filled,color=white];
    a0 -> a1 -> a2 -> a3;
    label = "process #1";
  }

  subgraph cluster_1 {
    node [style=filled];
    b0 -> b1 -> b2 -> b3;
    label = "process #2";
    color=blue
  }
  start -> a0;
  start -> b0;
  a1 -> b3;
  b2 -> a3;
  a3 -> a0;
  a3 -> end;
  b3 -> end;

  start [shape=Mdiamond];
  end [shape=Msquare];
}
```
- `chart`
``` chart
{
  "type": "pie",
  "data": {
    "labels": [
      "Red",
      "Blue",
      "Yellow"
    ],
    "datasets": [
      {
        "data": [
          300,
          50,
          100
        ],
        "backgroundColor": [
          "#FF6384",
          "#36A2EB",
          "#FFCE56"
        ],
        "hoverBackgroundColor": [
          "#FF6384",
          "#36A2EB",
          "#FFCE56"
        ]
      }
    ]
  },
  "options": {}
}
```

## Windows and Buffers
- `:new` : gets you a new horizontal buffer, similar to `C-w-s` but without repeating the same buffer
- `:vnew` : gets you a new vertical buffer, similar to `C-w-v` but without repeating the same buffer
- `:echo nvim_get_current_buf()` : gives the current buffer number in **neovim**
- `:echo buffer_number()` : gives the current buffer number in **vim**

## Some Concepts/Definitions
- `so %` : to source your current `.vimrc` when changing options
- `%` : means current buffer

## Go commands
- `gqq` : Makes a paragraph by inserting `CR` to making a paragraph not to have lines longer than 80 chars.
- `guu` : Makes the line `uncapitalized`.
- `gUU` : Makes the line capitalized
- `~` : Changes capitalization of single letter.
- `g~` : Changes capitalization of single line.
- `gd` : Goes to the file given by the current string (path).
- `gv` : Goes to last selected item.
- `J` : Joins the lines.
- `gJ` : Joins selected lines without spaces.
- `g&` : Make last substitution global.

## Hex mode magic wand
- `:%!xxd` : view a text file in hex mode
- `:%!xxd -r` : change view back from hex mode
- `echo "this is a test" | nvim -` : makes neovim to read from stdin

## Diff Command
- `:windo diffthis` : to make a diff of the two buffers opened in a window
- `:diffoff` : to close a diff of the two buffers opened in a window
- `neovim -d <file1> <file2>` : to open two files in neovim using diff mode

## Delete lines
- `:g!/foo/d` : to delete lines which have the word "foo"
- `:g/^\s*$/d` : to delete lines which are empty of have spaces
- `'<,'>s/original/new/gc` :  asks for confirmation for each matching case

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
- Yama is a linux security module. Depending on the settings it ensures that a process cannot access the memory/state of another process. That's usually a good thing, but for debugging can get in the way. 
- [Yama](https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html)
Quick Fix:
```
echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope ?
```

## Icons and Emojis
Visit the following link: [emoji](https://emojipedia.org)
