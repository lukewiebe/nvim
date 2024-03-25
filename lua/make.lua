-- make maps and utilities
-- currently not in use. I want to make sure everything is behaving with Oil before taking it live.

vim.keymap.set("n", "<space>mm", "<cmd>make<cr>", { desc = "[m]ake" })
vim.keymap.set("n", "<space>mc", function()
	vim.cmd("make", "clean")
	if vim.bo.filetype == "oil" then
		require("oil.actions").refresh.callback()
	end
end, { desc = "[m]ake [c]lean" })
