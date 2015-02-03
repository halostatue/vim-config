function! hs#tabline()
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
endfunction

function! hs#clean_folds()
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 13
  let foldedlinecount = v:foldend - v:foldstart + 1

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 2
  return line . '… ' . repeat(" ", fillcharcount) . foldedlinecount . ' lines'
endfunction

let g:default_foldtext_function = 'hs#clean_folds'
let g:default_foldtext_function = 'FoldCCtext'

function! hs#has_value(varname)
  return exists(a:varname) && exists("*" . eval(a:varname))
endfunction

function! hs#smart_foldtext(...)
  if a:0 != 0
    let &l:foldtext = a:1
  else
    let l:ftf = &l:foldtext

    if l:ftf =~ 'getline(v:foldstart)'
      if hs#has_value('g:default_foldtext_function')
        let l:ftf = g:default_foldtext_function . '()'
        let &l:foldtext = l:ftf
      else
        setlocal foldtext=foldtext()
      endif
    endif
  endif
endfunction
command! SmartFoldText call hs#smart_foldtext()

function! hs#on_filetype()
  " Disable automatically insert comment.
  setl formatoptions-=ro formatoptions+=mMBl

  " Disable auto wrap.
  if &l:textwidth != 70 && &filetype !=# 'help'
    setlocal textwidth=0
  endif

  " Use FoldCCtext().
  if &filetype !=# 'help' 
    call hs#smart_foldtext()
  endif

  if !&l:modifiable
    setlocal nofoldenable
    setlocal foldcolumn=0

    if v:version >= 703
      setlocal colorcolumn=
    endif
  endif
endfunction

" Make directory automatically.
function! hs#mkpath(dir, force)
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

function! hs#init_cmdwin()
  nnoremap <buffer><silent> q :<C-u>quit<Return>
  nnoremap <buffer><silent> <Tab> :<c-u>quit<Return>

  call cursor(line('$'), 0)

  startinsert!
endfunction

function! hs#toggleOption(option)
  execute 'setlocal' a:option.'!'
  execute 'setlocal' a:option.'?'
endfunction

function! hs#toggleVariable(variable)
  if eval(a:variable)
    execute 'let' a:variable.' = 0'
  else
    execute 'let' a:variable.' = 1'
  endif
  echo printf('%s = %s', a:variable, eval(a:variable))
endfunction
