local keymap = vim.api.nvim_set_keymap

-- buffer moving
keymap('n', '<C-l>', '<cmd>bnext<cr>', { noremap = true, silent = true })
keymap('n', '<C-h>', '<cmd>bprevious<cr>', { noremap = true, silent = true })
