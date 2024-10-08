local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

treesitter.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
}
