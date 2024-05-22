vim.o.termguicolors = true

local update_hl = require("highlights").update_hl

-- remove background
update_hl("Normal", { bg = "none" })
update_hl("EndOfBuffer", { bg = "none" })
update_hl("LineNr", { bg = "none" })
update_hl("CursorLine", { bg = "none" })
update_hl("CursorLineNr", { bg = "none" })

-- italics on comments is not working
-- update_hl("Comment", { italic = true })
