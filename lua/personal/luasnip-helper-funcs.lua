--local M = {}
--print("fuck")
--local ls = require("luasnip")
--local s = ls.snippet
--local t = ls.text_node
--local i = ls.insert_node
--local f = ls.function_node
--local d = ls.dynamic_node
--local fmta = require("luasnip.extras.fmt").fmta
--
--function M.get_ISO_8601_date()
--  return os.date("%Y-%m-%d")
--end
--
----function M.get_visual(args, parent)
----  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
----    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
----  else
----    return sn(nil, i(1, ''))
----  end
----end
--M.get_visual = function(args, parent)
--    if (#parent.snippet.env.SELECT_RAW > 0) then
--        return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
--    else
--        return sn(nil, i(1, ''))
--    end
--end
--return M
local ls = require("luasnip")

local M = {}

M.get_visual = function(args, parent)
    if (#parent.snippet.env.SELECT_RAW > 0) then
        return ls.snippet_node(nil, {
            ls.insert_node(1, parent.snippet.env.SELECT_RAW)
        })
    else
        return ls.snippet_node(nil, {
            ls.insert_node(1, '')
        })
    end
end

-- Add any other helper functions here

return M
