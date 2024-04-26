-- https://github.com/chrishrb/gx.nvim

local loaded, gx = pcall(require, "gx")
if not loaded then return end

gx.setup({
	handlers = {
		search = false,
	},
})

vim.keymap.set({ "n", "v" }, "gx", "<cmd>Browse<cr>", { silent = true })
