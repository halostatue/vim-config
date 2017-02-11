" Override the default K binding to search for a word in the current directory.
" Use the location window for matches.
nnoremap K :lgrep! "\b<C-R><C-W>\b"<CR>:lw<CR>
xnoremap K :lgrep! "\b<C-R><C-W>\b"<CR>:lw<CR>

" Allow easy toggling between cmdheight 1 and 2.
nnoremap <Leader>1 :set cmdheight=1<cr>
nnoremap <Leader>2 :set cmdheight=2<cr>

" Tabularization of equals signs
nmap <Leader>a= :Tabularize eq<CR>
xmap <Leader>a= :Tabularize eq<CR>

" Tabularization of hashes as JSON.
nmap <Leader>a: :Tabularize json_hash<CR>
xmap <Leader>a: :Tabularize json_hash<CR

augroup hsautocmd-rubysyntax
  " Override Tabularization of hashes to Ruby hash formats.
  autocmd FileType ruby
        \ nmap <buffer> <Leader>a: :<C-U>Tabularize ruby_hash<Return> |
        \ xmap <buffer> <Leader>a: :<C-U>Tabularize ruby_hash<Return>
  autocmd FileType ruby
        \ nmap <buffer> <Leader>a> :<C-U>Tabularize ruby_rocket_hash<Return> |
        \ xmap <buffer> <Leader>a> :<C-U>Tabularize ruby_rocket_hash<Return>
augroup END

" Fugitive
nnoremap <Leader>gd :Gdiff<Return>
nnoremap <Leader>gs :Gstatus<Return>
nnoremap <Leader>gw :Gwrite<Return>
nnoremap <Leader>ga :Gadd<Return>
nnoremap <Leader>gb :Gblame<Return>
nnoremap <Leader>gco :Gcheckout<Return>
nnoremap <Leader>gci :Gcommit<Return>
nnoremap <Leader>gm :Gmove<Return>
nnoremap <Leader>gr :Gremove<Return>

" Scratch buffer support
nmap <silent> <Leader><Leader>o <Plug>(scratch-open)
nmap <silent> <Leader><Leader>c <Plug>(scratch-close)

" Smartchr
" - smart comma
inoremap <expr> , smartchr#one_of(', ', ',')

" - smart equals
inoremap <expr> =
      \ search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')
      \ ? '<bs>= ' : search('\(*\<bar>!\)\%#', 'bcn')
      \ ? '= ' : smartchr#one_of(' = ', '=', ' == ')

augroup hsautocmd-smartchr
  " Substitute .. into -> .
  autocmd FileType c,cpp
        \ inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')
  autocmd FileType perl,php
        \ inoremap <buffer> <expr> . smartchr#loop(' . ', '->', '.')
  autocmd FileType perl,php
        \ inoremap <buffer> <expr> - smartchr#loop('-', '->')
  autocmd FileType vim
        \ inoremap <buffer> <expr> . smartchr#loop('.', ' . ', '..', '...')
  autocmd FileType lisp,scheme,clojure
        \ inoremap <buffer> <expr> = =

  autocmd FileType ruby
        \ inoremap <buffer> <expr> =
        \ search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')
        \ ? '<bs>= ' : search('\(*\<bar>!\)\%#', 'bcn')
        \ ? '= ' : smartchr#one_of(' = ', '=', ' == ', ' => ')

  autocmd FileType haskell,int-ghci
        \ inoremap <buffer> <expr> + smartchr#loop('+', ' ++ ') |
        \ inoremap <buffer> <expr> - smartchr#loop('-', ' -> ', ' <- ') |
        \ inoremap <buffer> <expr> $ smartchr#loop(' $ ', '$') |
        \ inoremap <buffer> <expr> \ smartchr#loop('\ ', '\') |
        \ inoremap <buffer> <expr> : smartchr#loop(':', ' :: ', ' : ') |
        \ inoremap <buffer> <expr> . smartchr#loop('.', ' . ', '..')

  autocmd FileType scala
        \ inoremap <buffer> <expr> - smartchr#loop('-', ' -> ', ' <- ') |
        \ inoremap <buffer> <expr> = smartchr#loop(' = ', '=', ' => ') |
        \ inoremap <buffer> <expr> : smartchr#loop(': ', ':', ' :: ') |
        \ inoremap <buffer> <expr> . smartchr#loop('.', ' => ')

  autocmd FileType eruby
        \ inoremap <buffer> <expr> > smartchr#loop('>', '%>') |
        \ inoremap <buffer> <expr> < smartchr#loop('<', '<%', '<%=')
