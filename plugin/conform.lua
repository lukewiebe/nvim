-- https://github.com/stevearc/conform.nvim

require('conform').setup({
  formatters_by_ft = {
    javascript = { { 'prettierd', 'prettier' } }
    -- add more filetypes here
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  }
})

-- this is a way to use conform's formatter
-- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
