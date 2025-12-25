-- modified from https://github.com/neovim/nvim-lspconfig/blob/master/lsp/rust_analyzer.lua

return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = vim.fn.getcwd(),
}
