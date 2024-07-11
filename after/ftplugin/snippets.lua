-- if .snippet extension, set filetype to name of enclosing folder
if vim.fn.expand("%:e") == "snippet" then
	local parent_dir = vim.fn.expand("%:h:t")
	vim.o.filetype = parent_dir
end
