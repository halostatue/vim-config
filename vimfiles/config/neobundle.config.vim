" {{{1 NeoBundle manages itself.
NeoBundleFetch 'Shougo/neobundle.vim'
" }}}1

" {{{2 vim-niceblock: Make blockwise Visual mode more useful
NeoBundleLazy 'kana/vim-niceblock',
      \ { 'autoload' : { 'mappings' : '<Plug>' }
      \ }
" }}}2

" {{{2 echodoc.vim: Print documentation in echo area
NeoBundleLazy 'Shougo/echodoc.vim',
      \ { 'autoload' : {
      \     'insert' : 1
      \   }
      \ }
" }}}2

" {{{2 neocomplete.vim: Next generation of auto completion framework
" -> context_filetype.vim: Context filetype library for Vim script
NeoBundleLazy 'Shougo/neocomplete.vim',
      \ { 'depends' : [ 'Shougo/context_filetype.vim' ],
      \   'insert' : 1
      \ }
" }}}2

" {{{2 neosnippet.vim: Next generation snippet support for Vim
" -> neosnippet-snippets: standard snippets for neosnippets
NeoBundleLazy 'Shougo/neosnippet.vim',
      \ { 'depends' : [
      \     'Shougo/neosnippet-snippets', 'Shougo/context_filetype.vim'
      \   ],
      \   'autoload' : {
      \     'insert' : 1,
      \     'filetypes' : 'snippet',
      \     'unite_sources' : [
      \       'neosnippet', 'neosnippet/user', 'neosnippet/runtime'
      \     ],
      \   }
      \ }
" }}}2

" {{{2 Standard recipe files for neobundle
NeoBundle 'Shougo/neobundle-vim-recipes'
" }}}2

" {{{2 Unite: Unite and create user interfaces
NeoBundleLazy 'Shougo/unite.vim',
      \ { 'autoload' : {
      \     'commands' : [
      \       { 'name' : 'Unite',
      \         'complete' : 'customlist,unite#complete_source'
      \       }
      \     ]
      \   }
      \ }
" }}}2

" {{{2 unite-build: Build by unite interface
NeoBundleLazy 'Shougo/unite-build', { 'depends' : [ 'Shougo/unite.vim' ] }
" }}}2

" {{{2 neossh: SSH interface for Vim plugins
NeoBundleLazy 'Shougo/neossh.vim',
      \ { 'autoload' : {
      \     'filetypes' : [ 'vimfiler' ],
      \     'unite_sources' : [ 'ssh' ],
      \   }
      \ }
" }}}2

" {{{2 neomru: MRU plugin includes unite.vim MRU sources
NeoBundleLazy 'Shougo/neomru.vim',
      \ { 'depends' : [ 'Shougo/unite.vim' ],
      \   'autoload' : { 'unite_sources' : [ 'mru' ] }
      \ }
" }}}2

" {{{2 tabpagebuffer: Tabpage buffer interface
NeoBundle 'Shougo/tabpagebuffer.vim'
" }}}2

" {{{2 vimshell-ssh: Run Vim over ssh on Vim
NeoBundleLazy 'ujihisa/vimshell-ssh',
      \ { 'autoload' : { 'filetypes' : 'vimshell' }
      \ }
" }}}2

" {{{2 unite-sudo: sudo source for unite
NeoBundle 'Shougo/unite-sudo',
      \ { 'depends' : [ 'Shougo/unite.vim' ],
      \   'autoload' : { 'unite_sources' : [ 'sudo' ] }
      \ }
" }}}2

" {{{2 vim-vcs: Comprehensive VCS plug-ins
" {{{3 -> vim-openbuf: Open and manage buffers
NeoBundleLazy 'Shougo/vim-vcs',
      \ { 'depends' : 'thinca/vim-openbuf',
      \   'autoload' : {
      \     'functions' : [ 'vcs#info' ],
      \     'commands' : [ 'Vcs' ]
      \   },
      \ }
