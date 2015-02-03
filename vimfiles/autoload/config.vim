if exists(':SourceConfig') == 2
  finish
endif

function! config#name(path)
  return expand('~/.vim/config/' . a:path . '.vim')
endfunction

function! config#source_if(path)
  let l:path = fnameescape(expand(a:path))
  if filereadable(l:path)
    execute 'source' l:path
  endif
endfunction

function! config#source_config(path)
  call config#source_if(config#name(a:path))
endfunction

function! config#init()
  let s:isWindows = has('win16') || has('win32') || has('win64')
  let s:isCygwin = has('win32unix')
  let s:isSudo = $SUDO_USER != '' && $USER !=# $SUDO_USER
      \ && $HOME !=# expand('~' . $USER)
      \ && $HOME ==# expand('~' . $SUDO_USER)

  command! -nargs=1 SourceConfig call config#source_config(<q-args>)
  command! -nargs=1 SourceIf call config#source_if(<q-args>)

  SourceConfig init
endfunction
