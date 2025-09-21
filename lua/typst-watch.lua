-- global table for system objects
typst_system_objs = {}

-- used by vim.system to print process info on exit
local on_exit = function(obj)
  print("### Process exited ###")
  print("code: " .. obj.code)
  print("signal: " .. obj.signal)
  print("stdout: " .. obj.stdout)
  print("stderr: " .. obj.stderr)
end

-- TODO: improve buffering
local print_output = function(err, data)
  if err then print(err) end
  if data then print(data) end
end

-- vim.system options
local options = {
  text = true,
  stdin = true,
  -- stdout = print_output,
  stderr = print_output,
}

local M = {}

M.watch = function()
  local bufnr = vim.fn.bufnr()
  if typst_system_objs[bufnr] ~= nil then
    print "File is already being watched"
    return
  end

  typst_system_objs[bufnr] = vim.system({ "typst", "watch", vim.fn.expand("%") }, options, on_exit)
end

M.stop_all = function()
  for _, obj in ipairs(typst_system_objs) do
    obj:write(nil)
  end
end

M.stop = function()
  local bufnr = vim.fn.bufnr()
  local obj = typst_system_objs[bufnr]
  if typst_system_objs[bufnr] ~= nil then
    obj:kill()
  end
end

return M
