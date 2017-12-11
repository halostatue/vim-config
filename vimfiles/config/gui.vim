" Do not use Windows ALT behaviour
set winaltkeys=no

" Font settings
if hs#is#mac()
  " Fullscreen options
  if has('gui_macvim') && has('gui_running')
    set fuoptions=maxvert,maxhorz
  endif

  set macligatures
  set guifont=Fira\ Code:h10,Input\ Mono\ Narrow:h10,Source\ Code\ Pro:h10,Inconsolata\ Medium:h10,Anonymous\ Pro:h11,DejaVu\ Sans\ Mono:h9,Andale\ Mono:h10
elseif has('gui_gtk2') || has('X11')
  set guifont=Input\ Mono\ Narrow\ 10,Source\ Code\ Pro\ 11,Inconsolata\ Medium\ 11,Anonymous\ Pro\ 12,DejaVu\ Sans\ Mono\ 10,Andale\ Mono\ 11,Luxi\ Mono\ 9
elseif has('win32') || has('win64')
  set guifont=Input\ Mono\ Narrow:h10,Source\ Code\ Pro:h11,Inconsolata\ Medium:h11,Anonymous\ Pro:h12,DejaVu\ Sans\ Mono:h10,Andale\ Mono:h11

  if has('patch-7.4.394')
    " Use DirectWrite
    set renderoptions=type:directx,gammma:2.2,mode:3
  endif
endif

" Window settings
if hs#is#windows()
  noremap <A-Space> :simalt ~<CR>
  inoremap <A-Space> <C-O>:simalt ~<CR>
  cnoremap <A-Space> <C-C><A-Space>
endif

if hs#is#mac()
  set lines=62 columns=106
  winpos 637 22

  " Make the mac window as big as possible
  " set lines=999 columns=9999
else
  set lines=60 columns=180
endif

if has('transparency') | set transparency=1 | endif
if !has_key(g:, 'colors_name') | colorscheme PaperColor | endif

" Mouse settings
set nomousefocus mousehide

" highlight Pmenu term=NONE cterm=NONE ctermfg=7 ctermbg=5 gui=NONE guifg=White guibg=Magenta
" highlight PmenuSel term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White
" highlight PmenuSbar term=NONE cterm=NONE ctermfg=7 ctermbg=0 gui=NONE guifg=White guibg=Black
" highlight PmenuThumb term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White

" Menu options, where applicable.
set guioptions=gmec
