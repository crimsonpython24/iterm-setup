local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  print("Telescope not installed!")
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  print("Telescope actions not installed!")
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, 
        ["<C-j>"] = actions.move_selection_next, 
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      }
    }
  }
})

telescope.load_extension("fzf")
