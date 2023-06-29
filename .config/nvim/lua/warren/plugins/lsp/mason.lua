local mason_status, mason = pcall(require, "mason")
if not mason_status then
	print("Mason not installed!")
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	print("Mason LSPConfig not installed!")
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	print("Mason null-ls not installed!")
	return
end

mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		"azure_pipelines_ls",
		"bashls",
		"clangd",
		"cssls",
		"cssmodules_ls",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		"html",
		"jsonls",
		"jdtls",
		"lua_ls",
		"quick_lint_js",
		"tsserver",
		"ltex",
		"texlab",
		"marksman",
		"jedi_language_server",
		"pyre",
		"pylsp",
		"tsserver",
		"lemminx",
	},
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
})
