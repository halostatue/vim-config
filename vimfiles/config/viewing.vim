scriptencoding utf-8

set number " Show line numbers
set hlsearch " Show search highlight

function! s:PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Make the default command-line height 1.
set cmdheight=1

" Remove whitespace sensitivity in diffs by default.
set diffopt-=iwhite

set noshowcmd
" Don't show the partial command in the last line of the screen.

" Use sensible search policies.
set ignorecase smartcase

" If the title can be changed, change it to something useful.
if has('title')
  set title titlelen=95
  let &titlestring="
        \ %{expand('%:p:~:.')}%(%m%w%)
        \ %<\(%{str#widthpart(\ fnamemodify(getcwd(), ':~'),
        \ &columns - len(expand('%:p:.:~')))}\) - VIM"
endif

" Set the default tabline.
let &tabline = '%!hs#tabline()'
set showtabline=1

set statusline=%{hs#status#buffer()}\ %<%.99f\ %h%m%r%{hs#try('CapsLockStatusline')}%y%{hs#try('fugitive#statusline')}%#ErrorMsg#%{hs#try('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P

" Set the default statusline when Airline is not turned on.
let &statusline= "%{(&previewwindow?'[preview] ':'').expand('%:t')}"
      \ . "\ %=%{(winnr('$')==1 || winnr('#')!=winnr()) ?
      \ '['.(&filetype!=''?&filetype.',':'')"
      \ . ".(&fenc!=''?&fenc:&enc).','.&ff.']' : ''}"
      \ . "%m%{printf(' %4d/%d',line('.'),line('$'))}"

let &g:statusline = '%{hs#status#buffer()}'
      \. '%<%.99f %(%{hs#status#filemodifiers()}%q%)'
      \. '%{hs#status#fugitive()}'
      \. '%#ErrorMsg#%{hs#try(''SyntasticStatuslineFlag'')}%*'
      \. '%='
      \. '%-14.(%c%V,%l/%L%) %P'

" Set linebreaking and wrapping rules
if has('linebreak')
  set wrap linebreak showbreak=↪ whichwrap=b,s,h,l,<,>,~,[,]
  if exists('+breakindent') | set breakindent | endif
else
  set nowrap
endif

set noshowmode

" Help avoid 'hit-enter' messages. a = (filmnrwx); T = middle truncation; I =
" no intro (also avoided with startify); o = write messages overwrite previous
" messages.
set shortmess=aTIo

" Do not display completion messages
" Patch: https://groups.google.com/forum/#!topic/vim_dev/WeBBjkXE8H8
try
  set shortmess+=c
catch /^Vim\%((\a\+)\)\=:E539: Illegal character/
  augroup hsautocmd-shortmess
    autocmd!
    autocmd VimEnter *
          \ highlight ModeMsg guifg=bg guibg=bg |
          \ highlight Question guifg=bg guibg=bg
  augroup END
endtry

" Disable the visual bell.
set novisualbell t_vb=

" Handle wildmenu matching.
if has('wildmenu')
  set wildcharm=<C-Z> wildmode=list:longest,list:full

  if has('wildignore')
    set wildignore+=.hg,.git,.svn                    " Version control
    set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore+=*.so,*.dylib                     " compiled object files
    set wildignore+=*.class                          " compiled object files
    set wildignore+=*.spl                            " compiled spelling word lists
    set wildignore+=*.sw?                            " Vim swap files
    set wildignore+=*.DS_Store                       " OSX bullshit
    set wildignore+=*.luac                           " Lua byte code
    set wildignore+=migrations                       " Django migrations
    set wildignore+=*.pyc                            " Python byte code
    set wildignore+=*.rbc                            " Rubinius byte code

    " Can supplement a tag in a command-line.
    set wildoptions=tagfile
  endif
endif

set norelativenumber showfulltag noequalalways lazyredraw
set winminheight=0 winminwidth=0 helpheight=10

" Disable menu
" let g:did_install_default_menus = 1

set browsedir=current