augroup END

" Quickrun
nmap <silent> <Leader>r <Plug>(quickrun)

" Qfreplace
augroup hsautocmd-qfreplace
  autocmd FileType qf nnoremap <buffer> r :<C-U>Qfreplace<Return>
augroup END

" vim-niceblock
xmap I <Plug>(niceblock-I)
xmap A <Plug>(niceblock-A)

" vim-easy-align
xmap <Enter> <Plug>(EasyAlign)
nmap <Leader><Leader>a <Plug>(EasyAlign)
nnoremap <silent> <F9> :TagbarToggle<Return>

if has('gui_running')
  " Move between buffers. Different on Mac vs not-Mac because option inserts
  " special characters on the Mac and the Command/Super key isn't available off
  " the Mac.
  if is#mac()
    nmap <D-<> :N<Return>
    nmap <D->> :n<Return>
  else
    nmap <A-<> :N<Return>
    nmap <A->> :n<Return>
  endif
endif

" Visual indent reselects the selected text.
xnoremap > >gv
xnoremap < <gv

" Insert a <Tab> with <C-t> rather than <C-v><Tab>.
inoremap <C-t> <C-v><Tab>

" Make it easy to get into the command-line buffer with ';;'. First, create
" private mappings:
nnoremap <SID>(command-line-enter) q:
xnoremap <SID>(command-line-enter) q:
nnoremap <SID>(command-line-norange) q:<C-U>
" Next, use these private mappings. This makes it harder to override.
nmap ;; <SID>(command-line-enter)
xmap ;; <SID>(command-line-enter)

" Treat <Space> as a type of <Leader>. This can be used by other scripts.
" Space by itself acts as <Nop> on timeout.
nmap <Space> [Space]
xmap <Space> [Space]
nnoremap [Space] <Nop>
xnoremap [Space] <Nop>

" Toggle a number of options:
nnoremap <silent> [Space].  :<C-U>call hs#toggleOption('relativenumber')<CR>
nnoremap <silent> [Space]m  :<C-U>call hs#toggleOption('paste')<CR>
nnoremap <silent> [Space]/  :<C-U>call hs#toggleOption('hlsearch')<CR>
nnoremap <silent> [Space]cl :<C-U>call hs#toggleOption('cursorline')<CR>
nnoremap <silent> [Space]ar :<C-U>call hs#toggleOption('autoread')<CR>
nnoremap <silent> [Space]sp :<C-U>call hs#toggleOption('spell')<CR>
nnoremap <silent> [Space]w  :<C-U>call hs#toggleOption('wrap')<CR>
nnoremap <silent> [Space]z  :<C-U>call <SID>MaybeSpellcheck()<CR>
nnoremap [Space]! :Shell<Space>

nmap <silent> [Space]P <Plug>WhitespasteBefore
nmap <silent> [Space]p <Plug>WhitespasteAfter
xmap <silent> [Space]P <Plug>WhitespasteVisual
xmap <silent> [Space]p <Plug>WhitespasteVisual
nnoremap <silent> [Space]S :<C-U>Switch<CR>

" Edit/reload .vimrc
nnoremap <silent> [Space]ev :<C-U>edit $MYVIMRC<CR>
nnoremap <silent> [Space]rv :<C-U>source $MYVIMRC \| echo "source $MYVIMRC"<CR>

