" vim:set foldmethod=marker :

scriptencoding utf-8

function! Cond(cond, ...)
  let l:opts = get(a:000, 0, {})
  return a:cond ? l:opts : extend(l:opts, { 'on': [], 'for': [] })
endfunction

Plug 'tpope/vim-sensible'

" {{{1 Generally useful utilities
Plug 'chrisbra/unicode.vim'
" Plug 'dahu/vimple'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-pseudocl' | Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-slash'
Plug 'kana/vim-smartchr'
Plug 'kana/vim-smartinput'
Plug 'LeafCage/foldCC.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'thinca/vim-localrc'
" Plug 'tomtom/tinykeymap_vim'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-jp/autofmt'
" Plug 'vim-utils/vim-troll-stopper'
" }}}1

" {{{1 Project Fuzzy Filefinder
Plug 'vim-ctrlspace/vim-ctrlspace'
" }}}

" {{{1 Scripting assistance and libraries
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-ruby-x', { 'on': 'RubyX' }
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-haystack'
Plug 'tpope/vim-scriptease'
" Plug 'thinca/vim-openbuf'
Plug 'tomtom/tlib_vim'
Plug 'thinca/vim-prettyprint', { 'on': [ 'PrettyPrint', 'PP' ] }
Plug 'vim-jp/vital.vim', { 'on': [ 'Vitalize' ] }
" }}}1

" {{{1 Submodes
Plug 'kana/vim-submode'
" }}}1

" {{{1 Text objects
Plug 'junegunn/vim-after-object'
Plug 'vim-utils/vim-all'
Plug 'wellle/targets.vim'

" {{{2 Provided by kana/vim-textobj-user
"      Temporarily disabled for performance investigation.
" Plug 'kana/vim-textobj-user'
"
" Plug 'bootleq/vim-textobj-rubysymbol'
" Plug 'kana/vim-textobj-datetime'
" Plug 'kana/vim-textobj-diff'
" Plug 'kana/vim-textobj-fold'
" Plug 'kana/vim-textobj-function'
" Plug 'kana/vim-textobj-indent'
" Plug 'kana/vim-textobj-line'
" Plug 'kana/vim-textobj-syntax'
" Plug 'lucapette/vim-textobj-underscore'
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'reedes/vim-textobj-quote'
" Plug 'reedes/vim-textobj-sentence'
" Plug 'thalesmello/vim-textobj-methodcall'
" Plug 'thinca/vim-textobj-comment'
" Plug 'thinca/vim-textobj-function-javascript'
" Plug 'thinca/vim-textobj-function-perl'
" Plug 'whatyouhide/vim-textobj-xmlattr'
" }}}2
" }}}1

" {{{1 Motions
Plug 'kana/vim-smartword'
" }}}1

" {{{1 gf (open file under cursor) extensions
Plug 'kana/vim-gf-user'
Plug 'kana/vim-gf-diff', { 'for': 'diff' }
" }}}1

" {{{1 Operators
Plug 'kana/vim-niceblock'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'tommcdo/vim-exchange'
" }}}1

" {{{1 Asynchronous Execution
Plug 'tpope/vim-dispatch'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" }}}1

" {{{1 Projects
Plug 'tpope/vim-projectionist'
" }}}1

