" Query Fucntions

if exists('s:isWindows')
  finish
endif

function! s:setup() abort
  let s:isWindows = has('win16') || has('win32') || has('win64')
  let s:isCygwin = has('win32unix')
  let s:isSudo = $SUDO_USER != '' && $USER !=# $SUDO_USER
        \ && $HOME !=# expand('~'.$USER)
        \ && $HOME ==# expand('~'.$SUDO_USER)
  let s:isMac = !s:isWindows && !s:isCygwin
        \ && (has('mac') || has('macunix') || has('gui_macvim') ||
        \   (!executable('xdg-open') &&
        \     system('uname') =~? '^darwin'))
endfunction

function! is#mac() abort
  return s:isMac
endfunction

function! is#windows() abort
  return s:isWindows
endfunction

function! is#cygwin() abort
  return s:isCygwin
endfunction

function! is#sudo() abort
  return s:isSudo
endfunction

call s:setup()
