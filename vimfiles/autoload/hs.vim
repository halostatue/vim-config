" Various helpful functions
scriptencoding utf-8

function! hs#tabline() abort
  let l:s = ''

  for l:i in range(1, tabpagenr('$'))
    let l:bufnrs = tabpagebuflist(l:i)
    let l:bufnr = l:bufnrs[tabpagewinnr(l:i) - 1] " 1st window, 1st appears

    let l:no = l:i " display 0-origin tabpagenr.
    let l:mod = getbufvar(l:bufnr, '&modified') ? '!' : ' '

    let l:title =
          \ !exists('*gettabvar') ?
          \      fnamemodify(bufname(l:bufnr), ':t') :
          \ gettabvar(l:i, 'title') !=# '' ?
          \      gettabvar(l:i, 'title') :
          \      fnamemodify((l:i == tabpagenr() ?
          \       getcwd() : gettabvar(l:i, 'cwd')), ':t')

    let l:title = '[' . l:title . ']'

    let l:s .= '%' . l:i . 'T'
    let l:s .= '%#' . (l:i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let l:s .= l:title
    let l:s .= l:mod
    let l:s .= '%#TabLineFill#'
  endfor

  let l:s .= '%#TabLineFill#%T%=%#TabLine#'
  return l:s
endfunction

function! hs#clean_folds() abort
  let l:line = getline(v:foldstart)

  let l:nucolwidth = &foldcolumn + &number * &numberwidth
  let l:windowwidth = winwidth(0) - l:nucolwidth - 13
  let l:foldedlinecount = v:foldend - v:foldstart + 1

  let l:onetab = strpart('          ', 0, &tabstop)
  let l:line = substitute(l:line, '\t', l:onetab, 'g')

  let l:line = strpart(l:line, 0, l:windowwidth - 2 - len(l:foldedlinecount))
  let l:fillcharcount = l:windowwidth - len(l:line) - len(l:foldedlinecount) - 2
  return l:line . '… ' . repeat(' ', l:fillcharcount) . l:foldedlinecount . ' lines'
endfunction

let g:default_foldtext_function = 'hs#clean_folds'
let g:default_foldtext_function = 'FoldCCtext'

function! hs#has_value(varname) abort
  return exists(a:varname) && exists('*' . eval(a:varname))
endfunction

function! hs#smart_foldtext(...) abort
  if a:0 != 0
    let &l:foldtext = a:1
  else
    let l:ftf = &l:foldtext

    if l:ftf =~# 'getline(v:foldstart)'
      if hs#has_value('g:default_foldtext_function')
        let l:ftf = g:default_foldtext_function . '()'
        let &l:foldtext = l:ftf
      else
        setlocal foldtext=foldtext()
      endif
    endif
  endif
endfunction
command! -nargs=? -complete=function SmartFoldText call hs#smart_foldtext(<args>)

function! hs#on_filetype() abort
  " Disable automatically insert comment.
  setl formatoptions-=ro formatoptions+=mMBl

  " Disable auto wrap.
  if &l:textwidth != 70 && &filetype !=# 'help'
    setlocal textwidth=0
  endif

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
function! hs#mkpath(dir, force) abort
  if !isdirectory(a:dir) && &l:buftype ==# '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

function! hs#init_cmdwin() abort
  nnoremap <buffer><silent> q :<C-u>quit<Return>
  nnoremap <buffer><silent> <Tab> :<c-u>quit<Return>

  call cursor(line('$'), 0)

  startinsert!
endfunction

function! hs#toggleOption(option) abort
  execute 'setlocal '.a:option.'!'
  execute 'setlocal '.a:option.'?'
endfunction

function! hs#toggleVariable(variable) abort
  if eval(a:variable)
    execute 'let' a:variable.' = 0'
  else
    execute 'let' a:variable.' = 1'
  endif
  echo printf('%s = %s', a:variable, eval(a:variable))
endfunction

function! hs#isotime() abort
  let l:zv = strftime('%z')
  let l:zone = substitute(l:zv, '\([-+]\)\(\d\{2}\)\(\d\{2}\)', '\1\2:\3', '')
  return strftime('%Y-%m-%dT%H:%M:%S') . l:zone
endfunction

function! hs#download_thesaurus(bang) abort
  if is#windows()
    let l:path = expand('~/vimfiles/thesaurus/mthesaur.txt')
  else
    let l:path = expand('~/.vim/thesaurus/mthesaur.txt')
  endif
  let l:url = 'https://raw.githubusercontent.com/zeke/moby/master/words.txt'
  let l:download = empty(glob(l:path))
  if a:bang ==# '!' | let l:download = 1 | endif

  if l:download
    echo 'Downloading the Moby thesaurus…'
    let l:command = '!curl -fLo ' . l:path . ' --create-dirs ' . l:url
    silent execute l:command
  endif
endfunction
command! -bang DownloadThesaurus call hs#download_thesaurus('<bang>')
