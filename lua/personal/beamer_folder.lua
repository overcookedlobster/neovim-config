local M = {} local function beamer_fold(lnum)
    local line = vim.fn.getline(lnum)
    if line:match("\\begin{frame}") then
        return ">1"
    elseif line:match("\\end{frame}") then
        return "<1"
    else
        return "="
    end
end

local function setup_folding()
    print("Setting up Beamer folding")
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.require'personal.beamer_folder'.fold(v:lnum)"
    vim.wo.foldlevel = 0
    vim.cmd("normal! zx")
    print("Beamer folding setup complete")
end

function M.setup()
    vim.api.nvim_create_user_command("BeamerFold", function()
        setup_folding()
        print("Beamer folding activated via command")
    end, {})

    vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
        pattern = "*.tex",
        callback = function()
            print("TeX file detected, setting up folding")
            setup_folding()
        end
    })
end

M.fold = beamer_fold

return M
