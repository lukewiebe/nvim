-- modified from https://github.com/neovim/nvim-lspconfig/blob/master/lsp/zls.lua

---@type vim.lsp.Config
return {
  name = "zls",
  cmd = { "zls" },
  root_dir = vim.env.PWD,
  filetypes = { "zig" },
}
