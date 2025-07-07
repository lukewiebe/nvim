-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

MiniDeps.add("https://github.com/JoosepAlviste/nvim-ts-context-commentstring")

require("ts_context_commentstring").setup({
  enable_autocmd = false,
})

-- from https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#native-commenting-in-neovim-010
-- override get_option to call this plugin, or fallback to the default setting
local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
  return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
    or get_option(filetype, option)
end
