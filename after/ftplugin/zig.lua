vim.keymap.set("n", "<leader>r", ":w<cr>:!zig run %<cr>", { silent = true, buffer = true })

MiniPairs.map_buf(
  0,
  "i",
  "|",
  { action = "closeopen", pair = "||", neigh_pattern = "^[^\\]", register = { cr = false } }
)
