" Reload vimrc behaviours automatically
if !has('autocmd') | finish | endif

augroup hsautocmd-allbufs
  autocmd!

  autocmd WinEnter * checktime

  autocmd InsertLeave *
        \ if &paste | set nopaste mouse=ar | echo 'nopaste' | endif
  autocmd InsertLeave * if &l:diff | diffupdate | endif

  " autocmd BufWritePre * CleanWhitespace
  autocmd BufWritePre * call hs#mkpath(expand('<afile>:p:h'), v:cmdbang)

  autocmd FileType,Syntax * call hs#reset_on_filetype()

  " Update filetype.
  autocmd BufWritePost *
        \ if &l:filetype ==# '' || exists('b:ftdetect') |
        \   unlet! b:ftdetect |
        \   filetype detect |
        \ endif

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \  if line('''"') > 1 && line('''"') <= line("$")
        \|   exe 'keepjumps normal g`"'
        \| endif
  autocmd BufReadPost * SmartFoldText
  autocmd BufRead * set modeline number

  " Resize splits when the window is resized
  autocmd VimResized * exe "normal! \<C-W>="
augroup END

augroup hsautocmd-cmdwin
  autocmd!
  autocmd CmdwinEnter * call hs#init_cmdwin()
augroup END

augroup hsautocmd-silence-the-beep
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=
augroup END

augroup hsautocmd-startup
  autocmd!
  autocmd StdinReadPre * let s:std_in = 1

  autocmd VimEnter *
        \  if !argc() && !exists('s:std_in')
        \|   Startify
        \|   NERDTree
        \|   wincmd w
        \| elseif argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in')
        \|   Startify
        \|   execute 'NERDTree' argv()[0]
        \|   wincmd w
        \| endif
        \| if exists('s:std_in') | unlet s:std_in | endif
augroup END
