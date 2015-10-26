" Plugins
" Make vim make sense by default.
Plug 'tpope/vim-sensible'

" Utility functions
Plug 'halostatue/vim-cecutil'
Plug 'mattn/webapi-vim'
Plug 'thinca/vim-openbuf'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-haystack'

" A sensible foldtext function.
Plug 'LeafCage/foldCC.vim'

" DLL-based vim process.
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Asynchronous compiler calls.
Plug 'tpope/vim-dispatch',
      \ { 'on': [
      \     'Make', 'Copen', 'Dispatch', 'FocusDispatch', 'Start', 'Spawn'
      \   ]
      \ }

" Hex editor
Plug 'Shougo/vinarise', { 'on': 'Vinarise' }

" Vim statusline replacement.
Plug 'bling/vim-airline'

" User textobject functions.
Plug 'bootleq/vim-textobj-rubysymbol', { 'for': 'ruby' }
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
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'thinca/vim-textobj-comment'
Plug 'thinca/vim-textobj-function-javascript', { 'for': 'javascript' }
Plug 'thinca/vim-textobj-function-perl', { 'for': 'perl' }
Plug 'vim-scripts/vim-textobj-quoted'
Plug 'vim-scripts/argtextobj.vim'

" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
" Plug 'ctrlp-related'

" Plug 'vim-scripts/dbext.vim'

" File Management
Plug 'tpope/vim-eunuch',
      \ { 'on': [
      \     'Unlink', 'Remove', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Find',
      \     'Locate', 'SudoEdit', 'SudoWrite', 'Wall', 'W'
      \   ]
      \ }

if homebrew#isdirectory('opt/fzf')
  set rtp+=homebrew#path("opt/fzf")
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
endif

" Editorconfig standard
Plug 'editorconfig/editorconfig-vim'

" vim-man
" Temporarily disabled because of https://github.com/bruno-/vim-man/issues/23.
Plug 'bruno-/vim-man'

" Completion code.
Plug 'Valloric/YouCompleteMe',
      \{
      \   'do': 'YCM_CORES=1 ./install.sh --clang-completer --omnisharp-completer'
      \ }

Plug 'mnpk/vim-jira-complete'

Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
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
Plug 'tpope/vim-vinegar'
Plug 'vim-jp/vital.vim', { 'on': 'Vitalize' }
Plug 'vim-scripts/camelcasemotion'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/ColorX', { 'on': [ 'ColorRGB', 'ColorHEX' ] }
Plug 'majutsushi/tagbar'
Plug 'abudden/taghighlight-automirror'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-ref'

Plug 'vimwiki/vimwiki'

if is#mac()
  Plug 'henrik/vim-reveal-in-finder', { 'on': 'Reveal' }
  Plug 'rizzatti/dash.vim',
        \ { 'on': [ '<Plug>DashSearch', '<Plug>DashGlobalSearch', 'Dash' ] }
endif

" VCS
Plug 'tpope/vim-fugitive'
Plug 'jlfwong/vim-mercenary'
Plug 'gregsexton/gitv'

" gf (open file under cursor) extensions
Plug 'kana/vim-gf-user'
Plug 'kana/vim-gf-diff', { 'for': 'diff' }

" Global regular expression execution
Plug 'kana/vim-operator-user'
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

" Ag instead of Grep.
Plug 'rking/ag.vim', { 'on': [ 'Ag', 'AgAdd', 'LAg', 'LAgAdd' ] }

" Vim-Test
Plug 'janko-m/vim-test',
      \ { 'on': [
      \     'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'
      \   ]
      \ }

" Display Helpers
Plug 'myusuf3/numbers.vim'
Plug 'flazz/vim-colorschemes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'halostatue/vim-zoom-win'
Plug 'thinca/vim-fontzoom'
Plug 'farseer90718/vim-regionsyntax'
Plug 'halostatue/vim-ansi-esc', { 'on': 'AnsiEsc' }
Plug 'henrik/vim-indexed-search'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'tomtom/quickfixsigns_vim'

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
Plug 'tpope/vim-projectionist',
      \ { 'on': [ 'A', 'AS', 'AV', 'AT', 'AD', 'Cd', 'Lcd', 'ProjectDo' ] }
Plug 'jeetsukumaran/vim-buffergator'

" Syntax Plugins
Plug 'adamlowe/vim-slurper', { 'for': 'slurper' }
Plug 'henrik/vim-yaml-flattener', { 'for': 'yaml' }
Plug 'ajf/puppet-vim', { 'for': 'puppet' }
Plug 'andreimaxim/vim-io', { 'for': 'io' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chase/vim-ansible-yaml', { 'for': 'ansible' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'depuracao/vim-rdoc', { 'for': 'ruby' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'guns/vim-sexp', { 'for': [ 'clojure', 'scheme', 'lisp' ] }
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss', 'html' ] }
Plug 'thinca/vim-ft-clojure', { 'for': 'clojure' }
Plug 'tpope/vim-liquid', { 'for': 'liquid' }
Plug 'tpope/vim-sexp-mappings-for-regular-people',
      \ { 'for': [ 'clojure', 'scheme', 'lisp' ] }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'davidoc/taskpaper.vim', { 'for': 'taskpaper' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'thinca/vim-ft-diff_fold', { 'for': 'diff' }
Plug 'thinca/vim-ft-help_fold', { 'for': 'help' }
Plug 'thinca/vim-ft-markdown_fold', { 'for': 'markdown' }
Plug 'thinca/vim-ft-vim_fold', { 'for' : 'vim' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'kylef/apiblueprint.vim', { 'for': 'apiblueprint' }
Plug 'msanders/cocoa.vim', { 'for': 'objc' }
Plug 'mustache/vim-mustache-handlebars',
      \ { 'for': [ 'html.mustache', 'html.handlebars' ] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'sunaku/vim-ruby-minitest', { 'for': 'ruby' }
Plug 'timcharper/textile.vim', { 'for': 'textile' }
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
Plug 'tpope/vim-git',
      \ { 'for': [
      \     'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git'
      \   ],
      \   'on': 'DiffGitCached'
      \ }
Plug 'tpope/vim-haml',
      \ { 'for': [ 'haml', 'hamlbars', 'hamlc', 'sass', 'scss' ] }
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }
Plug 'vim-erlang/erlang-motions.vim', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-tags', { 'for': 'erlang' }
Plug 'othree/html5.vim'
