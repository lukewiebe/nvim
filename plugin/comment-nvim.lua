-- https://github.com/numToStr/Comment.nvim

require("Comment").setup({
	-- integrate with ts_context_commentstring as per
	-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#commentnvim
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
-- adds intelligent comments in complicated nested languages
require("ts_context_commentstring").setup({
	enable_autocmd = false,
})
