" View:

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

set number

" Height of command line.
set cmdheight=2

" Cmdheight switching
nnoremap <leader>1 :set cmdheight=1<cr>
nnoremap <leader>2 :set cmdheight=2<cr>

" Not show command on statusline.
set noshowcmd

if has('title')
  set title
  set titlelen=95
  " Title string.
  let &titlestring="
        \ %{expand('%:p:~:.')}%(%m%r%w%)
        \ %<\(%{".s:SID_PREFIX()."strwidthpart(
        \ fnamemodify(&filetype ==# 'vimfiler' ?
        \ substitute(b:vimfiler.current_dir, '.\\zs/$', '', '') : getcwd(), ':~'),
        \ &columns-len(expand('%:p:.:~')))}\) - VIM"
endif

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''

  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears

    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '

    " Use gettabvar().
    let title =
          \ !exists('*gettabvar') ?
          \      fnamemodify(bufname(bufnr), ':t') :
          \ gettabvar(i, 'title') != '' ?
          \      gettabvar(i, 'title') :
          \      fnamemodify((i == tabpagenr() ?
          \       getcwd() : gettabvar(i, 'cwd')), ':t')

    let title = '[' . title . ']'

    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= title
    let s .= mod
    let s .= '%#TabLineFill#'
  endfor

  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=0

" Set statusline.
let &statusline="%{winnr('$')>1?'['.winnr().'/'.winnr('$')"
      \ . ".(winnr('#')==winnr()?'#':'').']':''}\ "
      \ . "%{(&previewwindow?'[preview] ':'').expand('%:t')}"
      \ . "\ %=%{(winnr('$')==1 || winnr('#')!=winnr()) ?
      \ '['.(&filetype!=''?&filetype.',':'')"
      \ . ".(&fenc!=''?&fenc:&enc).','.&ff.']' : ''}"
      \ . "%m%{printf(' %4d/%d',line('.'),line('$'))}"

set linebreak
set showbreak=↪
" Turn down a long line appointed in 'breakat'
set breakat=\ \	;:,!?

set whichwrap=b,s,h,l,<,>,~,[,]
if exists('+breakindent')
  set breakindent
  set wrap
else
  set nowrap
endif

set shortmess=aTIo

set nobackup writebackup
let &backupdir=&directory

" Make Vim able to edit crontab files again.
set backupskip+=/private/tmp/*

" Disable bell.
set t_vb=
set novisualbell

" Wildmenu matching rules
set wildcharm=<C-Z> wildmode=list:longest,list:full
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

set showfulltag
" Can supplement a tag in a command-line.
set wildoptions=tagfile

" Disable menu
" let g:did_install_default_menus = 1

" = Keyword completion options
" == ins-completion search order: current buffer; other window buffers;
" unloaded buffers; tags; current and included files; spell checking
" dictionary; files in 'dictionary'; files in 'thesaurus'
set complete+=kspell,k,s complete-=w,b,u
if has("insert_expand") | set completeopt-=preview | endif

" Set popup menu max height.
set pumheight=20

set nostartofline 
set winminheight=0 winminwidth=0 helpheight=10
set noequalalways
set lazyredraw

" View setting.
set viewdir=$CACHE/vim_view viewoptions-=options
set viewoptions+=slash,unix

function! s:strwidthpart(str, width) "{{{
  if a:width <= 0
    return ''
  endif
  let ret = a:str
  let width = s:wcswidth(a:str)
  while width > a:width
    let char = matchstr(ret, '.$')
    let ret = ret[: -1 - len(char)]
    let width -= s:wcswidth(char)
  endwhile

  return ret
endfunction"}}}

if v:version >= 703
  " For conceal.
  set conceallevel=2 concealcursor=iv

  set colorcolumn=79

  " Use builtin function.
  function! s:wcswidth(str)
    return strwidth(a:str)
  endfunction
  finish
endif

function! s:wcswidth(str)
  if a:str =~# '^[\x00-\x7f]*$'
    return strlen(a:str)
  end

  let mx_first = '^\(.\)'
  let str = a:str
  let width = 0
  while 1
    let ucs = char2nr(substitute(str, mx_first, '\1', ''))
    if ucs == 0
      break
    endif
    let width += s:_wcwidth(ucs)
    let str = substitute(str, mx_first, '', '')
  endwhile
  return width
endfunction

" UTF-8 only.
function! s:_wcwidth(ucs)
  let ucs = a:ucs
  if (ucs >= 0x1100
        \  && (ucs <= 0x115f
        \  || ucs == 0x2329
        \  || ucs == 0x232a
        \  || (ucs >= 0x2e80 && ucs <= 0xa4cf
        \      && ucs != 0x303f)
        \  || (ucs >= 0xac00 && ucs <= 0xd7a3)
        \  || (ucs >= 0xf900 && ucs <= 0xfaff)
        \  || (ucs >= 0xfe30 && ucs <= 0xfe6f)
        \  || (ucs >= 0xff00 && ucs <= 0xff60)
        \  || (ucs >= 0xffe0 && ucs <= 0xffe6)
        \  || (ucs >= 0x20000 && ucs <= 0x2fffd)
        \  || (ucs >= 0x30000 && ucs <= 0x3fffd)
        \  ))
    return 2
  endif
  return 1
endfunction
"}}}