" }}}3
" }}}2

" {{{2 vimfiler: Powerful file explorer implemented by Vim script
NeoBundleLazy 'Shougo/vimfiler.vim',
      \ { 'depends' : [ 'Shougo/unite.vim' ],
      \   'autoload' : {
      \     'commands' : [
      \       { 'name' : [ 'VimFiler', 'Edit', 'Write' ],
      \         'complete' : 'customlist,vimfiler#complete'
      \       },
      \       'VimFilerExplorer',
      \       'Edit', 'Read', 'Source', 'Write'
      \     ],
      \     'mappings' : '<Plug>',
      \     'explorer' : 1,
      \   }
      \ }
" }}}2

" {{{2 vimproc: Asynchronous execution plugin for Vim
NeoBundle 'Shougo/vimproc.vim',
      \ { 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \   }
      \ }
" }}}2

" {{{2 vimshell: Powerful shell implemented by Vim script
NeoBundleLazy 'Shougo/vimshell.vim',
      \ { 'depends' : 'Shougo/vimproc.vim',
      \   'autoload' : {
      \     'commands' : [
      \       { 'name' : 'VimShell',
      \         'complete' : 'customlist,vimshell#complete'
      \       },
      \       'VimShellExecute',
      \       'VimShellInteractive',
      \       'VimShellTerminal',
      \       'VimShellPop'
      \     ],
      \     'mappings' : '<Plug>'
      \   }
      \ }

" }}}2

" {{{2 vim-gitcomplete: completion of git commands
NeoBundleLazy 'yomi322/vim-gitcomplete',
      \ { 'autoload' : { 'filetypes' : [ 'vimshell' ] }
      \ }
" }}}2

" {{{2  vinarise: Ultimate hex editing system with Vim
NeoBundleLazy 'Shougo/vinarise.vim',
      \ { 'autoload' : {
      \     'commands' : [
      \       { 'name' : 'Vinarise',
      \         'complete' : 'file'
      \       }
      \     ]
      \   }
      \ }
" }}}2

" {{{2 vesting: VimL testing
NeoBundleLazy 'Shougo/vesting',
      \ { 'autoload' : { 'unite_sources' : [ 'vesting' ] }
      \ }
" }}}2

" {{{2 vim-jp/vital.vim: comprehensive Vim utility functions for Vim plugins
NeoBundleLazy 'vim-jp/vital.vim',
      \ { 'autoload' : { 'commands' : [ 'Vitalize' ] }
      \ }
" }}}2

" {{{2 junkfile: Create and work with a junkfile
NeoBundleLazy 'Shougo/junkfile.vim',
      \ { 'autoload' : {
      \     'commands' : [ 'JunkfileOpen' ],
      \     'unite_sources' : [ 'junkfile', 'junkfile/new' ],
      \   }
      \ }
" }}}2

" {{{2 unite-outline: Current buffer outline view with Unite
NeoBundleLazy 'Shougo/unite-outline',
      \ { 'depends' : [ 'Shougo/unite.vim' ],
      \   'autoload' : { 'unite_sources' : [ 'outline' ] }
      \ }
" }}}2

" {{{2 vim-css3-syntax: Extend CSS syntax highlighting for CSS3
NeoBundleLazy 'hail2u/vim-css3-syntax',
      \ { 'autoload' : { 'filetypes' : [ 'css', 'scss', 'html' ] }
      \ }
" }}}2

" {{{2 vim-smartchr: Insert several candidates with a single key
NeoBundleLazy 'kana/vim-smartchr',
      \ { 'autoload' : { 'insert' : 1 }
      \ }
" }}}2

" {{{2 vim-smartword: Insert several candidates with a single key
NeoBundleLazy 'kana/vim-smartword',
      \ { 'autoload' : {
      \     'mappings' : [
      \       '<Plug>(smartword-'
      \     ]
      \   }
      \ }
