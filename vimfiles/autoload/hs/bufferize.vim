scriptencoding utf-8

" Lifted from Andrew Radev's work. Convert a command's output to a buffer. Made
" to work with hidden buffers.
function! hs#bufferize#do(command) abort
  if a:command ==# ''
    return
  endif

  redir => l:output
  silent execute a:command
  redir END

  let l:bfz_buffer = hs#bufferize#bufnr(a:command)
  let l:current_buffer = bufnr('%')
  let l:at_last_line = 0
  let l:name = 'Bufferize:\ ' . escape(a:command, ' ')

  if l:bfz_buffer != 0
    let l:saved_view = winsaveview()
    if line('.') == line('$')
      let l:at_last_line = 1
    endif

    if l:bfz_buffer < 0
      execute 'sbuffer ' . abs(l:bfz_buffer)
    endif

    exec bufwinnr(abs(l:bfz_buffer)) . 'wincmd w'
    normal! gg0dG
  else
    new
    setlocal nowrap nonumber buftype=nofile
    let l:saved_view = winsaveview()
  endif

  execute 'file ' . l:name
  call setline(1, split(l:output, "\n"))
  set nomodified
  call winrestview(l:saved_view)
  if l:at_last_line
    normal! G
  endif

  if exists(':RunCommand')
    execute 'RunCommand silent Bufferize ' . a:command
  endif

  if l:bfz_buffer < 0
    execute bufwinnr(abs(l:bfz_buffer)) . 'wincmd c'
  endif

  execute bufwinnr(l:current_buffer) . 'wincmd w'
endfunction

" Return the buffer number if the buffer has a window visible on this tabpage.
" Return a negative buffer number if the buffer is not visible.
function! hs#bufferize#bufnr(command) abort
  let l:name = 'Bufferize: ' . a:command
  for l:bufnr in tabpagebuflist()
    if bufname(l:bufnr) =~? l:name
      return l:bufnr
      break
    endif
  endfor

  let l:bufnr = bufnr(l:name)

  if l:bufnr == -1
    return 0
  endif

  return -1 * l:bufnr
endfunction
