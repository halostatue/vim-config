" Do not use Windows ALT behaviour
set winaltkeys=no

" Fullscreen options
if is#mac()
  " Command-Ctrl-F for Full-Screen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-C-F>
  set fuoptions=maxvert,maxhorz
endif

" Font settings
if is#mac()
  set guifont=Source\ Code\ Pro:h10,Inconsolata\ Medium:h10,Anonymous\ Pro:h11,DejaVu\ Sans\ Mono:h9,Andale\ Mono:h100
elseif has('gui_gtk2') || has('X11')
  set guifont=Source\ Code\ Pro\ 11,Inconsolata\ Medium\ 11,Anonymous\ Pro\ 12,DejaVu\ Sans\ Mono\ 10,Andale\ Mono\ 11,Luxi\ Mono\ 9
elseif has('win32') || has('win64')
  set guifont=Source\ Code\ Pro:h11,Inconsolata\ Medium:h11,Anonymous\ Pro:h12,DejaVu\ Sans\ Mono:h10,Andale\ Mono:h11

  if has('patch-7.4.394')
    " Use DirectWrite
    set renderoptions=type:directx,gammma:2.2,mode:3
  endif
endif

" Window settings
if is#windows()
  noremap <A-Space> :simalt ~<CR>
  inoremap <A-Space> <C-O>:simalt ~<CR>
  cnoremap <A-Space> <C-C><A-Space>
endif

if is#mac()
  " Make the mac window as big as possible
  set lines=999 columns=9999
else
  set lines=60 columns=180
endif

if has('transparency') | set transparency=1 | endif
if !exists('g:colors_name') | colorscheme desertEx | endif

" Mouse settings
set nomousefocus mousehide

" highlight Pmenu term=NONE cterm=NONE ctermfg=7 ctermbg=5 gui=NONE guifg=White guibg=Magenta
" highlight PmenuSel term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White
" highlight PmenuSbar term=NONE cterm=NONE ctermfg=7 ctermbg=0 gui=NONE guifg=White guibg=Black
" highlight PmenuThumb term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White

" Menu options, where applicable.
" - Hide toolbar, menus, and all scrollbars.
set guioptions-=TtmrlRLbh
" - Use guitablabel, and confirm in-line.
set guioptions+=ec
