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

	-- colorscheme
	-- use { 'EdenEast/nightfox.nvim' }
	-- use { 'Daiki48/coolnessFlair.vim', config = 'vim.cmd[[colorscheme coolnessFlair]]' }
	use { 'ellisonleao/gruvbox.nvim' }

	-- statusline
	use {
		'nvim-lualine/lualine.nvim',
		reuqires = { 'nvim-tree/nvim-web-devicons', opt = true }
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
	use { 'jose-elias-alvarez/null-ls.nvim' }
	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/vim-vsnip' }
	use { 'hrsh7th/cmp-vsnip' }
	use { 'onsails/lspkind-nvim' }
	use { 'glepnir/lspsaga.nvim' }
	use { 'j-hui/fidget.nvim' }
	use { 'L3MON4D3/LuaSnip' }

	-- skkeleton
	use { 'vim-skk/skkeleton', requires = { 'vim-denops/denops.vim' } }
	use { 'rinx/cmp-skkeleton', after = { 'nvim-cmp', 'skkeleton' } }

	-- fzf, filer
	use { 'nvim-telescope/telescope.nvim' }
	use { 'nvim-telescope/telescope-file-browser.nvim' }

	-- color
	use { 'norcalli/nvim-colorizer.lua' }

	-- git
	use { 'lewis6991/gitsigns.nvim' }
	-- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	-- use { 'sindrets/diffview.nvim' }

	-- notification
	use { 'rcarriga/nvim-notify' }

end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end
		}
	} })