" }}}2

" {{{2 ctrlp: Fuzzy file, buffer, mru, tag, ... finder
NeoBundleLazy 'ctrlpvim/ctrlp.vim',
      \ { 'autoload' : {
      \     'commands' : [
      \       'CtrlP', 'CtrlPBuffer', 'CtrlPMRU', 'CtrlPTag',
      \       'CtrlPDir', 'CtrlPRTS', 'CtrlPUndo', 'CtrlPMixed'
      \     ]
      \   }
      \ }
" }}}2

" {{{2 foldCC: high-quality 'foldtext' function
NeoBundleLazy 'LeafCage/foldCC.vim',
      \ { 'autoload' : {
      \     'functions' : [ 'FoldCCtext' ]
      \   }
      \ }
" }}}2

" {{{2 vim-slurper: companion to the slurper gem for Pivotal Tracker
NeoBundleLazy 'adamlowe/vim-slurper',
      \ { 'autoload' : {
      \     'filetypes' : [ 'slurper' ]
      \   }
      \ }
" }}}2

" {{{2 rename.vim: Rename current file in vim buffer; retain relative path.
NeoBundleLazy 'danro/rename.vim',
      \ { 'autoload' : {
      \     'commands' : [
      \       { 'name' : [ 'Rename' ],
      \         'complete' : 'customlist,SiblingFiles'
      \       }
      \     ],
      \     'mappings' : '<Plug>',
      \   }
      \ }
" }}}2

" {{{2 ag.vim: Search with ag
NeoBundleLazy 'rking/ag.vim',
      \ { 'autoload' : { 'commands' : [ 'Ag', 'AgAdd', 'LAg', 'LAgAdd' ] }
      \ }
" }}}2

" {{{2 supertab: Supertab allows insert completion with tab key
NeoBundle 'ervandew/supertab'
" }}}2

" {{{2 tabular: Rename current file in vim buffer; retain relative path.
NeoBundleLazy 'godlygeek/tabular',
      \ { 'commands' : [
      \     { 'name' : [ 'Tabularize' ],
      \       'complete' : 'customlist,<SID>CompleteTabularizeCommand'
      \     }
      \   ],
      \   'mappings' : '<Plug>',
      \ }
" }}}2

" {{{2 vim-gf-diff: Go to a hunk from diff output
NeoBundleLazy 'kana/vim-gf-diff',
      \ { 'depends' : [ 'vim-gf-user' ],
      \   'autoload' : { 'filetypes' : [ 'diff' ] }
      \ }
" }}}2

" {{{2 vim-gf-user: A framework to open a file by context
NeoBundle 'kana/vim-gf-user'
" }}}2

" {{{2 vim-grex: Operate on lines matched to the last search pattern (:g/re/x)
NeoBundleLazy 'kana/vim-grex',
      \ { 'autoload' : {
      \     'commands' : [ 'Grey', 'Gred' ],
      \     'functions' : [ 'grex#delete', 'grex#yank' ]
      \   }
      \ }
" }}}2

" {{{2 vim-scratch: Emacs like scratch buffer
NeoBundleLazy 'kana/vim-scratch',
      \ { 'autoload' : {
      \     'commands' : [ 'ScratchOpen' ],
      \     'functions' : [ 'scratch#open' ]
      \   }
      \ }
" }}}2

" {{{2 vim-smartinput: Provide smart input assistant
" NeoBundleLazy 'kana/vim-smartinput'
" }}}2

" {{{2 vim-pipe: Pass the current buffer through a shell command, see the results
NeoBundle 'krisajenkins/vim-pipe'
" }}}2

" {{{2 gist-vim: Vimscript for creating gists (http://gist.github.com)
" {{{3 -> webapi-vim: Interface to various Web APIs
NeoBundleLazy 'mattn/gist-vim',
      \ { 'depends' : [ 'mattn/webapi-vim' ],
      \   'autoload' : { 'commands' : [ 'Gist' ] }
      \ }
