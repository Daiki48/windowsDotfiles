local api = vim.api
local fn = vim.fn

-- Compile each update
api.nvim_create_autocmd("BufWritePost", {
	pattern = { "daiki.packers.config" },
	command = "PackerCompile",
})

-- packer setup
api.nvim_create_user_command("PackerInstall", [[packadd packer.nvim | lua require("daiki.packers.config").install()]],
	{ bang = true })
api.nvim_create_user_command("PackerUpdate", [[packadd packer.nvim | lua require("daiki.packers.config").update()]],
	{ bang = true })
api.nvim_create_user_command("PackerSync", [[packadd packer.nvim | lua require("daiki.packers.config").sync()]],
	{ bang = true })
api.nvim_create_user_command("PackerClean", [[packadd packer.nvim | lua require("daiki.packers.config").clean()]],
	{ bang = true })
api.nvim_create_user_command("PackerCompile", [[packadd packer.nvim | lua require("daiki.packers.config").compile()]],
	{ bang = true })

-- test
-- api.nvim_create_user_command("PackerTest", [[packadd packer.nvim | lua require("daiki.packers.config").sync()]],
-- { bang = true })

-- Automaticly install packer
-- if OperatingSystem == "unix" then
--   install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
-- else
--   install_path = fn.stdpath("data") .. "\\site\\pack\\packer\\start\\packer.nvim"
-- end

local install_path = fn.stdpath("data") .. "\\site\\pack\\packer\\start\\packer.nvim"

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
