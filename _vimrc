" vimrc for Austin Ziegler <halostatue@gmail.com>
"
" The options set in this file are known to work with Vim 7.3 or later.
" Earlier versions may need some changes.
"
" This has been cribbed from a number of sources over the years.

" Skip initialization for a vim-tiny or vim-small environment.
if !1 | finish | endif

if has('vim_starting')
  " Use Vim settings, rather then Vi settings (much better!). This must be
  " first, because it changes other options as a side effect.
  set nocompatible
endif

setlocal verbose=0 " Turn off verbose mode for this file.

let g:config = {}

function! config.name(path) dict
  return expand('~/.vim/config/' . a:path . '.config.vim')
endfunction

function! config.plugin(path) dict
  return g:config.name('plugins/' . a:path)
endfunction

function! config.source_if(path) dict
  if filereadable(fnameescape(expand(a:path)))
    execute 'source' fnameescape(expand(a:path))
  endif
endfunction

function! config.source(path) dict
  call g:config.source_if(g:config.name(a:path))
endfunction

" Source a configuration file (~/.vim/config/…)
command! -nargs=1 SourceConfig call config.source(<q-args>)

" Source a file if it’s readable.
command! -nargs=1 SourceIf call config.source_if(<q-args>)

SourceConfig init

" let g:vimfiler_as_default_explorer = 1
call neobundle#begin(expand('$CACHE/neobundle'))

if neobundle#has_cache()
  NeoBundleLoadCache
else
  SourceConfig neobundle
  NeoBundleSaveCache
endif

if filereadable('vimrc_local.vim') ||
      \ findfile('vimrc_local.vim', '.;') != ''
  " Load develop version.
  call neobundle#local(fnamemodify(
        \ findfile('vimrc_local.vim', '.;'), ':h'))
endif

NeoBundleLocal ~/.vim/bundlex

" NeoBundle configurations.
" NeoBundleDisable neocomplcache.vim

call neobundle#end()

filetype plugin indent on
syntax enable

" Installation check.
NeoBundleCheck

" Search:
set ignorecase smartcase wrapscan

" Edit:
SourceConfig edit

" View:
SourceConfig view

" FileType:
SourceConfig filetype

" Plugins:
SourceConfig plugins

" Mappings:
SourceConfig mappings

" Commands:
SourceConfig commands

" Abbreviations:
SourceConfig abbrevs

" Platform:
if IsWindows()
  SourceConfig windows
elseif IsMac()
  SourceConfig mac
else
  SourceConfig unix
endif

" Using the mouse on a terminal.
if has('mouse')
  set mouse=ar
  if has('mouse_sgr') || v:version > 703 ||
        \ v:version == 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif

  " Paste.
  nnoremap <RightMouse> "+p
  xnoremap <RightMouse> "+p
  inoremap <RightMouse> <C-r><C-o>+
  cnoremap <RightMouse> <C-r>+
endif

" GUI:
if has('gui_running')
  SourceConfig gui
endif

" Default home directory
let t:cwd = getcwd()

SourceConfig syntax

augroup HSAutoCmd
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  autocmd BufReadPost * SmartSetFoldText
  autocmd BufRead * set modeline number

  " Resize splits when the window is resized
  autocmd VimResized * exe "normal! \<C-W>="
augroup END

set diffopt-=iwhite
let g:diffwhitespaceon = 1
function! s:ToggleDiffWhitespace() "{{{
  if g:diffwhitespaceon
    set diffopt-=iwhite
    let g:diffwhitespaceon = 0
  else
    set diffopt+=iwhite
    let g:diffwhitespaceon = 1
  endif
  diffupdate
endfunc "}}}
nnoremap <leader>dw :call <SID>ToggleDiffWhitespace()<CR>

if filereadable(expand("~/.local.vimrc"))
  exec ":source " . expand("~/.local.vimrc")
endif

call neobundle#call_hook('on_source')
call neobundle#call_hook('on_post_source')

set secure

" vim: foldmethod=marker
