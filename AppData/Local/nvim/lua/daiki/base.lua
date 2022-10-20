vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'

-- vim.wo.number = true
-- vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'

vim.o.shell = 'pwsh'
vim.o.scrolloff = 10
vim.o.cmdheight = 1
vim.o.inccommand = 'split'
vim.o.breakindent = true
vim.o.helplang = 'ja,en'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.updatetime = 300
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.cursorline = true

vim.bo.expandtab = true
vim.bo.autoindent = false
vim.bo.smartindent = false
vim.bo.autoread = true

vim.cmd 'set clipboard+=unnamedplus'
vim.cmd 'set wildoptions=pum'
