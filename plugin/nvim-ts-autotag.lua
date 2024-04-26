-- https://github.com/windwp/nvim-ts-autotag

local loaded, nvim_ts_autotag = pcall(require, "nvim-ts-autotag")
if not loaded then return end

nvim_ts_autotag.setup()