" }}}3
" }}}2

" {{{2 vim-signify: Indicate changed lines within a file using a VCS
NeoBundle 'mhinz/vim-signify'
" }}}2

" {{{2 numbers.vim: A plugin for intelligently toggling line numbers
NeoBundle 'myusuf3/numbers.vim'
" }}}2

" {{{2 syntastic: Syntax checking on the fly
NeoBundle 'scrooloose/syntastic'
" }}}2

" {{{2 thoughtbot/vim-rspec: lightweight RSpec runner
NeoBundleLazy 'thoughtbot/vim-rspec',
      \ { 'autoload' : {
      \     'filetypes' : [ 'ruby' ]
      \   }
      \ }
" }}}2

" {{{2 vim-fontzoom: Fontsize controller for gVim.
NeoBundle 'thinca/vim-fontzoom'
" }}}2

" {{{2 vim-prettyprint: Prettyprint vim variables
NeoBundleLazy 'thinca/vim-prettyprint',
      \ { 'autoload' : {
      \     'commands' : [ 'PrettyPrint', 'PP' ],
      \     'functions' : [ 'PrettyPrint', 'PP' ]
      \   }
      \ }
" }}}2

" {{{2 vim-quickrun: Run a command and show its result quickly
NeoBundleLazy 'thinca/vim-quickrun',
      \ { 'autoload' : { 'commands' : [ 'QuickRun' ] }
      \ }
" }}}2

" {{{2 vim-quickmemo: Change an empty buffer to a memo buffer
NeoBundle 'thinca/vim-quickmemo'
" }}}2

" {{{2 vim-qfreplace: Perform the replacement in quickfix
NeoBundleLazy 'thinca/vim-qfreplace',
      \ { 'autoload' : { 'commands' : [ 'Qfreplace' ] }
      \ }
" }}}2

" {{{2 vim-unite-history: Unite source for command/search history
NeoBundleLazy 'thinca/vim-unite-history',
      \ { 'depends' : [ 'Shougo/unite.vim' ],
      \   'autoload' : {
      \     'unite_sources' : [ 'history' ]
      \   }
      \ }
" }}}2

" {{{2 vim-localrc: Enable configuration file of each directory
NeoBundle 'thinca/vim-localrc'
" }}}2

" {{{2 git-grep-vim: Search with git-grep
NeoBundleLazy 'tjennings/git-grep-vim',
      \ { 'autoload' : {
      \     'commands' : [
      \       'GitGrep', 'GitGrepAdd', 'LGitGrep', 'LGitGrepAdd'
      \     ]
      \   }
      \ }
" }}}2

" {{{2 quickfixsigns_vim: Mark quickfix & location list items with signs
NeoBundle 'tomtom/quickfixsigns_vim', { 'depends' : [ 'tomtom/tlib_vim' ] }
" }}}2

" {{{2 vim-abolish: Language friendly searches, substitutions, and abbreviations
NeoBundle 'tpope/vim-abolish'
" }}}2

" {{{2 vim-bundler: Support for Ruby's Bundler
NeoBundleLazy 'tpope/vim-bundler',
      \ { 'autoload' : {
      \     'commands' : [
      \       'Bundle', 'Bopen', 'Bedit', 'Bsplit', 'Bvsplit',
      \       'Btabedit', 'Bpedit'
      \     ]
      \   }
      \ }
" }}}2

" {{{2 vim-commentary: Comment stuff out
NeoBundle 'tpope/vim-commentary'
" }}}2

" {{{2 vim-dispatch: Asynchronous build and test dispatcher
NeoBundle 'tpope/vim-dispatch'
" }}}2

" {{{2 vim-endwise: Wisely add 'end' to various programming languages.
NeoBundle 'tpope/vim-endwise'
" }}}2

