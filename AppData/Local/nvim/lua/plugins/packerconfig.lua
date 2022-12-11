local fn = vim.fn

-- Automaticly install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path
	})
	print "Installing packer - close and reopen Neovim..."
	PACKER_BOOTSTRAP = true
	vim.cmd [[packadd packer.nvim]]
end

local status, packer = pcall(require, 'packer')
if (not status) then
	print("Packer is not installed")
	return
end

packer.startup({ function(use)
	-- plugin manager
	use { 'wbthomason/packer.nvim', opt = true }

	-- common utilities
	use { 'nvim-lua/popup.nvim' }
	use { 'nvim-lua/plenary.nvim' }
	use { 'MunifTanjim/nui.nvim' }
	use { 'vim-denops/denops.vim' }
	-- use { 'Shougo/pum.vim' }

	-- colorscheme
	-- use { 'EdenEast/nightfox.nvim' }
	use { 'Daiki48/coolnessFlair.vim', config = 'vim.cmd[[colorscheme coolnessFlair]]' }
	-- use { 'ellisonleao/gruvbox.nvim' }

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
	use { 'yioneko/nvim-yati', requires = 'nvim-treesitter/nvim-treesitter' }

	-- brackets
	use {
		'windwp/nvim-autopairs',
		config = function() require("nvim-autopairs").setup {} end
	}

	-- html tag
	use {
		'windwp/nvim-ts-autotag',
		config = function() require("nvim-ts-autotag").setup {} end
	}

	-- comment out
	use { 'terrortylor/nvim-comment' }

	-- LSP
	use { 'neovim/nvim-lspconfig' }
	-- use { 'jose-elias-alvarez/null-ls.nvim' }
	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }

	use {
		'hrsh7th/nvim-cmp',
		module = { "cmp" },
		requires = {
			{ "hrsh7th/cmp-buffer", event = { "InsertEnter" } },
			{ "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter" } },
			{ "hrsh7th/cmp-path", event = { "InsertEnter" } },
			{ "hrsh7th/vim-vsnip", event = { "InsertEnter" } },
			{ "hrsh7th/cmp-vsnip", event = { "InsertEnter" } },
		}
	}

	-- use { 'Shougo/ddc.vim', requires = { 'Shougo/pum.vim' } }
	-- use { 'Shougo/ddc-ui-native', after = { 'ddc.vim' } }
	-- use { 'Shougo/ddc-source-around', after = { 'ddc.vim' } }
	-- use { 'Shougo/ddc-matcher_head', after = { 'ddc.vim' } }
	-- use { 'Shougo/ddc-sorter_rank', after = { 'ddc.vim' } }


	use { 'onsails/lspkind.nvim' }
	use { 'glepnir/lspsaga.nvim' }
	use { 'j-hui/fidget.nvim' }
	use { 'L3MON4D3/LuaSnip' }
	use { 'ray-x/lsp_signature.nvim' }

	-- skkeleton
	-- use { 'vim-skk/skkeleton', requires = { 'vim-denops/denops.vim' } }
	-- use { 'rinx/cmp-skkeleton', after = { 'nvim-cmp', 'skkeleton' } }

	use { 'Daiki48/hello-daiki', opt = true, requires = { 'vim-denops/denops.vim' } }

	-- fzf, filer
	use {
		'nvim-telescope/telescope.nvim',
		module = { 'telescope' },
		requires = {
			{ 'nvim-telescope/telescope-file-browser.nvim', opt = true }
		},
		wants = { 'telescope-file-browser.nvim' }
	}

	-- use { 'nvim-telescope/telescope.nvim' }
	-- use { 'nvim-telescope/telescope-file-browser.nvim' }

	-- color
	use { 'norcalli/nvim-colorizer.lua' }

	-- git
	use { 'lewis6991/gitsigns.nvim' }

	-- notification
	-- use {
	--   'folke/noice.nvim',
	--   event = "VimEnter",
	--   requires = {
	--     'MunifTanjim/nui.nvim',
	--     'rcarriga/nvim-notify',
	--     'j-hui/fidget.nvim'
	--   }
	-- }

	-- rust
	use { 'simrat39/rust-tools.nvim', ft = { "rust" } }
	use { 'mfussenegger/nvim-dap' }

end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end
		}
	}
})
