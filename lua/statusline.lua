-- https://zignar.net/2022/01/21/a-boring-statusline-for-neovim/
-- :h statusline

local M = {}

M.statusline = function()
  local parts = {
    [[%{luaeval("require('statusline').git()")} ]],
    [[%{luaeval("require('statusline').fileformat()")}]],
    [[%<%f %m%r%=]], -- truncatable filename, [+] if modified, [RO] if read-only
    [[%-14{luaeval("require('statusline').ruler()")} %P]],
    -- [[%-14.(%l,%c%V%) %P]], -- default ruler
  }
  return table.concat(parts, "")
end

M.fileformat = function()
  if vim.o.fileformat ~= "unix" then
    return string.format("!%s! ", vim.o.fileformat)
  end
  return ""
end

-- my replacement for the builtin ruler
M.ruler = function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  col = col + 1 -- shift from 0-index to 1-index
  local result = string.format("%s,%s", row, col)

  local v_start = vim.fn.getcharpos("v")
  local v_row = v_start[2]
  local v_col = v_start[3]
  local sel_width = math.abs(col - v_col) + 1
  local sel_height = math.abs(row - v_row) + 1

  local mode = vim.api.nvim_get_mode()["mode"]

  -- intelligently display visual selection metrics
  if mode == "V" then
    if sel_height == 1 then
      result = "1 line"
    else
      result = string.format("%s lines", sel_height)
    end
  elseif mode == "" then
    result = string.format("%s×%s", sel_width, sel_height)
  elseif row == v_row and col ~= v_col then
    local min = math.min(col, v_col)
    local max = math.max(col, v_col)
    result = string.format("%s,%s-%s (%sc)", row, min, max, sel_width)
  end

  -- result = string.format("row: %s, col: %s, v_row: %s, v_col: %s", row, col, v_row, v_col) -- debug
  return result
end

-- see fugitive source (/plugin/fugitive.vim) for API documentation
M.git = function()
  local head = vim.fn.FugitiveHead(7) -- hash truncated to 7 characters
  if head == "" then return "" end
  return string.format("(%s)", head)
end

return M