" {{{2 vim-endwise: A Git wrapper so awesome, it should be illegal
NeoBundle 'tpope/vim-fugitive', { 'augroup' : 'fugitive' }
" }}}2

" {{{2 vim-mercenary: A mercurial wrapper so awesome, you should give it money
NeoBundle 'jlfwong/vim-mercenary'
" }}}2

" {{{2 vim-sexp-mappings-for-regular-people: Sensible mappings for vim-sexp
NeoBundleLazy 'tpope/vim-sexp-mappings-for-regular-people',
      \ { 'depends' : [
      \     'guns/vim-sexp', 'tpope/vim-repeat', 'tpope/vim-surround'
      \   ],
      \   'autoload' : {
      \     'filetypes' : [ 'clojure,scheme,lisp,timl' ]
      \   }
      \ }
" }}}2

" {{{2 vim-unimpaired: Pairs of handy bracket mappings
NeoBundle 'tpope/vim-unimpaired'
" }}}2

" {{{2 vim-rsi: Readline style insertion
NeoBundle 'tpope/vim-rsi'
" }}}2

" {{{2 vim-rake: It's like rails.vim without the rails
NeoBundleLazy 'tpope/vim-rake',
      \ { 'depends' : [ 'tpope/vim-projectionist' ],
      \   'autoload' : {
      \     'commands' : [ 'Rake' ]
      \   }
      \ }
" }}}2

" {{{2 vim-capslock: Software caps lock
NeoBundle 'tpope/vim-capslock'
" }}}2

" {{{2 vim-surround: Plugin for deleting, changing, and adding "surroundings"
NeoBundle 'tpope/vim-surround'
" }}}2

" {{{2 vim-scriptease: Write Vim scripts with ease
NeoBundle 'tpope/vim-scriptease'
" }}}2

" {{{2 vim-characterize: Unicode character metadata
NeoBundle 'tpope/vim-characterize'
" }}}2

" {{{2 vim-speeddating: Use CTRL-A/CTRL-X to increment dates, times, and more
NeoBundle 'tpope/vim-speeddating'
" }}}2

" {{{2 vim-ragtag: Ghetto XML/HTML mappings
NeoBundle 'tpope/vim-ragtag'
" }}}2

" {{{2 vim-jdaddy: JSON manipulation and pretty printing
NeoBundle 'tpope/vim-jdaddy'
" }}}2

" {{{2 vim-repeat: enable repeating supported plugin maps with "."
NeoBundle 'tpope/vim-repeat'
" }}}2

" {{{2 vim-eunuch: Unix shell command file manipulation
NeoBundleLazy 'tpope/vim-eunuch',
      \ { 'autoload' : {
      \     'commands' : [
      \       'Unlink', 'Remove', 'Move', 'Rename', 'Chmod', 'Mkdir',
      \       'Find', 'Locate', 'SudoEdit', 'SudoWrite', 'Wall', 'W'
      \     ]
      \   }
      \ }
" }}}2

" {{{2 vim-obsession: Continuously updated session files
NeoBundleLazy 'tpope/vim-obsession',
      \ { 'autoload' : { 'commands' : [ 'Obsession' ] }
      \ }
" }}}2

" {{{2 vim-sensible: Defaults everyone can agree on
NeoBundle 'tpope/vim-sensible'
" }}}2

" {{{2 vim-rhubarb: fugitive.vim extension for GitHub
NeoBundle 'tpope/vim-rhubarb'
" }}}2

" {{{2 vim-vinegar: combine with netrw to create a delicious salad dressing
" NeoBundleLazy 'tpope/vim-vinegar'
" }}}2

" {{{2 vim-heroku: Heroku toolbelt and hk wrapper
NeoBundleLazy 'tpope/vim-heroku',
      \ { 'depends' : [
      \     'tpope/vim-dispatch', 'tpope/vim-fugitive'
      \   ],
      \   'autoload' : { 'commands' : [ 'Hk' ] }
      \ }
