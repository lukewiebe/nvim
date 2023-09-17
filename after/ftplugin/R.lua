require('lspconfig').r_language_server.setup({
  -- untested config
  root_dir = function() return vim.fn.getcwd() end,
})
