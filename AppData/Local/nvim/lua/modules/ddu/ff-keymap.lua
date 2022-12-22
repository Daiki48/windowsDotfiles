M = {}

local ddu = {
	do_action = vim.fn["ddu#ui#ff#do_action"];
	start = vim.fn["ddu#start"];
}

M.ddu_ff_setting = function ()
	vim.keymap.set("n", "<CR>", function() return ddu.do_action("itemAction") end, { buffer = 0 })
	vim.keymap.set("n", "i", function() return ddu.do_action("openFilterWindow") end, { buffer = 0 })
	vim.keymap.set("n", "q", function() return ddu.do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "<ESC>", function() return ddu.do_action("quit") end, { buffer = 0 })
end

M.ddu_ff_filter_setting = function ()
	vim.keymap.set("i", "<CR>", "<ESC><cmd>call ddu#ui#ff#close()<CR>", { buffer = 0 })
	vim.keymap.set("i", "<ESC>", function() return vim.fn["ddu#ui#ff#close"]() and ddu.do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "<ESC>", function() return vim.fn["ddu#ui#ff#close"]() and ddu.do_action("quit") end, { buffer = 0 })
	vim.keymap.set("n", "q", function() return vim.fn["ddu#ui#ff#close"]() and ddu.do_action("quit") end, { buffer = 0 })
end

M.find_files = function ()
	ddu.start({
		sources = {
			{
				name = {"file_rec"},
			},
		},
	})
end


vim.api.nvim_create_autocmd("FileType", {
	pattern = {"ddu-ff"},
	callback = function() return M.ddu_ff_setting() end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"ddu-ff-filter"},
	callback = function() return M.ddu_ff_filter_setting() end,
})

vim.keymap.set("n", "ff", function() return M.find_files() end)
