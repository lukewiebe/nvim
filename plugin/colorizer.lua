-- https://github.com/NvChad/nvim-colorizer.lua

require("colorizer").setup({
  filetypes = {
    "*",
  },
  user_default_options = {
    tailwind = true,
    rgb_fn = true,
    hsl_fn = true,
    names = false,
  },
})
