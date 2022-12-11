require('daiki.options.disable') -- default plugin disable
require('daiki.options.base') -- base options

-- local development
-- vim.opt.runtimepath:append("D:/projects/vim-plugin-dev/navigation.nvim")
-- vim.opt.runtimepath:append("D:/projects/vim-plugin-dev/coolnessFlair.vim")

-- require("navigation")
-- require("coolnessFlair")

-- require('plugins.packerconfig') -- plugin manager
require('daiki.packers')
require('daiki.options.keymaps') -- keymaps
