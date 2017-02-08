" Various helpful library functions, pulled mostly from
" https://github.com/AndrewRadev/Vimfiles
scriptencoding utf-8

" Capitalize first letter of argument:
" foo -> Foo
function! lib#capitalize(word) abort
  return substitute(a:word, '^\w', '\u\0', 'g')
endfunction

function! lib#camel_case(word) abort
  return substitute(a:word, '_\(.\)', '\u\1', 'g')
endfunction

function! lib#capital_camel_case(word) abort
  return lib#capitalize(lib#camel_case(a:word))
endfunction

function! lib#snake_case(word) abort
  return tolower(substitute(a:word, '\([[:upper:]]\+[[:lower:]]*\)', '_\L\1', 'g')[1:])
endfunction

function! lib#dash_case(word) abort
  return tolower(substitute(a:word, '\([[:upper:]]\+[[:lower:]]*\)', '-\L\1', 'g')[1:])
endfunction

function! lib#lowercase(word) abort
  return substitute(a:word, '^\w', '\l\0', 'g')
endfunction
