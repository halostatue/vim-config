" vim:set foldmethod=marker :

scriptencoding utf-8

function! Cond(cond, ...)
  let l:opts = get(a:000, 0, {})
  return a:cond ? l:opts : extend(l:opts, { 'on': [], 'for': [] })
endfunction

Plug 'tpope/vim-sensible'

" {{{1 Generally useful utilities
Plug 'chrisbra/unicode.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-pseudocl'
      \| Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-slash'
  " Plug 'romainl/vim-cool'
Plug 'kana/vim-smartchr'
Plug 'kana/vim-smartinput'
  " Plug 'cohama/lexima.vim'
Plug 'lambdalisue/vim-foldround'
Plug 'LeafCage/foldCC.vim'
Plug 'mhinz/vim-hugefile'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-qlist'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'thinca/vim-localrc'
Plug 'tomtom/tinykeymap_vim'
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
Plug 'direnv/direnv.vim'
Plug 'vim-utils/vim-troll-stopper'
Plug 'unblevable/quick-scope'

" {{{2 Projects
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'scrooloose/nerdtree'
      \| Plug 'Xuyuanp/nerdtree-git-plugin'
      \| Plug 'AndrewRadev/andrews_nerdtree.vim'
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-gtfo'
Plug 'tyru/open-browser.vim'
Plug 'kana/vim-metarw'
      \| Plug 'kana/vim-metarw-git'
" }}}2

" {{{2 Version Control
" {{{3 Fugitive
Plug 'tpope/vim-fugitive'
      \| Plug 'tpope/vim-rhubarb'
      \| Plug 'junegunn/gv.vim', { 'on': 'GV' }
      \| Plug 'gregsexton/gitv', { 'on': 'Gitv' }
" }}}3
" Plug 'rhysd/committia.vim'
Plug 'jlfwong/vim-mercenary'
Plug 'lambdalisue/gina.vim', { 'on': 'Gina' }
" }}}2
" }}}1

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
Plug 'tweekmonster/exception.vim'
" }}}1

" {{{1 Submodes
Plug 'kana/vim-submode'
" }}}1

" {{{1 Text objects
Plug 'junegunn/vim-after-object'
Plug 'vim-utils/vim-all'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'

" {{{2 Provided by kana/vim-textobj-user
"      Temporarily disabled for performance investigation.
" Plug 'kana/vim-textobj-user'
"
" Plug 'bootleq/vim-textobj-rubysymbol'
" Plug 'kana/vim-textobj-datetime'
" Plug 'kana/vim-textobj-diff'
" Plug 'kana/vim-textobj-fold'
" Plug 'kana/vim-textobj-function'
" Plug 'thinca/vim-textobj-function-javascript'
" Plug 'thinca/vim-textobj-function-perl'
" Plug 'kana/vim-textobj-indent'
" Plug 'kana/vim-textobj-line'
" Plug 'kana/vim-textobj-syntax'
" Plug 'lucapette/vim-textobj-underscore'
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'reedes/vim-textobj-quote'
" Plug 'reedes/vim-textobj-sentence'
" Plug 'rhysd/vim-textobj-anyblock'
" Plug 'rhysd/vim-textobj-ruby'
" Plug 'rhysd/vim-textobj-conflict'
" Plug 'thalesmello/vim-textobj-methodcall'
" Plug 'thinca/vim-textobj-comment'
" Plug 'whatyouhide/vim-textobj-xmlattr'
" }}}2
" }}}1

" {{{1 Motions
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'haya14busa/vim-asterisk'
Plug 'justinmk/vim-sneak'
Plug 'rhysd/clever-f.vim'
Plug 'vim-scripts/camelcasemotion'
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
Plug 'rhysd/vim-operator-trailingspace-killer'
" }}}1

" {{{1 Asynchronous Execution
Plug 'tpope/vim-dispatch'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" }}}1

