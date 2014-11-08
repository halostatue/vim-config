" Initialization.

let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_sudo = $SUDO_USER != '' && $USER !=# $SUDO_USER
      \ && $HOME !=# expand('~'.$USER)
      \ && $HOME ==# expand('~'.$SUDO_USER)

function! IsWindows()
  return s:is_windows
endfunction

function! IsMac()
  return !s:is_windows && !s:is_cygwin
      \ && (has('mac') || has('macunix') || has('gui_macvim') ||
      \   (!executable('xdg-open') &&
      \     system('uname') =~? '^darwin'))
endfunction

" Use ',' instead of '\' as <Leader> in global plugins.
let g:mapleader = ','
" Use 'm' as <LocalLeader> for filetype (buffer) plugins.
let g:maplocalleader = 'm'

" Release 'm', ';', and ',' mappings for plug-in use with both normal (n) and
" visual (x) maps.
nnoremap ; <Nop>
nnoremap m <Nop>
nnoremap , <Nop>
xnoremap ; <Nop>
xnoremap m <Nop>
xnoremap , <Nop>

" Exchange the path separator on Windows.
if IsWindows() | set shellslash | endif

let $CACHE = expand('~/.cache')

if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

" Create a MyAutoCmd autogroup
augroup MyAutoCmd
  autocmd
augroup END

TrySource ~/.secret.vimrc

let s:neobundle_dir = expand('$CACHE/neobundle')

if has('vim_starting') "{{{
  " Load neobundle
  if isdirectory('neobundle.vim')
    set runtimepath^=neobundle.vim
  elseif finddir('neobundle.vim', '.;') != ''
    execute 'set runtimepath^=' . finddir('neobundle.vim', '.;')
  elseif &runtimepath !~ '/neobundle.vim'
    if !isdirectory(s:neobundle_dir.'/neobundle.vim')
      execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git',
            \ (exists('$http_proxy') ? 'https' : 'git'))
            \ s:neobundle_dir.'/neobundle.vim'
    endif

    execute 'set runtimepath^=' . s:neobundle_dir.'/neobundle.vim'
  endif
endif "}}}

let g:neobundle#default_options = {}

" Disable GetLatestVimPlugin.vim
if !&verbose
  let g:loaded_getscriptPlugin = 1
endif

" let g:loaded_netrwPlugin = 1
let g:loaded_matchparen = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimballPlugin = 1
