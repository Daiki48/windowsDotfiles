local ddu = {
	patch_global = vim.fn['ddu#custom#patch_global'];
}

ddu.patch_global({
	ui = 'ff',
	sources = { name = 'file_rec', params = {} },
	sourceOptions = {
		_ = {
			matchers = 'matcher_substring',
		},
	},
	kindOptions = {
		file = {
			defaultAction = 'open',
		},
	},
})
