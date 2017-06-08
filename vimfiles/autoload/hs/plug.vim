scriptencoding utf-8

function! hs#plug#in(name) abort
  return has_key(g:, 'plugs') && has_key(g:plugs, a:name)
endfunction
