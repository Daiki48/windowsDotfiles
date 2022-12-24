local ddu = {
	patch_global = vim.fn["ddu#custom#patch_global"];
	alias = vim.fn["ddu#custom#alias"];
}

ddu.alias("source", "directory_rec", "file_external")

ddu.patch_global({
	ui = "ff",
	uiParams = {
		ff = {
			displaySourceName = "no",
			prompt = ">",
			split = "floating",
			floatingBorder = "rounded",
			previewFloating = true,
			previewFloatingBorder = "rounded",
			filterSplitDirection = "floating",
			filterFloatingPosition = "top",
			startFilter = true,
		},
		filer = {
			split = "floating",
			sort = "filename",
			sortTreesFirst = true,
			toggle = true,
		}
	},
	uiOptions = {
		filer = {
			toggle = true,
		}
	},
	sourceOptions = {
		['_'] = {
			matchers = {"matcher_substring"}
		},
		dein_update = {
			matchers = {"matcher_dein_update"},
		},
	},
	kindOptions = {
		file = {
			defaultAction = "open",
		},
		dein_update = {
			defaultAction = "viewDiff",
		}
	},
	actionOptions = {
		narrow = {
			quit = false,
		},
		echo = {
			quit = false,
		},
		echoDiff = {
			quit = false,
		},
	}
})