" {{{1 :Commands
Plug 'ervandew/lookup', { 'on': 'Lookup' }
Plug 'junegunn/vim-easy-align', { 'on': [ '<Plug>(EasyAlign)', 'EasyAlign' ] }
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'kana/vim-grex', { 'on': [ 'Grey', 'Gred' ] }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'rstacruz/vim-xtract', { 'on': 'Xtract' }
Plug 'Shougo/vinarise', { 'on': 'Vinarise' }
Plug 'thinca/vim-editvar', { 'on': 'Editvar' }
Plug 'thinca/vim-github', { 'on': 'Github' }
Plug 'thinca/vim-qfreplace', { 'on': 'Qfreplace' }
Plug 'thinca/vim-ref', { 'on': 'Ref' }
Plug 'tomtom/autolinker_vim', { 'on': 'Autolinkbuffer' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-heroku', { 'on': 'Hk' }
Plug 'tpope/vim-tbone', { 'on': [ 'Tmux', 'Tyank', 'Tput', 'Twrite', 'Tattach' ] }
Plug 'vim-utils/vim-man', { 'on': [ 'Man', 'Vman', 'Mangrep' ] }
Plug 'Yggdroot/indentLine', { 'on': [ 'IndentLinesEnable', 'IndentLinesToggle' ] }

if is#windows()
  Plug 'thinca/vim-winenv', { 'on': 'WinEnv', '<Plug>(winenv-edit)' }
endif

" {{{2 QuickRun Plugins
Plug 'thinca/vim-quickrun', { 'on': [ 'QuickRun', '<Plug>(quickrun)' ] }
Plug 'bootleq/vim-qrpsqlpq'
Plug 'rhysd/quickrun-mac_notifier-outputter'
" }}}2
" }}}1

" {{{1 Scratch buffer
" Plug 'kana/vim-scratch', { 'on': [ '<Plug>(scratch-open)', '<Plug>(scratch-close)' ] }
Plug 'thinca/vim-quickmemo'
" }}}1

" {{{1 fzf
if homebrew#isdirectory('opt/fzf')
  Plug homebrew#path('opt/fzf')
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
endif
Plug 'junegunn/fzf.vim'
" }}}1

" {{{1 Editing
Plug 'tomtom/tcomment_vim'

" {{{2 Signs
" Plug 'mhinz/vim-signify'
Plug 'tomtom/quickfixsigns_vim'
" }}}2

" {{{2 Completions
Plug 'mnpk/vim-jira-complete'
" Plug 'ervandew/supertab'
Plug 'ajh17/VimCompletesMe'
Plug 'vim-jp/vital-complete', { 'for': 'vim' }
" }}}2
" }}}1

" ----- CONTINUE HERE

" {{{1 Browsing
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'AndrewRadev/andrews_nerdtree.vim'
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-gtfo'
Plug 'tyru/open-browser.vim'
" Plug 'kana/vim-metarw'
" Plug 'kana/vim-metarw-git'
" }}}1


" Utilities
Plug 'w0rp/ale'

Plug 'tjennings/git-grep-vim',
      \ { 'on': [ 'GitGrep', 'GitGrepAdd', 'LGitGrep', 'LGitGrepAdd' ] }
Plug 'vim-jp/vital.vim', { 'on': 'Vitalize' }
Plug 'vim-scripts/camelcasemotion'
Plug 'vim-scripts/ColorX', { 'on': [ 'ColorRGB', 'ColorHEX' ] }
Plug 'abudden/taghighlight-automirror'
Plug 'terryma/vim-multiple-cursors'
Plug 'chiedoX/vim-case-convert'
Plug 'christoomey/vim-sort-motion'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-qlist'
Plug 'justinmk/vim-sneak'
Plug 'vimwiki/vimwiki'

if is#mac()
  Plug 'henrik/vim-reveal-in-finder', { 'on': 'Reveal' }
  Plug 'rizzatti/dash.vim',
        \ { 'on': [ '<Plug>DashSearch', '<Plug>DashGlobalSearch', 'Dash' ] }
  Plug 'itchyny/dictionary.vim', { 'on': 'Dictionary' }
endif

" {{{1 Version Control
Plug 'tpope/vim-fugitive'
      \| Plug 'tpope/vim-rhubarb'
Plug 'jlfwong/vim-mercenary'
Plug 'tpope/vim-git',
      \ { 'for': [ 'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git' ] }
Plug 'lambdalisue/vim-gita'
Plug 'junegunn/gv.vim'
Plug 'gregsexton/gitv'
Plug 'itchyny/vim-gitbranch'
" }}}1

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
Plug 'tweekmonster/helpful.vim', { 'for': 'help' }
Plug 'farseer90718/vim-regionsyntax'
Plug 'halostatue/vim-zoom-win'
Plug 'mh21/errormarker.vim'
Plug 'mhinz/vim-startify'
Plug 'myusuf3/numbers.vim'
Plug 'thinca/vim-fontzoom', { 'on': [ '<Plug>(fontzoom-larger)', '<Plug>(fontzoom-smaller)' ] }

Plug 'henrik/vim-indexed-search'
Plug 'haya14busa/incsearch.vim'
Plug 'landock/vim-expand-region'

" Development
Plug 'jeetsukumaran/vim-buffergator'

" {{{1 Languages

" {{{2 Clojure
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" Plug 'kovisoft/paredit', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': [ 'clojure', 'scheme', 'lisp' ] }
Plug 'guns/vim-slamhound', { 'on': 'Slamhound' }
Plug 'tpope/vim-classpath', { 'for': [ 'clojure', 'java' ], 'on': [ 'Java' ] }
" }}}2

" {{{2 Ruby
Plug 'vim-ruby/vim-ruby', { 'for': [ 'ruby', 'eruby' ] }
Plug 'depuracao/vim-rdoc', { 'for': 'ruby' }
Plug 'sunaku/vim-ruby-minitest', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'on': 'Bundle' }
Plug 'tpope/vim-rails', { 'on': 'Rails' }
Plug 'tpope/vim-rake', { 'on': 'Rake' }
Plug 'michaelbruce/vim-chruby'
" }}}2

