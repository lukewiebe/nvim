-- modified from https://github.com/neovim/nvim-lspconfig/blob/master/lsp/clangd.lua

---@type vim.lsp.Config
return {
  name = "clangd",
  cmd = { "clangd" },
  root_dir = vim.fn.getcwd(),
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}
