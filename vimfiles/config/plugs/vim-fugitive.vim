scriptencoding utf-8

if hs#plug#in('vim-fugitive')
  nnoremap <Leader>gd :Gdiff<Return>
  nnoremap <Leader>gs :Gstatus<Return>
  nnoremap <Leader>gw :Gwrite<Return>
  nnoremap <Leader>ga :Gadd<Return>
  nnoremap <Leader>gb :Gblame<Return>
  nnoremap <Leader>gco :Gcheckout<Return>
  nnoremap <Leader>gci :Gcommit<Return>
  nnoremap <Leader>gm :Gmove<Return>
  nnoremap <Leader>gr :Gremove<Return>

  augroup hsautocmd-fugitive
    autocmd!
    autocmd BufNewFile,BufRead .git/index setlocal nolist
  augroup END
endif
