-- counts the number of methods in a java file. Intended to be called from the command line in headless mode.

local parser = vim.treesitter.get_parser()
local trees = parser:parse()
local root = trees[1]:root()

local query = vim.treesitter.query.parse(vim.bo.filetype, [[ (method_declaration) @foo ]])

local count = 0
for _, _ in query:iter_captures(root, vim.api.nvim_get_current_buf(), 0, -1) do
  count = count + 1
end

-- print("number of methods in " .. vim.fn.expand("%:t") .. ": " .. count .. "\n")
if count > 0 then print(count .. "\n") end
