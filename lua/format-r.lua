-- a function that replaces = with <- in buffers, for R files

local M = {}

M.replace_equals_with_arrow = function(bufnr)
  local text = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  for row, line in ipairs(text) do
    local _, col = line:find("^%s*[^%s]+ (=)")
    if col ~= nil then
      row = row - 1
      col = col - 1
      vim.api.nvim_buf_set_text(bufnr, row, col, row, col + 1, { "<-" })
    end
  end

end

return M
