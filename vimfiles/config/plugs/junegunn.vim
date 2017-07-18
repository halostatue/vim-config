scriptencoding utf-8

" Configurations for various junegunn plugins.

if hs#plug#in('vim-easy-align')
  xmap ea <Plug>(EasyAlign)
  nmap ea <Plug>(EasyAlign)
endif

if hs#plug#in('vim-slash')
  if has('timers')
    noremap <expr> <plug>(slash-after) 'zz'.slash#blink(2, 50)
  endif
endif

if hs#plug#in('vim-github-dashboard')
  if !has_key(g:, 'github_dashboard') | let g:github_dashboard = {} | endif
endif

if hs#plug#in('vim-after-object')
  augroup junegunn-vim-after-object
    autocmd!

    autocmd VimEnter * call after_object#enable([']', '['], '=', ':', '-', '#', ' ')
  augroup END
endif
