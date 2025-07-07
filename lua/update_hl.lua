-- inspired by https://stackoverflow.com/questions/74677587/how-to-set-comments-to-italic-fonts-in-neovim
return function(group_name, opts)
  local hl_group = vim.api.nvim_get_hl(0, { name = group_name })
  hl_group = vim.tbl_extend("force", hl_group, opts)
  vim.api.nvim_set_hl(0, group_name, hl_group)
end