" }}}2

" {{{2 vim-liquid: Vim Liquid runtime files with Jekyll enhancements
NeoBundleLazy 'tpope/vim-liquid',
      \ { 'autoload' : { 'filetypes' : [ 'liquid' ] } }
" }}}2

" {{{2 vim-ansi-esc: Ansi Escape Sequence Visualization
NeoBundleLazy 'halostatue/vim-ansi-esc',
      \ { 'autoload' : { 'commands' : [ 'AnsiEsc' ] },
      \   'depends' : [ 'halostatue/vim-cecutil' ]
      \ }
" }}}2

" {{{2 ColorX: Insert Hex or RGB from Mac OS X colour picker
" The plugin appropriately ignores itself if this is not a Mac.
NeoBundleLazy 'vim-scripts/ColorX',
      \ { 'autoload' : {
      \     'commands' : [ 'ColorRGB', 'ColorHEX' ]
      \   }
      \ }
" }}}2

" {{{2 vim-indexed-search: Show match count and index with search command
NeoBundle 'henrik/vim-indexed-search'
" }}}2

" {{{2 vim-zoom-win: Zoom a window into focus
NeoBundle 'halostatue/vim-zoom-win'
" }}}2

" {{{2 vim-calendar: Calendar utility for vim
NeoBundleLazy 'halostatue/vim-calendar',
      \ { 'autoload' : { 'commands' : [ 'Calendar', 'CalendarH' ] }
      \ }
" }}}2

" {{{2 matchit.zip: Extended "%" matching
NeoBundle 'vim-scripts/matchit.zip'
" }}}2

" {{{2 vim-regionsyntax: Dynamically highlight code blocks
NeoBundle 'farseer90718/vim-regionsyntax'
" }}}2

" {{{2 vim-startify: Showing recently used stuff like a boss
NeoBundle 'mhinz/vim-startify'
" }}}2

" {{{2 vim-airline: Lean and mean status/tabline that's light as air
NeoBundle 'bling/vim-airline'
" }}}2

" {{{2 tagbar: Display tags of a file ordered by scope
NeoBundleLazy 'majutsushi/tagbar',
      \ { 'autoload' : { 'commands' : [ 'TagBar', 'TagBarToggle' ] }
      \ }
" }}}2

" {{{2 vim-colorschemes: one colorscheme pack to rule them all
NeoBundle 'flazz/vim-colorschemes'
" }}}2

" {{{2 vim-erlang-compiler: Erlang syntax checking and compiler plugin
NeoBundleLazy 'vim-erlang/vim-erlang-compiler',
      \ { 'autoload' : { 'filetypes' : [ 'erlang' ] }
      \ }
" }}}2
"
" {{{2 vim-erlang-omnicomplete: Erlang omnicomplete plugin
NeoBundleLazy 'vim-erlang/vim-erlang-omnicomplete',
      \ { 'autoload' : { 'filetypes' : [ 'erlang' ] }
      \ }
" }}}2
"
" {{{2 vim-erlang-tags: Erlang ctags-support
NeoBundleLazy 'vim-erlang/vim-erlang-tags',
      \ { 'autoload' : { 'filetypes' : [ 'erlang' ] }
      \ }
" }}}2

" {{{2 editorconfig-vim: Editorconfig support for Vim
NeoBundle "editorconfig/editorconfig-vim"
" }}}2

" Current cleanup HERE
" {{{1 Text Objects (navigation, selection, etc.)
" {{{2 vim-textobj-rubysymbol: Text objects for ruby symbols
NeoBundleLazy 'bootleq/vim-textobj-rubysymbol',
      \ { 'autoload' : { 'filetypes' : [ 'ruby' ] }
      \ }
" }}}2

" {{{2 vim-textobj-datetime: Text objects for date and time
NeoBundle 'kana/vim-textobj-datetime'
" }}}2

