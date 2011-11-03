" vimrc for Austin Ziegler <halostatue@gmail.com>
"
" The options set in this file are known to work with Vim 7.3 or later.
" Earlier versions may need some changes.

" Use Vim settings, rather then Vi settings (much better!).  This must be
" first, because it changes other options as a side effect.
set nocompatible

setlocal verbose=0 " Turn off verbose mode for this file.

" Get the value of $PATH from a login shell if MacVim.app was started from the
" Finder.
if has("gui_macvim") && has("gui_running")
  " ps -xc: just the command, not the command-line; including non-terminal processes
  " grep -wsc: suppress errors; word boundary; count of matches.
  if system("ps -xc | grep -wsc Vim") > 0
    " If your shell is not on this list, it may be just because we have not
    " tested it.  Try adding it to the list and see if it works. If so, please
    " post a note to the vim-mac list!
    if $SHELL =~ '/\(sh\|csh\|bash\|tcsh\|zsh\)$'
      let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
      let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
    endif
  endif

  " MacVIM shift+arrow-keys behavior (required in .vimrc)
  " let g:macvim_hig_shift_movement=1
endif

" vimrc.defaults: default values for vim settings.
" ------------------------------------------------------------------------
" Force the encoding to UTF-8 by default.
set encoding=utf-8

" Backspace over everything in insert mode
set backspace=indent,eol,start

" Make a backup of a file while we're writing it, and then delete it. This
" prevents us from having unsighly ~ files.
set nobackup writebackup

set history=50 " Keep 50 lines of command line history
set ruler " Show the cursor position all the time
set showcmd " Display incomplete commands
set incsearch " Perform searches incrementally.
set ignorecase " Ignore case…
set smartcase " Unless there's a capital letter

set autoread " Automatically reload changed files.
set autowrite " Automatically write changed buffers to disk.
set modelines=10

" = Keyword completion options
" == ins-completion search order: current buffer; other window buffers;
" unloaded buffers; tags; current and included files; spell checking
" dictionary; files in 'dictionary'; files in 'thesaurus'
set complete=.,w,b,u,t,i,kspell,k,s showfulltag
if has("insert_expand")
  set completeopt-=preview
endif

