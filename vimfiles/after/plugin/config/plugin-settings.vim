" CtrlP configuration
if exists(':CtrlP')
  nnoremap <D-O> :<C-U>CtrlP<CR>
  xnoremap <D-O> :<C-U>CtrlP<CR>
endif

if exists(':CtrlSpace') && mapcheck('<C-P>', 'n') ==# ''
  nnoremap <silent> <C-P> :<C-U>CtrlSpace O<CR>
endif

if has_key(g:plugs, 'vim-airline')
  if !exists('g:airline_symbols') | let g:airline_symbols = {} | endif

  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_symbols.readonly = '∅'
  let g:airline_theme = 'papercolor'
endif

if exists('#lightline')
  let g:lightline = {
        \   'colorscheme': 'PaperColor',
        \   'component': {
        \     'readonly': '%{&readonly?"🔒":""}'
        \   },
        \   'separator': { 'left': '', 'right': '' },
        \   'subseparator': { 'left': '|', 'right': '|' }
        \ }
endif