" {{{2 vim-textobj-diff: Text objects for ouputs of diff(1)
NeoBundle 'kana/vim-textobj-diff'
" }}}2

" {{{2 vim-textobj-entire: Text objects for entire buffer
NeoBundle 'kana/vim-textobj-entire'
" }}}2

" {{{2 vim-textobj-fold: Text objects for foldings
NeoBundle 'kana/vim-textobj-fold'
" }}}2

" {{{2 vim-textobj-function: Text objects for functions
NeoBundle 'kana/vim-textobj-function'
" }}}2

" {{{2 vim-textobj-help: Text objects for VIM help documents
NeoBundle 'kana/vim-textobj-help'
" }}}2

" {{{2 vim-textobj-indent: Text objects for indented blocks of lines
NeoBundle 'kana/vim-textobj-indent'
" }}}2

" {{{2 vim-textobj-lastpat: Text objects for the last searched pattern
NeoBundle 'kana/vim-textobj-lastpat'
" }}}2

" {{{2 vim-textobj-syntax: Text objects for syntax highlighted items
NeoBundle 'kana/vim-textobj-syntax'
" }}}2

" {{{2 vim-textobj-user: Create your own text objects
NeoBundle 'kana/vim-textobj-user'
" }}}2

" {{{2 vim-textobj-rubyblock: Text objects for ruby blocks
NeoBundleLazy 'nelstrom/vim-textobj-rubyblock',
      \ { 'depends' : [ 'kana/vim-textobj-user' ],
      \   'autoload' : { 'filetypes' : [ 'ruby' ] }
      \ }
" }}}2

" {{{2 vim-textobj-comment: Text objects for comments
NeoBundleLazy 'thinca/vim-textobj-comment',
      \ { 'depends' : [ 'kana/vim-textobj-user' ],
      \ }
" }}}2

" {{{2 vim-textobj-perl: Text objects for functions in perl
NeoBundleLazy 'thinca/vim-textobj-function-perl',
      \ { 'depends' : [ 'kana/vim-textobj-function' ],
      \   'autoload' : { 'filetypes' : [ 'perl' ] }
      \ }
" }}}2

" {{{2 vim-textobj-javascript: Text objects for functions in javascript
NeoBundleLazy 'thinca/vim-textobj-function-javascript',
      \ { 'depends' : [ 'kana/vim-textobj-function' ],
      \   'autoload' : { 'filetypes' : [ 'javascript' ] }
      \ }
" }}}2

" {{{2 argtextobj.vim: Text objects for function arguments.
NeoBundle 'vim-scripts/argtextobj.vim'
" }}}2

" {{{2 camelcasemotion: Motion through CamelCaseWords and underscore_notation
NeoBundle 'vim-scripts/camelcasemotion'
" }}}2

" {{{2 vim-textobj-quoted: Text objects for quoted content
NeoBundle 'vim-scripts/vim-textobj-quoted',
      \ { 'depends' : [ 'kana/vim-textobj-user' ],
      \ }
" }}}2

" {{{2 erlang-motions.vim: text motions for erlang
NeoBundleLazy 'vim-erlang/erlang-motions.vim',
      \ { 'autoload' : { 'filetypes' : [ 'erlang' ] }
      \ }
" }}}2
" }}}1

" {{{1 Syntax formats
" {{{2 puppet-vim: Vim support for Puppet file syntaxes
NeoBundle 'ajf/puppet-vim'
" }}}2

" {{{2 vim-toml: Vim syntax for TOML
NeoBundle 'cespare/vim-toml'
" }}}2

" {{{2 csv: Vim syntax for CSV
NeoBundle 'chrisbra/csv.vim'
" }}}2

" {{{2 vim-reveal-in-finder:  Reveal in Finder plugin
NeoBundle 'henrik/vim-reveal-in-finder',
      \ { 'autoload' : { 'commands' : [ 'Reveal' ] }
      \ }