" Change current directory to the directory of the current buffer.
nnoremap <silent> [Space]cd :<C-U>CDToBufferDir<CR>

" Toggle diff whitespace comparison.
nnoremap <silent> [Space]dw :<C-U>call <SID>ToggleDiffWhitespace()<CR>

" Enable ArgWrap
nnoremap <silent> [Space]aw :<C-U>ArgWrap<CR>

" Vim-Test
nmap <silent> [Space]tt :<C-U>TestNearest<CR>
nmap <silent> [Space]tf :<C-U>TestFile<CR>
nmap <silent> [Space]ta :<C-U>TestSuite<CR>
nmap <silent> [Space]tl :<C-U>TestLast<CR>
nmap <silent> [Space]tg :<C-U>TestVisit<CR>

" Toggle gj/gk behaviours for j/k behaviours. The default is gk/gj
" (display-linewise) movement, not j/k (linewise) movement.
noremap j gj
noremap k gk
noremap <silent> [Space]gj :<C-U>ToggleGJK<CR>

" Change tab width.
nnoremap <silent> [Space]t2 :<C-U>setlocal shiftwidth=2 softtabstop=2<CR>
nnoremap <silent> [Space]t4 :<C-U>setlocal shiftwidth=4 softtabstop=4<CR>
nnoremap <silent> [Space]t8 :<C-U>setlocal shiftwidth=8 softtabstop=8<CR>

" Jump folds.
noremap <silent> [Space]j zj
noremap <silent> [Space]k zk

" Buffergator
nnoremap <silent> [Space]b :<C-U>BuffergatorToggle<CR>
nnoremap <silent> [Space]to :<C-U>BuffergatorTabsOpen<CR>
nnoremap <silent> [Space]tc :<C-U>BuffergatorTabsClose<CR>
nnoremap <silent> [Space][b :<C-U>BuffergatorMruCyclePrev<CR>
nnoremap <silent> [Space]]b :<C-U>BuffergatorMruCycleNext<CR>

" YAML Toggle Flatness
nnoremap <silent> [Space]y :<C-U>YAMLToggleFlatness<CR>

" Look into vim-ref
nmap <silent> [Space]K <Plug>(ref-keyword)
vmap <silent> [Space]K <Plug>(ref-keyword)

" Grepper
nnoremap <silent> [Space]* :<C-U>Grepper -tool ag -cword -noprompt<CR>
nmap gS <plug>(GrepperOperator)
xmap gS <plug>(GrepperOperator)

" Set keyword lookup to be vim help. Because of the binding above, remap this
" behaviour to <Leader>K (\K by default).
nnoremap <silent> [Space]H K
xnoremap <silent> [Space]H K

" Dash lookup
nmap <silent> [Space]D <Plug>DashSearch
nmap <silent> [Space]G <Plug>DashGlobalSearch

" Treat q as a type of <Leader>. This can be used by other scripts. q by itself
" acts as <Nop> on timeout.
nmap q [Quickfix]
nnoremap [Quickfix] <Nop>

" Open a quickfix window for the last search.
nnoremap [Quickfix]/ :execute 'vimgrep /' . @/ . '/g %'<CR>:copen<CR>

" Toggle quickfix window.
nnoremap <silent> [Quickfix]q :<C-U>ToggleQuickfixWindow<CR>
nnoremap <silent> [Quickfix]n :<C-U>cnext<CR>
nnoremap <silent> [Quickfix]p :<C-U>cprevious<CR>

