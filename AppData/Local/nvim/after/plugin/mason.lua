local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({

})

lspconfig.setup {
	automatic_installation = true
}

-- local on_attach = function(client, bufnr)

local capabilities = require('cmp_nvim_lsp').default_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

require("mason-lspconfig").setup_handlers {
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {
			-- on_attach = on_attach, --keyバインドなどの設定を登録
			capabilities = capabilities, --cmpを連携
		}
	end,
}