" }}}2

" {{{2 vim-rdoc: Vim syntax for RDoc
NeoBundle 'depuracao/vim-rdoc'
" }}}2

" {{{2 vim-scala: Vim syntax for Scala
NeoBundle 'derekwyatt/vim-scala'
" }}}2

" {{{2 vim-less: Vim syntax for LESS
NeoBundle 'groenewege/vim-less'
" }}}2

" {{{2 vim-orgmode: Text outlining for Vim (like Emacs' Org-Mode)
NeoBundle 'jceb/vim-orgmode'
" }}}2

" {{{2 vim-coffee-script: Vim syntax for CoffeeScript
NeoBundle 'kchmck/vim-coffee-script'
" }}}2

" {{{2 cocoa.vim: Vim syntax for Objective-C & Cocoa
NeoBundle 'msanders/cocoa.vim'
" }}}2

" {{{2 vim-mustache-handlebars: Vim syntax for Mustache & Handlebars syntax
NeoBundle 'mustache/vim-mustache-handlebars'
" }}}2

" {{{2 html5.vim: Vim syntax for HTML5
NeoBundle 'othree/html5.vim'
" }}}2

" {{{2 vim-javascript: Vastly improved Javascript indentation and syntax support
NeoBundle 'pangloss/vim-javascript'
" }}}2

" {{{2 vim-ruby-minitest: Vim highlighting & completion for MiniTest
NeoBundle 'sunaku/vim-ruby-minitest'
" }}}2

" {{{2 vim-ft-markdown_fold: Folding setting for markdown syntax
NeoBundle 'thinca/vim-ft-markdown_fold'
" }}}2

" {{{2 vim-ft-vim_fold: Folding setting for VimL syntax
NeoBundle 'thinca/vim-ft-vim_fold'
" }}}2

" {{{2 vim-ft-clojure: FileType support for Clojure
NeoBundle 'thinca/vim-ft-clojure'
" }}}2

" {{{2 vim-ft-help_fold: Folding settings for Vim help files
NeoBundle 'thinca/vim-ft-help_fold'
" }}}2

" {{{2 vim-ft-diff_fold: Folding settings for diff
NeoBundle 'thinca/vim-ft-diff_fold'
" }}}2

" {{{2 textile.vim: Textile for VIM
NeoBundle 'timcharper/textile.vim'
" }}}2

" {{{2 vim-cucumber: Vim Cucumber runtime files
NeoBundle 'tpope/vim-cucumber'
" }}}2

" {{{2 vim-git: Vim Git runtime files
NeoBundle 'tpope/vim-git'
" }}}2

" {{{2 vim-haml: Vim runtime files for Haml, Sass, and SCSS
NeoBundle 'tpope/vim-haml'
" }}}2

" {{{2 vim-rails: Plugin for working with Ruby on Rails applications
NeoBundle 'tpope/vim-rails'
" }}}2

" {{{2 vim-markdown: Vim Markdown runtime files
NeoBundle 'plasticboy/vim-markdown'
" }}}2

" {{{2 vim-erlang-runtime: Erlang support
NeoBundle 'vim-erlang/vim-erlang-runtime'
" }}}2

" {{{2 vim-ruby: Ruby support
NeoBundle 'vim-ruby/vim-ruby'
" }}}2

" {{{2 apiblueprint.vim: Support for API Blueprint
NeoBundle 'kylef/apiblueprint.vim'
" }}}2

" {{{2 taskpaper.vim: TaskPaper support
NeoBundle 'davidoc/taskpaper.vim'
" }}}2

" {{{2 vim-io: Io (language) support
NeoBundle 'andreimaxim/vim-io'
" }}}2

" {{{2 vim-io: Go (language) support
NeoBundle 'fatih/vim-go'
" }}}2
" }}}1

" vim: foldmethod=marker
