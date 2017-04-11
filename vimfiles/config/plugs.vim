scriptencoding utf-8

function! Cond(cond, ...)
  let l:opts = get(a:000, 0, {})
  return a:cond ? l:opts : extend(l:opts, { 'on': [], 'for': [] })
endfunction

" Make vim make sense by default.
Plug 'tpope/vim-sensible'

" Utility functions
Plug 'halostatue/vim-cecutil'
Plug 'mattn/webapi-vim'
Plug 'thinca/vim-openbuf'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-haystack'
Plug 'rstacruz/vim-xtract'
Plug 'tpope/vim-projectionist'
" Plug 'google/vim-glaive'
" Plug 'google/vim-maktaba'

" A sensible foldtext function.
Plug 'LeafCage/foldCC.vim'

" DLL-based vim process.
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Asynchronous compiler calls.
" Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-dispatch',
      \ { 'on': [
      \     'Make', 'Copen', 'Dispatch', 'FocusDispatch', 'Start', 'Spawn'
      \   ]
      \ }

" Hex editor
Plug 'Shougo/vinarise', { 'on': 'Vinarise' }

" Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
" Plug 'rafi/vim-tinyline'
" Plug 'tpope/vim-flagship'

" User textobject functions.
Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-datetime'
  Plug 'kana/vim-textobj-diff'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-fold'
  Plug 'kana/vim-textobj-function'
  Plug 'kana/vim-textobj-help'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-lastpat'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-syntax'
  Plug 'thinca/vim-textobj-comment'
  Plug 'thalesmello/vim-textobj-methodcall'
  Plug 'bootleq/vim-textobj-rubysymbol', { 'for': [ 'ruby', 'eruby' ] }
  Plug 'nelstrom/vim-textobj-rubyblock', { 'for': [ 'ruby', 'eruby' ] }
  Plug 'thinca/vim-textobj-function-javascript', { 'for': 'javascript' }
  Plug 'thinca/vim-textobj-function-perl', { 'for': 'perl' }
  Plug 'reedes/vim-textobj-quote', { 'for': [ 'markdown', 'mkd', 'text' ] }
  Plug 'reedes/vim-textobj-sentence', { 'for': [ 'markdown', 'mkd', 'text' ] }
  Plug 'whatyouhide/vim-textobj-xmlattr', { 'for': [ 'html', 'xml' ] }
Plug 'wellle/targets.vim'

Plug 'tommcdo/vim-exchange'

" Fuzzy file finder
" Plug 'ctrlpvim/ctrlp.vim'
"   Plug 'tacahiroy/ctrlp-funky'
"   Plug 'phalkunz/ctrlp-related'
Plug 'vim-ctrlspace/vim-ctrlspace'

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" File Management
Plug 'justinmk/vim-dirvish'
  Plug 'tpope/vim-eunuch',
        \ { 'on': [
        \     'Unlink', 'Remove', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Find',
        \     'Locate', 'SudoEdit', 'SudoWrite', 'Wall', 'W'
        \   ]
        \ }

if homebrew#isdirectory('opt/fzf')
  let &runtimepath .= ',' . homebrew#path('opt/fzf')
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
endif

" Editorconfig standard
Plug 'editorconfig/editorconfig-vim'

" vim-man
Plug 'bruno-/vim-man'

Plug 'mnpk/vim-jira-complete'

" Plug 'ervandew/supertab'
Plug 'ajh17/VimCompletesMe'
" Plug 'lifepillar/vim-mucomplete'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'AndrewRadev/andrews_nerdtree.vim'

Plug 'vim-jp/autofmt'

" Utilities
Plug 'godlygeek/tabular'
Plug 'halostatue/vim-calendar', { 'on': [ 'Calendar', 'CalendarH' ] }
Plug 'junegunn/vim-easy-align',
      \ { 'on': [
      \     '<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)',
      \     'EasyAlign', 'LiveEasyAlign'
      \   ]
      \ }
Plug 'scrooloose/syntastic'
Plug 'thinca/vim-localrc'
Plug 'thinca/vim-qfreplace', { 'on': 'Qfreplace' }
Plug 'thinca/vim-prettyprint', { 'on': [ 'PrettyPrint', 'PP' ] }
Plug 'thinca/vim-quickrun', { 'on': [ 'QuickRun', '<Plug>(quickrun)' ] }
Plug 'tjennings/git-grep-vim',
      \ { 'on': [ 'GitGrep', 'GitGrepAdd', 'LGitGrep', 'LGitGrepAdd' ] }
Plug 'tpope/vim-abolish', { 'on': [ 'Abolish', 'Subvert' ] }
Plug 'tpope/vim-characterize'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-obsession', { 'on': 'Obsession' }
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-jp/vital.vim', { 'on': 'Vitalize' }
Plug 'vim-scripts/camelcasemotion'
Plug 'vim-scripts/ColorX', { 'on': [ 'ColorRGB', 'ColorHEX' ] }
Plug 'majutsushi/tagbar'
Plug 'abudden/taghighlight-automirror'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-ref'
Plug 'chiedoX/vim-case-convert'
Plug 'christoomey/vim-sort-motion'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-qlist'
Plug 'justinmk/vim-sneak'
Plug 'vimwiki/vimwiki'
" Plug 'chiphogg/vim-vtd'

if is#mac()
  Plug 'henrik/vim-reveal-in-finder', { 'on': 'Reveal' }
  Plug 'rizzatti/dash.vim',
        \ { 'on': [ '<Plug>DashSearch', '<Plug>DashGlobalSearch', 'Dash' ] }
  Plug 'itchyny/dictionary.vim', { 'on': 'Dictionary' }
endif

" VCS
Plug 'tpope/vim-fugitive' | Plug 'int3/vim-extradite'
Plug 'lambdalisue/vim-gita'
Plug 'jlfwong/vim-mercenary'
Plug 'gregsexton/gitv'
Plug 'itchyny/vim-gitbranch'

" gf (open file under cursor) extensions
Plug 'kana/vim-gf-user'
Plug 'kana/vim-gf-diff', { 'for': 'diff' }

" Global regular expression execution
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
" Plug 'rhysd/vim-operator-surround'
Plug 'kana/vim-grex', { 'on': [ 'Grey', 'Gred' ] }

" Work with blockwise Visual mode nicer.
Plug 'kana/vim-niceblock'

" Scratch buffer
Plug 'kana/vim-scratch',
      \ { 'on': [
      \     'ScratchOpen', 'ScratchClose', '<Plug>(scratch-open)',
      \     '<Plug>(scratch-close)'
      \    ]
      \ }

" Loop around some characters smartly.
Plug 'kana/vim-smartchr'
" Input braces &c. smartly.
Plug 'kana/vim-smartinput'
" Word motions smarter than default
Plug 'kana/vim-smartword'

" Run a buffer through a pipe-ready runner.
Plug 'krisajenkins/vim-pipe'

" Gist management
Plug 'mattn/gist-vim', { 'on': 'Gist' }
" Plug 'lambdalisue/vim-gista'

" Ag instead of Grep.
Plug 'mhinz/vim-grepper',
      \ { 'on':
      \   [ 'Grepper'
      \   ]
      \ }
Plug 'rking/ag.vim', { 'on': [ 'Ag', 'AgAdd', 'LAg', 'LAgAdd' ] }

" Vim-Test
Plug 'janko-m/vim-test',
      \ { 'on': [
      \     'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'
      \   ]
      \ }

" Display Helpers
Plug 'myusuf3/numbers.vim'
Plug 'halostatue/vim-zoom-win'
Plug 'thinca/vim-fontzoom'
Plug 'farseer90718/vim-regionsyntax'
Plug 'halostatue/vim-ansi-esc', { 'on': 'AnsiEsc' }
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'tomtom/quickfixsigns_vim'
Plug 'mh21/errormarker.vim'
Plug 'Shougo/echodoc.vim'

Plug 'henrik/vim-indexed-search'
Plug 'haya14busa/incsearch.vim'
Plug 'terryma/vim-expand-region'

" Development
Plug 'tpope/vim-bundler',
      \ { 'on': [
      \     'Bundle', 'Bopen', 'Bedit', 'Bsplit', 'Bvsplit', 'Btabedit',
      \     'Bpedit'
      \   ]
      \ }
