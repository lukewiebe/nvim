-- modified from https://github.com/neovim/nvim-lspconfig/blob/master/lsp/zls.lua
return {
  name = "zls",
  cmd = { "zls" },
  root_dir = vim.env.PWD,
  filetypes = { "zig" },
}
