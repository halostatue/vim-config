" Trim to the specified width.

function! str#widthpart(str, width) abort
  if a:width <= 0
    return ''
  endif
  let l:ret = a:str
  let l:width = s:wcswidth(a:str)
  while l:width > a:width
    let l:char = matchstr(l:ret, '.$')
    let l:ret = l:ret[: -1 - len(l:char)]
    let l:width -= s:wcswidth(l:char)
  endwhile

  return l:ret
endfunction

" Determine the correct width of a string.
if v:version >= 703
  " Vim 7.0.3 or better is already correct.
  function! s:wcswidth(str) abort
    return strwidth(a:str)
  endfunction
else
  " Earlier versions of vim do not handle wide characters correctly.
  function! s:wcswidth(str) abort
    if a:str =~# '^[\x00-\x7f]*$'
      return strlen(a:str)
    end

    let l:mx_first = '^\(.\)'
    let l:str = a:str
    let l:width = 0
    while 1
      let l:ucs = char2nr(substitute(l:str, l:mx_first, '\1', ''))
      if l:ucs == 0
        break
      endif
      let l:width += s:_wcwidth(l:ucs)
      let l:str = substitute(l:str, l:mx_first, '', '')
    endwhile
    return l:width
  endfunction

  " UTF-8 only character width calculation.
  function! s:_wcwidth(ucs) abort
    let l:ucs = a:ucs
    if (
          \     l:ucs >= 0x1100
          \  && (   l:ucs <= 0x115f
          \      || l:ucs == 0x2329
          \      || l:ucs == 0x232a
          \      || (l:ucs >= 0x2e80 && l:ucs <= 0xa4cf && l:ucs != 0x303f)
          \      || (l:ucs >= 0xac00 && l:ucs <= 0xd7a3)
          \      || (l:ucs >= 0xf900 && l:ucs <= 0xfaff)
          \      || (l:ucs >= 0xfe30 && l:ucs <= 0xfe6f)
          \      || (l:ucs >= 0xff00 && l:ucs <= 0xff60)
          \      || (l:ucs >= 0xffe0 && l:ucs <= 0xffe6)
          \      || (l:ucs >= 0x20000 && l:ucs <= 0x2fffd)
          \      || (l:ucs >= 0x30000 && l:ucs <= 0x3fffd)
          \  ))
      return 2
    endif
    return 1
  endfunction
endif
