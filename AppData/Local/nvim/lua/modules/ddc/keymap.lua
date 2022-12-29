vim.keymap.set("i", "<Tab>", "<cmd>call pum#map#insert_relative(+1)<CR>")
vim.keymap.set("i", "<S-Tab>", "<cmd>call pum#map#insert_relative(-1)<CR>")

-- if vim.fn["dein#is_sourced"]("denops-popup-preview") then
-- 	vim.call("popup_preview#enable")
-- end

-- if vim.fn["denops#server#start"]() then
-- 	vim.call("popup_preview#enable")
-- else
-- 	vim.call("denops#server#start")
-- 	vim.call("popup_preview#enable")
-- end

