-- Arty: a background-process R console for persisting state between script runs

-- working: write a buffer to Arty
-- not working: get Arty to generate a chart

-- to fix:
-- httpgd won't display charts when running inside Arty

-- to add:
-- keybindings
-- functions that can be called in any context
-- export functions as a module

-- to run:
-- source this file
-- go to an R file (there's one in after/ftplugin/test.R)
-- try out :ArtyStart, :ArtyWrite, and :ArtyRun

local cmd = { "R", "--slave", "--no-save" }
-- local cmd = { "cat" }

-- used by vim.system to print process info on exit
local on_exit = function(obj)
  print("### Process exited ###")
  print("code: " .. obj.code)
  print("signal: " .. obj.signal)
  print("stdout: " .. obj.stdout)
  print("stderr: " .. obj.stderr)
end

-- prints process stdout and stderr to vim's console
local print_output = function(err, data)
  if err then print(err) end
  if data then print(data) end
end

-- vim.system options
local options = {
  text = true,
  stdin = true,
  stdout = print_output,
  stderr = print_output,
}

-- starts R console process with httpgd graphics server
vim.api.nvim_create_user_command("ArtyStart", function()
  ARTY_SYSTEM_OBJ = vim.system(cmd, options, on_exit)

  ARTY_SYSTEM_OBJ:write("print('foo bar')\n") -- DEBUG should print to messages
  -- ARTY_SYSTEM_OBJ:write("flush.console()\n")
  ARTY_SYSTEM_OBJ:write("library('httpgd')\n")
  ARTY_SYSTEM_OBJ:write("hgd()\n")
  ARTY_SYSTEM_OBJ:write("hgd_browse()\n")
end, {})

vim.api.nvim_create_user_command("ArtyStop", function()
  -- kill Arty's process
  ARTY_SYSTEM_OBJ:write(nil)
end, {})

vim.api.nvim_create_user_command("ArtyRun", function(opts)
  -- write R code to Arty
  ARTY_SYSTEM_OBJ:write(opts.args .. "\n")
end, { nargs = "*" })

vim.api.nvim_create_user_command("ArtyWrite", function(opts)
  -- write R code to Arty from the current buffer
  local buf = vim.api.nvim_get_current_buf()
  local buffer_contents = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  for _, line in ipairs(buffer_contents) do
    ARTY_SYSTEM_OBJ:write(line .. "\n")
    -- print(line)
  end
end, {})
