-- https://github.com/stevearc/conform.nvim

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    markdown = { "prettier" },
    html = { "prettier" },
    java = { "google-java-format" },
    lua = { "stylua" },
    c = { "clang-format" },
    fish = { "fish_indent" },
    zig = { "zigfmt" },
    cpp = { "clang-format" },
    python = { "ruff_format", "ruff_organize_imports" },
    r = { "air" },
  },
})

vim.keymap.set("n", "<space>f", function()
  local run_async = {
    "zig",
    "java",
  }
  if vim.tbl_contains(run_async, vim.bo.filetype) then
    conform.format({ async = true })
  else
    conform.format()
  end
  -- if vim.bo.filetype == "r" then
  --   require("format-r").replace_equals_with_arrow(0)
  -- end
  vim.notify("formatted")
end, {})
