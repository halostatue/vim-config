" Edit defaults

" Reasonable modern tab settings
set tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab

set autowrite     " Automatically write changed buffers to disk.
set modeline      " Turn on modeline.
set nojoinspaces  " Only one space after punctuation.
set scrolljump=2  " Scroll at least two lines for offscreen moves
set keymodel=startsel,stopsel " Selection with shift+arrows

if has('gui_running') || has('xterm_clipboard')
  if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
  else
    set clipboard& clipboard+=unnamed
  endif
endif

" Match settings.
set showmatch cpoptions-=m matchtime=3 matchpairs+=<:>

set hidden " Display another buffer when current buffer isn't saved.
set infercase " Ignore case on insert completion.

if has('folding')
  " Folding settings.
  set foldenable foldmethod=marker foldcolumn=1 commentstring=#\ %s
  set foldlevelstart=5 foldnestmax=10
end

  " Use ag for built-in grep capabilities instead of grep.
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Use grep.
  set grepprg=grep\ -inH
endif

set keywordprg=:help

set timeout timeoutlen=500 ttimeoutlen=100 " Keymapping timeout.
set updatetime=1000 " CursorHold time.
set directory=~/.cache/vim-tmp//,/var/tmp//,/tmp//,/private/tmp// " swap path

if has('persistent_undo') | set undofile | let &undodir = &directory | endif

" Vim bug on tag binary searching.
if v:version < 703 || (v:version == 7.3 && !has('patch336'))
  set notagbsearch
endif

" Enable virtualedit in visual block mode.
set virtualedit+=block

" Do not leave a backup file around, but make all writes safe. Use the swap
" file directory for these files, too.
set nobackup writebackup
let &backupdir=&directory

" Make Vim able to edit crontab files again.
if has('wildignore') && isdirectory('/private/tmp')
  set backupskip+=/private/tmp/*
endif

" = Keyword completion options
" == ins-completion search order: current buffer; other window buffers;
" unloaded buffers; tags; current and included files; spell checking
" dictionary; files in 'dictionary'; files in 'thesaurus'
set complete+=kspell,k,s complete-=w,b,u
if has('insert_expand')
  set completeopt-=preview pumheight=20
endif

set nostartofline " Do not default to start of line.

if has('mksession')
  set viewdir=$CACHE/vim_view viewoptions-=options viewoptions+=slash,unix
endif

if has('conceal')
  set conceallevel=2 concealcursor=iv
endif

if has('syntax')
  set colorcolumn=+1,+2,79,80,90,91
end

" Use vim-jp/autofmt if present.
if has_key(g:plugs, 'autofmt')
  set formatexpr=autofmt#compat#formatexpr()
endif

call hs#smart_foldtext()
