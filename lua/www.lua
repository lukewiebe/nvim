-- open WorldWideWeb.app on the current directory

vim.api.nvim_create_user_command("WWW", "!open -a WorldWideWeb .", {})
