if exists(':SourceConfig') == 2
  finish
endif

function! config#name(path) abort
  let l:path = 'config/' . a:path

  if fnamemodify(l:path, ':e') ==# ''
    let l:path = l:path . '.vim'
  endif

  return l:path
endfunction

function! config#glob(from, pattern) abort
  return split(globpath(a:from, a:pattern), "[\r\n]")
endfunction

function! config#source(from, ...) abort
  let l:found = v:false
  for l:pattern in a:000
    for l:vim in config#glob(a:from, l:pattern)
      execute 'source' fnameescape(l:vim)
      let l:found = v:true
    endfor
  endfor
  return l:found
endfunction

function! config#source_if(path) abort
  return config#source(&runtimepath, a:path)
endfunction

function! config#source_config(path) abort
  call config#source_if(config#name(a:path))
endfunction

function! config#init() abort
  command! -nargs=1 SourceConfig call config#source_config(<q-args>)
  command! -nargs=1 SourceIf call config#source_if(<q-args>)

  SourceConfig init
endfunction
