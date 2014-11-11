" Edit:

set tabstop=2     " <Tab> is two spaces
set softtabstop=2 " <Tab> is substituted with spaces
set shiftwidth=2  " Autoindent width of two spaces
set shiftround    " Round indent by shiftwidth
set expandtab     " Exchange tab to spaces

set modeline      " Turn on modeline.
set modelines=5   " vim default

if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed
endif

" Highlight parenthesis.
set showmatch

set cpoptions-=m " Highlight when CursorMoved.
set matchtime=3
set matchpairs+=<:> " Highlight <>.

set hidden " Display another buffer when current buffer isn't saved.

set infercase " Ignore case on insert completion.

set foldenable " Enable folding.
set foldmethod=marker

" Show folding level.
set foldcolumn=1

set commentstring=%s

if exists('*FoldCCtext')
  set foldtext=FoldCCtext() " Use FoldCCtext().
endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Use grep.
  set grepprg=grep\ -inH
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

set isfname-== " Exclude = from isfilename.

" Reload vimrc behaviours automatically
if has('autocmd')
  augroup HSAutoCmd
    autocmd!
  augroup END
endif

" Automatically load .vimrc source when saved
autocmd HSAutoCmd BufWritePost .vimrc,_vimrc,config/*.vim source $MYVIMRC
autocmd HSAutoCmd BufWritePost .gvimrc,_gvimrc,config/*.g.vim source $MYGVIMRC

" Keymapping timeout.
set timeout timeoutlen=3000

" CursorHold time.
set updatetime=1000

" Set swap directory.
set directory=~/tmp//,/var/tmp//,/tmp//,/private/tmp//

if v:version >= 703
  " Set undofile.
  set undofile
  let &undodir=&directory
endif

if v:version < 703 || (v:version == 7.3 && !has('patch336'))
  " Vim's bug.
  set notagbsearch
endif

" Enable virtualedit in visual block mode.
set virtualedit+=block

" Set keyword help.
set keywordprg=:help

" Check timestamp more for 'autoread'.
autocmd HSAutoCmd WINENTER * checktime

" Disable paste.
autocmd HSAutoCmd InsertLeave *
      \ if &paste | set nopaste mouse=a | echo 'nopaste' | endif |
      \ if &l:diff | diffupdate | endif

" Update diff.
autocmd HSAutoCmd InsertLeave * if &l:diff | diffupdate | endif

" Make directory automatically.
" --------------------------------------
" http://vim-users.jp/2011/02/hack202/

autocmd HSAutoCmd BufWritePre *
      \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
function! s:mkdir_as_necessary(dir, force)
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" Use autofmt.
if exists('*autofmt#compat#formatexpr')
  set formatexpr=autofmt#compat#formatexpr()
end
