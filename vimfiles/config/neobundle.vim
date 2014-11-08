" {{{1 NeoBundle manages itself.
NeoBundleFetch 'Shougo/neobundle.vim'
" }}}1

" {{{2 vim-niceblock: Make blockwise Visual mode more useful
NeoBundleLazy 'kana/vim-niceblock', { 'mappings' : '<Plug>' }
" }}}2

" {{{2 echodoc.vim: Print documentation in echo area
NeoBundleLazy 'Shougo/echodoc.vim', { 'insert' : 1 }
" }}}2

" {{{2 neocomplete.vim: Next generation of auto completion framework
" {{{3 -> context_filetype.vim: Context filetype library for Vim script
NeoBundleLazy 'Shougo/neocomplete.vim',
      \ { 'depends' : [ 'Shougo/context_filetype.vim' ],
      \   'insert' : 1
      \ }
" }}}3
" }}}2

" {{{2 neosnippet.vim: Next generation snippet support for Vim
" {{{3 -> neosnippet-snippets: standard snippets for neosnippets
" {{{4 -> context_filetype.vim: Context filetype library for Vim script
NeoBundleLazy 'Shougo/neosnippet.vim',
      \ { 'depends' : [
      \     'Shougo/neosnippet-snippets', 'Shougo/context_filetype.vim'
      \   ],
      \   'insert' : 1,
      \   'filetypes' : 'snippet',
      \   'unite_sources' : [
      \     'neosnippet', 'neosnippet/user', 'neosnippet/runtime'
      \   ],
      \ }
" }}}4
" }}}3
" }}}2

" {{{2 Standard recipe files for neobundle
NeoBundle 'Shougo/neobundle-vim-recipes'
" }}}2

" {{{2 Unite: Unite and create user interfaces
NeoBundleLazy 'Shougo/unite.vim',
      \ { 'commands' : [
      \     { 'name' : 'Unite',
      \       'complete' : 'customlist,unite#complete_source'
      \     }
      \   ]
      \ }
" }}}2

" {{{2 unite-build: Build by unite interface
NeoBundleLazy 'Shougo/unite-build'
" }}}2
" {{{2 neossh: SSH interface for Vim plugins
NeoBundleLazy 'Shougo/neossh.vim',
      \ { 'filetypes' : 'vimfiler',
      \   'sources' : 'ssh',
      \ }
" }}}2
" {{{2 neomru: MRU plugin includes unite.vim MRU sources
NeoBundle 'Shougo/neomru.vim'
" }}}2
" {{{2 tabpagebuffer: Tabpage buffer interface
NeoBundle 'Shougo/tabpagebuffer.vim'
" }}}2

" {{{2 vimshell-ssh: Run Vim over ssh on Vim
NeoBundleLazy 'ujihisa/vimshell-ssh', { 'filetypes' : 'vimshell' }
" }}}2
" {{{2 unite-sudo: sudo source for unite
NeoBundle 'Shougo/unite-sudo'
" }}}2
" {{{2 vim-vcs: Comprehensive VCS plug-ins
" {{{3 -> vim-openbuf: Open and manage buffers
NeoBundleLazy 'Shougo/vim-vcs', { 'depends' : 'thinca/vim-openbuf' }
" }}}3
" }}}2
" {{{2 vimfiler: Powerful file explorer implemented by Vim script
" {{{3 -> Unite: Unite and create user interfaces
NeoBundleLazy 'Shougo/vimfiler.vim',
      \ { 'depends' : 'Shougo/unite.vim',
      \   'commands' : [
      \     { 'name' : [ 'VimFiler', 'Edit', 'Write' ],
      \       'complete' : 'customlist,vimfiler#complete'
      \     },
      \     'Read', 'Source'
      \   ],
      \   'mappings' : '<Plug>',
      \   'explorer' : 1,
      \ }
" }}}3
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
      \ { 'commands' : [
      \     { 'name' : 'VimShell',
      \       'complete' : 'customlist,vimshell#complete'
      \     }
      \   ],
      \   'mappings' : '<Plug>'
      \ }
" }}}2
" {{{2 vim-gitcomplete: completion of git commands
NeoBundleLazy 'yomi322/vim-gitcomplete', { 'filetype' : 'vimshell' }
" }}}2
" {{{2  vinarise: Ultimate hex editing system with Vim
NeoBundleLazy 'Shougo/vinarise.vim',
      \ { 'commands' : [
      \     { 'name' : 'Vinarise',
      \       'complete' : 'file'
      \     }
      \   ]
      \ }
