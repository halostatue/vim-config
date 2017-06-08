scriptencoding utf-8

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

if hs#plug#in('YouCompleteMe')
  let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
  let g:SuperTabDefaultCompletionType = '<C-Tab>'
elseif hs#plug#in('neocomplete')
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

if hs#plug#in('vim-airline') | let g:airline_powerline_fonts = 1 | endif

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

if hs#plug#in('vim-test')
  let g:test#ruby#minitest#executable = 'm'

  if has('nvim')
    if hs#plug#in('neoterm')
      let g:test#strategy = 'neoterm'
    else
      let g:test#strategy = 'neovim'
    endif
  elseif hs#plug#in('vim-dispatch')
    let g:test#strategy = 'dispatch'
  elseif hs#plug#in('asyncrun.vim')
    let g:test#strategy = 'asyncrun'
  elseif hs#plug#in('vimproc.vim')
    let g:test#strategy = 'vimproc'
  elseif !has('gui_running')
    if hs#plug#in('vimux')
      let g:test#strategy = 'vimux'
    elseif hs#plug#in('tslime.vim')
      let g:test#strategy = 'tslime'
    elseif hs#plug#in('vim-tmux-runner')
      let g:test#strategy = 'vtr'
    endif
  elseif is#macgui()
    let g:test#strategy = 'terminal'
  else
    let g:test#strategy = 'make'
  endif
endif

if hs#plug#in('vim-dispatch')
  " let g:dispatch_compilers =
  "       \ {
  "       \    'elixir' : 'exunit'
  "       \ }
endif

if v:version >= 800 && hs#plug#in('asyncrun.vim')
  if hs#plug#in('errormarker.vim')
    let g:asyncrun_auto = 'make'
  endif
  if hs#plug#in('vim-fugitive')
    command! bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
  endif
endif

if hs#plug#in('vim-lexical')
  let g:lexical#spellang = [ 'en_ca', 'en_us', 'en', ]
endif

if hs#plug#in('vim-mucomplete')
  set completeopt+=menuone
  " set completeopt+=noinsert,noselect
endif

if hs#plug#in('vim-peekaboo')
  let g:peekaboo_ins_prefix='<C-x>'
endif

SourceIf local/*
