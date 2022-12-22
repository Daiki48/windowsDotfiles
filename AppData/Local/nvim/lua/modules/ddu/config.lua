local ddu = {
	patch_global = vim.fn["ddu#custom#patch_global"];
	alias = vim.fn["ddu#custom#alias"];
}

ddu.alias("source", "directory_rec", "file_external")

ddu.patch_global({
	ui = "ff",
	uiParams = {
		ff = {
			-- displaySourceName = "short",
			prompt = ">",
			split = "floating",
			floatingBorder = "rounded",
			previewFloating = true,
			previewFloatingBorder = "rounded",
			filterSplitDirection = 'floating',
			startFilter = true,
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


