-- https://github.com/folke/todo-comments.nvim

local loaded, todo_comments = pcall(require, "todo-comments")
if not loaded then return end

todo_comments.setup({
	signs = false,
})

-- TODO:
