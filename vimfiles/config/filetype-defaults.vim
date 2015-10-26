if has('smartindent') | set smartindent | endif

" These values have been determined more by trolling through the syntax files
" than reading the documentation. There's more features that exist than are
" documented.

let g:ada_standard_types=1

let g:apache_version="2.0"

let g:c_ansi_constants=1
let g:c_ansi_typedefs=1
let g:c_comment_strings=1
let g:c_gnu=1
let g:c_space_errors=1

let g:changelog_timeformat="%Y-%m-%d"

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

let g:vimsyn_embed="lmpPrt"
let g:vimsyn_folding="alfmpPrt"

let g:xml_syntax_folding=1

if $GOROOT != '' && isdirectory(expand('$GOROOT/misc/vim'))
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

augroup hsautocmd-vimsyntax
  autocmd!
  " Syntax highlight for user commands in vim.
  autocmd Syntax vim call s:vim_syntax_user_defined_commands()

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc,_vimrc,~/.vim/config/*.vim source $MYVIMRC
  autocmd BufWritePost .gvimrc,_gvimrc,~/vim/config/*.g.vim source $MYGVIMRC

  " Auto reload VimScript.
  autocmd BufWritePost,FileWritePost *.vim if &autoread |
        \ source <afile> | echo 'source ' . bufname('%') | endif

  autocmd FileType vim setlocal foldmethod=syntax
augroup END

function! s:vim_syntax_user_defined_commands()
  redir => _
  silent! command
  redir END

  let command_names = join(map(split(_, '\n')[1:],
        \ "matchstr(v:val, '[!\"b]*\\s\\+\\zs\\u\\w*\\ze')"))

  if command_names == '' | return | endif

  execute 'syntax keyword vimCommand ' . command_names
endfunction

augroup hsautocmd-schemesyntax
  autocmd!

  " Enable gauche syntax for scheme.
  autocmd FileType scheme nested let b:is_gauche=1 |
        \ setlocal lispwords=define | let b:current_syntax='' | syntax enable
augroup END

augroup hsautocmd-adasyntax
  autocmd!

  if exists('*adacomplete#Complete')
    autocmd FileType ada setlocal omnifunc=adacomplete#Complete
  endif
augroup END

augroup hsautocmd-csyntax
  autocmd!

  if exists('*ccomplete#Complete')
    autocmd FileType c setlocal omnifunc=ccomplete#Complete
  endif
augroup END

augroup hsautocmd-csssyntax
  autocmd!

  if exists('*csscomplete#CompleteCSS')
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  endif
augroup END

augroup hsautocmd-htmlsyntax
  autocmd!

  if exists('*htmlcomplete#CompleteTags')
    autocmd htmlsyntax FileType html,markdown
          \ setlocal omnifunc=htmlcomplete#CompleteTags
  endif

  " Improved include pattern.
  autocmd FileType html
        \ setlocal includeexpr=substitute(v:fname,'^\\/','','') |
        \ setlocal path+=./;/
augroup END

augroup hsautocmd-javas
  autocmd!

  if exists('*javacomplete#Complete')
    autocmd hsautocmd-javasyntax FileType java
          \ setlocal omnifunc=javacomplete#Complete
  endif
augroup END

augroup hsautocmd-phpsyntax
  if exists('*phpcomplete#CompletePHP')
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  endif

  autocmd FileType php setlocal path+=/usr/local/share/pear
augroup END

augroup hsautocmd-pythonsyntax
  if has('python3') && exists('*python3complete#Complete')
    autocmd FileType python setlocal omnifunc=python3complete#Complete
  elseif exists('*pythoncomplete#Complete')
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  endif

  autocmd FileType python setlocal foldmethod=indent
augroup END

augroup hsautocmd-rubysyntax
  autocmd!

  if exists('*rubycomplete#Complete')
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  endif
augroup END

augroup hsautocmd-sqlsyntax
  autocmd!

  if exists('*sqlcomplete#Complete')
    autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
  endif
augroup END

augroup hsautocmd-xmlsyntax
  autocmd!

  if exists('*xmlcomplete#CompleteTags')
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  endif
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
