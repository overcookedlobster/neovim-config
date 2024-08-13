"nmap dsm <plug>(vimtex-env-delete-math)
"nmap tsm <plug>(vimtex-env-toggle-math)
"
"nmap csm <plug>(vimtex-env-change-math)
"" Use `ai` and `ii` for the item text object
"omap ai <plug>(vimtex-am)
"xmap ai <plug>(vimtex-am)
"omap ii <plug>(vimtex-im)
"xmap ii <plug>(vimtex-im)
"
"" Use `am` and `im` for the inline math text object
"omap am <plug>(vimtex-a$)
"xmap am <plug>(vimtex-a$)
"omap im <plug>(vimtex-i$)
"xmap im <plug>(vimtex-i$)

" A few examples of disabling default VimTeX features.
let g:vimtex_indent_enabled   = 0      " turn off VimTeX indentation
let g:vimtex_imaps_enabled    = 0      " disable insert mode mappings (e.g. if you use UltiSnips)
let g:vimtex_complete_enabled = 0      " turn off completion
let g:vimtex_syntax_enabled   = 1      " disable syntax conceal
""imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'

" Jump forward
imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'

" Jump backward
imap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'
smap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'

" Cycle forward through choice nodes with Control-F
imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'

noremap <leader>wc <Cmd>VimtexCountWords<CR>
" Use `<localleader>c` to trigger continuous compilation...
nmap <localleader>c <Plug>(vimtex-compile)
nmap <localleader>v <plug>(vimtex-view)
" Don't open QuickFix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0 
" Filter out some compilation warning messages from QuickFix display
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]
let g:vimtex_view_method = 'zathura'
" Get Vim's window ID for switching focus from Zathura to Vim using xdotool.
" Only set this variable once for the current Vim instance.
if !exists("g:vim_window_id")
  let g:vim_window_id = system("xdotool getactivewindow")
endif
function! s:TexFocusVim(delay_ms) abort
  " Give window manager time to recognize focus 
  " moved to PDF viewer before focusing Vim.
  let delay = a:delay_ms . "m"
  execute 'sleep ' . delay
  execute "!xdotool windowfocus " . expand(g:vim_window_id)
  redraw!
endfunction
augroup vimtex_event_focus
  au!
  " Post-forward-search refocus with 200ms delay---tweak as needed
  au User VimtexEventView call s:TexFocusVim(200)

  " Only perform post-inverse-search refocus on gVim; delay unnecessary
  if has("gui_running")
    au User VimtexEventViewReverse call s:TexFocusVim(0)
  endif
augroup END
