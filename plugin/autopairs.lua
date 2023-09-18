require("nvim-autopairs").setup{}

-- from https://github.com/windwp/nvim-autopairs
local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')

-- from https://github.com/windwp/nvim-autopairs/wiki/Rules-API
-- the :with_move() addition allows 'type over' behaviour
-- cond.done() always returns true, but we can specify conditions
npairs.add_rule(Rule("<", ">", "html"):with_move(cond.done()))
