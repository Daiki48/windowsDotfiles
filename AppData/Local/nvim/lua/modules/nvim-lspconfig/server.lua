local tools = require("modules.nvim-lspconfig.tools")

require('lspconfig')['sumneko_lua'].setup{
	on_attach = tools.on_attach,
	flags = tools.lsp_flags,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';')
			},
			diagnostics = {
				globals = {'vim'}
			},
		}
	}
}

require('lspconfig')['tsserver'].setup{
    on_attach = tools.on_attach,
    flags = tools.lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = tools.on_attach,
    flags = tools.lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
require('lspconfig')['clangd'].setup{
	on_attach = tools.on_attach,
	flags = tools.lsp_flags,
}

-- require('lspconfig')['csharp_ls'].setup{
-- 	on_attach = tools.on_attach,
-- 	flags = tools.lsp_flags,
--   cmd = { 'csharp-ls' },
-- 	filetypes = { "cs" },
-- }

local omnisharp_path = vim.fn.glob(vim.fn.stdpath('data') .. '/mason/') .. 'packages/omnisharp/OmniSharp.dll'
require('lspconfig')['omnisharp'].setup{
	on_attach = tools.on_attach,
	flags = tools.lsp_flags,
	cmd = { "dotnet", omnisharp_path },
	enable_editorconfig_support = true,
	enable_ms_build_load_projects_on_demand = false,
	enable_roslyn_analyzers = false,
	filetypes = { "cs", "vb", "cshtml" },
	organize_imports_on_format = false,
	enable_import_completion = false,
	sdk_include_prereleases = true,
	analyze_open_documents_only = false,
	init_options = {},
}
