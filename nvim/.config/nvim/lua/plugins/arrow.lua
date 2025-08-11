-- [[ Add Plugin ]]
vim.pack.add({
  { src = "https://github.com/otavioschwanck/arrow.nvim.git"},
})

-- [[ Plugin Setup ]]
require("arrow").setup({
  show_icons = true,
  leader_key = '<leader>;', -- Recommended to be a single key
  buffer_leader_key = 'm', -- Per Buffer Mappings
  hide_handbook = true,
  hide_buffer_handbook = false,
  global_bookmarks = false,
  window = {border = "rounded"},
  mappings = {
    edit = "e",
    delete_mode = "d",
    clear_all_items = "C",
    toggle = "s", -- used as save if separate_save_and_remove is true
    open_vertical = "v",
    open_horizontal = "-",
    quit = "q",
    remove = "x", -- only used if separate_save_and_remove is true
    next_item = "]",
    prev_item = "["
  },
})
