local ddu = {
	patch_global = vim.fn["ddu#custom#patch_global"];
	alias = vim.fn["ddu#custom#alias"];
}

-- local lines = vim.o.lines
-- local win_height = math.floor(lines / 4)
-- local win_row = math.floor(lines - win_height)
-- local win_col = math.floor(vim.o.columns)
-- local win_between = 3
-- local win_width = math.floor((vim.o.columns - win_col * 2 - win_between) / 2)

ddu.alias("source", "directory_rec", "file_external")

ddu.patch_global({
	ui = "ff",
	uiParams = {
		ff = {
			displaySourceName = "no",
			prompt = "> ",
			split = "floating",
			floatingBorder = "rounded",
			previewFloating = true,
			previewFloatingBorder = "rounded",
			filterSplitDirection = "floating",
			filterFloatingPosition = "top",
			startFilter = true,
			highlights = {
				floating = "DduUiFfFloating",
				prompt = "DduUiFfPrompt",
				selected = "DduUiFfSelected",
			},
			-- winRow = win_row,
			-- winCol = win_col,
			-- winHeight = win_height - 1,

		},
		filer = {
			split = "floating",
			sort = "filename",
			sortTreesFirst = true,
			toggle = true,
			highlights = {
				floating = "DduUiFilerFloating",
				selected = "DduUiFilerSelected"
			},
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
		file = {
			columns = {"icon_filename"},
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
	},
	filterParams = {
		matcher_substring = {
			highlightMatched = "DduUiFfFilterMatch",
		}
	},
})


