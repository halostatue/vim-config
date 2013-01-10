" Vim indent file
" Language:	C++
" Maintainer:	Konstantin Lepa <konstantin.lepa@gmail.com>
" Last Change:	2009 May 16
" Version: 1.0.0

if exists("g:no_google_indentation") && g:no_google_indentation == 1
  finish
endif

if !exists("b:debug_indent")
  let b:debug_indent = 0
endif

let s:cpp_skip      = '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\|^\s*#\)'
let s:cpp_qualifier = '^\s*public:\|^\s*private:\|^\s*protected:'
let s:cpp_open_brace    = '^\s*{'
let s:cpp_constructor   = ')\s*:$\|)\s*:\s*'
let s:cpp_case          = 'case\s*\w\+:\|default:'

if !exists('b:did_after_indent')
  if exists("*GoogleCPPIndent")
    delfunction GoogleCPPIndent
  endif

  function! GoogleCPPIndent()
    if b:debug_indent != 0
      redir! >debug-indent.txt
    endif

    let l:cur_line_num = line('.')
    let l:cur_line = getline(l:cur_line_num)
    let l:prev_line_num = prevnonblank(l:cur_line_num - 1)
    let l:prev_line = getline(l:prev_line_num)

    if b:debug_indent != 0
      echom 'current             : ' . l:cur_line_num . '/' . l:cur_line
      echom 'previous            : ' . l:prev_line_num . '/' . l:prev_line
    endif

    " Skip brace-only, comments, or preproc directives.
    while l:prev_line =~# s:cpp_skip
      let l:prev_line_num = prevnonblank(l:prev_line_num - 1)
      let l:prev_line = getline(l:prev_line_num)
      if b:debug_indent != 0
        echom 'previous            : ' . l:prev_line_num . '/' . l:prev_line
      endif
      if l:prev_line_num = 1
        break
      endif
    endwhile

    let l:retv = cindent(l:cur_line_num)
    if b:debug_indent != 0
      echom '(cindent) retv      : ' . l:retv
    endif

    if l:cur_line =~# s:cpp_qualifier
      " Qualifiers are pulled back to class level.
      let l:retv = l:retv - 2
      if b:debug_indent != 0
        echom '(qualifier) retv    : ' . l:retv
      endif
    elseif l:cur_line =~# s:cpp_open_brace
      " If the currentline is an opening brace, check to see if the previous
      " line looks like a constructor qualifier list.
      if l:prev_line =~# s:cpp_constructor
        let l:retv = l:retv - 2
        if b:debug_indent != 0
          echom '(constructor) retv  : ' . l:retv
        endif
        "   elseif l:prev_line =~# s:cpp_case
        "     let l:retv = l:retv - 2
        "     if b:debug_indent != 0
        "       echom '(case) retv         : ' . l:retv
        "     endif
      else
        echom '(brace) retv        : ' . l:retv
      endif
    elseif l:cur_line =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\|^\s*#\)'
      if b:debug_indent != 0
        "     '12345678901234567890: '
        echom '(special) retv      : ' . l:retv
      endif
    elseif l:prev_line =~# '^\s*template.*\|^\s*class.*'
      let l:retv = cindent(l:prev_line_num)
      if b:debug_indent != 0
        echom 'retv:      ' . l:retv . ' (previous-line template|class)'
      endif
    elseif l:prev_line =~# '^\s*namespace.*' && l:prev_line !~# '^\s*namespace.*=.*;'
      let l:retv = 0
      if b:debug_indent != 0
        echom 'retv:      ' . l:retv . ' (previous-line namespace)'
      endif
    endif

    if l:retv < 0
      let l:retv = 0
      if b:debug_indent != 0
        echom 'retv:      ' . l:retv . ' (no subzero)'
      endif
    endif

    if b:debug_indent != 0
      redir END
    endif
    return l:retv
  endfunction

  let b:did_after_indent = 1
endif

if exists('g:cpp_indent_width')
  let &l:shiftwidth = g:cpp_indent_width
  let &l:tabstop = g:cpp_indent_width
  let &l:softtabstop = g:cpp_indent_width
else
  setlocal shiftwidth=2
  setlocal tabstop=2
  setlocal softtabstop=2
endif

if exists('g:cpp_line_width')
  let &l:textwidth=g:cpp_line_width
else
  setlocal textwidth=118
endif

setlocal expandtab
setlocal nowrap
setlocal cindent

if exists('g:cpp_indentexpr')
  let &l:indentexpr = g:cpp_indentexpr
elseif exists('g:cpp_no_google_indent')
  setlocal indentexpr=
else
  setlocal indentexpr=GoogleCPPIndent()
endif

let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

" redir > | silent messages | redir END
