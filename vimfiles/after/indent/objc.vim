"   Vim indent file
"   Language:       Objective-C
"   Maintainer:     Kazunobu Kuriyama <kazunobu.kuriyama@nifty.com>
"   Last Change:    2004 May 16
"
" Only load this indent file when no other was loaded.
if exists("b:did_after_indent")
    finish
endif

if exists("g:no_google_indentation") && g:no_google_indentation == 1
  finish
endif

let b:did_after_indent = 1

" Set the function to do the work.
setlocal indentexpr=GoogleObjCIndent()

" To make a colon (:) suggest an indentation other than a goto/swich label,
setlocal indentkeys-=:
setlocal indentkeys+=<:>

" Only define the function once.
if exists("*GoogleObjCIndent")
  delfunction GoogleObjCIndent
endif

function! s:GetWidth(line, regexp)
  let end = matchend(a:line, a:regexp)
  let width = 0
  let i = 0
  while i < end
    if a:line[i] != "\t"
      let width = width + 1
    else
      let width = width + &ts - (width % &ts)
    endif
    let i = i + 1
  endwhile
  return width
endfunction

function! s:LeadingWhiteSpace(line)
  let end = strlen(a:line)
  let width = 0
  let i = 0
  while i < end
    let char = a:line[i]
    if char != " " && char != "\t"
      break
    endif
    if char != "\t"
      let width = width + 1
    else
      let width = width + &ts - (width % &ts)
    endif
    let i = i + 1
  endwhile
  return width
endfunction

let s:objc_definitions    = '\(^\s*@interface\|^\s*@protocol\|^\s*@implementation\|^\s*@end\)'
let s:objc_methods        = '\(^\s*-\s*\|^\s*+\s*\)'
let s:objc_modifiers      = '\(^\s*@public\|^\s*@private\|^\s*@required\|^\s*@optional\)'

function! GoogleObjCIndent()
  let l:cline_num = v:lnum
  let l:pline_num = prevnonblank(l:cline_num - 1)
  let l:pline = getline(l:pline_num)
  let l:cline = getline(l:cline_num)
  let l:retv = cindent(l:cline_num)

  if l:cline =~# s:objc_definitions
    " If the current or previous line is an @-keyword, don't indent the current line.
    let l:retv = 0
  elseif l:cline =~# s:objc_methods
    " If the current line is a method marker, don't indent the current line.
    let l:retv = 0
  elseif l:cline =~# s:objc_modifiers
    " If the current line is a modifier (@required, @private, etc.)
    let l:retv = 1
  elseif l:pline =~# s:objc_definitions
    " If the previous line is an @-keyword, don't indent the current line.
    let l:retv = 0
  else
    " If the current line has a colon in it, and the previous line didn't
    " terminate an expression or open or close a block, let's line up the
    " colons.
    if l:cline =~# ':' && l:pline =~# ':' && l:pline !~# ';\|{\|}'
      let l:pcolon = s:GetWidth(l:pline, ":")
      let l:delta = s:GetWidth(l:cline, ":") - s:LeadingWhiteSpace(l:cline)
      let l:retv = l:pcolon - l:delta
    endif

    if l:pline =~# s:objc_modifiers
      let l:retv = l:retv - 1
    endif
  endif

  return l:retv
endfunction

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab
setlocal textwidth=118
setlocal nowrap

setlocal cindent

let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"
