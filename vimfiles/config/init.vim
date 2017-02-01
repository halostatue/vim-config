" Basic Initialization.

if is#windows() | set shellslash | endif

if has('vim_starting') && empty(glob('~/.vim/autoload/plug.vim'))
  " Automatically install vim-plug.
  echo "Installing vim-plug.\n"
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup vim-plug-install
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
else
  augroup vim-plug-install
    autocmd VimEnter *
          \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
          \|   PlugInstall --sync | q
          \| endif
  augroup END
endif

let g:loaded_getscriptPlugin = 1 " Disable GetLatestVimScripts
let g:loaded_matchparen = 1 " Disable matchparen
let g:loaded_2html_plugin = 1 " Disable 2html
let g:loaded_vimballPlugin = 1 " Disable vimballs

" Get the value of $PATH from a login shell if MacVim.app was started from the
" Finder.
if has('gui_macvim') && has('gui_running')
  " ps -xc: just the command, not the command-line; including non-terminal
  "         processes
  " grep -wsc: suppress errors; word boundary; count of matches.
  if system('ps -xc | grep -wsc Vim') > 1
    " If your shell is not on this list, it may be just because we have not
    " tested it.  Try adding it to the list and see if it works. If so, please
    " post a note to the vim-mac list!
    if $SHELL =~# '/\(sh\|csh\|bash\|tcsh\|zsh\)$'
      let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
      let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
    endif
  endif

  if executable(expand('$HOME/.brew/bin/git'))
    let g:fugitive_git_executable = expand('$HOME/.brew/bin/git')
  endif

  " MacVIM shift+arrow-keys behavior (required in .vimrc)
  " let g:macvim_hig_shift_movement=1
endif