" {{{1 :Commands
Plug 'Shougo/vinarise', { 'on': 'Vinarise' }
Plug 'Yggdroot/indentLine', { 'on': [ 'IndentLinesEnable', 'IndentLinesToggle' ] }
Plug 'abudden/taghighlight-automirror', { 'on': 'UpdateTypesFile' }
Plug 'ervandew/lookup', { 'on': 'Lookup' }
Plug 'janko-m/vim-test', { 'on': [ 'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit' ] }
Plug 'jeetsukumaran/vim-buffergator', { 'on': [ 'BuffergatorToggle' ] }
Plug 'junegunn/vim-easy-align', { 'on': [ '<Plug>(EasyAlign)', 'EasyAlign' ] }
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
" Plug 'justinmk/vim-dirvish', { 'on': 'Dirvish' }
Plug 'kana/vim-grex', { 'on': [ 'Grey', 'Gred' ] }
Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mhinz/vim-grepper', { 'on': [ 'Grepper', '<Plug>(GrepperOperator)' ] }
Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' }
Plug 'rstacruz/vim-xtract', { 'on': 'Xtract' }
Plug 'thinca/vim-editvar', { 'on': 'Editvar' }
Plug 'thinca/vim-github', { 'on': 'Github' }
Plug 'thinca/vim-qfreplace', { 'on': 'Qfreplace' }
Plug 'thinca/vim-ref', { 'on': 'Ref' }
Plug 'tomtom/autolinker_vim', { 'on': 'Autolinkbuffer' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-heroku', { 'on': 'Hk' }
Plug 'tpope/vim-tbone', { 'on': [ 'Tmux', 'Tyank', 'Tput', 'Twrite', 'Tattach' ] }
Plug 'vim-utils/vim-man', { 'on': [ 'Man', 'Vman', 'Mangrep' ] }

" {{{2 Mac Commands
if hs#is#mac()
  Plug 'itchyny/dictionary.vim', { 'on': 'Dictionary' }
  Plug 'rizzatti/dash.vim', { 'on': [ '<Plug>DashSearch', '<Plug>DashGlobalSearch', 'Dash' ] }
  Plug 'vim-scripts/ColorX', { 'on': [ 'ColorRGB', 'ColorHEX' ] }
endif
" }}}2

" {{{2 Windows Commands
if hs#is#windows()
  Plug 'thinca/vim-winenv', { 'on': 'WinEnv', '<Plug>(winenv-edit)' }
endif
" }}}2

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
  let &runtimepath .= ',' . homebrew#path('opt/fzf')
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
endif
" }}}1

" {{{1 Editing
Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'landock/vim-expand-region'

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

" {{{1 Window display utilities
Plug 'halostatue/vim-zoom-win'
Plug 'itchyny/vim-cursorword'
Plug 'mhinz/vim-startify'
Plug 'myusuf3/numbers.vim'
Plug 'thinca/vim-fontzoom', { 'on': [ '<Plug>(fontzoom-larger)', '<Plug>(fontzoom-smaller)' ] }

" {{{2 Search
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'osyo-manga/vim-anzu'
Plug 'google/vim-searchindex'
" }}}2
" }}}1

" {{{1 Language Support
" {{{2 Syntax checking
Plug 'w0rp/ale'
" }}}2

" {{{2 API Definition Languages
" {{{3 API Blueprint
Plug 'kylef/apiblueprint.vim', { 'for': 'apiblueprint' }
" }}}3
" {{{3 RAML
Plug 'IN3D/vim-raml', { 'for': 'raml' }
" }}}3
" }}}2
" {{{2 AppleScript
Plug 'vim-scripts/applescript.vim', { 'for': 'applescript' }
" }}}2
" {{{2 Ansible
Plug 'pearofducks/ansible-vim', { 'for': [ 'ansible', 'ansible_host', 'ansible_template'] }
" }}}2
" {{{2 C/C++
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': [ 'cpp' ] }
Plug 'vim-jp/vim-cpp', { 'for': [ 'c', 'cpp' ] }
" {{{3 YACC Output y.output
Plug 'rhysd/y-output.vim', { 'for': 'y-output' }
" }}}3
" }}}2
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
" {{{2 Coffeescript
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'mtscout6/vim-cjsx', { 'for': 'coffee' }
" }}}2
" " {{{2 Configuration Files
" " {{{3 LogStash
" Plug 'robbles/logstash.vim', { 'for': 'logstash' }
" " }}}3
" " {{{3 Nginx
" Plug 'othree/nginx-contrib-vim', { 'for': 'nginx' }
" " }}}3
" " {{{3 Systemd
" Plug 'kurayama/systemd-vim-syntax', { 'for': 'systemd' }
" " }}}3
" " }}}2
" {{{2 CQL
Plug 'elubow/cql-vim', { 'for': 'cql' }
" }}}2
" {{{2 Cryptol
Plug 'victoredwardocallaghan/cryptol.vim', { 'for': 'cryptol' }
" }}}2
" {{{2 Crystal
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
" }}}2
" {{{2 CSV
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
" }}}2
" {{{2 Cucumber
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
" }}}2
" {{{2 Dart
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
" }}}2
" {{{2 Data description languages (thrift, avro, protobuf)
Plug 'solarnz/thrift.vim', { 'for': 'thrift' }
Plug 'uarun/vim-protobuf', { 'for': 'proto' }
" }}}2
" {{{2 Docker
Plug 'honza/dockerfile.vim', { 'for': 'dockerfile' }
" Plug 'ekalinin/Dockerfile.vim'
" }}}2
" {{{2 Elixir
Plug 'elixir-lang/vim-elixir', { 'for': [ 'elixir', 'eelixir' ] }
  Plug 'mattreduce/vim-mix', { 'for': [ 'elixir', 'eelixir' ] }
  Plug 'c-brenn/phoenix.vim'
  Plug 'slashmili/alchemist.vim'
  " let g:alchemist_tag_disable = 1
" }}}2
" {{{2 Elm
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
" }}}2
" {{{2 Ember
Plug 'yalesov/vim-ember-script', { 'for': 'ember-script' }
      \| Plug 'yalesov/vim-emblem', { 'for': 'emblem' }
" }}}2
" {{{2 Erlang
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }
  Plug 'vim-erlang/erlang-motions.vim', { 'for': 'erlang' }
  Plug 'vim-erlang/vim-erlang-compiler'
  Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
  Plug 'vim-erlang/vim-erlang-tags', { 'for': 'erlang' }
