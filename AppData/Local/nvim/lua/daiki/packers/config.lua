local fn = vim.fn

local top_path = fn.stdpath "config" -- ~\AppData\Local\nvim
local compiled_filename = "packer_compiled.lua"
local compile_dir = top_path .. "\\plugin\\"
local compiled_file_path = compile_dir .. compiled_filename

if fn.empty(fn.glob(compile_dir)) < 1 then
	fn.delete(compiled_file_path, 'rf')
	print("Delete compile file!")
end

local packer = nil
local function init()
	if packer == nil then
		packer = require("packer")
		packer.init({
			disable_commands = true,
			display = {
				open_fn = function()
					return require('packer.util').float({ border = 'single' })
				end
			},
			profile = {
				enable = true,
				threshold = 1,
			},
		})
	end
	local use = packer.use
	packer.reset()

	-- plugin manager
	use { 'wbthomason/packer.nvim', opt = true }

	-- common utilities
	use { 'nvim-lua/popup.nvim' }
	use { 'nvim-lua/plenary.nvim' }
	use { 'MunifTanjim/nui.nvim' }

	-- colorscheme
	-- use({
	-- 	'EdenEast/nightfox.nvim',
	-- 	config = function ()
	-- 		require("color_scheme.nightfox")
	-- 	end
	-- })
	use { 'Daiki48/coolnessFlair.vim', config = 'vim.cmd[[colorscheme coolnessFlair]]' }
	-- use({
	-- 	'ellisonleao/gruvbox.nvim',
	-- 	config = function()
	-- 		require("color_scheme.gruvbox")
	-- 	end
	-- })

	-- statusline
	use {
		'nvim-lualine/lualine.nvim',
		-- event = { 'BufRead' },
		reuqires = {
			'nvim-tree/nvim-web-devicons',
			opt = true,
			module = { 'nvim-web-devicons' }
		},
		-- タブやステータスラインを消すとき
		-- setup = function()
		-- 	vim.opt.laststatus = 0
		-- 	vim.opt.showtabline = 0
		-- end
	}

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}

	-- brackets
	use {
		'windwp/nvim-autopairs',
		config = function() require("nvim-autopairs").setup {} end
	}

	-- html tag
	use {
		'windwp/nvim-ts-autotag',
		ft = { "html", "typescriptreact" },
		config = function() require("nvim-ts-autotag").setup {} end
	}

	-- comment out
	use { 'terrortylor/nvim-comment' }

	-- LSP
	use({
		'neovim/nvim-lspconfig',
		event = { "VimEnter" },
		config = function()
			require("modules.lspconfig")
		end
	})
	-- use { 'jose-elias-alvarez/null-ls.nvim' }
	use({
		'williamboman/mason.nvim',
		event = { "VimEnter" },
		requires = {
			{ 'williamboman/mason-lspconfig.nvim' }
		},
		config = function()
			require("modules.mason")
		end
	})

	-- ******** nvim-cmp opt config ********
	-- use({
	-- 	'hrsh7th/nvim-cmp',
	-- 	module = { "cmp" },
	-- 	requires = {
	-- 		{ "hrsh7th/cmp-buffer", event = { "InsertEnter" } },
	-- 		{ "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter" } },
	-- 		{ "hrsh7th/cmp-path", event = { "InsertEnter" } },
	-- 		{ "hrsh7th/vim-vsnip", event = { "InsertEnter" } },
	-- 		{ "hrsh7th/cmp-vsnip", event = { "InsertEnter" } },
	-- 		{ "L3MON4D3/LuaSnip", event = { "InsertEnter" } },
	-- 	},
	-- 	config = function()
	-- 		require("modules.cmp")
	-- 	end,
	-- })

	-- ******** nvim-cmp start config ********
	use({
		'hrsh7th/nvim-cmp',
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/vim-vsnip" },
			{ "hrsh7th/cmp-vsnip" },
			{ "L3MON4D3/LuaSnip" },
		},
		wants = {
			"cmp-buffer",
			"cmp-nvim-lsp",
			"cmp-path",
			"vim-vsnip",
			"cmp-vsnip",
			"LuaSnip"
		},
		config = function()
			require("modules.cmp")
		end,
	})

	-- use { 'onsails/lspkind.nvim' }
	use({
		'glepnir/lspsaga.nvim',
		event = { "BufRead" },
		config = function()
			require("modules.lspsaga")
		end
	})
	use({
		'j-hui/fidget.nvim',
		event = { "BufRead" },
		config = function()
			require("modules.fidget")
		end
	})
	use({
		'ray-x/lsp_signature.nvim',
		event = { "BufRead" },
		requires = {
			{ 'neovim/nvim-lspconfig' }
		},
		wants = { 'nvim-lspconfig' },
		config = function()
			require("modules.lsp_signature")
		end,
	})

	-- skkeleton
	-- use { 'vim-skk/skkeleton', requires = { 'vim-denops/denops.vim' } }
	-- use { 'rinx/cmp-skkeleton', after = { 'nvim-cmp', 'skkeleton' } }

	-- use { 'Daiki48/hello-daiki', opt = true, requires = { 'vim-denops/denops.vim' } }

	-- fzf, filer
	use({
		'nvim-telescope/telescope.nvim',
		keys = {
			{ "n", "ff" }
		},
		requires = {
			{ 'nvim-telescope/telescope-file-browser.nvim' },
			{ 'nvim-tree/nvim-web-devicons', opt = true, module = { 'nvim-web-devicons' } },
		},
		config = function()
			require("modules.telescope")
		end
	})

	-- color
	use { 'norcalli/nvim-colorizer.lua' }

	-- git
	use({
		'lewis6991/gitsigns.nvim',
		event = { "BufRead" },
		config = function()
			require("modules.gitsigns")
		end
	})

	-- rust
	use { 'simrat39/rust-tools.nvim', opt = true, ft = { "rust" } }
	use { 'mfussenegger/nvim-dap' }

	-- development
	use { 'D:\\projects\\vim-plugin-dev\\greeting.nvim' }

end

local plugins = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end
})

return plugins
