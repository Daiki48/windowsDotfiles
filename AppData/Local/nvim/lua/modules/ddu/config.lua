local ddu = {
	patch_global = vim.fn["ddu#custom#patch_global"];
}

ddu.patch_global({
	ui = "ff",
	uiParams = {
		ff = {
			displaySourceName = "short",
			prompt = ">",
			split = "floating",
			floatingBorder = "rounded",
		}
	},
	-- sources = {
	-- 	{
	-- 		name = {"file_rec"},
	-- 	},
	-- },
	sourceOptions = {
		['_'] = {
			matchers = {"matcher_substring"}
		},
	},
	kindOptions = {
		file = {
			defaultAction = "open",
		}
	},
})


