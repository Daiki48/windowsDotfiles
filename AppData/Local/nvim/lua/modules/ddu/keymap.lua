M = {}

local tools = require("modules.ddu.tools")

local ddu_ff = {
	do_action = vim.fn["ddu#ui#ff#do_action"];
}

local ddu_filer = {
	do_action = vim.fn["ddu#ui#filer#do_action"];
	is_tree = vim.fn["ddu#ui#filer#is_tree"];
}

-- ###################################### --
--           ddu-ui-ff keymap             --
-- ###################################### --
M.ddu_ff_setting = function ()
	vim.keymap.set("n", "<CR>", function() return ddu_ff.do_action("itemAction") end, { buffer = 0 })
	vim.keymap.set("n", "i", function() return ddu_ff.do_action("openFilterWindow") end, { buffer = 0 })
	vim.keymap.set("n", "p", function() return ddu_ff.do_action("preview") end, { buffer = 0 })
	vim.keymap.set("n", "q", function() return ddu_ff.do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "<ESC>", function() return ddu_ff.do_action("quit") end, { buffer = 0 })
end

M.ddu_ff_filter_setting = function ()
	vim.keymap.set("i", "<CR>", "<ESC><cmd>call ddu#ui#ff#close()<CR>", { buffer = 0 })
	vim.keymap.set("i", "<ESC>", function() return vim.fn["ddu#ui#ff#close"]() and ddu_ff.do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "<ESC>", function() return vim.fn["ddu#ui#ff#close"]() and ddu_ff.do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "q", function() return vim.fn["ddu#ui#ff#close"]() and ddu_ff.do_action("quit") end, { buffer = 0 })
end

-- ###################################### --
--          ddu-ui-filer keymap           --
-- ###################################### --
M.ddu_filer_setting = function ()
	-- vim.keymap.set("n", "<CR>", function() return ddu_filer.do_action("itemAction") end, { buffer = 0 })
	vim.keymap.set("n", "<Space>", function() return ddu_filer.do_action("toggleSelectItem") end, { buffer = 0 })
	vim.keymap.set("n", "o", function() return ddu_filer.do_action("expandItem", { mode = "toggle" }) end, { buffer = 0 })
	vim.keymap.set("n", "<ESC>", function() return ddu_filer.do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "q", function() return ddu_filer.do_action("quit") end, { buffer = 0 })

	vim.keymap.set("n", "N", function() return ddu_filer.do_action("itemAction", { name = "newFile" }) end, { buffer = 0 })
	vim.keymap.set("n", "K", function() return ddu_filer.do_action("itemAction", { name = "newDirectory" }) end, { buffer = 0 })
	vim.keymap.set("n", "R", function() return ddu_filer.do_action("itemAction", { name = "rename" }) end, { buffer = 0 })
	vim.keymap.set("n", "D", function() return ddu_filer.do_action("itemAction", { name = "delete" }) end, { buffer = 0 })

	vim.keymap.set("n", "<CR>", function ()
		if ddu_filer.is_tree() then
			ddu_filer.do_action("itemAction", { name = "narrow" })
		else
			ddu_filer.do_action("itemAction", { name = "open" })
		end
	end, { buffer = 0 })
	vim.keymap.set("n", "l", function ()
		if ddu_filer.is_tree() then
			ddu_filer.do_action("itemAction", { name = "narrow" })
		else
			ddu_filer.do_action("itemAction", { name = "open" })
		end
	end, { buffer = 0 })
	vim.keymap.set("n", "<C-h>", function() return ddu_filer.do_action("collapseItem") end, { buffer = 0 })
	vim.keymap.set("n", "<C-l>", function() return ddu_filer.do_action("expandItem", { mode = "toggle" }) end, { buffer = 0 })

end

M.ddu_filer_filter_setting = function ()
	vim.keymap.set("i", "<CR>", "<ESC><cmd>call ddu#ui#filer#close()<CR>", { buffer = 0 })
	vim.keymap.set("i", "<ESC>", function() return vim.fn["ddu#ui#filer#close"]() and ddu_filer.do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "<ESC>", function() return vim.fn["ddu#ui#filer#close"]() and ddu_filer.do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "q", function() return vim.fn["ddu#ui#filer#close"]() and ddu_filer.do_action("quit") end, { buffer = 0 })
end


-- ###################################### --
--      ddu-ui-ff FileType autocmd        --
-- ###################################### --
vim.api.nvim_create_autocmd("FileType", {
	pattern = {"ddu-ff"},
	callback = function() return M.ddu_ff_setting() end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"ddu-ff-filter"},
	callback = function() return M.ddu_ff_filter_setting() end,
})

-- ###################################### --
--     ddu-ui-filer FileType autocmd      --
-- ###################################### --
vim.api.nvim_create_autocmd("FileType", {
	pattern = {"ddu-filer"},
	callback = function() return M.ddu_filer_setting() end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"ddu-filer-filter"},
	callback = function() return M.ddu_filer_filter_setting() end,
})

-- ###################################### --
--            starting keymap             --
-- ###################################### --
vim.keymap.set("n", "ff", function() return tools.find_files() end)
vim.keymap.set("n", ";;", function() return tools.filer() end)
vim.keymap.set("n", "DU", "<cmd>Ddu dein_update<CR>")
-- vim.keymap.set("n", "DU", function() return tools.dein_update() end, { buffer = 0 })
-- vim.keymap.set("n", "DU", "<cmd>Ddu dein_update -ui-param-winHeight=20 -ui-param-winRow=2 -ui-param-winWidth=60 -ui-param-winCol=10<CR>", { buffer = 0 })
