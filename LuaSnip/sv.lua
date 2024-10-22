local ls = require("luasnip")

-- Define the shorthand functions
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- Helper function to load snippets from a file
local function load_snippets(file)
    local status, snippets = pcall(function()
        -- Create a new environment with the shorthand functions and other necessities
        local env = {
            s = s, sn = sn, t = t, i = i, f = f, d = d, c = c,
            fmt = fmt, fmta = fmta, rep = rep,
            ls = ls,  -- Also pass the entire luasnip module
            vim = vim,  -- Pass vim module for vim.fn calls
            require = require,  -- Include the require function
        }
        -- Set the environment's metatable to fall back to the global environment
        setmetatable(env, {__index = _G})
        
    local fn = vim.fn
    local config_path = fn.stdpath('config')
    local chunk, err = loadfile(config_path .. "/LuaSnip/sv/" .. file .. ".lua", "t", env)
        if chunk then
            return chunk()
        else
            error(err)
        end
    end)
    if status then
        return snippets
    else
        print("Error loading " .. file .. ".lua: " .. snippets)
        return {}
    end
end

-- Load all snippet files
local non_syn = load_snippets("non_synthesizable")
local syn = load_snippets("synthesizable")
local uvm = load_snippets("uvm")

-- Combine all snippets
local snippets = {}
for _, snip_table in ipairs({syn, non_syn, uvm}) do
    for _, snip in ipairs(snip_table) do
        table.insert(snippets, snip)
    end
end

-- Setup keymaps
local function setup_keymaps()
    local opts = {noremap = true, silent = true}
    vim.keymap.set("i", "<C-k>", function() ls.expand_or_jump() end, opts)
    vim.keymap.set("s", "<C-k>", function() ls.expand_or_jump() end, opts)
    vim.keymap.set("i", "<C-j>", function() ls.jump(-1) end, opts)
    vim.keymap.set("s", "<C-j>", function() ls.jump(-1) end, opts)
    vim.keymap.set("i", "<C-l>", function() ls.change_choice(1) end, opts)
    vim.keymap.set("s", "<C-l>", function() ls.change_choice(1) end, opts)
end

-- Additional synthesizable SystemVerilog snippets
--local function create_sv_snippets()
--    ls.add_snippets("systemverilog", {
--        -- Module
--        s("module", {
--            t("module "), i(1, "module_name"),
--            t({ " (", "\t" }), i(2),
--            t({ "", ");", "" }),
--            i(0),
--            t({ "", "endmodule" })
--        }),
--        -- Always FF block
--        s("aff", {
--            t("always_ff @(posedge "), i(1, "clk"), t(") begin"),
--            t({ "", "\t" }), i(0),
--            t({ "", "end" })
--        }),
--        -- Always Comb block
--        s("acomb", {
--            t("always_comb begin"),
--            t({ "", "\t" }), i(0),
--            t({ "", "end" })
--        }),
--        -- Case statement
--        s("case", {
--            t("case ("), i(1, "expression"), t(")"),
--            t({ "", "\t" }), i(2, "value"), t(": "), i(3),
--            t({ "", "\tdefault: "}), i(0),
--            t({ "", "endcase" })
--        }),
--        -- Generate for loop
--        s("genfor", {
--            t("generate"), t({ "", "for (int " }), i(1, "i"), t(" = 0; "), 
--            i(2, "i"), t(" < "), i(3, "N"), t("; "), i(4, "i"), t("++) begin : "), i(5, "gen_label"),
--            t({ "", "\t" }), i(0),
--            t({ "", "end", "endgenerate" })
--        }),
--    })
--end

-- Setup function
local function setup_sv_snippets()
    setup_keymaps()
    --create_sv_snippets()
    -- Add the loaded snippets to LuaSnip
    for _, snip in ipairs(snippets) do
        ls.add_snippets("systemverilog", {snip})
    end
end

-- Autocmd to setup snippets for SystemVerilog files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "systemverilog",
    callback = setup_sv_snippets
})

-- Return the snippets for use in other files if needed
return snippets
