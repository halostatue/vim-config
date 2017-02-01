" Homebrew interaction functions

if exists('*homebrew#active')
  finish
endif

let s:HomebrewActive = is#mac() && executable('brew')

function! homebrew#active() abort
  return s:HomebrewActive
endfunction

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

function! homebrew#init() abort
  if homebrew#active()
    let l:brew_prefix = expand('~/.brew-prefix')
    if exists(l:brew_prefix)
      let s:HomebrewPrefix = execute('read ~/.brew-prefix')
    else
      let s:HomebrewPrefix = substitute(system('brew --prefix'), "\\n", '', '')
      call writefile([ s:HomebrewPrefix ], l:brew_prefix)
    endif
  else
    let s:HomebrewPrefix = ''
  endif
endfunction

call homebrew#init()
