scriptencoding utf-8

function! hs#status#buffer() abort
  return '['
        \ . bufnr('%')
        \ . '/'
        \ . bufnr('$')
        \ . '] '
endfunction

function! hs#status#preview() abort
  return &previewwindow ? '[preview]' : ''
endfunction

function! hs#status#filemodifiers() abort
  if &buftype ==# 'help'
    return '[help]'
  elseif &buftype ==# 'quickfix'
    return ''
  endif

  let l:state = []
  if &modified
    let l:state += ['+']
  endif
  if !&modifiable
    let l:state += ['-']
  endif
  if &readonly
    let l:state += ['🚫']
  endif

  if !empty(l:state)
    let l:state = '[' . join(l:state, '') . ']'
  else
    let l:state = ''
  endif

  let l:filetype = ''
  if &filetype !=# ''
    let l:filetype = '[' . &filetype . ']'
  endif

  let l:result = join([l:state, l:filetype], '')

  if !empty(l:result)
    let l:result .= ' '
  endif

  return l:result
endfunction

function! hs#status#fugitive() abort
  let l:result = hs#try('fugitive#statusline')
  if !empty(l:result)
    let l:result .= ' '
  end
  return l:result
endfunction

function! hs#status#asyncrun() abort
  return get(g:, 'asyncrun_status', '')
endfunction
