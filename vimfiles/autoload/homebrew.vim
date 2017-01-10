" Homebrew interaction functions

if exists('*homebrew#active')
  finish
endif

let s:HomebrewActive = is#mac() && executable('brew')

function! homebrew#active() abort
  return s:HomebrewActive
endfunction

if homebrew#active()
  let s:HomebrewPrefix = substitute(system('brew --prefix'), "\\n", '', '')
else
  let s:HomebrewPrefix = ''
endif

function! homebrew#prefix() abort
  return s:HomebrewPrefix
endfunction

function! homebrew#path(path) abort
  if homebrew#active()
    return homebrew#prefix() . '/' . fnameescape(expand(a:path))
  else
    return ''
  endif
endfunction

function! homebrew#isdirectory(path) abort
  return isdirectory(homebrew#path(a:path))
endfunction

function! homebrew#filereadable(path) abort
  return filereadable(homebrew#path(a:path))
endfunction

function! homebrew#filewritable(path) abort
  return filewritable(homebrew#path(a:path))
endfunction
