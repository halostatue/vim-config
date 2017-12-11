" Cache Management

if exists('s:vim_cache') == 2
  finish
endif

function! cache#mkpath(...) abort
  let l:path = s:vim_cache

  if a:0 != 0
    let l:path = join([l:path, a:1], '/')
  endif

  if !isdirectory(l:path)
    call mkdir(l:path, 'p')
  endif
  return l:path
endfunction

function! cache#setup() abort
  if exists('$VIM_CACHE')
    let s:vim_cache = expand('$VIM_CACHE')
  elseif exists('$CACHE')
    let s:vim_cache = expand('$CACHE')
  elseif hs#is#windows() || hs#is#cygwin()
    let s:vim_cache = expand('~/vimcache')
  else
    let s:vim_cache = expand('~/.cache')
  endif

  call cache#mkpath()
endfunction

function! cache#root() abort
  return s:vim_cache
endfunction

function! cache#for(path) abort
  return cache#mkpath(a:path)
endfunction

call cache#setup()
