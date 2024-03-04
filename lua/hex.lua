-- hex editor features

vim.api.nvim_create_user_command("ToHex", "%!xxd", {})
vim.api.nvim_create_user_command("FromHex", "%!xxd -r", {})
