scriptencoding utf-8

" CtrlP configuration
if exists(':CtrlP')
  nnoremap <D-O> :<C-U>CtrlP<CR>
  xnoremap <D-O> :<C-U>CtrlP<CR>
endif

if exists(':CtrlSpace') && mapcheck('<C-P>', 'n') ==# ''
  nnoremap <silent> <C-P> :<C-U>CtrlSpace O<CR>
endif

if hs#plug#in('vim-airline')
  if !has_key(g:, 'airline_symbols') | let g:airline_symbols = {} | endif

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
  if !has_key(g:, 'lightline') | let g:lightline = {} | endif
  let g:lightline.colorscheme = 'PaperColor'
  let g:lightline.component = { 'readonly': '%{&readonly?"🔒":""}' }
  let g:lightline.separator =  { 'left': '', 'right': '' }
  let g:lightline.subseparator = { 'left': '|', 'right': '|' }
endif