" {{{2 Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" }}}2

" {{{2 Cucumber test files
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
" }}}2

" {{{2 Templating languages
Plug 'mustache/vim-mustache-handlebars', { 'for': [ 'html.mustache', 'html.handlebars' ] }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'tpope/vim-liquid', { 'for': 'liquid' }
Plug 'mitsuhiko/vim-jinja'
" Plug 'Glench/Vim-Jinja2-Syntax'
" }}}

" {{{2 HTML, CSS, SASS, SCSS, and Less
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml', { 'for': [ 'haml', 'sass', 'scss' ] }
Plug 'JulesWang/css.vim', { 'for': [ 'css', 'scss', 'html' ] }
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss', 'html' ] }
Plug 'rstacruz/vim-hyperstyle', { 'for': [ 'css', 'scss' ] }
" }}}

Plug 'vim-scripts/applescript.vim', { 'for': 'applescript' }

Plug 'pearofducks/ansible-vim',
      \ { 'for': [ 'ansible', 'ansible_host', 'ansible_template'] }

Plug 'octol/vim-cpp-enhanced-highlight', { 'for': [ 'cpp' ] }
Plug 'vim-jp/vim-cpp', { 'for': [ 'c', 'cpp' ] }


Plug 'victoredwardocallaghan/cryptol.vim', { 'for': 'cryptol' }

Plug 'rhysd/vim-crystal', { 'for': 'crystal' }

Plug 'elubow/cql-vim', { 'for': 'cql' }

Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }

" {{{2 Docker
Plug 'honza/dockerfile.vim', { 'for': 'dockerfile' }
" Plug 'ekalinin/Dockerfile.vim'
" }}}2

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



Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }

" {{{ Go
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'vim-jp/vim-go-extra', { 'for': 'go', 'on': [ 'Godoc', 'Fmt', 'Import' ] }
" }}}

Plug 'vim-scripts/groovy.vim', { 'for': 'groovy' }



Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

Plug 'yaymukund/vim-haxe', { 'for': 'haxe' }

" {{{ JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'glanotte/vim-jasmine', { 'for': 'jasmine.javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }

if hs#plug#in('syntastic')
  Plug 'pmsorhaindo/syntastic-local-eslint.vim'
endif
" }}}

" {{{ Coffeescript
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'mtscout6/vim-cjsx', { 'for': 'coffee' }
" }}}

Plug 'elzr/vim-json', { 'for': 'json' }

Plug 'briancollins/vim-jst', { 'for': 'jst' }

Plug 'dcjones/julia-minimalist-vim', { 'for': 'julia' }

Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }

Plug 'lervag/vimtex', { 'for': [ 'tex', 'latex' ] }



Plug 'gkz/vim-ls', { 'for': 'livescript' }

Plug 'tbastos/vim-lua', { 'for': 'lua' }

Plug 'sophacles/vim-bundle-mako', { 'for': 'mako' }

Plug 'othree/nginx-contrib-vim', { 'for': 'nginx' }

Plug 'zah/nim.vim', { 'for': 'nim' }

Plug 'spwhitt/vim-nix', { 'for': 'nix' }

Plug 'b4winckler/vim-objc', { 'for': 'objc' }
  Plug 'msanders/cocoa.vim', { 'for': 'objc' }

Plug 'jrk/vim-ocaml', { 'for': 'ocaml' }
Plug 'reasonml-editor/vim-reason'

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

