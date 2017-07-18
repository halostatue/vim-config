scriptencoding utf-8

if hs#plug#in('vim-dirvish')
  nmap <silent> [Space]- <Plug>(dirvish_up)
  nmap <silent> [Space]h- <Plug>(dirvish_split_up)
  nmap <silent> [Space]v- <Plug>(dirvish_vsplit_up)
elseif hs#plug#in('vim-vinegar')
  nmap <silent> [Space]- <Plug>VinegarUp
  nmap <silent> [Space]t- <Plug>VinegarTabUp
  nmap <silent> [Space]h- <Plug>VinegarSplitUp
  nmap <silent> [Space]v- <Plug>VinegarVerticalSplitUp
endif

if hs#plug#in('nerdtree')
  let g:NERDTreeShowBookmarks = 1
  let g:NERDTreeChDirMode = 2
  let g:NERDTreeQuitOnOpen = 1
  let g:NERDTreeMouseMode = 2
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeIgnore = [ '\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg',
        \ '\.svn', '\.bzr' ]
  let g:NERDTreeIndicatorMapCustom = {
        \ 'Modified'  : emoji#for('eight_spoked_asterisk'),
        \ 'Staged'    : emoji#for('white_check_mark'),
        \ 'Untracked' : emoji#for('question'),
        \ 'Renamed'   : emoji#for('arrow_right'),
        \ 'Unmerged'  : emoji#for('interrobang'),
        \ 'Deleted'   : emoji#for('x'),
        \ 'Dirty'     : '✗',
        \ 'Clean'     : '✔︎',
        \ 'Ignored'   : emoji#for('no_entry_sign'),
        \ 'Unknown'   : emoji#for('grey_question')
        \ }

  nnoremap <silent> <F4> :NERDTreeToggle<Return>
endif
