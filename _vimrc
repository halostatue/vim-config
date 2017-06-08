" vimrc for Austin Ziegler <halostatue@gmail.com>
"
" The options set in this file are known to work with Vim 7.4 or later.
" Earlier versions may need some changes.
"
" This has been cribbed from a number of sources over the years.

" Skip initialization for a vim-tiny or vim-small environment.
if !1 | finish | endif

" if has('vim_starting')
"   " Use Vim settings, rather than Vi settings (much better!). This must be
"   " first, because it changes other options as a side effect.
"   set nocompatible
" endif

" setlocal verbose=0 " Turn off verbose mode for this file.

call config#init()

call plug#begin(cache#for('plugged'))
SourceConfig plugs
call plug#end()

SourceConfig editing
SourceConfig viewing
SourceConfig autocmd-groups
SourceConfig filetype-defaults
SourceConfig plugin-settings
SourceConfig syntax-settings
SourceConfig commands
SourceConfig abbreviations
SourceConfig key-mappings

SourceConfig plugs/*

if is#windows()
  SourceConfig windows
elseif is#mac()
  SourceConfig mac
else
  SourceConfig unix
endif

if has('gui_running')
  SourceConfig gui
else
  SourceConfig terminal
endif

set secure