" }}}2
" {{{2 Git, diff, etc.
Plug 'tpope/vim-git', { 'for': [ 'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git' ] }
Plug 'lambdalisue/vim-unified-diff'
" }}}2
" {{{2 GLSL
Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }
" }}}2
" {{{2 Go
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'vim-jp/vim-go-extra', { 'for': 'go', 'on': [ 'Godoc', 'Fmt', 'Import' ] }
Plug 'rhysd/vim-goyacc', { 'for': 'goyacc' }
" }}}2
" {{{2 Groovy
Plug 'vim-scripts/groovy.vim', { 'for': 'groovy' }
" }}}2
" {{{2 Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" }}}2
" {{{2 Haxe
Plug 'yaymukund/vim-haxe', { 'for': 'haxe' }
" }}}2
" {{{2 HTML, CSS, SASS, SCSS, and Less
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml', { 'for': [ 'haml', 'sass', 'scss' ] }
Plug 'JulesWang/css.vim', { 'for': [ 'css', 'scss', 'html' ] }
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss', 'html' ] }
Plug 'rstacruz/vim-hyperstyle', { 'for': [ 'css', 'scss' ] }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
" }}}
" {{{2 Io
Plug 'andreimaxim/vim-io', { 'for': 'io' }
" }}}2
" {{{2 JavaScript
Plug 'glanotte/vim-jasmine', { 'for': 'jasmine.javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'posva/vim-vue', { 'for': [ 'vue', 'javascript.vue' ] }
Plug 'rhysd/npm-filetypes.vim', { 'for': [ 'npm-debug-log', 'npmrc' ]}

if hs#plug#in('syntastic')
  Plug 'pmsorhaindo/syntastic-local-eslint.vim'
endif
" }}}2
" {{{2 JSON
Plug 'elzr/vim-json', { 'for': 'json' }
" }}}2
" {{{2 Julia
Plug 'dcjones/julia-minimalist-vim', { 'for': 'julia' }
" }}}2
" {{{2 Kotlin
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
" }}}2
" {{{2 LaTeX / TeX
Plug 'lervag/vimtex', { 'for': [ 'tex', 'latex' ] }
" }}}2
" {{{2 LiveScript
Plug 'gkz/vim-ls', { 'for': 'livescript' }
" }}}2
" {{{2 Lua
Plug 'tbastos/vim-lua', { 'for': 'lua' }
" }}}2
" {{{2 Mako
Plug 'sophacles/vim-bundle-mako', { 'for': 'mako' }
" }}}2
" {{{2 Nim
Plug 'zah/nim.vim', { 'for': 'nim' }
" }}}2
" {{{2 Nix
Plug 'spwhitt/vim-nix', { 'for': 'nix' }
" }}}2
" {{{2 Objective-C
Plug 'b4winckler/vim-objc', { 'for': 'objc' }
  Plug 'msanders/cocoa.vim', { 'for': 'objc' }
" }}}2
" {{{2 Ocaml/Reason
Plug 'jrk/vim-ocaml', { 'for': 'ocaml' }
Plug 'reasonml-editor/vim-reason'
" }}}2
" {{{2 Octave
Plug 'vim-scripts/octave.vim--', { 'for': 'octave' }
" }}}2
" {{{2 OpenCL
Plug 'petRUShka/vim-opencl', { 'for': 'opencl' }
" }}}2
" {{{2 Perl
Plug 'vim-perl/vim-perl', { 'for': 'perl' }
" }}}2
" {{{2 Postgres SQL/PgPLSQL
Plug 'exu/pgsql.vim', { 'for': 'pgsql' }
" }}}2
" {{{2 PHP
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
  Plug 'rayburgemeestre/phpfolding.vim', { 'for': 'php' }
  Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
  Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
  Plug 'rafi/vim-phpspec', { 'for': 'php' }
" }}}2
" {{{2 PlantUML
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
" }}}2
" {{{2 PowerShell
Plug 'PProvost/vim-ps1', { 'for': [ 'ps1', 'ps1xml' ] }
" }}}2
" {{{2 Puppet
Plug 'voxpupuli/vim-puppet', { 'for': [ 'puppet', 'ruby' ] }
  " Plug 'ajf/puppet-vim', { 'for': 'puppet' }
" }}}2
" {{{2 PureScript
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }
" }}}2
" {{{2 Python
Plug 'mitsuhiko/vim-python-combined', { 'for': 'python' }
  Plug 'aliev/vim-compiler-python'
  Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