Plug 'tpope/vim-heroku', { 'on': 'Hk' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake', { 'on': 'Rake' }
Plug 'tpope/vim-rhubarb'
Plug 'jeetsukumaran/vim-buffergator'

" Syntax Plugins
" Plug 'sheerun/vim-polyglot'

Plug 'vim-scripts/applescript.vim', { 'for': 'applescript' }

Plug 'pearofducks/ansible-vim',
      \ { 'for': [ 'ansible', 'ansible_host', 'ansible_template'] }

" Plug 'sudar/vim-arduino-syntax', { 'for': 'arduino' }

" Plug 'jwalton512/vim-blade', { 'for': 'blade' } " PHP

Plug 'octol/vim-cpp-enhanced-highlight', { 'for': [ 'cpp' ] }
Plug 'vim-jp/vim-cpp', { 'for': [ 'c', 'cpp' ] }

Plug 'kchmck/vim-coffee-script' ", { 'for': 'coffee' }
  Plug 'mtscout6/vim-cjsx', { 'for': 'coffee' }

Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
  Plug 'tpope/vim-salve',
        \ {
        \   'for': [ 'clojure' ],
        \   'on': [ 'Console', 'Esource', 'Emain', 'Etest', 'Eresource' ]
        \ }
  Plug 'tpope/vim-fireplace',
        \ {
        \   'for': [ 'clojure' ],
        \    'on': [ 'Eval', 'Require', 'Require!', 'Source', 'Doc', 'FindDoc' ]
        \ }
  Plug 'guns/vim-clojure-highlight', { 'for': [ 'clojure' ] }
  Plug 'tpope/vim-classpath', { 'for': [ 'clojure', 'java' ], 'on': [ 'Java' ] }
  Plug 'guns/vim-sexp', { 'for': [ 'clojure', 'scheme', 'lisp' ] }
  Plug 'tpope/vim-sexp-mappings-for-regular-people',
        \ { 'for': [ 'clojure', 'scheme', 'lisp' ] }

Plug 'victoredwardocallaghan/cryptol.vim', { 'for': 'cryptol' }

Plug 'rhysd/vim-crystal', { 'for': 'crystal' }

Plug 'elubow/cql-vim', { 'for': 'cql' }

Plug 'JulesWang/css.vim', { 'for': [ 'css', 'scss', 'html' ] }
  Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss', 'html' ] }

Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }

Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }

" Plug 'ekalinin/Dockerfile.vim'
Plug 'honza/dockerfile.vim', { 'for': 'dockerfile' }

Plug 'elixir-lang/vim-elixir', { 'for': [ 'elixir', 'eelixir' ] }
  Plug 'mattreduce/vim-mix', { 'for': [ 'elixir', 'eelixir' ] }
  Plug 'andyl/vim-projectionist-elixir'
  Plug 'c-brenn/phoenix.vim'
  Plug 'slashmili/alchemist.vim'
  " let g:alchemist_tag_disable = 1

Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

Plug 'yalesov/vim-ember-script', { 'for': 'ember-script' } |
  Plug 'yalesov/vim-emblem', { 'for': 'emblem' }

Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }
  Plug 'vim-erlang/erlang-motions.vim', { 'for': 'erlang' }
  Plug 'vim-erlang/vim-erlang-compiler'
  Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
  Plug 'vim-erlang/vim-erlang-tags', { 'for': 'erlang' }

Plug 'dag/vim-fish', { 'for': 'fish' }

Plug 'tpope/vim-git',
      \ {
      \   'for': [
      \     'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git'
      \   ],
      \   'on': 'DiffGitCached'
      \ }

Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }

Plug 'fatih/vim-go',
      \ { 'for': [ 'go', 'gohtmltmpl' ], 'do': ':GoInstallBinaries' }

Plug 'vim-scripts/groovy.vim', { 'for': 'groovy' }

Plug 'tpope/vim-haml', { 'for': [ 'haml', 'sass', 'scss' ] }

Plug 'mustache/vim-mustache-handlebars',
      \ { 'for': [ 'html.mustache', 'html.handlebars' ] }

Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

Plug 'yaymukund/vim-haxe', { 'for': 'haxe' }

Plug 'othree/html5.vim'

Plug 'glanotte/vim-jasmine', { 'for': 'jasmine.javascript' }

" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'jiangmiao/simple-javascript-indenter', { 'for': 'javascript' }
" Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'pmsorhaindo/syntastic-local-eslint.vim'

Plug 'elzr/vim-json', { 'for': 'json' }

Plug 'briancollins/vim-jst', { 'for': 'jst' }

Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }

Plug 'dcjones/julia-minimalist-vim', { 'for': 'julia' }

Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }

Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'latex' }

Plug 'groenewege/vim-less', { 'for': 'less' }

