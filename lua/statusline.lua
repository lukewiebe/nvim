-- https://zignar.net/2022/01/21/a-boring-statusline-for-neovim/
-- :h statusline

return function()
	local parts = {
		[[%{FugitiveStatusline()} ]],
		[[%<%f %h%m%r%=]],
		[[%-14.(%l,%c%V%) %P]],
	}
	return table.concat(parts, "")
end
