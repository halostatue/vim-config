function! s:add_jobs_dispatch_handler()
  if exists('g:dispatch_handlers') && index(g:dispatch_handlers, 'jobs') == -1
    let l:position = index(g:dispatch_handlers, 'screen') + 1
    let g:dispatch_handlers = insert(g:dispatch_handlers, 'jobs', l:position)
  endif
endfunction

augroup vim-plug-load-vim-dispatch
  autocmd!
  autocmd User vim-dispatch call <SID>add_jobs_dispatch_handler()
augroup END
