-- https://github.com/nvim-mini/mini.pairs

require("mini.pairs").setup({
  -- when typing triple backticks, don't close the third pair
  mappings = {
    ["`"] = {
      action = "closeopen",
      pair = "``",
      neigh_pattern = "[^\\`].",
      register = { cr = false },
    },
  },
})

-- add spaces between brackets
MiniPairs.map("i", " ", {
  action = "open",
  pair = "  ",
  neigh_pattern = "[({[][]})]",
  register = { bs = true, cr = false },
})

-- add >< to CR mapping so that html tags are autoindented
-- first register the map, then unregister the open key but leave the pair registered
MiniPairs.map("i", ">", { action = "open", pair = "><", register = { bs = false } })
MiniPairs.unmap("i", ">", "")

-- <c-u>, <c-w>, and <c-h> delete pairs (but only if they are right on the pair)
local map_bs = function(lhs, rhs) vim.keymap.set("i", lhs, rhs, { expr = true, replace_keycodes = false }) end
map_bs("<C-h>", "v:lua.MiniPairs.bs()")
map_bs("<C-w>", 'v:lua.MiniPairs.bs("\23")')
map_bs("<C-u>", 'v:lua.MiniPairs.bs("\21")')