Plug 'tpope/vim-liquid', { 'for': 'liquid' }

Plug 'gkz/vim-ls', { 'for': 'livescript' }

Plug 'tbastos/vim-lua', { 'for': 'lua' }

Plug 'sophacles/vim-bundle-mako', { 'for': 'mako' }

" Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'thinca/vim-ft-markdown_fold', { 'for': 'markdown' }

Plug 'othree/nginx-contrib-vim', { 'for': 'nginx' }

Plug 'zah/nim.vim', { 'for': 'nim' }

Plug 'spwhitt/vim-nix', { 'for': 'nix' }

Plug 'b4winckler/vim-objc', { 'for': 'objc' }
  Plug 'msanders/cocoa.vim', { 'for': 'objc' }

Plug 'jrk/vim-ocaml', { 'for': 'ocaml' }

Plug 'vim-scripts/octave.vim--', { 'for': 'octave' }

Plug 'petRUShka/vim-opencl', { 'for': 'opencl' }

Plug 'vim-perl/vim-perl', { 'for': 'perl' }

Plug 'exu/pgsql.vim', { 'for': 'pgsql' }

Plug 'StanAngeloff/php.vim', { 'for': 'php' }
  Plug 'rayburgemeestre/phpfolding.vim', { 'for': 'php' }
  Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
  Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
  Plug 'rafi/vim-phpspec', { 'for': 'php' }

Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }

Plug 'Persistent13/vim-ps1', { 'for': [ 'ps1', 'ps1xml' ] }

Plug 'uarun/vim-protobuf', { 'for': 'proto' }

Plug 'digitaltoad/vim-pug', { 'for': 'pug' }

Plug 'voxpupuli/vim-puppet', { 'for': [ 'puppet', 'ruby' ] }
  " Plug 'ajf/puppet-vim', { 'for': 'puppet' }

Plug 'raichoo/purescript-vim', { 'for': 'purescript' }

Plug 'mitsuhiko/vim-python-combined', { 'for': 'python' }
  Plug 'aliev/vim-compiler-python'
  Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }

Plug 'peterhoeg/vim-qml', { 'for': 'qml' }

Plug 'vim-scripts/R.vim', { 'for': 'r-lang' }

Plug 'IN3D/vim-raml', { 'for': 'raml' }

Plug 'jneen/ragel.vim', { 'for': 'ragel' }

Plug 'sheerun/rspec.vim', { 'for': 'rspec' }
Plug 'vim-ruby/vim-ruby', { 'for': [ 'ruby', 'eruby' ] }
  Plug 'depuracao/vim-rdoc', { 'for': 'ruby' }
  Plug 'sunaku/vim-ruby-minitest', { 'for': 'ruby' }

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
  Plug 'derekwyatt/vim-sbt', { 'for': 'sbt.scala' }

Plug 'slim-template/vim-slim', { 'for': 'slim' }

Plug 'ethereum/vim-solidity', { 'for': 'solidity' }

Plug 'wavded/vim-stylus', { 'for': 'stylus' }

Plug 'keith/swift.vim', { 'for': 'swift' }

Plug 'kurayama/systemd-vim-syntax', { 'for': 'systemd' }

Plug 'timcharper/textile.vim', { 'for': 'textile' }

Plug 'solarnz/thrift.vim', { 'for': 'thrift' }

Plug 'keith/tmux.vim', { 'for': 'tmux' }
  Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
  Plug 'tmux-plugins/vim-tmux-focus-events'
  " Plug 'christoomey/vim-tmux-navigator'
  Plug 'tpope/vim-tbone',
        \ { 'on': [ 'Tmux', 'Tyank', 'Tput', 'Twrite', 'Tattach' ] }

Plug 'wellbredgrapefruit/tomdoc.vim', { 'for': 'tomdoc' }

Plug 'cespare/vim-toml', { 'for': 'toml' }

Plug 'lumiliet/vim-twig', { 'for': 'twig' }

Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

Plug 'tkztmk/vim-vala', { 'for': 'vala' }

Plug 'vim-scripts/vbnet.vim', { 'for': 'vbnet' }

Plug 'smerrill/vcl-vim-plugin', { 'for': 'vcl' }

Plug 'lepture/vim-velocity', { 'for': 'velocity' }

Plug 'vim-scripts/XSLT-syntax', { 'for': 'xls' }

Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
  Plug 'henrik/vim-yaml-flattener', { 'for': 'yaml' }

