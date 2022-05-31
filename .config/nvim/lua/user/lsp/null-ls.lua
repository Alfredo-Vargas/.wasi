local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
    formatting.xmllint,
    diagnostics.flake8
	},
})

-- ORIGINAL SOURCE FOR xmllint
-- local h = require("null-ls.helpers")
-- local methods = require("null-ls.methods")
--
-- local FORMATTING = methods.internal.FORMATTING
--
-- return h.make_builtin({
--     name = "xmllint",
--     meta = {
--         url = "http://xmlsoft.org/xmllint.html",
--         description = "Despite the name, xmllint can be used to format XML files as well as lint them, and that's the mode this builtin is using.",
--     },
--     method = FORMATTING,
--     filetypes = { "xml" },
--     generator_opts = {
--         command = "xmllint",
--         args = { "--format", "-" },
--         to_stdin = true,
--     },
--     factory = h.formatter_factory,
-- })
