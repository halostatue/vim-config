" Scratch
command! ScratchToggle call <SID>ScratchToggle()
function! s:ScratchToggle()
  if bufexists("*Scratch*")
    exec "normal! :ScratchClose"
  else
    exec "normal! :ScratchOpen"
  endif
endfunction
nnoremap <silent> <leader><leader><S> :ScratchToggle<CR>
