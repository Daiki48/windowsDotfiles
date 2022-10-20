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

packer.startup(function(use)
  -- plugin manager
  use { 'wbthomason/packer.nvim', opt = true }

  -- colorscheme
  use { "EdenEast/nightfox.nvim" }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    reuqires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
end)
