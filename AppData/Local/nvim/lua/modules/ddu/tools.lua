M = {}

local ddu = {
	start = vim.fn["ddu#start"];
}

M.find_files = function ()
	ddu.start({
		name = "ff",
		ui = "ff",
		sources = {
			{
				name = {"file_rec"},
			},
		},
	})
end

M.filer = function ()
	ddu.start({
		name = "filer",
		ui = "filer",
		sources = {
			{
				name = "file",
			},
		},
		sourceOptions = {
			path = vim.fn["getcwd"](),
			columns = { "filename" }
		}
	})
end



return M
