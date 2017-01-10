if exists(':SourceConfig') == 2
  finish
endif

function! config#name(path) abort
  return expand('~/.vim/config/' . a:path . '.vim')
endfunction

function! config#source_if(path) abort
  let l:path = fnameescape(expand(a:path))
  if filereadable(l:path)
    execute 'source' l:path
  endif
endfunction

function! config#source_config(path) abort
  call config#source_if(config#name(a:path))
endfunction

function! config#init() abort
  command! -nargs=1 SourceConfig call config#source_config(<q-args>)
  command! -nargs=1 SourceIf call config#source_if(<q-args>)

  SourceConfig init
endfunction
