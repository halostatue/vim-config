" GUI:

set winaltkeys=no " Do not use Windows ALT behaviour

" Fonts: {{{
if has('gui_macvim')
  " Command-Ctrl-F for Full-Screen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-C-F>

  set fuoptions=maxvert,maxhorz

  set guifont=Source\ Code\ Pro:h11,Inconsolata\ Medium:h11,Anonymous\ Pro:h12,DejaVu\ Sans\ Mono:h10,Andale\ Mono:h11
elseif has('gui_gtk2')  || has('X11')
  set guifont=Source\ Code\ Pro\ 11,Inconsolata\ Medium\ 11,Anonymous\ Pro\ 12,DejaVu\ Sans\ Mono\ 10,Andale\ Mono\ 11,Luxi\ Mono\ 9
elseif has('win32') || has('win64')
  set guifont=Source\ Code\ Pro:h11,Inconsolata\ Medium:h11,Anonymous\ Pro:h12,DejaVu\ Sans\ Mono:h10,Andale\ Mono:h11

  if has('patch-7.4.394')
    " Use DirectWrite
    set renderoptions=type:directx,gammma:2.2,mode:3
  endif

  map <A-Space> :simalt ~<CR>
  imap <A-Space> <C-O>:simalt ~<CR>
  cmap <A-Space> <C-C><A-Space>
endif
" }}}

"---------------------------------------------------------------------------
" Window:"{{{
"
if has('transparency')
  set transparency=1 " 1% transparency
endif

set lines=60 columns=180

" Don't override colorscheme.
if !exists('g:colors_name')
  colorscheme desertEx
endif
"}}}

"---------------------------------------------------------------------------
" Mouse:"{{{
highlight Pmenu      term=NONE cterm=NONE ctermfg=7 ctermbg=5 gui=NONE guifg=White guibg=Magenta
highlight PmenuSel   term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White
highlight PmenuSbar  term=NONE cterm=NONE ctermfg=7 ctermbg=0 gui=NONE guifg=White guibg=Black
highlight PmenuThumb term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White

" Don't focus the window when the mouse pointer is moved.
set nomousefocus

" Hide mouse pointer on insert mode.
set mousehide
"}}}

"---------------------------------------------------------------------------
" Menu:"{{{
" Hide toolbar and menus.
set guioptions-=Tt
set guioptions-=m
" Scrollbar is always off.
set guioptions-=rLRlbh
" Use guitablabel.
set guioptions+=e

" Confirm without window.
set guioptions+=c
"}}}

" vim: foldmethod=marker
