-- functions helpful for dealing with usenet archives

local save_post = function(target_file, do_print_file)
	local relative_filepath = "./" .. vim.fs.relpath(vim.env.PWD, vim.fn.expand("%"))
	vim.cmd("silent !echo " .. relative_filepath .. " >> " .. target_file)
	if print_file then vim.cmd("!cat " .. target_file) end
end

vim.keymap.set("n", "<space>s", function() save_post("../interesting.txt", true) end, {})

-- save_post("./foo.txt", true)
