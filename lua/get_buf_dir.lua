-- get the current buffer's working directory
-- accounts for buffer names from plugins I use

local get_buf_dir = function()
  local dir = vim.fn.expand("%:h")
  -- strip oil:// from the front
  dir = string.gsub(dir, "^oil://(.*)", "%1")
  -- if fugitive buffer return the root git repo, not the .git folder
  if string.find(dir, "^fugitive://") then dir = string.gsub(dir, "^fugitive://(.*)/.git", "%1") end
  return dir
end

return get_buf_dir
