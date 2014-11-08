" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

majutsushi/tagbar

bling/vim-airline

    echo "NeoBundle 'tpope/vim-fugitive'"
    echo "NeoBundle 'flazz/vim-colorschemes'"

https://github.com/itchyny/lightline.vim
https://github.com/jceb/vim-orgmode
https://github.com/jmcantrell/vim-virtualenv
https://github.com/kana/vim-gf-diff
https://github.com/kana/vim-gf-user
https://github.com/kana/vim-grex
https://github.com/kana/vim-ku
https://github.com/kana/vim-scratch
https://github.com/kana/vim-smartinput
https://github.com/kana/vim-textobj-datetime
https://github.com/kana/vim-textobj-diff
https://github.com/kana/vim-textobj-entire
https://github.com/kana/vim-textobj-fold
https://github.com/kana/vim-textobj-function
https://github.com/kana/vim-textobj-help
https://github.com/kana/vim-textobj-indent
https://github.com/kana/vim-textobj-lastpat
https://github.com/kana/vim-textobj-line
https://github.com/kana/vim-textobj-syntax
https://github.com/kana/vim-textobj-user
https://github.com/kchmck/vim-coffee-script
https://github.com/krisajenkins/vim-pipe
https://github.com/maksimr/vim-jsbeautify
https://github.com/marcweber/vim-addon-mw-utils
https://github.com/mattn/gist-vim
https://github.com/mhinz/vim-signify
https://github.com/mikewest/vimroom
https://github.com/millermedeiros/vim-statline
https://github.com/mrtazz/molokai.vim
https://github.com/msanders/cocoa.vim
https://github.com/mustache/vim-mustache-handlebars
https://github.com/myusuf3/numbers.vim
https://github.com/nathanaelkane/vim-indent-guides
https://github.com/nelstrom/vim-textobj-rubyblock
https://github.com/othree/html5.vim
https://github.com/pangloss/vim-javascript
https://github.com/robgleeson/hammer.vim
https://github.com/scrooloose/syntastic
https://github.com/sjbach/lusty
https://github.com/sjl/gundo.vim
https://github.com/sjl/splice.vim
https://github.com/skwp/vim-rspec
https://github.com/sunaku/vim-ruby-minitest
https://github.com/thinca/vim-fontzoom
https://github.com/thinca/vim-ft-markdown_fold
https://github.com/thinca/vim-ft-vim_fold
https://github.com/thinca/vim-prettyprint
https://github.com/thinca/vim-quickrun
https://github.com/thinca/vim-textobj-comment
https://github.com/thinca/vim-textobj-function-javascript
https://github.com/thinca/vim-textobj-function-perl
https://github.com/thoughtbot/vim-rspec
https://github.com/timcharper/textile.vim
https://github.com/tjennings/git-grep-vim
https://github.com/tomtom/quickfixsigns_vim
https://github.com/tomtom/tlib_vim
https://github.com/tpope/vim-abolish
https://github.com/tpope/vim-bundler
https://github.com/tpope/vim-commentary
https://github.com/tpope/vim-cucumber
https://github.com/tpope/vim-dispatch
https://github.com/tpope/vim-endwise
https://github.com/tpope/vim-fugitive
https://github.com/tpope/vim-git
https://github.com/tpope/vim-haml
https://github.com/tpope/vim-liquid
https://github.com/tpope/vim-markdown
https://github.com/tpope/vim-pathogen
https://github.com/tpope/vim-ragtag
https://github.com/tpope/vim-rails
https://github.com/tpope/vim-rake
https://github.com/tpope/vim-repeat
https://github.com/tpope/vim-scriptease
https://github.com/tpope/vim-sensible
https://github.com/tpope/vim-speeddating
https://github.com/tpope/vim-surround
https://github.com/tpope/vim-unimpaired
https://github.com/tpope/vim-vividchalk
https://github.com/vim-ruby/vim-ruby
https://github.com/vim-scripts/AnsiEsc.vim
https://github.com/vim-scripts/ColorX
https://github.com/vim-scripts/Colour-Sampler-Pack
https://github.com/vim-scripts/EasyGrep
https://github.com/vim-scripts/IndexedSearch
https://github.com/vim-scripts/ShowMarks7
https://github.com/vim-scripts/YankRing.vim
https://github.com/vim-scripts/ZoomWin
https://github.com/vim-scripts/applescript.vim
https://github.com/vim-scripts/argtextobj.vim
https://github.com/vim-scripts/bufferlist.vim
https://github.com/vim-scripts/calendar.vim--Matsumoto
https://github.com/vim-scripts/camelcasemotion
https://github.com/vim-scripts/cmake.vim
https://github.com/vim-scripts/cmake.vim-syntax
https://github.com/vim-scripts/jQuery
https://github.com/vim-scripts/matchit.zip
https://github.com/vim-scripts/number-marks
https://github.com/vim-scripts/searchfold.vim
https://github.com/vim-scripts/taskpaper.vim
https://github.com/vim-scripts/vim-textobj-quoted
https://github.com/vim-voom/VOoM
https://github.com/wgibbs/vim-irblack
https://github.com/farseer90718/vim-regionsyntax
https://github.com/mhinz/vim-startify
