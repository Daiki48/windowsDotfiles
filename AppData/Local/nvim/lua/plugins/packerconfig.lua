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
	use { 'EdenEast/nightfox.nvim' }

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

	-- brackets
	use {
		'windwp/nvim-autopairs',
		config = function() require("nvim-autopairs").setup {} end
	}

	-- LSP
	use { 'neovim/nvim-lspconfig' }
	use { 'onsails/lspkind-nvim' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/nvim-cmp' }
	use { 'jose-elias-alvarez/null-ls.nvim' }
	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }
	use { 'glepnir/lspsaga.nvim' }

	-- fzf, filer
	use { 'nvim-telescope/telescope.nvim' }
	use { 'nvim-telescope/telescope-file-browser.nvim' }

end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end
		}
	} })
