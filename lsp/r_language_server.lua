-- modified from https://github.com/neovim/nvim-lspconfig/blob/master/lsp/r_language_server.lua

return {
  cmd = { "R", "--no-echo", "-e", "languageserver::run()" },
  filetypes = { "r", "rmd", "quarto" },
  root_dir = vim.fn.getcwd(),
}
