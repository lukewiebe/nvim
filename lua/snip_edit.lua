-- fast edit access for snippets

-- opens the snippet directory in a split
vim.api.nvim_create_user_command("SnipEdit", "split | edit ~/.config/nvim/snippets", {})
