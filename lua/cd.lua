-- :Cd to change working dir to dir of current buffer

vim.api.nvim_create_user_command("Cd", "cd %:h", {})
