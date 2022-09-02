-- Configuration reference: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local cmp_capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
-- local clangd_capabilities = cmp_capabilities
-- clangd_capabilities.offsetEncoding = { "utf-16"}

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.offsetEncoding = { "utf-16"}

return {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  single_file_support = { false },
}
