-- ~/.config/nvim/lua/plugins/luasnip.lua

local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
        virt_text = {{"●", "GruvboxOrange"}}
      }
    }
  }
})

-- Load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Load your custom snippets
require("luasnip.loaders.from_lua").load({paths = vim.fn.stdpath('config') .. "/LuaSnip/"})

-- Keymaps
vim.keymap.set({"i", "s"}, "<C-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, {silent = true})

vim.keymap.set("i", "<C-l>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end)
