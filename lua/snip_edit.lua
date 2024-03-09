-- fast edit access for snippets

vim.api.nvim_create_user_command("SnipEdit", "split | edit ~/.config/nvim/snippets", {})
