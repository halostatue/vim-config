scriptencoding utf-8

" Improves upon the Andrew Radev rip from haskellmode.vim
function! lib#url#encode(url) abort
  let l:parts = split(a:url, '/', 1)
  let l:index = 0

  if l:parts[0] =~# '^https\='
    let l:index = 3
  endif

  let l:parts[l:index : ] = map(l:parts[l:index :],
          \ { _i, part ->
          \     substitute(part, '\([^-[:alnum:].=?&]\)',
          \       { m -> '%' . printf('%02X', char2nr(m[1])) }, 'g')
          \ })

  return join(l:parts, '/')
endfunction

" Ripped from unimpaired.vim via Andrew Radev
function! lib#url#decode(url) abort
  let l:url = substitute(a:url, '%0[Aa]\n$', '%0A', '')
  let l:url = substitute(l:url, '%0[Aa]', '\n', 'g')
  let l:url = substitute(l:url, '+', ' ', 'g')
  return substitute(l:url, '%\(\x\x\)', { m -> nr2char('0x' . m[1]) }, 'g')
endfunction
