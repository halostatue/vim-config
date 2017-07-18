" .h files can be C, Ch, C++, ObjC, or ObjC++.
" Set c_syntax_for_h if you want C, ch_syntax_for_h if you want Ch. ObjC is
" detected automatically.
au BufNewFile,BufRead *.h			call s:FTcstyleheader()

func! s:FTcstyleheader()
  if match(getline(1, min([line('$'), 200])), '^@\(interface\|end\|class\)') > -1
    if has_key(g:, 'c_syntax_for_h')
      setf objc
    else
      setf objcpp
    endif
  elseif has_key(g:, 'c_syntax_for_h')
    setf c
  elseif has_key(g:, 'ch_syntax_for_h')
    setf ch
  else
    setf cpp
  endif
endfunc

