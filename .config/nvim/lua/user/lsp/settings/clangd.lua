-- Configuration reference: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
return {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cu" },
  single_file_support = { true },
}
