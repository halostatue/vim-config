scriptencoding utf-8

if !hs#plug#in('ale') | finish | endif

let g:airline#extensions#ale#enabled = hs#plug#in('airline')

let g:ale_open_list = 1
let g:ale_set_quickfix = 1
let g:ale_sign_column_always = 1

let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_rust_cargo_use_check = 1

" function! s:configure_ale_ruby()
"   let l:gemfile = findfile('Gemfile', '.;~')
"   if len(l:gemfile) > 0
"     let b:ale_ruby_rubocop_executable = 'bundle'
"   endif
" endfunction
"
" augroup hsautocmd-ale-ruby
"   autocmd!
"
"   autocmd FileType ruby
"         \ call s:configure_ale_ruby()
" augroup END
