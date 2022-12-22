M = {}

local ddu = {
	do_action = vim.fn["ddu#ui#ff#do_action"];
	start = vim.fn["ddu#start"];
}

M.ddu_ff_setting = function ()
	vim.keymap.set("n", "<CR>", function() return ddu.do_action("itemAction") end)
	vim.keymap.set("n", "q", function() return ddu.do_action("quit") end)
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

vim.keymap.set("n", "ff", function() return M.find_files() end)
