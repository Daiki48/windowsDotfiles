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
			}
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
	-- use { 'Daiki48/coolnessFlair.vim', config = 'vim.cmd[[colorscheme coolnessFlair]]' }
	use({
		'ellisonleao/gruvbox.nvim',
		config = function()
			require("color_scheme.gruvbox")
		end
	})

	-- statusline
	use {
		'nvim-lualine/lualine.nvim',
		-- event = { 'BufRead' },
		reuqires = { 'nvim-tree/nvim-web-devicons', opt = true, module = { 'nvim-web-devicons' } },
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
	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }

	use({
		'hrsh7th/nvim-cmp',
		module = { "cmp" },
		requires = {
			{ "hrsh7th/cmp-buffer", event = { "InsertEnter" } },
			{ "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter" } },
			{ "hrsh7th/cmp-path", event = { "InsertEnter" } },
			{ "hrsh7th/vim-vsnip", event = { "InsertEnter" } },
			{ "hrsh7th/cmp-vsnip", event = { "InsertEnter" } },
			{ "L3MON4D3/LuaSnip", event = { "InsertEnter" } },
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
		-- module = { 'telescope' },
		-- event = { "BufEnter" },
		requires = {
			{ 'nvim-telescope/telescope-file-browser.nvim' },
			{ 'nvim-tree/nvim-web-devicons', opt = true, module = { 'nvim-web-devicons' } },
		},
		-- wants = { 'telescope-file-browser.nvim' },
		-- setup = function()
		-- 	-- local function builtin(name)
		-- 	-- 	return function(opt)
		-- 	-- 		return function()
		-- 	-- 			return require("telescope.builtin")[name](opt or {})
		-- 	-- 		end
		-- 	-- 	end
		-- 	-- end
		-- 	local function extensions(name, prop)
		-- 		return function(opt)
		-- 			return function()
		-- 				local telescope = require "telescope"
		-- 				telescope.load_extension(name)
		-- 				return telescope.extensions[name][prop](opt or {})
		-- 			end
		-- 		end
		-- 	end
		--
		-- 	vim.keymap.set("n", ";fj", extensions("file_browser", "file_browser"))
		-- end,
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

end

local plugins = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end
})

return plugins

-- config = {
-- 	display = {
-- 		open_fn = function()
-- 			return require('packer.util').float({ border = 'single' })
-- 		end
-- 	},
-- 	profile = {
-- 		enable = true,
-- 		threshold = 1,
-- 	}
-- }