" }}}2
" {{{2 QML
Plug 'peterhoeg/vim-qml', { 'for': 'qml' }
" }}}2
" {{{2 R
Plug 'vim-scripts/R.vim', { 'for': 'r-lang' }
" }}}2
" {{{2 Ragel
Plug 'jneen/ragel.vim', { 'for': 'ragel' }
" }}}2
" {{{2 Ruby
Plug 'vim-ruby/vim-ruby', { 'for': [ 'ruby', 'eruby' ] }
Plug 'depuracao/vim-rdoc', { 'for': 'ruby' }
Plug 'sunaku/vim-ruby-minitest', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'on': 'Bundle' }
Plug 'tpope/vim-rails', { 'on': 'Rails' }
Plug 'tpope/vim-rake', { 'on': 'Rake' }
Plug 'michaelbruce/vim-chruby'
" {{{3 Rspec
Plug 'sheerun/rspec.vim', { 'for': [ 'rspec', 'ruby.rspec' ] }
" }}}3
" {{{3 Tomdoc
Plug 'wellbredgrapefruit/tomdoc.vim', { 'for': 'tomdoc' }
" }}}3
" {{{3 Yard
Plug 'sheerun/vim-yardoc', { 'for': 'yard' }
" }}}3
" }}}2
" {{{2 Rust
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rhysd/rust-doc.vim', { 'for': 'rust' }
Plug 'rhysd/vim-rustpeg', { 'for': 'rustpeg' }
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
" {{{2 Solidity
Plug 'ethereum/vim-solidity', { 'for': 'solidity' }
" }}}2
" {{{2 Swift
Plug 'keith/swift.vim', { 'for': 'swift' }
" }}}2
" {{{2 Text files and markdown languages
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'christoomey/vim-quicklink'
" {{{3 Markdown
" Disabled for issue https://github.com/plasticboy/vim-markdown/issues/323
" Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-gfm-syntax', { 'for': 'markdown' }
" }}}3
" {{{3 Org
Plug 'jceb/vim-orgmode', { 'for': 'org' }
" }}}3
" {{{3 TaskPaper
Plug 'davidoc/taskpaper.vim', { 'for': 'taskpaper' }
" }}}3
" {{{3 Textile
Plug 'timcharper/textile.vim', { 'for': 'textile' }
" }}}3
" {{{3 Vimwiki
Plug 'vimwiki/vimwiki', { 'for': 'vimwiki' }
" }}}3
" }}}2
" {{{2 Templating languages
" {{{3 Jinja/Jinja2
" Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mitsuhiko/vim-jinja'
" }}}3
" {{{3 JST
Plug 'briancollins/vim-jst', { 'for': 'jst' }
" }}}3
" {{{3 Liquid
Plug 'tpope/vim-liquid', { 'for': 'liquid' }
" }}}3
" {{{3 Mustache/Handlebars
Plug 'mustache/vim-mustache-handlebars', { 'for': [ 'html.mustache', 'html.handlebars' ] }
" }}}3
" {{{3 Pug (formerly Jade)
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
" }}}3
" {{{3 Slim
Plug 'slim-template/vim-slim', { 'for': 'slim' }
" }}}3
" }}}2
" {{{2 Tmux
Plug 'keith/tmux.vim', { 'for': 'tmux' }
  Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
  Plug 'tmux-plugins/vim-tmux-focus-events'
  " Plug 'christoomey/vim-tmux-navigator'
