vim.keymap.set("i", "<Tab>", "<cmd>call pum#map#insert_relative(+1)<CR>")
vim.keymap.set("i", "<S-Tab>", "<cmd>call pum#map#insert_relative(-1)<CR>")

vim.call("ddc#enable")
-- vim.call("popup_preview#enable")
