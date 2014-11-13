let g:syntastic_disabled_filetypes = ['html']
let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'
let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': [ 'c', 'cpp' ] }

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
