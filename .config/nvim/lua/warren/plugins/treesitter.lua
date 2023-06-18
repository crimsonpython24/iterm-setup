local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	print("Treesitter not installed!")
	return
end

treesitter.setup({
	hightlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"dockerfile",
		"fish",
		"git_config",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"html",
		"java",
		"javascript",
		"json",
		"latex",
		"markdown",
		"python",
		"typescript",
	},
	auto_install = true,
})
