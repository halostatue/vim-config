" Cache Management

if exists('s:vim_cache') == 2
  finish
endif

function! s:mkpath(path)
  if !isdirectory(a:path)
    call mkdir(a:path, 'p')
  endif
  return a:path
endfunction

function! cache#setup()
  if exists('$VIM_CACHE')
    let s:vim_cache = expand('$VIM_CACHE')
  elseif exists('$CACHE')
    let s:vim_cache = expand('$CACHE')
  elseif is#windows() || is#cygwin()
    let s:vim_cache = expand('~/vimcache')
  else
    let s:vim_cache = expand('~/.cache')
  endif

  call s:mkpath(s:vim_cache)
endfunction

function! cache#root()
  return s:vim_cache
endfunction

function! cache#for(path)
  return s:mkpath(expand(join([s:vim_cache, a:path], '/')))
endfunction

call cache#setup()