" }}}2

" {{{2 vesting: VimL testing
NeoBundleLazy 'Shougo/vesting', { 'unite_sources' : 'vesting' }
" }}}2

" {{{2 vim-jp/vital.vim: comprehensive Vim utility functions for Vim plugins
NeoBundleLazy 'vim-jp/vital.vim', { 'commands' : 'Vitalize' }
" }}}2
" {{{2 junkfile: Create and work with a junkfile
NeoBundleLazy 'Shougo/junkfile.vim', { 'unite_sources' : 'junkfile' }
" }}}2

" {{{2 unite-outline: Current buffer outline view with Unite
NeoBundleLazy 'Shougo/unite-outline'
" }}}2

" {{{2 vim-css3-syntax: Extend CSS syntax highlighting for CSS3
NeoBundleLazy 'hail2u/vim-css3-syntax'
" }}}2

" {{{2 vim-smartchr: Insert several candidates with a single key
NeoBundleLazy 'kana/vim-smartchr', { 'insert' : 1 }
" }}}2

" {{{2 ctrlp: Fuzzy file, buffer, mru, tag, ... finder
NeoBundleLazy 'ctrlpvim/ctrlp.vim'
" }}}2
" {{{2 foldCC: high-quality 'foldtext' function
NeoBundleLazy 'LeafCage/foldCC.vim',
      \ { 'autoload' : {
      \     'filetypes' : [ 'vim' ]
      \   }
      \ }
" }}}2
" {{{2 webapi-vim: Interface to various Web APIs
NeoBundleLazy 'mattn/webapi-vim'
" }}}2

" {{{2 vim-slurper: companion to the slurper gem for Pivotal Tracker
NeoBundleLazy 'adamlowe/vim-slurper',
      \ { 'autoload' : {
      \     'filetypes' : [ 'slurper' ]
      \   }
      \ }
" }}}2

" {{{2 vim-textobj-rubysymbol: Text objects for ruby symbols
NeoBundleLazy 'bootleq/vim-textobj-rubysymbol',
      \ { 'autoload' : {
      \     'filetypes' : [ 'ruby' ]
      \   }
      \ }
" }}}2

" {{{2 rename.vim: Rename current file in vim buffer; retain relative path.
NeoBundleLazy 'danro/rename.vim',
      \ { 'commands' : [
      \     { 'name' : [ 'Rename' ],
      \       'complete' : 'customlist,SiblingFiles'
      \     }
      \   ],
      \   'mappings' : '<Plug>',
      \ }
" }}}2

" {{{2 vim-localvimrc: Search and load lvimrc files.
NeoBundleLazy 'embear/vim-localvimrc'
" }}}2

" {{{2 ag.vim: Search with ag
NeoBundleLazy 'empatsw/ag.vim'
" }}}2

" {{{2 supertab: Supertab allows insert completion with tab key
NeoBundleLazy 'ervandew/supertab'
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

" {{{2 minibufexpl.vim: Mini Buffer Explorer
" NeoBundleLazy 'fholgado/minibufexpl.vim'
" }}}2

" {{{1 Syntax formats
" {{{2 puppet-vim: Vim support for Puppet file syntaxes
NeoBundleLazy 'ajf/puppet-vim'
" }}}2

" {{{2 vim-toml: Vim syntax for TOML
NeoBundleLazy 'cespare/vim-toml'
" }}}2

" {{{2 csv: Vim syntax for CSV
NeoBundleLazy 'chrisbra/csv.vim'
" }}}2

" {{{2 vim-reveal-in-finder:  Reveal in Finder plugin
NeoBundleLazy 'henrik/vim-reveal-in-finder',
      \ { 'commands' : [
      \     { 'name' : [ 'Reveal' ] }
      \   ],
      \ }
" }}}2

" {{{2 vim-rdoc: Vim syntax for RDoc
NeoBundleLazy 'depuracao/vim-rdoc'
" }}}2

" {{{2 vim-scala: Vim syntax for Scala
NeoBundleLazy 'derekwyatt/vim-scala'
" }}}2

" {{{2 vim-less: Vim syntax for LESS
NeoBundleLazy 'groenewege/vim-less'
" }}}2

" }}}1

" vim: foldmethod=marker
