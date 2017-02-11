if has('smartindent') | set smartindent | endif

" These values have been determined more by trolling through the syntax files
" than reading the documentation. There's more features that exist than are
" documented.

let g:ada_standard_types=1

let g:apache_version='2.0'

let g:c_ansi_constants=1
let g:c_ansi_typedefs=1
let g:c_comment_strings=1
let g:c_gnu=1
let g:c_space_errors=1

let g:changelog_timeformat='%Y-%m-%d'

let g:clojure_fold=1

let g:load_doxygen_syntax=1
let g:doxygen_enhanced_colour=1

let g:erlang_highlight_special_atoms=1

let g:hs_allow_hash_operator=1
let g:hs_highlight_boolean=1
let g:hs_highlight_delimiters=1
let g:hs_highlight_more_types=1
let g:hs_highlight_types=1

let g:html_extended_events=1

let g:java_allow_cpp_keywords=1
let g:java_comment_strings=1
let g:java_highlight_all=1
let g:java_highlight_functions='style'
let g:java_space_errors=1

let g:javaScript_fold=1

let g:lisp_instring=1
let g:lisp_rainbow=1

let g:perl_include_pod=1
let g:perl_fold=1

let g:php_sql_query=1
let g:php_baselib=1
let g:php_htmlInStrings=1
let g:php_noShortTags=1
let g:php_parent_error_close=1
let g:php_parent_error_open=1
let g:php_folding=2

let g:python_highlight_all=1

let g:r_syntax_folding=1

let g:readline_has_bash=1

let g:ruby_operators=1
let g:ruby_space_errors=1
let g:ruby_fold=1

let g:is_sh=1
let g:sh_fold_enabled=7

let g:tex_fold_enabled=1
let g:tex_comment_nospell=1
let g:tex_stylish=1
let g:plaintex_delimiters=1

let g:vimsyn_embed='lmpPrt'
let g:vimsyn_folding='alfmpPrt'

let g:xml_syntax_folding=1

if $GOROOT !=# '' && isdirectory(expand('$GOROOT/misc/vim'))
  set runtimepath+=$GOROOT/misc/vim
endif

let g:SimpleJsIndenter_BriefMode=1
let g:SimpleJsIndenter_CaseIndentLevel=-1

" http://mattn.kaoriya.net/software/vim/20140523124903.htm
let g:markdown_fenced_languages=[
      \  'coffee',
      \  'css',
      \  'erb=eruby',
      \  'javascript',
      \  'js=javascript',
      \  'json=javascript',
      \  'ruby',
      \  'sass',
      \  'xml',
      \  'vim',
      \]
let g:vim_markdown_no_default_key_mappings=0

let g:fieldtrip_start_map='Gs'

let g:switch_mapping=''

let g:whitespaste_before_mapping = ''
let g:whitespaste_after_mapping  = ''

let g:multichange_mapping        = '[Space]M'
let g:multichange_motion_mapping = 'm'

