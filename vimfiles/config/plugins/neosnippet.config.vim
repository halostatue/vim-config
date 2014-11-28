"---------------------------------------------------------------------------
" neosnippet.vim
"
imap <silent><C-L>    <Plug>(neosnippet_jump_or_expand)
smap <silent><C-L>    <Plug>(neosnippet_jump_or_expand)
xmap <silent><C-L>    <Plug>(neosnippet_start_unite_snippet_target)
imap <silent><C-K>    <Plug>(neosnippet_expand_or_jump)
smap <silent><C-K>    <Plug>(neosnippet_expand_or_jump)
xmap <silent><C-K>    <Plug>(neosnippet_expand_target)
imap <silent><C-G>    <Plug>(neosnippet_expand)
imap <silent><C-S>    <Plug>(neosnippet_start_unite_snippet)
xmap <silent><C-o>    <Plug>(neosnippet_register_oneshot_snippet)

" let g:neosnippet#enable_snipmate_compatibility = 1

" let g:snippets_dir = '~/.vim/snippets/,~/.vim/bundle/snipmate/snippets/'
let g:neosnippet#snippets_directory = '~/.vim/snippets'
let g:neosnippet#enable_preview  =  1