Plug 'sheerun/vim-yardoc', { 'for': 'yard' }

Plug 'adamlowe/vim-slurper', { 'for': 'slurper' }

Plug 'andreimaxim/vim-io', { 'for': 'io' }

Plug 'chrisbra/csv.vim', { 'for': 'csv' }

Plug 'davidoc/taskpaper.vim', { 'for': 'taskpaper' }

Plug 'jceb/vim-orgmode', { 'for': 'org' }

Plug 'thinca/vim-ft-diff_fold', { 'for': 'diff' }

Plug 'thinca/vim-ft-help_fold', { 'for': 'help' }

Plug 'thinca/vim-ft-vim_fold', { 'for' : 'vim' }

Plug 'kylef/apiblueprint.vim', { 'for': 'apiblueprint' }

Plug 'mitsuhiko/vim-jinja'
Plug 'robbles/logstash.vim'

Plug 'sukima/xmledit', { 'for': 'xml' }

Plug 'flazz/vim-colorschemes'
  Plug 'godlygeek/csapprox'

Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'JarrodCTaylor/vim-shell-executor'
Plug 'kana/vim-submode'
Plug 'AndrewRadev/whitespaste.vim'
Plug 'AndrewRadev/inline_edit.vim'
Plug 'AndrewRadev/writable_search.vim', { 'on': 'WritableSearch' }
Plug 'AndrewRadev/modsearch.vim', { 'on': 'Modsearch' }
Plug 'AndrewRadev/multichange.vim'
Plug 'AndrewRadev/linediff.vim', { 'on': [ 'Linediff', 'LinediffReset' ] }
Plug 'junegunn/vim-slash'

Plug 'ramele/agrep', { 'on': 'Agrep' }
Plug 'wincent/loupe'
Plug 'dohsimpson/vim-macroeditor', { 'on': 'MacroEdit' }

Plug 'vim-scripts/sqlutilities',
      \ {
      \   'on': [
      \     'SQLUFormatter',
      \     'SQLUCreateColumnList',
      \     'SQLUGetColumnDef',
      \     'SQLUGetColumnDataType',
      \     'SQLUCreateProcedure',
      \     '<Plug>SQLU_Formatter',
      \     '<Plug>SQLU_CreateColumnList',
      \     '<Plug>SQLU_GetColumnDef',
      \     '<Plug>SQLU_GetColumnDataType',
      \     '<Plug>SQLU_CreateProcedure'
      \   ]
      \ }
  Plug 'vim-scripts/Align',
        \ {
        \   'on': [
        \     'Align',
        \     'SQLUFormatter',
        \     'SQLUCreateColumnList',
        \     'SQLUGetColumnDef',
        \     'SQLUGetColumnDataType',
        \     'SQLUCreateProcedure',
        \     '<Plug>SQLU_Formatter',
        \     '<Plug>SQLU_CreateColumnList',
        \     '<Plug>SQLU_GetColumnDef',
        \     '<Plug>SQLU_GetColumnDataType',
        \     '<Plug>SQLU_CreateProcedure'
        \   ]
        \ }
  Plug 'vim-scripts/dbext.vim'

Plug 'itspriddle/vim-marked', { 'for': 'markdown' }
Plug 'reedes/vim-lexical', { 'for': [ 'markdown', 'mkd', 'text' ] }
Plug 'reedes/vim-litecorrect', { 'for': [ 'markdown', 'mkd', 'text' ] }
Plug 'reedes/vim-wordy', { 'on': [ 'Wordy', 'NextWordy', 'PrevWordy' ] }

" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'

" Plug 'andreshazard/vim-logreview', { 'for': 'logreview' }

Plug 'romainl/vim-qlist'

Plug 'jbranchaud/vim-bdubs', { 'on': [ 'BD', 'BW' ] }

Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

" Plug 'neomake/neomake'

Plug 'tek/vim-fieldtrip'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

Plug 'osyo-manga/vim-anzu'

Plug 'junegunn/vader.vim', { 'for': 'vader', 'on': 'Vader' }

Plug 'MattesGroeger/vim-bookmarks'
Plug 't9md/vim-choosewin'
Plug 'itchyny/vim-cursorword'
Plug 'bogado/file-line'
Plug 'tyru/open-browser.vim'

Plug 'michaelbruce/vim-chruby'

Plug 'junegunn/vim-peekaboo'

delfunction Cond
