scriptencoding utf-8

if hs#plug#in('vim-ctrlspace')
  function! s:ctrlspace_command(...)
    for l:cmd in a:000
      if executable(l:cmd)
        return l:cmd . ' -l --nocolor --hidden -g "" --ignore .git'
      endif
    endfor
    return ''
  endfunction

  let g:CtrlSpaceGlobCommand = s:ctrlspace_command('pt', 'ag')

  delfunction s:ctrlspace_command

  let g:CtrlSpaceCacheDir = expand($HOME . '/.cache')
endif
