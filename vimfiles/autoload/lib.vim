" Various helpful library functions, pulled mostly from
" https://github.com/AndrewRadev/Vimfiles
scriptencoding utf-8

" Capitalize first letter of argument:
" foo -> Foo
function! lib#capitalize(word) abort
  return substitute(a:word, '^\w', '\u\0', 'g')
endfunction

function! lib#camel_case(word) abort
  return substitute(a:word, '_\(.\)', '\u\1', 'g')
endfunction

function! lib#capital_camel_case(word) abort
  return lib#capitalize(lib#camel_case(a:word))
endfunction

function! lib#underscore(word) abort
  return tolower(substitute(a:word, '\([[:upper:]]\+[[:lower:]]*\)', '_\L\1', 'g')[1:])
endfunction

function! lib#dasherize(word) abort
  return tolower(substitute(a:word, '\([[:upper:]]\+[[:lower:]]*\)', '-\L\1', 'g')[1:])
endfunction

function! lib#lowercase(word) abort
  return substitute(a:word, '^\w', '\l\0', 'g')
endfunction

" Join the list of items given with the current path separator, escaping the
" backslash in Windows for use in regular expressions.
function! lib#rxpath(...) abort
  return join(a:000, has('win32') ? '\\' : '/')
endfunction

function! lib#in(haystack, needle, ...) abort
  if type(a:haystack) == type('')
    return strdix(a:haystack, a:needle) != -1
  elseif type(a:haystack) == type([])
    return index(a:haystack, a:needle) != -1
  elseif type(a:haystack) == type({})
    return index(values(a:haystack), a:needle) != -1
  endif
endfunction

function! lib#ltrim(s) abort
  return substitute(a:s, '^\_s\+', '', '')
endfunction
function! lib#rtrim(s) abort
  return substitute(a:s, '\_s\+$', '', '')
endfunction
function! lib#trim(s) abort
  return lib#rtrim(lib#ltrim(a:s))
endfunction
function! lib#trim_list(l) abort
  return map(a:l, 'lib#trim(v:val)')
endfunction
function! lib#trim_lines(s) abort
  return join(lib#trim_list(split(a:s, "\n")), "\n")
endfunction

function! lib#wrap(surround, string) abort
  return empty(a:string) ? '' : a:surround . a:string . a:surround
endfunction

function! lib#extract_rx(expr, pat, sub) abort
  let l:rx = a:pat
  if l:rx[0] !=# '^'
    let l:rx = '^.*' . l:rx
  endif
  if l:rx[-1:] !=# '$'
    let l:rx = l:rx . '.*$'
  endif

  return substitute(a:expr, l:rx, a:sub, '')
endfunction

function! lib#in_place(command) abort
  let l:saved_view = winsaveview()
  execute a:command
  call winrestview(l:saved_view)
endfunction

function! lib#with_saved_state(command) abort
  let l:ch = histnr('/')
  call lib#in_place(a:command)
  if l:ch != histnr('/')
    call histdel('/', -1)
    let @/ = histget('/', -1)
  endif
endfunction

function! lib#vim_include_expression(fname) abort
  if getline('.') =~# '^\s*runtime'
    for l:dir in split(&runtimepath, ',')
      let l:fname = l:dir . '/' . a:fname
      if filereadable(l:fname)
        return l:fname
      endif
    endfor
  endif

  return a:fname
endfunction

" Execute the normal mode motion "motion" and return the text it marks. Note
" that the motion needs to include a visual mode key, like "V", "v" or "gv".
function! lib#get_motion(motion) abort
  let l:cursor = getpos('.')
  let l:reg = getreg('z')
  let l:type = getregtype('z')

  execute 'normal! ' . a:motion . '"zy'
  let l:text = @z

  call setreg('z', l:reg, l:type)
  call setpos('.', l:cursor)

  return l:text
endfunction

function! lib#mark_visual(command, start, end) abort
  if a:start != line('.')
    execute a:start
  endif

  silent! execute a:start . ',' . a:end . 'foldopen'

  if a:end > a:start
    execute 'normal! ' . a:command . (a:end - a:start) . 'jg_'
  else
    execute 'normal! ' . a:command . 'g_'
  endif
endfunction

function! lib#switch_window(bufname) abort
  execute bufwinnr(a:bufname) . 'wincmd w'
endfunction

function! lib#default_register() abort
  if &clipboard =~# 'unnamedplus'
    return '+'
  elseif &clipboard =~# 'unnamed'
    return '*'
  else
    return '"'
  endif
endfunction

function! lib#set_buffer_updater(bufnr, callback, interval) abort
  let l:timer = timer_start(a:interval, a:callback, { 'repeat': -1 })
  augroup lib_buffer_updater
    autocmd!
    execute 'autocmd BufUnload <buffer=' . a:bufnr . '> call timer_stop(' . l:timer . ')'
  augroup END
endfunction
