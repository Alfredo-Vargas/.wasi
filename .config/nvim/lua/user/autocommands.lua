-- vim.api.nvim_create_autocmd({ "User" }, {
--   pattern = { "AlphaReady" },
--   callback = function()
--     vim.cmd [[
--       set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
--     ]]
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   callback = function()
--     vim.cmd [[
--       if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
--     ]]
--   end,
-- })

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link illuminatedWord LspReferenceText"
  end,
})

vim.cmd [[
  " augroup _general_settings
  "   autocmd!
  "   autocmd FileType qf,help,man,lspinfo,spectre_panel nnoremap <silent> <buffer> q :close<CR>
  "
  "   autocmd BufWinEnter * :set formatoptions-=cro
  "   autocmd FileType qf set nobuflisted
  "   autocmd CmdWinEnter * quit
  " augroup end
  "
  " augroup _git
  "   autocmd!
  "   autocmd FileType gitcommit setlocal wrap
  "   autocmd FileType gitcommit setlocal spell
  " augroup end
  "
  " augroup _markdown
  "   autocmd!
  "   autocmd FileType markdown setlocal wrap
  "   autocmd FileType markdown setlocal spell
  " augroup end
  "
  " augroup _auto_resize
  "   autocmd!
  "   autocmd VimResized * tabdo wincmd =
  " augroup end
  "
  " augroup _alpha
  "   autocmd!
  "   autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  " augroup end

  " augroup illuminate_augroup
  "   autocmd!
  "   autocmd VimEnter * hi link illuminatedWord LspReferenceText
  " augroup END

 " let ftToEnable = ['java']
  " augroup codelens
  "   autocmd!
  "   autocmd BufWritePost *.java lua vim.lsp.codelens.refresh()
  " augroup END

  " autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]

-- vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost" }, {
--   callback = function()
--     local winbar_filetype_exclude = {
--       "help",
--       "startify",
--       "dashboard",
--       "packer",
--       "neogitstatus",
--       "NvimTree",
--       "Trouble",
--       "alpha",
--       "lir",
--       "Outline",
--       "spectre_panel",
--       "toggleterm",
--     }
--
--     if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
--       vim.opt_local.winbar = nil
--       return
--     end
--
--     local value = require("user.winbar").gps()
--
--     if value == nil then
--       value = require("user.winbar").filename()
--     end
--
--     vim.opt_local.winbar = value
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   callback = function()
--     vim.cmd "set formatoptions-=cro"
--   end,
-- })
