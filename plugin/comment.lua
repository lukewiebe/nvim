-- https://github.com/numToStr/Comment.nvim

local loaded, comment = pcall(require, "Comment")
if not loaded then return end

comment.setup({
	extra = { eol = "gcA" },
	-- integrate with ts_context_commentstring as per
	-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#commentnvim
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
-- adds intelligent comments in complicated nested languages

local loaded, ts_context_commentstring = pcall(require, "ts_context_commentstring")
if not loaded then return end

ts_context_commentstring.setup({
	enable_autocmd = false,
})
