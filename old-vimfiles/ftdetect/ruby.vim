" Ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec setf ruby

" Ruby on Rails
au BufNewFile,BufRead *.builder,*.rxml,*.rjs setf ruby

" Rakefile
au BufNewFile,BufRead [rR]akefile,*.rake setf ruby

" Rantfile
au BufNewFile,BufRead [rR]antfile,*.rant setf ruby

" eRuby
au BufNewFile,BufRead *.erb,*.rhtml setf eruby
