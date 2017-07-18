scriptencoding utf-8

if hs#plug#in('vim-smartchr')
  " - smart comma
  inoremap <expr> , smartchr#one_of(', ', ',')

  inoremap <expr> =
        \ search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')
        \ ? '<bs>= ' : search('\(*\<bar>!\)\%#', 'bcn')
        \ ? '= ' : smartchr#loop(' = ', '=', ' == ', ' => ')

  augroup hsautocmd-smartchr
    " Substitute .. into -> .
    autocmd FileType c,cpp
          \ inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')
    autocmd FileType perl,php
          \ inoremap <buffer> <expr> . smartchr#loop(' . ', '->', '.')
    autocmd FileType perl,php,rust
          \| inoremap <buffer> <expr> - smartchr#loop('-', ' -',  ' -> ')
    autocmd FileType vim
          \ inoremap <buffer> <expr> . smartchr#loop('.', ' . ', '..', '...')
    autocmd FileType lisp,scheme,clojure
          \ inoremap <buffer> = =

    autocmd FileType ruby,elixir
          \  inoremap <buffer> <expr> ~ smartchr#loop('~', ' ~= ', ' !~ ')

    autocmd FileType haskell,int-ghci
          \  inoremap <buffer> <expr> + smartchr#loop('+', ' ++ ')
          \| inoremap <buffer> <expr> - smartchr#loop('-', ' -> ', ' <- ')
          \| inoremap <buffer> <expr> $ smartchr#loop(' $ ', '$')
          \| inoremap <buffer> <expr> \ smartchr#loop('\ ', '\')
          \| inoremap <buffer> <expr> : smartchr#loop(':', ' :: ', ' : ')
          \| inoremap <buffer> <expr> . smartchr#loop('.', ' . ', '..')

    autocmd FileType scala
          \ inoremap <buffer> <expr> - smartchr#loop('-', ' -> ', ' <- ') |
          \ inoremap <buffer> <expr> = smartchr#loop(' = ', '=', ' => ') |
          \ inoremap <buffer> <expr> : smartchr#loop(': ', ':', ' :: ') |
          \ inoremap <buffer> <expr> . smartchr#loop('.', ' => ')

    autocmd FileType eruby
          \ inoremap <buffer> <expr> > smartchr#loop('>', '%>') |
          \ inoremap <buffer> <expr> < smartchr#loop('<', '<%', '<%=')
  augroup END
endif
