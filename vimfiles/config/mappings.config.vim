"---------------------------------------------------------------------------
" Key-mappings:

" Use <C-Space> to trigger VimShellTerminal
nmap <C-Space> <C-@>
cmap <C-Space> <C-@>

" Move between buffers. Different on Mac vs not-Mac because option inserts
" special characters on the Mac and the Command/Super key isn't available off
" the Mac.
if has("mac") || has("macunix")
  map <D-<> :N<CR>
  map <D->> :n<CR>
else
  map <A-<> :N<CR>
  map <A->> :N<CR>
endif

" Indent
xnoremap > >gv
xnoremap < <gv

" Insert mode keymappings: "{{{
" <C-t>: insert tab.
inoremap <C-t>  <C-v><TAB>
" <C-d>: delete char.
inoremap <C-d>  <Del>
" <C-a>: move to head.
inoremap <silent><C-a>  <C-o>^
" Enable undo <C-w> and <C-u>.
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-u>  <C-g>u<C-u>

if has('gui_running')
  inoremap <Esc> <Esc>
endif
"}}}

" Command-line mode keymappings:"{{{
" <C-a>, A: move to head.
cnoremap <C-a>          <Home>
" <C-b>: previous char.
cnoremap <C-b>          <Left>
" <C-d>: delete char.
cnoremap <C-d>          <Del>
" <C-e>, E: move to end.
cnoremap <C-e>          <End>
" <C-f>: next char.
cnoremap <C-f>          <Right>
" <C-n>: next history.
cnoremap <C-n>          <Down>
" <C-p>: previous history.
cnoremap <C-p>          <Up>
" <C-k>, K: delete to end.
cnoremap <C-k> <C-\>e getcmdpos() == 1 ?
      \ '' : getcmdline()[:getcmdpos()-2]<CR>
" <C-y>: paste.
cnoremap <C-y>          <C-r>*
"}}}

" Command line buffer."{{{
nnoremap <SID>(command-line-enter) q:
xnoremap <SID>(command-line-enter) q:
nnoremap <SID>(command-line-norange) q:<C-u>

nmap ;;  <SID>(command-line-enter)
xmap ;;  <SID>(command-line-enter)

autocmd HSAutoCmd CmdwinEnter * call s:init_cmdwin()
autocmd HSAutoCmd CmdwinLeave * let g:neocomplcache_enable_auto_select = 1

function! s:init_cmdwin()
  let g:neocomplcache_enable_auto_select = 0
  let b:neocomplcache_sources_list = ['vim_complete']

  nnoremap <buffer><silent> q :<C-u>quit<CR>
  nnoremap <buffer><silent> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> neocomplete#close_popup()."\<CR>"
  inoremap <buffer><expr><C-h> col('.') == 1 ?
        \ "\<Esc>:quit\<CR>" : neocomplete#cancel_popup()."\<C-h>"
  inoremap <buffer><expr><BS> col('.') == 1 ?
        \ "\<Esc>:quit\<CR>" : neocomplete#cancel_popup()."\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ?
        \ "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>\<C-p>"

  call cursor(line('$'), 0)

  startinsert!
endfunction"}}}

" [Space]: Other useful commands "{{{
" Smart space mapping.
" Notice: when starting other <Space> mappings in noremap, disappeared [Space].

nmap  <Space>   [Space]
xmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap  [Space]   <Nop>

" Toggle relativenumber.
nnoremap <silent> [Space].
      \ :<C-u>call ToggleOption('relativenumber')<CR>
nnoremap <silent> [Space]m
      \ :<C-u>call ToggleOption('paste')<CR>:set mouse=<CR>
" Toggle highlight.
nnoremap <silent> [Space]/
      \ :<C-u>call ToggleOption('hlsearch')<CR>
" Toggle cursorline.
nnoremap <silent> [Space]cl
      \ :<C-u>call ToggleOption('cursorline')<CR>
" Set autoread.
nnoremap [Space]ar
      \ :<C-u>setlocal autoread<CR>
" Set spell check.
nnoremap [Space]sp
      \ :<C-u>call ToggleOption('spell')<CR>
nnoremap [Space]w
      \ :<C-u>call ToggleOption('wrap')<CR>

" Easily edit .vimrc and .gvimrc "{{{
nnoremap <silent> [Space]ev  :<C-u>edit $MYVIMRC<CR>
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> [Space]rv :<C-u>source $MYVIMRC \|
      \ echo "source $MYVIMRC"<CR>
"}}}

" Useful save mappings.
nnoremap <silent> <Leader><Leader> :<C-u>update<CR>

" Change current directory.
nnoremap <silent> [Space]cd :<C-u>call <SID>cd_buffer_dir()<CR>
function! s:cd_buffer_dir() "{{{
  let filetype = getbufvar(bufnr('%'), '&filetype')
  if filetype ==# 'vimfiler'
    let dir = getbufvar(bufnr('%'), 'vimfiler').current_dir
  elseif filetype ==# 'vimshell'
    let dir = getbufvar(bufnr('%'), 'vimshell').save_dir
  else
    let dir = isdirectory(bufname('%')) ?
          \ bufname('%') : fnamemodify(bufname('%'), ':p:h')
  endif

  execute 'lcd' fnameescape(dir)
endfunction"}}}

" Exchange gj and gk to j and k. "{{{
command! -nargs=? -bar -bang ToggleGJK call s:ToggleGJK()
nnoremap <silent> [Space]gj :<C-u>ToggleGJK<CR>
xnoremap <silent> [Space]gj :<C-u>ToggleGJK<CR>
function! s:ToggleGJK()
  if exists('b:enable_mapping_gjk') && b:enable_mapping_gjk
    let b:enable_mapping_gjk = 0
    noremap <buffer> j j
    noremap <buffer> k k
    noremap <buffer> gj gj
    noremap <buffer> gk gk

    xnoremap <buffer> j j
    xnoremap <buffer> k k
    xnoremap <buffer> gj gj
    xnoremap <buffer> gk gk
  else
    let b:enable_mapping_gjk = 1
    noremap <buffer> j gj
    noremap <buffer> k gk
    noremap <buffer> gj j
    noremap <buffer> gk k

    xnoremap <buffer> j gj
    xnoremap <buffer> k gk
    xnoremap <buffer> gj j
    xnoremap <buffer> gk k
  endif
endfunction"}}}

" Change tab width. "{{{
nnoremap <silent> [Space]t2 :<C-u>setl shiftwidth=2 softtabstop=2<CR>
nnoremap <silent> [Space]t4 :<C-u>setl shiftwidth=4 softtabstop=4<CR>
nnoremap <silent> [Space]t8 :<C-u>setl shiftwidth=8 softtabstop=8<CR>
"}}}

" Toggle options. "{{{
function! ToggleOption(option_name)
  execute 'setlocal' a:option_name.'!'
  execute 'setlocal' a:option_name.'?'
endfunction  "}}}
" Toggle variables. "{{{
function! ToggleVariable(variable_name)
  if eval(a:variable_name)
    execute 'let' a:variable_name.' = 0'
  else
    execute 'let' a:variable_name.' = 1'
  endif
  echo printf('%s = %s', a:variable_name, eval(a:variable_name))
endfunction  "}}}
"}}}

" Disable Ex-mode and make it reformat the current paragraph.
nnoremap Q gqip

" q: Quickfix  "{{{
" The prefix key.
nmap q [Quickfix]
nnoremap [Quickfix]   <Nop>

" Toggle quickfix window.
nnoremap <silent> [Quickfix]q
      \ :<C-u>call <SID>toggle_quickfix_window()<CR>
function! s:toggle_quickfix_window()
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
    copen
    setlocal nowrap
    setlocal whichwrap=b,s
  endif
endfunction
"}}}

" Like gv, but select the last changed text.
nnoremap gz  `[v`]
" Specify the last changed text as {motion}.
vnoremap <silent> gz  :<C-u>normal gz<CR>
onoremap <silent> gz  :<C-u>normal gz<CR>

" Auto escape / and ? in search command.
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'

" Smart }."{{{
nnoremap <silent> } :<C-u>call ForwardParagraph()<CR>
onoremap <silent> } :<C-u>call ForwardParagraph()<CR>
xnoremap <silent> } <Esc>:<C-u>call ForwardParagraph()<CR>mzgv`z
function! ForwardParagraph()
  let cnt = v:count ? v:count : 1
  let i = 0
  while i < cnt
    if !search('^\s*\n.*\S','W')
      normal! G$
      return
    endif
    let i = i + 1
  endwhile
endfunction
"}}}

" Smart home and smart end."{{{
nnoremap <silent> gh  :<C-u>call SmartHome('n')<CR>
nnoremap <silent> gl  :<C-u>call SmartEnd('n')<CR>
xnoremap <silent> gh  <Esc>:<C-u>call SmartHome('v')<CR>
xnoremap <silent> gl  <Esc>:<C-u>call SmartEnd('v')<CR>
" Smart home function"{{{
function! SmartHome(mode)
  let curcol = col('.')

  if &wrap
    normal! g^
  else
    normal! ^
  endif
  if col('.') == curcol
    if &wrap
      normal! g0
    else
      normal! 0
    endif
  endif

  if a:mode == "v"
    normal! msgv`s
  endif

  return ""
endfunction"}}}

" Smart end function"{{{
function! SmartEnd(mode)
  let curcol = col('.')
  let lastcol = a:mode ==# 'i' ? col('$') : col('$') - 1

  " Gravitate towards ending for wrapped lines
  if curcol < lastcol - 1
    call cursor(0, curcol + 1)
  endif

  if curcol < lastcol
    if &wrap
      normal! g$
    else
      normal! $
    endif
  else
    normal! g_
  endif

  " Correct edit mode cursor position, put after current character
  if a:mode == "i"
    call cursor(0, col(".") + 1)
  endif

  if a:mode == "v"
    normal! msgv`s
  endif

  return ""
endfunction "}}}
"}}}

" Select rectangle.
xnoremap r <C-v>
" Select until end of current line in visual mode.
xnoremap v $h

" Paste next line.
nnoremap <silent> gp o<Esc>p^
nnoremap <silent> gP O<Esc>P^
xnoremap <silent> gp o<Esc>p^
xnoremap <silent> gP O<Esc>P^

" Redraw.
nnoremap <silent> <C-l> :<C-u>redraw!<CR>

" Folding."{{{
" <Tab> opens/closes the outermost fold.
nmap <Tab> za
vmap <Tab> za
omap <Tab> za
" <Shift-Tab> opens/closes all folds, recursively.
nmap <S-Tab> za
vmap <S-Tab> za
omap <S-Tab> za

" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO
vnoremap zO zCzO

" Jump folds.
noremap [Space]j zj
noremap [Space]k zk

" Use <Leader>z to "focus" the current fold.
nnoremap <Leader>z zMzvzz
"}}}

" Substitute.
xnoremap s :s//g<Left><Left>

" Move to top/center/bottom.
noremap <expr> zz (winline() == (winheight(0)+1)/ 2) ?
      \ 'zt' : (winline() == 1)? 'zb' : 'zz'

" Capitalize.
nnoremap gu gUiw`]

" Clear highlight.
nnoremap <Esc><Esc> :nohlsearch<CR>:match<CR>
"}}}

" Read pdf
if executable('pdftotext')
  command! -complete=file -nargs=1 Pdf call s:read_pdf(<q-args>)
  function! s:read_pdf(file)
    enew
    execute 'read !pdftotext -nopgbrk -layout' a:file '-'
    setlocal nomodifiable
    setlocal nomodified
  endfunction
endif

" Error toggles ----------------------------------------------------------- {{{
command! ErrorsToggle call <SID>ErrorsToggle()
function! s:ErrorsToggle() " {{{
  if exists("w:is_error_window")
    unlet w:is_error_window
    exec "q"
  else
    exec "Errors"
    lopen
    let w:is_error_window = 1
  endif
endfunction " }}}

command! -bang -nargs=? QFixToggle call <SID>QFixToggle(<bang>0)
function! s:QFixToggle(forced) " {{{
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction " }}}

nmap <silent> <leader>et :ErrorsToggle<cr>
nmap <silent> <leader>qt :QFixToggle<cr>
" }}}

function! s:PulseCursorLine()
  let current_window = winnr()

  windo set nocursorline
  execute current_window . 'wincmd w'

  setlocal cursorline

  redir => old_hi
  silent execute 'hi CursorLine'
  redir END
  let old_hi = split(old_hi, '\n')[0]
  let old_hi = substitute(old_hi, 'xxx', '', '')

  hi CursorLine guibg=#2a2a2a ctermbg=233
  redraw
  sleep 20m

  hi CursorLine guibg=#333333 ctermbg=235
  redraw
  sleep 20m

  hi CursorLine guibg=#3a3a3a ctermbg=237
  redraw
  sleep 20m

  hi CursorLine guibg=#444444 ctermbg=239
  redraw
  sleep 20m

  hi CursorLine guibg=#3a3a3a ctermbg=237
  redraw
  sleep 20m

  hi CursorLine guibg=#333333 ctermbg=235
  redraw
  sleep 20m

  hi CursorLine guibg=#2a2a2a ctermbg=233
  redraw
  sleep 20m

  execute 'hi ' . old_hi

  windo set cursorline
  execute current_window . 'wincmd w'
endfunction

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap <silent> n nzzzv:call <SID>PulseCursorLine()<CR>
nnoremap <silent> N Nzzzv:call <SID>PulseCursorLine()<CR>

" Make CTRL-^ rebound to the line and *column* in the previous file
noremap <C-^> <C-^>`"

" Make "gf" rebound to last cursor position (line *and* column)
noremap gf gf`"

" Show more information under <C-G>
noremap <C-G> 2<C-G>

" Capitalize the first word or the selected text.
nnoremap <Leader>cc :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>
vnoremap <Leader>cc :s/\%V\(\w\)\(\w*\)\%V/\u\1\L\2/g<CR>

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap <silent> * :<C-U>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap <silent> # :<C-U>call <SID>VSetSearch()<CR>??<CR><c-o>

" Don't move on *
nnoremap * *<c-o>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" It's 2011.
noremap j gj
noremap k gk

" Error navigation {{{
"             Location List     QuickFix Window
"            (e.g. Syntastic)     (e.g. Ack)
"            ----------------------------------
" Next      |     M-k               M-Down     |
" Previous  |     M-l                M-Up      |
"            ----------------------------------
if IsMac()
  nnoremap <D-M-K> :lnext<CR>zvzz
  nnoremap <D-M-L> :lprevious<CR>zvzz
  inoremap <D-M-K> <Esc>:lnext<CR>zvzz
  inoremap <D-M-L> <Esc>:lprevious<CR>zvzz
  nnoremap <D-M-Down> :cnext<CR>zvzz
  nnoremap <D-M-Up> :cprevious<CR>zvzz
else
  nnoremap <M-K> :lnext<CR>zvzz
  nnoremap <M-L> :lprevious<CR>zvzz
  inoremap <M-K> <Esc>:lnext<CR>zvzz
  inoremap <M-L> <Esc>:lprevious<CR>zvzz
  nnoremap <M-Down> :cnext<CR>zvzz
  nnoremap <M-Up> :cprevious<CR>zvzz
endif

" Open a Quickfix window for the last search.
nnoremap <silent> <Leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" }}}

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
imap <S-Insert> x<Esc>:set paste<CR>:call <SID>NormalPaste()<CR>:set nopaste<CR>s
cmap <S-Insert> <C-R>*
vmap <S-Insert> "-x:set paste<CR>:call <SID>SelectPaste()<CR>:set nopaste<CR>

" Easier linewise reselection
nnoremap <leader>V V`]

function! s:WhenPUMVisible(ifVisible, ifNotVisible)
  if pumvisible()
    return a:ifVisible
  else
    return a:ifNotVisible
  endif
endfunction

" If a popupmenu is visible (pumvisible), change the behaviour of various
" keys to do something meaningful with the menu.
inoremap <expr> <Esc> <SID>WhenPUMVisible("\<C-E>", "\<Esc>")
inoremap <expr> <Down> <SID>WhenPUMVisible("\<C-N>", "\<Down>")
inoremap <expr> <Up> <SID>WhenPUMVisible("\<C-P>", "\<Up>")
inoremap <expr> <PageDown> <SID>WhenPUMVisible("\<PageDown>\<C-P>\<C-N>", "\<PageDown>")
inoremap <expr> <PageUp> <SID>WhenPUMVisible("\<PageUp>\<C-P>\<C-N>", "\<PageUp>")

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <leader>e
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <leader>t
map <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+R, Ctrl+P
cmap <C-R><C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Shell
function! s:ExecuteInShell(command) " {{{
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber
    silent! execute 'silent %!'. command
    silent! redraw
    silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>:AnsiEsc<CR>'
    silent! execute 'nnoremap <silent> <buffer> q :q<CR>'
    silent! execute 'AnsiEsc'
endfunction " }}}
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
nnoremap <leader>! :Shell

nnoremap <silent> <C-P> :<c-u>CtrlP<CR>
