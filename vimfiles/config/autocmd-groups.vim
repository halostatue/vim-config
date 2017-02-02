" Reload vimrc behaviours automatically
if !has('autocmd') | finish | endif

augroup hsautocmd-allbufs
  " Check timestamp more for 'autoread'.
  autocmd WINENTER * checktime

  " Disable paste.
  autocmd InsertLeave *
        \ if &paste | set nopaste mouse=ar | echo 'nopaste' | endif
  " Update diff.
  autocmd InsertLeave * if &l:diff | diffupdate | endif

  autocmd BufWritePre * call hs#mkpath(expand('<afile>:p:h'), v:cmdbang)

  autocmd FileType,Syntax * call hs#on_filetype()

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
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  autocmd BufReadPost * SmartFoldText
  autocmd BufRead * set modeline number

  " Resize splits when the window is resized
  autocmd VimResized * exe "normal! \<C-W>="
augroup END

augroup hsautocmd-cmdwin
  autocmd CmdwinEnter * call hs#init_cmdwin()
augroup END

augroup hsautocmd-startup
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
augroup END

augroup hsautocmd-flagship
  autocmd User Flags call Hoist("window", "SyntasticStatuslineFlag")
  autocmd User Flags call Hoist("global", "%{&ignorecase ? '[IC]' : ''}")
augroup END
