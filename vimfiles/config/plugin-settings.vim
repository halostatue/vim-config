" CtrlP configuration
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_extensions = [ 'funky', 'tag', 'dir', 'mixed', 'rtscript', 'undo' ]
let g:ctrlp_working_path_mode = 'rwa'
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_use_caching = 1
  let g:ctrlp_clear_cache_on_exit = 1
endif
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_new_file = 'v'

let g:commentary_map_backslash = 0

augroup hsautocmd-fugitive
  autocmd!
  autocmd BufNewFile,BufRead .git/index setlocal nolist
augroup END

" Syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_ruby_mri_exec = expand("~/.rubies/ruby-2.2.2/bin/ruby")
let g:syntastic_ruby_rubocop_exe = g:syntastic_ruby_mri_exec . " -S rubocop"
" let g:syntastic_ruby_rubylint_exe = g:syntastic_ruby_mri_exec . " -S ruby-lint"
let g:syntastic_ruby_checkers = [ 'mri', 'rubocop' ]

" Gist
if is#cygwin()
  let g:gist_clip_command = 'putclip'
elseif is#mac()
  let g:gist_clip_command = 'pbcopy'
elseif !is#windows() && executable('xclip')
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" NetRW
let g:netrw_list_hide= '*.swp'

" VCS List
let g:signify_vcs_list = [ 'git', 'hg' ]

" Ragtag Global Maps
let g:ragtag_global_maps = 1

" Autodetect Vinarise
let g:vinarise_enable_auto_detect = 1

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-p>"
let g:SuperTabLongestHighlight = 1

if has_key(g:plugs, 'YouCompleteMe')
  let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
  let g:SuperTabDefaultCompletionType = '<C-Tab>'
elseif has_key(g:plugs, 'neocomplete')
  let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
endif

" Scratch
function! s:scratchtoggle()
  if bufexists("*Scratch*")
    exec "normal! :ScratchClose"
  else
    exec "normal! :ScratchOpen"
  endif
endfunction
command! -bar -nargs=0 ScratchToggle call <SID>scratchtoggle()

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = '∅'
let g:airline_theme = 'papercolor'

let g:vimpipe_invoke_map = '[Space]r'
let g:vimpipe_close_map = '[Space]p'

let g:buffergator_suppress_keymaps = 1

let g:tagbar_type_vimwiki = { 'ctagstype' : 'wiki', 'kinds' : [ 'h:headers' ] }
let g:tagbar_type_mkd=
      \ { 'ctagstype' : 'md', 'kinds' : [ 'h:headings' ], 'sort' : 0, }
let g:tagbar_type_css=
      \ { 'ctagstype' : 'css',
      \   'kinds' : [
      \      'c:classes', 'i:ids', 't:tags', 'm:media', 'f:fonts',
      \      'k:keyframes'
      \   ],
      \   'sort' : 0,
      \ }
let g:tagbar_type_html=
      \ { 'ctagstype' : 'html', 'kinds' : [ 'i:ids', 'c:classes' ] }
let g:tagbar_type_vhdl =
      \ { 'ctagstype': 'vhdl',
      \   'kinds' : [
      \     'd:prototypes', 'b:package bodies', 'e:entities',
      \     'a:architectures', 't:types', 'p:processes', 'f:functions',
      \     'r:procedures', 'c:constants', 'T:subtypes', 'r:records',
      \     'C:components', 'P:packages', 'l:locals'
      \   ]
      \ }

let g:ref_no_default_key_mappings = 1

let test#strategy = 'dispatch'

SourceIf ~/.jiracomplete.vimrc
