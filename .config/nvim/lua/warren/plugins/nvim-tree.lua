local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	print("Nvim-tree not installed!")
	return
end

-- recommended settings from nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
