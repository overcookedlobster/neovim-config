local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  print("Comment.nvim not found")
  return
end
  comment.setup({  
      padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
        line = 'gll',
        block = 'gcc',
    },
    opleader = {
        line = 'gl',
        block = 'gc',
    },
    extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
    },
    mappings = {
        basic = true,
        extra = true,
        extended = false,
    },
    pre_hook = nil,
    post_hook = nil,
})
