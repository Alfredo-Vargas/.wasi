### My Personal Neovim Tweaks
###### Base build based from: [Chris Neovim](https://github.com/ChristianChiarulli/nvim)

---
* On "keymaps.lua" activate:
```lua
-- Insert --
-- Press jk fast to enter
vim.keymap.set("i", "jk", "<ESC>")
```
---
* On options.lua
```lua
vim.opt.listchars={space = '.', tab = '>~', eol='↵'}
```
---
* Commented the plugins that are not working properly on `init.lua`
```lua
-- require "user.sniprun"
```
---
* Comment the lines that give trouble on `winbar.lua`
* comment on `lualine.lua` the line where `StatusLineSeparator` is called which is not previously defined
* comment the trouble lines on `winbar.lua` (navic\_text lines)
* comment line `cmd = { "py" }` on `pyright.lua`
* use fortune binary on `alpha.lua`
* comment `autocommands.lua` to have an idea of what each `autocommand` does

**and let's go!**