" Smart }.
nnoremap <silent> } :<C-U>call ForwardParagraph()<CR>
onoremap <silent> } :<C-U>call ForwardParagraph()<CR>
xnoremap <silent> } <Esc>:<C-U>call ForwardParagraph()<CR>mzgv`z

" Smart home and smart end.
nnoremap <silent> gh  :<C-U>call SmartHome('n')<CR>
nnoremap <silent> gl  :<C-U>call SmartEnd('n')<CR>
xnoremap <silent> gh  <Esc>:<C-U>call SmartHome('v')<CR>
xnoremap <silent> gl  <Esc>:<C-U>call SmartEnd('v')<CR>

" Disable Ex mode shortcut.
nnoremap Q gqip

" Like gv, reselect the last changed text.
nnoremap gz `[v`]
" Specify the last changed text as {motion}.
xnoremap <silent> gz :<C-U>normal gz<CR>
onoremap <silent> gz :<C-U>normal gz<CR>

" Select rectangle.
xnoremap r <C-v>
" Select until end of current line in visual mode.
xnoremap v $h

" Paste next line.
nnoremap <silent> gp o<Esc>p^
nnoremap <silent> gP O<Esc>P^
xnoremap <silent> gp o<Esc>p^
xnoremap <silent> gP O<Esc>P^

" Folding.
" <Tab> opens/closes the outermost fold.
map <Tab> za
" <Shift-Tab> opens/closes all folds, recursively.
map <S-Tab> zA

" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO
xnoremap zO zCzO

" Use <Leader>z to "focus" the current fold.
nnoremap <Leader>z zMzvzz

" Move view to the top/centre/bottom
noremap <expr> zz (winline() == (winheight(0)+1)/ 2) ?
      \ 'zt' : (winline() == 1)? 'zb' : 'zz'

" Keep search matches in the middle of the window and pulse the line when
" moving to them.
nnoremap <silent> n nzzzv:call <SID>PulseCursorLine(4, 20, 5)<CR>
nnoremap <silent> N Nzzzv:call <SID>PulseCursorLine(4, 20, 5)<CR>
augroup hsautocmd-pulse
  autocmd!
  autocmd FocusGained * call s:PulseCursorLine(4, 20, 5)
augroup END

" Make CTRL-^ rebound to the line and column in the alternate file.
noremap <C-^> <C-^>`"

" Show more information under <C-G>.
noremap <C-G> 2<C-G>

" Visual Mode */# from Scrooloose
xnoremap <silent> * :<C-U>call <SID>VSetSearch()<CR>//<CR><C-O>
xnoremap <silent> # :<C-U>call <SID>VSetSearch()<CR>??<CR><C-O>

" Don't move on */#
nnoremap * *<C-O>
nnoremap # #<C-O>

" Center the viewport when jumping around.
nnoremap g; g;zz
nnoremap g, g,zz

" Duplicate the current selection.
xnoremap D y'>p

nnoremap <D-O> :<C-U>CtrlP<CR>
xnoremap <D-O> :<C-U>CtrlP<CR>

" Insert the path of the currently edited file into a command.
cmap <C-R><C-P> <C-R>=expand("%:p:h") . "/"<CR>

" Functions for the maps within.
function! s:PulseCursorLine(times, delay, ...)
  let l:cl = &l:cursorline
  let l:index = 0
  let l:delay = 'sleep ' . a:delay . 'm'
  if a:0 > 0
    let l:last = 'sleep ' . a:1 . 'm'
  else
    let l:last = a:delay
  endif

  while l:index < a:times
    setlocal cursorline!
    redraw

    let l:index = l:index + 1

    if l:index < a:times
      exec l:delay
    else
      exec l:last
    endif
  endwhile

  let &l:cursorline = l:cl
endfunction

function! s:VSetSearch()
  let l:temp = @@
  normal! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = l:temp
endfunction

function! s:ToggleDiffWhitespace()
  if &diffopt =~# 'iwhite'
    set diffopt-=iwhite
  else
    set diffopt+=iwhite
  endif
  diffupdate
endfunction

function! s:MaybeSpellcheck()
  if &spell
    setlocal nospell
  else
    setlocal spell
    normal z=
  endif
endfunction