set showmatch hidden noequalalways hlsearch nostartofline nojoinspaces
set shortmess=aIo scrolloff=0 sidescrolloff=0 scrolljump=2
set mouse=ar laststatus=2 keymodel=startsel,stopsel
set tabstop=2 shiftwidth=2 softtabstop=2 shiftround expandtab smarttab
set winminheight=0 winminwidth=0 helpheight=10
set list listchars=tab:»—,extends:›,precedes:‹,trail:•
set whichwrap=b,s,h,l,<,>,~,[,] viminfo='100,<100,s10,h,!
set linebreak showmode
set wildcharm=<C-Z> wildmenu wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,.hg,vendor/gems/*

if has("win32")
  set viminfo+=rA:,rB:
endif

if has("balloon_eval")
  set ballooneval
endif

set sessionoptions=blank,buffers,curdir,folds,globals,help,options,resize,slash,unix,winpos,winsize

" Use Ack instead of Grep when available
if executable("ack-grep") " Debian
  set grepprg=ack-grep\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
elseif executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

" vimrc.maps: default key mappings
" ------------------------------------------------------------------------
" Make folding 
nmap <Tab> za
vmap <Tab> za
omap <Tab> za

" Move between buffers. Different on Mac vs not-Mac because option inserts
" special characters on the Mac and the Command/Super key isn't available off
" the Mac.
if has("mac") || has ("macunix")
  map <D-[> :N<CR>
  map <D-]> :n<CR>
else
  map <A-[> :N<CR>
  map <A-]> :N<CR>
endif

" Make CTRL-^ rebound to the line and *column* in the previous file
noremap <C-^> <C-^>`"

" Make "gf" rebound to last cursor position (line *and* column)
noremap gf gf`"

" Show more information under <C-G>
noremap <C-G> 2<C-G>

nmap <A-Down>   <C-W>j
nmap <A-Up>     <C-W>k
nmap <A-Left>   <C-W>h
nmap <A-Right>  <C-W>l

" Typical command line stuff... -- emacsen-style
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>
cnoremap <C-D> <Del>

function! s:setupWrapping()
  setlocal wrap
  setlocal wrapmargin=2
  setlocal textwidth=72
endfunction

function! s:setupMarkdown()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

function! s:setupMail()
  setfiletype mail
  call s:setupWrapping()
endfunction

" For keyboards that have Insert and Del keys (not Macs), make them do the
" right thing.
function! s:NormalPaste()
  if @* != ""
    normal "*gP
  endif
endfunction

function! s:SelectPaste()
  if @* != ""
    if col(".") < col("'<")
      normal "*gp
    else
      normal "*gP
    endif
  endif
endfunction

map <S-Del> "*x
map <C-Insert> "*y
map <S-Insert> :set paste<CR>:call <SID>NormalPaste()<CR>:set nopaste<CR>
imap <S-Insert> x<ESC>:set paste<CR>:call <SID>NormalPaste()<CR>:set nopaste<CR>s
cmap <S-Insert> <C-R>*
vmap <S-Insert> "-x:set paste<CR>:call <SID>SelectPaste()<CR>:set nopaste<CR>

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cmap <C-Tab> <C-C><C-Tab>
noremap <C-S-Tab> <C-W>W
inoremap <C-S-Tab> <C-O><C-W>W
cmap <C-S-Tab> <C-C><C-S-Tab>

" Don't use Ex mode, use Q for formatting
map Q gq

" Prepare to write email.
map <Leader>mail :call s:setupMail()<CR>

function! WhenPUMVisible(ifVisible, ifNotVisible)
  if pumvisible()
    return a:ifVisible
  else
    return a:ifNotVisible
  endif
endfunction
"

" If a popupmenu is visible (pumvisible), change the behaviour of various
" keys to do something meaningful with the menu.
inoremap <expr> <Esc>      WhenPUMVisible("\<C-E>", "\<Esc>")
" inoremap <expr> <CR>       WhenPUMVisible("\<C-Y>", "\<CR>")
inoremap <expr> <Down>     WhenPUMVisible("\<C-N>", "\<Down>")
inoremap <expr> <Up>       WhenPUMVisible("\<C-P>", "\<Up>")
inoremap <expr> <PageDown> WhenPUMVisible("\<PageDown>\<C-P>\<C-N>", "\<PageDown>")
inoremap <expr> <PageUp>   WhenPUMVisible("\<PageUp>\<C-P>\<C-N>", "\<PageUp>")

" For the BufferList plug-in.
noremap <silent> <F3> :call BufferList()<CR>
inoremap <silent> <F3> <C-O>:call BufferList()<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

command! -bar -nargs=1 OpenURL :!open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>w :call OpenURL()<CR>

" function! SuperCleverTab()
"   " check if at beginning of line or after a space
"   if strpart(getline('.'), 0, col('.')-1) =~ '^\s*$'
"     return "\<Tab>"
"   else " do we have omni completion available
"     if &omnifunc != ''
"       " use omni-completion 1. priority
"       return "\<C-X>\<C-O>"
"     elseif &dictionary != ''
"       " no omni completion, try dictionary completion
"       return "\<C-K>"
"     else
"       " use omni completion or dictionary completion
"       " use known-word completion
"       return "\<C-N>"
"     endif
"   endif
" endfunction

" " bind function to the tab key
" inoremap <Tab> <C-R>=SuperCleverTab()<cr>

" vimrc.abbrs: default values for vim settings.
" ------------------------------------------------------------------------
" Insertion abbreviations for measurement rules.
iab raz abcdefghijklmnopqrstuvwxyz
iab Raz ABCDEFGHIJKLMNOPQRSTUVWXYZ
iab r10 1234567890
iab r40 1234567890123456789012345678901234567890
iab r80 12345678901234567890123456789012345678901234567890123456789012345678901234567890
iab r72 123456789012345678901234567890123456789012345678901234567890123456789012
iab R10 ----------
iab R40 ----------------------------------------
iab R80 --------------------------------------------------------------------------------
iab R72 ------------------------------------------------------------------------

" General echo "editing abbreviations
" yyyymmdd
iab cdate <C-R>=strftime("%Y%m%d")<CR>
" yyyy.mm.dd
iab cfdate <C-R>=strftime("%Y.%m.%d")<CR>
" hh:mm
iab ctime <C-R>=strftime("%H:%M")<CR>
" yyyymmdd hh:mm
iab cdatetime <C-R>=strftime("%Y%m%d %H:%M")<CR>
" yyyy.mm.dd hh:mm
iab cfdatetime <C-R>=strftime("%Y.%m.%d %%H:%M")<CR>
" system long date
iab clongdate <C-R>=strftime("%a %b %#d %X %z %Y")<CR>
" formatted long date
iab cpdate <C-R>=strftime("%A, %#d %B %Y")<CR>

" vimrc.syntax: variables set for syntax management.
" ------------------------------------------------------------------------
" Default Syntax settings.
"
" These values have been determined more by trolling through the syntax files
" than reading the documentation. There's more features that exist than are
" documented.

" c.vim
let g:c_gnu=1
let g:c_comment_strings=1
let g:c_space_errors=1
let g:c_ansi_constants=1
let g:c_ansi_typedefs=1

" doxygen
let g:doxygen_enhanced_colour=1

" haskell.vim
let g:hs_allow_hash_operator=1
let g:hs_highlight_boolean=1
let g:hs_highlight_debug=1
let g:hs_highlight_delimiters=1
let g:hs_highlight_more_types=1
let g:hs_highlight_types=1

" html.vim
let g:html_extended_events=1

" java.vim
let g:java_comment_strings=1
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_highlight_functions="style"
let g:java_space_errors=1

" javascript.vim
let g:javaScript_fold=1

" lisp.vim
let g:lisp_instring=1
let g:lisp_rainbow=1

" perl.vim
let g:perl_include_pod=1
let g:perl_fold=1

" perl6.vim
let g:perl6_extended_all=1
let g:perl6_embedded_pir=1

" php.vim
let g:php_sql_query=1
let g:php_baselib=1
let g:php_htmlInStrings=1
let g:php_noShortTags=1
let g:php_parent_error_close=1
let g:php_parent_error_open=1
let g:php_folding=2

" python.vim
let g:python_highlight_all=1

" r.vim
let g:r_syntax_folding=1

" ruby.vim
let g:ruby_fold=1
let g:ruby_space_errors=1
let g:ruby_operators=1

" sh.vim
let g:sh_fold_enabled=1
let g:is_bash=1

" vim.vim
" g:vimsyn_embed defaults to lmpPr (lua, mzscheme, perl, Python, and Ruby)
let g:vimsyn_folding='alfmpPr'

" xml.vim
let g:xml_syntax_folding=1

" vimrc.plugins: plug-in settings/variables that should be set before they
" are loaded.
" ------------------------------------------------------------------------
" This file is used for plug-in settings.

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" An earlier version of Lusty Juggler always spat out an ugly warning if you
" don't have Ruby support compiled in. Just in case:
if !has("ruby")
  let g:LustyJugglerSuppressRubyWarning = 1
endif

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac_unix")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" NERDTree configuration
let g:NERDTreeSortDirs=1
let g:NERDTreeSplitVertical=1
let g:NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Find where the abbreviations.txt file exists for the abbrevlist plug-in to
" use.
for s:rt_path in split(&runtimepath, ',')
  if isdirectory(s:rt_path)
    let g:support_file_path=s:rt_path
    break
  endif
endfor

let g:abbrevlist_filename=g:support_file_path.'/abbreviations.txt'

" " MiniBufExpl Colors
" hi MBEVisibleActive guifg=#A6DB29 guibg=fg
" hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
" hi MBEVisibleChanged guifg=#F1266F guibg=fg
" hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
" hi MBEChanged guifg=#CD5907 guibg=fg
" hi MBENormal guifg=#808080 guibg=fg

" vimrc.autogroups: autogroup definitions.
" ------------------------------------------------------------------------
if has("autocmd")
  " Markdown setup.
  augroup vimrcMarkdown
    autocmd!
    autocmd BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn} setfiletype markdown
    autocmd FileType markdown call s:setupMarkdown()
  augroup END

  " Ruby OmniCompletion
  augroup vimrcRubyOmni
    autocmd!
    autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
"   autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"   autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"   autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    autocmd FileType eruby setlocal wrap linebreak nolist
  augroup END

  augroup vimrcText
    autocmd!
    autocmd FileType text setlocal wrap linebreak nolist textwidth=78
  augroup END

  augroup vimrcHTML
    autocmd!
    autocmd FileType text,html,xhtml setlocal wrap linebreak nolist
  augroup END

  augroup vimrcExtra
    autocmd!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

    " Automatically load .vimrc source when saved
    autocmd BufWritePost .vimrc source $MYVIMRC
    autocmd BufWritePost .gvimrc source $MYGVIMRC
  augroup END

" add json syntax highlighting
au BufNewFile,BufRead *.json setfiletype javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

  augroup vimrcRubyFileTypes
    autocmd!
    " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
    au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} setfiletype ruby
  augroup END

  augroup vimrcAllBuffers
    autocmd!
    autocmd BufRead * set modeline number
  augroup END

  augroup vimrcCType
    autocmd!
    " When starting to edit a file: For *.c and *.h files set formatting of
    " comments and set C-indenting on. For other files switch it off. Don't
    " change the order, it's important that the line with * comes first.
    autocmd FileType * set fo=tcroq2 nocin si com& number
    autocmd FileType c,cpp,proc,procpp,php setlocal fo=tcroq2 cin com=sr:/*,mb:*,elx:*/,://

    autocmd BufRead *.gsoap,*.dox,*.h.tmpl,*.cpp.tmpl setlocal ft=cpp
    autocmd BufRead *.gsoap setlocal include=^\s*#\s*include\|^\s*#\s*import
    autocmd FileType sql,plsql setlocal fo=tcroq2 cin com=sr:/*,mb:*,elx:*/,:--
    autocmd FileType sh,perl,ruby,python setlocal fo=tcroql2 cin com=b:#
  augroup END
else
  set autoindent
endif

" config_files: Useful maps for managing config files
" ------------------------------------------------------------------------
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>eg :split $MYGVIMRC<CR>

" The last thing we do is load bundles via Pathogen.
call pathogen#infect()
" call pathogen#helptags()
syntax on
filetype plugin indent on

if has("gui_running")
  set background=light
endif

" % to bounce from do to end etc.
runtime! macros/matchit.vim
