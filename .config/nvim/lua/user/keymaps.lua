-- local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- Shorten function name (old way to set keymaps)
-- local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- OLD Way to remap!
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- New way to remap!!!
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- New way to remap!!!
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")


-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Insert --
-- Press jk fast to enter
vim.keymap.set("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- NVim-Telescope 
vim.keymap.set("n", "<A-g>", ":Telescope grep_string<CR>")
vim.keymap.set("n", "<A-f>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<A-b>", ":Telescope buffers<CR>")
vim.keymap.set("n", "<A-h>", ":Telescope help_tags<CR>")

-- Nvim-DAP -- Debug Adapter Protocol
-- vim.keymap.set("n", "<F8>", ":lua require('dap').run_last()<CR>")
-- vim.keymap.set("n", "<F9>", ":lua require('dap').repl.open({}, 'vsplit')<CR><C-w>v")
-- vim.keymap.set("n", "<C-j>", ":lua require('dap').step_over()<CR>")
-- vim.keymap.set("n", "<C-l>", ":lua require('dap').step_into()<CR>")
-- vim.keymap.set("n", "<C-k>", ":lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<Space>dn", ":lua require('dap').continue()<CR>")
vim.keymap.set("n", "<Space>db", ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Space>dk", ":lua require('dap').up()<CR>")
vim.keymap.set("n", "<Space>dj", ":lua require('dap').down()<CR>")

vim.keymap.set("n", "<Space>di", ":lua require('dap.ui.widgets').hover()<CR>")
vim.keymap.set("n", "<Space>ds", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>")
-- vim.keymap.set("n", "<F5>", ":lua require('debugHelper').attach()<CR>")
-- vim.keymap.set("n", "<F5>", ":lua require('dap').debugHelper.attach()<CR>")

-- Vim-bbye --
vim.keymap.set("n", "<C-q>", ":Bdelete<CR>") -- closes current buffer
vim.keymap.set("n", "<C-e>", ":Bwipeout<CR>") -- closes wipesout buffer

-- Here are General Purpose Keymaps (try to set up keymaps that are convention with other programs)
-- NvimTreeToggle
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>") -- closes wipesout buffer
-- Comment
-- The design of vim recognizes <C-/> as <C-_> !!!
vim.keymap.set("n", "<C-_>", ":normal gcc<CR>")
-- keymap("v", "<C-_>", ":normal gb<CR>", opts )

-- Colorscheme Material toggler
--Lua:
vim.keymap.set("n", "<Space>m", ":lua require('material.functions').toggle_style()<CR>")
vim.keymap.set("n", "<Space>,", ":colorscheme darkplus<CR>")

-- Terminal --
-- Better terminal navigation
-- vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h")
-- vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j")
-- vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k")
-- vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l")

