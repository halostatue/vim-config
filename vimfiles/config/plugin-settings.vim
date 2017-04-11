scriptencoding utf-8

if has_key(g:plugs, 'CtrlP')
  let g:ctrlp_switch_buffer = 'Et'
  let g:ctrlp_extensions = [ 'funky', 'tag', 'dir', 'mixed', 'rtscript', 'undo' ]
  let g:ctrlp_working_path_mode = 'rwa'

  function! s:ctrlp_user_command(...)
    let l:command = ''

    if a:0 > 0 && len(a:1)
      if executable(a:1)
        let l:command = a:1
      else
        echom 'Command "' . a:1 .'" is not executable. Falling back to discovery.'
      endif
    endif

    " if !len(l:command) && executable('pt') | let l:command = 'pt' | endif
    if !len(l:command) && executable('ag') | let l:command = 'ag' | endif

    if len(l:command)
      let g:ctrlp_user_command = l:command . ' %s -l --nocolor -g ""'
    else
      let g:ctrlp_user_command = ''
    endif
  endfunction
  command! -nargs=? CtrlPUserCommand call <SID>ctrlp_user_command(<q-args>)
  CtrlPUserCommand

  if len(g:ctrlp_user_command)
    " ag or pt are fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  else
    let g:ctrlp_use_caching = 1
    let g:ctrlp_clear_cache_on_exit = 1
  endif

  let g:ctrlp_show_hidden = 1
  let g:ctrlp_open_new_file = 'v'
  let g:ctrlp_reuse_window = 'startify'

endif

let g:commentary_map_backslash = 0

augroup hsautocmd-fugitive
  autocmd!
  autocmd BufNewFile,BufRead .git/index setlocal nolist
augroup END

" Syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_ruby_mri_exec = expand('~/.rubies/ruby-2.2.2/bin/ruby')
let g:syntastic_ruby_rubocop_exe = g:syntastic_ruby_mri_exec . ' -S rubocop'
" let g:syntastic_ruby_rubylint_exe = g:syntastic_ruby_mri_exec . ' -S ruby-lint'
let g:syntastic_ruby_checkers = [ 'mri', 'rubocop' ]
let g:syntastic_javascript_checkers = [ 'eslint' ]
" let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_vim_checkers = ['vint']

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
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-p>'
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
  if bufexists('*Scratch*')
    exec 'normal! :ScratchClose'
  else
    exec 'normal! :ScratchOpen'
  endif
endfunction
command! -bar -nargs=0 ScratchToggle call <SID>scratchtoggle()

if has_key(g:plugs, 'vim-airline') | let g:airline_powerline_fonts = 1 | endif

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

let g:startify_custom_header =
      \ 'map(startify#fortune#boxed(), "\"   \".v:val")'
let g:startify_change_to_vcs_root = 1

let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMouseMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']

let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

let g:grepper = {
      \   'tools': [ 'pt', 'ag', 'git', 'grep' ],
      \ }

let g:sqlutil_keyword_case = '\U'

" We don’t want these maps by default. They are not nicely loaded.
let g:loaded_AlignMaps = 1
let g:loaded_AlignMapsPlugin = 1

if has_key(g:plugs, 'vim-test')
  let g:test#ruby#minitest#executable = 'm'

  if has('nvim')
    if has_key(g:plugs, 'neoterm')
      let g:test#strategy = 'neoterm'
    else
      let g:test#strategy = 'neovim'
    endif
  elseif has_key(g:plugs, 'vim-dispatch')
    let g:test#strategy = 'dispatch'
  elseif has_key(g:plugs, 'asyncrun.vim')
    let g:test#strategy = 'asyncrun'
  elseif has_key(g:plugs, 'vimproc.vim')
    let g:test#strategy = 'vimproc'
  elseif !has('gui_running')
    if has_key(g:plugs, 'vimux')
      let g:test#strategy = 'vimux'
    elseif has_key(g:plugs, 'tslime.vim')
      let g:test#strategy = 'tslime'
    elseif has_key(g:plugs, 'vim-tmux-runner')
      let g:test#strategy = 'vtr'
    endif
  elseif is#macgui()
    let g:test#strategy = 'terminal'
  else
    let g:test#strategy = 'make'
  endif
endif

if has_key(g:plugs, 'vim-dispatch')
  " let g:dispatch_compilers =
  "       \ {
  "       \    'elixir' : 'exunit'
  "       \ }
endif

if v:version >= 800 && has_key(g:plugs, 'asyncrun.vim')
  if has_key(g:plugs, 'errormarker.vim')
    let g:asyncrun_auto = 'make'
  endif
  if has_key(g:plugs, 'vim-fugitive')
    command! bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
  endif
endif

if has_key(g:plugs, 'vim-lexical')
  let g:lexical#spellang = [ 'en_ca', 'en_us', 'en', ]
endif

if has_key(g:plugs, 'vim-mucomplete')
  set completeopt+=menuone
  " set completeopt+=noinsert,noselect
endif

if has_key(g:plugs, 'vim-peekaboo')
  let g:peekaboo_ins_prefix='<C-x>'
endif

SourceIf ~/.jiracomplete.vimrc
