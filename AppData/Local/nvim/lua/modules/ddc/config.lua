M = {}

local ddc = {
	patch_global = vim.fn["ddc#custom#patch_global"];
}

ddc.patch_global({
	ui = "pum",
	autoCompleteEvents = { 'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged' },
	sources = {
		"around",
		"nvim-lsp",
		"buffer",
		"cmdline",
		"cmdline-history",
	},
	sourceOptions = {
		['_'] = {
			matchers = {"matcher_head"},
			sorters = {"sorter_rank"},
		},
		['around'] = {
			mark = "Around",
		},
		['nvim-lsp'] = {
			mark = "Lsp",
			forceCompletionPattern = "\\.\\w*|:\\w*|->\\w*",
			minAutoCompleteLength = 1,
		},
		['buffer'] = {
			mark = "Buffer",
		},
		['cmdline'] = {
			mark = "CmdLine",
		},
		['cmdline-history'] = {
			mark = "CL-History",
		},
	},
	sourceParams = {
		['around'] = {
			maxSize = 500,
		},
		['nvim-lsp'] = {
			kindLabels = {
				Text          = ' ',
				Method        = ' ',
				Function      = ' ',
				Constructor   = ' ',
				Field         = 'ﰠ ',
				Variable      = ' ',
				Class         = ' ',
				Interface     = ' ',
				Module        = ' ',
				Property      = ' ',
				Unit          = ' ',
				Value         = ' ',
				Enum          = ' ',
				Keyword       = ' ',
				Snippet       = '﬌ ',
				Color         = ' ',
				File          = ' ',
				Reference     = ' ',
				Folder        = ' ',
				EnumMember    = ' ',
				Constant      = ' ',
				Struct        = ' ',
				Event         = ' ',
				Operator      = 'ﬦ ',
				TypeParameter = ' ',
			},
		},
		['buffer'] = {
			requireSameFiletype = false,
			limitBytes = 5000000,
			fromAltBuf = true,
			forceCollect = true,
		},
	},
})