" }}}2
" {{{2 Toml
Plug 'cespare/vim-toml', { 'for': 'toml' }
" }}}2
" {{{2 Twig
Plug 'lumiliet/vim-twig', { 'for': 'twig' }
" }}}2
" {{{2 Typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" }}}2
" {{{2 Vala
Plug 'tkztmk/vim-vala', { 'for': 'vala' }
" }}}2
" {{{2 VB.net
Plug 'vim-scripts/vbnet.vim', { 'for': 'vbnet' }
" }}}2
" {{{2 VCL
Plug 'smerrill/vcl-vim-plugin', { 'for': 'vcl' }
" }}}2
" {{{2 Velocity
Plug 'lepture/vim-velocity', { 'for': 'velocity' }
" }}}2
" {{{2 VimL/vimhelp
Plug 'junegunn/vader.vim', { 'for': 'vader', 'on': 'Vader' }
Plug 'tweekmonster/helpful.vim', { 'for': 'help' }
" {{{3 Folds
Plug 'thinca/vim-ft-diff_fold', { 'for': 'diff' }
Plug 'thinca/vim-ft-help_fold', { 'for': 'help' }
Plug 'thinca/vim-ft-vim_fold', { 'for' : 'vim' }
" }}}3
" }}}2
" {{{2 WebAssembly
Plug 'rhysd/vim-wasm', { 'for': 'wast' }
" }}}2
" {{{2 XML
Plug 'sukima/xmledit', { 'for': 'xml' }
" {{{3 XSLT
Plug 'vim-scripts/XSLT-syntax', { 'for': [ 'xsl', 'xslt' ] }
" }}}3
" }}}2
" {{{2 YAML
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
" }}}2
" {{{2 GraphQL
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
" }}}2
" }}}1

" {{{1 Color Schemes
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/csapprox'
Plug 'dracula/vim'
Plug 'chrisbra/Colorizer'
" }}}1

" ----- CONTINUE HERE

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
  " Plug 'vim-scripts/dbext.vim'

Plug 'itspriddle/vim-marked', { 'for': 'markdown' }
Plug 'reedes/vim-lexical', { 'for': [ 'markdown', 'mkd', 'text' ] }
Plug 'reedes/vim-litecorrect', { 'for': [ 'markdown', 'mkd', 'text' ] }
Plug 'reedes/vim-wordy', { 'on': [ 'Wordy', 'NextWordy', 'PrevWordy' ] }

Plug 'jbranchaud/vim-bdubs', { 'on': [ 'BD', 'BW' ] }

Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

Plug 'tek/vim-fieldtrip'

Plug 'osyo-manga/vim-anzu'

Plug 'MattesGroeger/vim-bookmarks'
Plug 't9md/vim-choosewin'
Plug 'kopischke/vim-fetch'

" Plug 'skywind3000/asyncrun.vim'
" Plug 'google/vim-glaive'
" Plug 'google/vim-maktaba'
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

" {{{1 Candidate Scripts
" Plug 'svermeulen/vim-easyclip'

" Look at vim stuff by rhysd
" Plug 'rhysd/vim-clang-format' " requires clang-format
" Plug 'rhysd/vim-operator-surround'
" }}}1

delfunction Cond

" vim:set foldmethod=marker
