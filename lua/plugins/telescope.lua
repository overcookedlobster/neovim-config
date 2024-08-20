local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup{
  defaults = {
    file_ignore_patterns = {"node_modules"},
    layout_strategy = 'vertical',
    layout_config = { height = 0.95, width = 0.95 },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      layout_config = {
        width = 0.9, -- 90% of screen width
      },
    }
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
  },
}

pcall(telescope.load_extension, 'file_browser')
pcall(telescope.load_extension, 'heading')
