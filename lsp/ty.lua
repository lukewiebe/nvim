--@type vim.lsp.Config
return {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_dir = vim.fn.getcwd(),
}