augroup hsautocmd-vimsyntax
  autocmd!
  " Syntax highlight for user commands in vim.
  autocmd Syntax vim call s:vim_syntax_user_defined_commands()

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc,_vimrc,~/.vim/config/*.vim nested source $MYVIMRC
  autocmd BufWritePost .gvimrc,_gvimrc,~/vim/config/*.g.vim nested source $MYGVIMRC

  " Auto reload VimScript.
  autocmd BufWritePost,FileWritePost *.vim nested
        \  if &autoread
        \|   source <afile>
        \|   echo 'source ' . bufname('%')
        \| endif

  autocmd FileType vim setlocal foldmethod=syntax
augroup END

function! s:vim_syntax_user_defined_commands()
  redir => l:commands
  silent! command
  redir END

  let l:command_names = join(map(split(l:commands, '\n')[1:],
        \ "matchstr(v:val, '[!\"b]*\\s\\+\\zs\\u\\w*\\ze')"))

  if l:command_names ==# '' | return | endif

  execute 'syntax keyword vimCommand ' . l:command_names
endfunction

augroup hsautocmd-schemesyntax
  autocmd!

  " Enable gauche syntax for scheme.
  autocmd FileType scheme nested let b:is_gauche=1 |
        \ setlocal lispwords=define | let b:current_syntax='' | syntax enable
augroup END

augroup hsautocmd-adasyntax
  autocmd!

  autocmd FileType ada
        \  if exists('*adacomplete#Complete')
        \|   setlocal omnifunc=adacomplete#Complete
        \| endif
augroup END

augroup hsautocmd-csyntax
  autocmd!

  autocmd FileType c
        \  if exists('*ccomplete#Complete')
        \|   setlocal omnifunc=ccomplete#Complete
        \| endif
augroup END

augroup hsautocmd-csssyntax
  autocmd!

  autocmd FileType css
        \  if exists('*csscomplete#CompleteCSS')
        \|   setlocal omnifunc=csscomplete#CompleteCSS
        \| endif
augroup END

augroup hsautocmd-htmlsyntax
  autocmd!

  autocmd FileType html,markdown
        \  if exists('*htmlcomplete#CompleteTags')
        \|   setlocal omnifunc=htmlcomplete#CompleteTags
        \| endif

  " Improved include pattern.
  autocmd FileType html
        \  setlocal includeexpr=substitute(v:fname,'^\\/','','')
        \| setlocal path+=./;/
augroup END

augroup hsautocmd-javas
  autocmd!

  autocmd FileType java
        \  if exists('*javacomplete#Complete')
        \|   setlocal omnifunc=javacomplete#Complete
        \| endif
augroup END

augroup hsautocmd-phpsyntax
  autocmd FileType php
        \  if exists('*phpcomplete#CompletePHP')
        \|   setlocal omnifunc=phpcomplete#CompletePHP
        \| endif

  if isdirectory('/usr/local/share/pear')
    autocmd FileType php setlocal path+=/usr/local/share/pear
  endif
augroup END

augroup hsautocmd-pythonsyntax
  if has('python3')
    autocmd FileType python
          \  if exists('*python3complete#Complete')
          \|   setlocal omnifunc=python3complete#Complete
          \| endif
  else
    autocmd FileType python
          \| if exists('*pythoncomplete#Complete')
          \|   setlocal omnifunc=pythoncomplete#Complete
          \| endif
  endif

  autocmd FileType python setlocal foldmethod=indent
augroup END

augroup hsautocmd-rubysyntax
  autocmd!

  autocmd FileType ruby
        \  if exists('*rubycomplete#Complete')
        \|   setlocal omnifunc=rubycomplete#Complete
        \| endif
augroup END

augroup hsautocmd-jssyntax
  autocmd!
  autocmd FileType javascript if exists(':SmartFoldText') | SmartFoldText | endif
augroup END

augroup hsautocmd-sqlsyntax
  autocmd!

  autocmd FileType sql
        \  if exists('*sqlcomplete#Complete')
        \|   setlocal omnifunc=sqlcomplete#Complete
        \| endif
augroup END

augroup hsautocmd-xmlsyntax
  autocmd!

  autocmd FileType xml
        \| if exists('*xmlcomplete#CompleteTags')
        \|   setlocal omnifunc=xmlcomplete#CompleteTags
        \| endif
augroup END

augroup hsautocmd-apachesyntax
  autocmd!

  autocmd FileType apache setlocal path+=./;/
augroup END

augroup hsautocmd-gosyntax
  autocmd!

  autocmd FileType go highlight default link goErr WarningMsg |
        \ match goErr /\<err\>/

  autocmd FileType go setlocal ts=2 sts=2 sw=2 noet ai
augroup END

augroup hsautocmd-gitstuff
  autocmd!

  autocmd FileType gitcommit setlocal buftype=

  autocmd FileType gitconfig setlocal buftype=

  autocmd FileType gitrebase setlocal buftype=
  autocmd FileType gitrebase nnoremap <buffer> <silent> S :Cycle<CR>

  autocmd FileType gitsendemail setlocal buftype=
augroup END

augroup hsautocmd-switch
  autocmd!

  autocmd FileType erlang let b:switch_custom_definitions =
        \ [
        \   {
        \     '<<"\([^"]*\)">>':       '"\1"',
        \     '\%(<<\)\@<!"\([^"]*\)"': '<<"\1">>',
        \   }
        \ ]

  autocmd FileType tex,plaintex let b:switch_custom_definitions =
        \ [
        \    [
        \      '\\tiny', '\\scriptsize', '\\footnotesize', '\\small',
        \      '\\normalsize', '\\large', '\\Large', '\\LARGE', '\\huge',
        \      '\\Huge'
        \    ],
        \    [ '\\displaystyle', '\\scriptstyle', '\\scriptscriptstyle', '\\textstyle' ],
        \    [
        \      '\\part', '\\chapter', '\\section', '\\subsection',
        \      '\\subsubsection', '\\paragraph', '\\subparagraph'
        \    ],
        \    [ 'part:', 'chap:', 'sec:', 'subsec:', 'subsubsec:' ],
        \    [ 'article', 'report', 'book', 'letter', 'slides' ],
        \    [
        \      'a4paper', 'a5paper', 'b5paper', 'executivepaper', 'legalpaper',
        \      'letterpaper', 'beamer', 'subfiles', 'standalone'
        \    ],
        \    [ 'onecolumn', 'twocolumn' ],
        \    [ 'oneside', 'twoside' ],
        \    [ 'draft', 'final' ],
        \    [ 'AnnArbor', 'Antibes', 'Bergen', 'Berkeley',
        \      'Berlin', 'Boadilla', 'CambridgeUS', 'Copenhagen', 'Darmstadt',
        \      'Dresden', 'Frankfurt', 'Goettingen', 'Hannover', 'Ilmenau',
        \      'JuanLesPins', 'Luebeck', 'Madrid', 'Malmoe', 'Marburg',
        \      'Montpellier', 'PaloAlto', 'Pittsburgh', 'Rochester', 'Singapore',
        \      'Szeged', 'Warsaw' ]
        \ ]

  autocmd FileType gitrebase let b:switch_custom_definitions =
        \ [
        \   [ 'pick', 'reword', 'edit', 'squash', 'fixup', 'exec' ]
        \ ]
augroup END

augroup hsautocmd-dirvish
  autocmd!
  autocmd FileType dirvish call fugitive#detect(@%)
augroup END

function! s:plug_doc()
  let l:name = matchstr(getline('.'), '^- \zs\S\+\ze:')
  if has_key(g:plugs, l:name)
    for l:doc in split(globpath(g:plugs[l:name].dir, 'doc/*.txt'), '\n')
      execute 'tabe' l:doc
    endfor
  endif
endfunction

function! s:plug_gx()
  let l:line = getline('.')
  let l:sha  = matchstr(l:line, '^  \X*\zs\x\{7}\ze ')
  let l:name = empty(l:sha) ? matchstr(l:line, '^[-x+] \zs[^:]\+\ze:')
                      \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let l:uri  = get(get(g:plugs, l:name, {}), 'l:uri', '')
  if l:uri !~# 'github.com'
    return
  endif
  let l:repo = matchstr(l:uri, '[^:/]*/'.l:name)
  let l:url  = empty(l:sha) ? 'https://github.com/'.l:repo
                      \ : printf('https://github.com/%s/commit/%s', l:repo, l:sha)
  call netrw#BrowseX(l:url, 0)
endfunction

function! s:plug_scroll_preview(down)
  silent! wincmd P
  if &previewwindow
    execute 'normal!' a:down ? "\<c-e>" : "\<c-y>"
    wincmd p
  endif
endfunction

function! s:plug_setup_extra_keys()
  nnoremap <silent> <buffer> J :call <sid>plug_scroll_preview(1)<cr>
  nnoremap <silent> <buffer> K :call <sid>plug_scroll_preview(0)<cr>
  nnoremap <silent> <buffer> <c-n> :call search('^  \X*\zs\x')<cr>
  nnoremap <silent> <buffer> <c-p> :call search('^  \X*\zs\x', 'b')<cr>
  nmap <silent> <buffer> <c-j> <c-n>o
  nmap <silent> <buffer> <c-k> <c-p>o
endfunction

augroup hsautocmd-vim-plug
  autocmd!
  autocmd FileType vim-plug nnoremap <buffer> <silent> H :call <sid>plug_doc()<cr>
  autocmd FileType vim-plug call s:plug_setup_extra_keys()
  autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END
