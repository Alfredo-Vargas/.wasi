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
* Add server detection for `clangd` to `mason.lua` (location: `nvim/lua/user/lsp/mason.lua`)
```lua
if server == "clangd" then
  local clangd_opts = require "user.lsp.settings.clangd"
  opts = vim.tbl_deep_extend("force", clangd_opts, opts)
end
```
then add `clangd.lua` to location: `nvim/lua/user/lsp/settings/clangd.lua`, these are the defaults
```lua
return {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  single_file_support = { true },
}
```
finally on `handlers.lua` add the following encoding to the client capabilities:
```lua
M.capabilities = vim.lsp.protocol.make_client_capabilities()

-- to fix the encoding when using clangd
-- should be nice to handle encoding capabilities per lsp server?
M.capabilities.offsetEncoding = { "utf-16" }  

```

- For Perl LSP, modify `mason.lua`
```lua
lcal servers = {
    ...
    "perlnavigator",
    ...
  }
...
if server == "perlnavigator" then
  local perl_opts = require("user.lsp.settings.perlnavigator")
  opts = vim.tbl_deep_extend("force", perl_opts, opts)
end
```
and add `settings/perlnavigator.lua`:
```lua
return {
  settings = {
    perlnavigator = {
      perlPath = 'perl',
      perltidyProfile = '',
      perlcriticProfile = '',
      perlcriticEnabled = true
    },
  },
}

```

* Comment the lines that give trouble on `winbar.lua`
* comment on `lualine.lua` the line where `StatusLineSeparator` is called which is not previously defined
* comment the trouble lines on `winbar.lua` (navic\_text lines)
* comment line `cmd = { "py" }` on `pyright.lua`
* use fortune binary on `alpha.lua`
* comment `autocommands.lua` to have an idea of what each `autocommand` does

**and let's go!**

