-- https://github.com/saghen/blink.cmp

require("blink.cmp").setup({
  enabled = function() return vim.g.autocomplete end,
  keymap = {
    preset = "default",
    ["<c-k>"] = {},
    ["<c-l>"] = { "show_signature", "hide_signature", "fallback" },
  },

  signature = {
    enabled = true,
  },

  cmdline = {
    enabled = false,
  }
})

vim.keymap.set("n", "<leader>cc", function()
  if vim.g.autocomplete then
    vim.g.autocomplete = false
    vim.notify("autocomplete disabled")
  else
    vim.g.autocomplete = true
    vim.notify("autocomplete enabled")
  end
end, {})

vim.g.autocomplete = false
