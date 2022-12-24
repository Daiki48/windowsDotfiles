M = {}

local tools = require("modules.ddu.tools")

local ddu = {
	ff_do_action = vim.fn["ddu#ui#ff#do_action"];
	filer_do_action = vim.fn["ddu#ui#filer#do_action"];
}

-- ###################################### --
--           ddu-ui-ff keymap             --
-- ###################################### --
M.ddu_ff_setting = function ()
	vim.keymap.set("n", "<CR>", function() return ddu.ff_do_action("itemAction") end, { buffer = 0 })
	vim.keymap.set("n", "i", function() return ddu.ff_do_action("openFilterWindow") end, { buffer = 0 })
	vim.keymap.set("n", "q", function() return ddu.ff_do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "<ESC>", function() return ddu.ff_do_action("quit") end, { buffer = 0 })
end

M.ddu_ff_filter_setting = function ()
	vim.keymap.set("i", "<CR>", "<ESC><cmd>call ddu#ui#ff#close()<CR>", { buffer = 0 })
	vim.keymap.set("i", "<ESC>", function() return vim.fn["ddu#ui#ff#close"]() and ddu.ff_do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "<ESC>", function() return vim.fn["ddu#ui#ff#close"]() and ddu.ff_do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "q", function() return vim.fn["ddu#ui#ff#close"]() and ddu.ff_do_action("quit") end, { buffer = 0 })
end

-- ###################################### --
--          ddu-ui-filer keymap           --
-- ###################################### --
M.ddu_filer_setting = function ()
	vim.keymap.set("n", "<CR>", function() return ddu.filer_do_action("itemAction") end, { buffer = 0 })
	vim.keymap.set("n", "<Space>", function() return ddu.filer_do_action("toggleSelectItem") end, { buffer = 0 })
	vim.keymap.set("n", "o", function() return ddu.filer_do_action("expandItem", { mode = "toggle" }) end, { buffer = 0 })
	vim.keymap.set("n", "q", function() return ddu.filer_do_action("quit") end, { buffer = 0 })

	vim.keymap.set("n", "N", function() return ddu.filer_do_action("itemAction", { name = "newFile" }) end, { buffer = 0 })
	vim.keymap.set("n", "K", function() return ddu.filer_do_action("itemAction", { name = "newDirectory" }) end, { buffer = 0 })
	vim.keymap.set("n", "R", function() return ddu.filer_do_action("itemAction", { name = "rename" }) end, { buffer = 0 })
	vim.keymap.set("n", "D", function() return ddu.filer_do_action("itemAction", { name = "delete" }) end, { buffer = 0 })
end



vim.api.nvim_create_autocmd("FileType", {
	pattern = {"ddu-ff"},
	callback = function() return M.ddu_ff_setting() end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"ddu-ff-filter"},
	callback = function() return M.ddu_ff_filter_setting() end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"ddu-filer"},
	callback = function() return M.ddu_filer_setting() end,
})


vim.keymap.set("n", "ff", function() return tools.find_files() end)
vim.keymap.set("n", ";f", function() return tools.filer() end)