Plug 'PProvost/vim-ps1', { 'for': [ 'ps1', 'ps1xml' ] }

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

" {{{2 Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" }}}2

" {{{2 Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'derekwyatt/vim-sbt', { 'for': 'sbt.scala' }
" Plug 'ensime/ensime-vim',    { 'for': 'scala' }
" }}}2

" {{{2 Shells
Plug 'dag/vim-fish', { 'for': 'fish' }
" }}}2

Plug 'ethereum/vim-solidity', { 'for': 'solidity' }

Plug 'wavded/vim-stylus', { 'for': 'stylus' }

Plug 'keith/swift.vim', { 'for': 'swift' }

Plug 'kurayama/systemd-vim-syntax', { 'for': 'systemd' }

Plug 'timcharper/textile.vim', { 'for': 'textile' }

" {{{2 Data description languages (thrift, avro, protobuf)
Plug 'solarnz/thrift.vim', { 'for': 'thrift' }
Plug 'uarun/vim-protobuf', { 'for': 'proto' }
" }}}2

Plug 'keith/tmux.vim', { 'for': 'tmux' }
  Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
  Plug 'tmux-plugins/vim-tmux-focus-events'
  " Plug 'christoomey/vim-tmux-navigator'

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

" {{{2 Folds
Plug 'thinca/vim-ft-diff_fold', { 'for': 'diff' }
Plug 'thinca/vim-ft-help_fold', { 'for': 'help' }
Plug 'thinca/vim-ft-vim_fold', { 'for' : 'vim' }
" }}}

Plug 'kylef/apiblueprint.vim', { 'for': 'apiblueprint' }

Plug 'robbles/logstash.vim'

Plug 'sukima/xmledit', { 'for': 'xml' }

Plug 'flazz/vim-colorschemes'
  Plug 'godlygeek/csapprox'
  Plug 'dracula/vim'
  Plug 'ajmwagar/vim-deus'

Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'

Plug 'FooSoft/vim-argwrap'
Plug 'JarrodCTaylor/vim-shell-executor'

Plug 'AndrewRadev/whitespaste.vim'
Plug 'AndrewRadev/inline_edit.vim'
Plug 'AndrewRadev/writable_search.vim', { 'on': 'WritableSearch' }
Plug 'AndrewRadev/modsearch.vim', { 'on': 'Modsearch' }
Plug 'AndrewRadev/multichange.vim'
Plug 'AndrewRadev/linediff.vim', { 'on': [ 'Linediff', 'LinediffReset' ] }

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

Plug 'romainl/vim-qlist'

Plug 'jbranchaud/vim-bdubs', { 'on': [ 'BD', 'BW' ] }

Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

Plug 'tek/vim-fieldtrip'

Plug 'osyo-manga/vim-anzu'


Plug 'MattesGroeger/vim-bookmarks'
Plug 't9md/vim-choosewin'
Plug 'itchyny/vim-cursorword'
Plug 'bogado/file-line'

Plug 'posva/vim-vue'



" Plug 'skywind3000/asyncrun.vim'
" Plug 'google/vim-glaive'
" Plug 'google/vim-maktaba'
" Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
" Plug 'rafi/vim-tinyline'
" Plug 'lifepillar/vim-mucomplete'
" Plug 'godlygeek/tabular'
" Plug 'scrooloose/syntastic'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'chiphogg/vim-vtd'
" Plug 'sheerun/vim-polyglot'
" Plug 'sudar/vim-arduino-syntax', { 'for': 'arduino' }
" Plug 'jwalton512/vim-blade', { 'for': 'blade' } " PHP
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'jiangmiao/simple-javascript-indenter', { 'for': 'javascript' }
" Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
" Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'latex' }
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'andreshazard/vim-logreview', { 'for': 'logreview' }
" Plug 'neomake/neomake'

" {{{ Candidate Scripts
" Plug 'svermeulen/vim-easyclip'

" Look at vim stuff by rhysd
" Plug 'rhysd/vim-grammarous'
" }}}


" {{{ VimL Unit Tests
Plug 'junegunn/vader.vim', { 'for': 'vader', 'on': 'Vader' }
" }}}

" {{{ Distraction-free writing environment
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
" }}}

delfunction Cond

" vim:set foldmethod=marker
