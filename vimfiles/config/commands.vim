command! -nargs=0 -bar ToggleGJK call <SID>ToggleGJK()
command! -nargs=0 -bar CDToBufferDir call <SID>CDToBufferDir()
command! -nargs=0 -bar ToggleQuickfixWindow call <SID>ToggleQuickfixWindow()
command! -nargs=0 -bar ToggleLocationWindow call <SID>ToggleLocationWindow()
command! -complete=shellcmd -nargs=+ Shell call <SID>ExecuteInShell(<q-args>)
" Show the stack of syntax highlighting classes affecting whatever is under the
" cursor.
command! -nargs=0 -bar SynStack call <SID>SynStack

" Display diff with the file.
command! -nargs=1 -complete=file Diff vertical diffsplit <args>
" Display diff from last save.
command! -nargs=0 DiffOrig vert new | setlocal bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" Disable diff mode.
command! -nargs=0 Undiff setlocal nodiff noscrollbind wrap
" Show the output in a new tab.
command! -nargs=+ -complete=command TabMessage call <SID>TabMessage(<q-args>)

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
endfunction

function! s:CDToBufferDir()
  let l:filetype = getbufvar(bufnr('%'), '&filetype')
  if l:filetype ==# 'vimfiler'
    let l:dir = getbufvar(bufnr('%'), 'vimfiler').current_dir
  elseif l:filetype ==# 'vimshell'
    let l:dir = getbufvar(bufnr('%'), 'vimshell').save_dir
  else
    let l:dir = isdirectory(bufname('%')) ?
          \ bufname('%') : fnamemodify(bufname('%'), ':p:h')
  endif

  execute 'lcd' fnameescape(l:dir)
endfunction

function! s:ToggleQuickfixWindow()
  let l:w = winnr('$')
  cclose
  if l:w == winnr('$')
    copen
    setlocal nowrap whichwrap=b,s
  endif
endfunction

function! s:ToggleLocationWindow()
  let l:w = winnr('$')
  lclose
  if l:w == winnr('$')
    lopen
    setlocal nowrap whichwrap=b,s
  endif
endfunction

function! ForwardParagraph()
  let l:cnt = v:count ? v:count : 1
  let l:i = 0
  while l:i < l:cnt
    if !search('^\s*\n.*\S','W')
      normal! G$
      return
    endif
    let l:i = l:i + 1
  endwhile
endfunction

function! SmartHome(mode)
  let l:curcol = col('.')

  if &wrap
    normal! g^
  else
    normal! ^
  endif
  if col('.') == l:curcol
    if &wrap
      normal! g0
    else
      normal! 0
    endif
  endif

  if a:mode ==# 'v'
    normal! msgv`s
  endif

  return ''
endfunction

" Smart end function
function! SmartEnd(mode)
  let l:curcol = col('.')
  let l:lastcol = a:mode ==# 'i' ? col('$') : col('$') - 1

  " Gravitate towards ending for wrapped lines
  if l:curcol < l:lastcol - 1
    call cursor(0, l:curcol + 1)
  endif

  if l:curcol < l:lastcol
    if &wrap
      normal! g$
    else
      normal! $
    endif
  else
    normal! g_
  endif

  " Correct edit mode cursor position, put after current character
  if a:mode ==# 'i'
    call cursor(0, col('.') + 1)
  endif

  if a:mode ==# 'v'
    normal! msgv`s
  endif

  return ''
endfunction

function! s:ExecuteInShell(command)
    let l:command = join(map(split(a:command), 'expand(v:val)'))
    let l:winnr = bufwinnr('^' . l:command . '$')
    silent! execute l:winnr < 0 ? 'botright vnew ' . fnameescape(l:command) : l:winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber
    silent! execute 'silent %!'. l:command
    silent! redraw
    silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . l:command . ''')<CR>:AnsiEsc<CR>'
    silent! execute 'nnoremap <silent> <buffer> q :q<CR>'
    silent! execute 'AnsiEsc'
endfunction

function! s:SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, ''name'')'), ' > ')
endfunction

function! s:TabMessage(cmd)
  let l:message = ''
  redir => l:message
  silent execute a:cmd
  redir END
  tabnew
  silent put=l:message
  set nomodified
endfunction

if executable('pdftotext')
  command! -complete=file -nargs=1 Pdf call s:ReadPDF(<q-args>)
  function! s:ReadPDF(file)
    enew
    execute 'read !pdftotext -nopgbrk -layout' a:file '-'
    setlocal nomodifiable
    setlocal nomodified
  endfunction
endif
