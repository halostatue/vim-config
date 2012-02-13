# -*- ruby encoding: utf-8 -*-

require 'fileutils'

BUNDLES = {
#   github://astashov/vim-ruby-debugger
#   github://robgleeson/hammer.vim
#   github://fholgado/minibufexpl.vim
  :git => %W(
    github://ajf/puppet-vim
    github://altercation/vim-colors-solarized
    github://bdd/vim-scala
    github://bootleq/vim-textobj-rubysymbol
    github://bsl/obviousmode
    github://ervandew/supertab
    github://godlygeek/tabular
    github://hsitz/VimOrganizer
    github://jceb/vim-orgmode
    github://jeetsukumaran/vim-buffergator
    github://kana/vim-ku
    github://kana/vim-scratch
    github://kana/vim-textobj-datetime
    github://kana/vim-textobj-diff
    github://kana/vim-textobj-entire
    github://kana/vim-textobj-function
    github://kana/vim-textobj-indent
    github://kana/vim-textobj-user
    github://kchmck/vim-coffee-script
    github://mattn/gist-vim
    github://michaeljsmith/vim-indent-object
    github://mikewest/vimroom
    github://mileszs/ack.vim
    github://millermedeiros/vim-statline
    github://mrtazz/molokai.vim
    github://msanders/cocoa.vim
    github://msanders/snipmate.vim
    github://nathanaelkane/vim-indent-guides
    github://nelstrom/vim-textobj-rubyblock
    github://pangloss/vim-javascript
    github://scrooloose/nerdcommenter
    github://scrooloose/nerdtree
    github://scrooloose/syntastic
    github://sjbach/lusty
    github://sjl/gundo.vim
    github://sjl/threesome.vim
    github://sunaku/vim-ruby-minitest
    github://taq/vim-rspec
    github://thinca/vim-fontzoom
    github://thinca/vim-ft-markdown_fold
    github://thinca/vim-ft-vim_fold
    github://thinca/vim-prettyprint
    github://thinca/vim-quickrun
    github://thinca/vim-textobj-comment
    github://thinca/vim-textobj-function-javascript
    github://thinca/vim-textobj-function-perl
    github://timcharper/textile.vim
    github://tomtom/quickfixsigns_vim
    github://tpope/vim-abolish
    github://tpope/vim-commentary
    github://tpope/vim-cucumber
    github://tpope/vim-endwise
    github://tpope/vim-fugitive
    github://tpope/vim-git
    github://tpope/vim-haml
    github://tpope/vim-liquid
    github://tpope/vim-markdown
    github://tpope/vim-ragtag
    github://tpope/vim-rails
    github://tpope/vim-repeat
    github://tpope/vim-speeddating
    github://tpope/vim-surround
    github://tpope/vim-unimpaired
    github://tpope/vim-vividchalk
    github://vim-ruby/vim-ruby
    github://vim-scripts/Align
    github://vim-scripts/Color-Sampler-Pack
    github://vim-scripts/ColorX
    github://vim-scripts/IndexedSearch
    github://vim-scripts/ZoomWin
    github://vim-scripts/a.vim
    github://vim-scripts/applescript.vim
    github://vim-scripts/bufexplorer.zip
    github://vim-scripts/bufferlist.vim
    github://vim-scripts/calendar.vim--Matsumoto
    github://vim-scripts/cmake.vim
    github://vim-scripts/cmake.vim-syntax
    github://vim-scripts/cmakeref
    github://vim-scripts/jQuery
    github://vim-scripts/matchit.zip
    github://vim-scripts/number-marks
    github://vim-scripts/searchfold.vim
    github://vim-scripts/taglist.vim
    github://vim-scripts/taskpaper.vim
    github://vim-scripts/vim-textobj-quoted
    github://wgibbs/vim-irblack
  ),
  :svn => {
    "conque_2.3" => "http://conque.googlecode.com/svn/trunk/"
  },
  :copy => %W(
    janus
    google-golang
    manpageview
  ),
}

# http://drchip.0sites.net/astronaut/vim/vbafiles/manpageview.vba.gz

CURRENT_PATH = File.expand_path(File.dirname(__FILE__))

module FileUtils
  module NullOps
    class << self
      def method_missing(sym, *args, &block)
        puts "#{sym} #{args.join(' ')}"
      end
    end
  end
end

class BundleInstaller
  include Rake::DSL

  class VCS
    include Rake::DSL

    def initialize(name, null = false)
      @name = name
      @null = (null == :null)
    end

    def method_missing(sym, *args, &block)
      sym = sym.to_s.gsub(%r{!}, '')
      command = "#{@name} #{sym} #{args.join(' ')}"
      if @null
        puts command
      else
        sh command
      end
    end
  end

  Svn      = BundleInstaller::VCS.new('svn')
  SvnNull  = BundleInstaller::VCS.new('svn', :null)
  Git      = BundleInstaller::VCS.new('git')
  GitNull  = BundleInstaller::VCS.new('git', :null)
  Hg       = BundleInstaller::VCS.new('hg')
  HgNull   = BundleInstaller::VCS.new('hg', :null)

  attr_reader :source_path
  attr_accessor :target_path

  attr_reader :fileops
  attr_reader :git
  attr_reader :svn
  attr_reader :hg

  def noop(value)
    if !!value
      @fileops  = FileUtils::NullOps
      @svn      = SvnNull
      @git      = GitNull
      @hg       = HgNull
    else
      @fileops  = FileUtils
      @svn      = Svn
      @git      = Git
      @hg       = Hg
    end

    @noop = !!value
  end

  def initialize(source_path, target_path, options = {})
    @source_path = source_path
    @target_path = target_path

    noop options[:noop]

    @ostype = %x(uname).chomp.downcase
  end

  def source(*args)
    File.join(@source_path, *args)
  end

  def vimfiles_path(*args)
    source('vimfiles', *args)
  end

  def bundle_path(*args)
    vimfiles_path('bundle', *args)
  end

  def partial_path(*args)
    source('partial', *args)
  end

  def target(*args)
    File.join(@target_path, *args)
  end

  def file_task(name, *args)
    file name, *args do
      yield
    end
    task :install => [ name ]
  end

  def update_task_name(name)
    "update_#{name.gsub(%r{[^_A-Za-z0-9]}, '-')}".to_sym
  end
  private :update_task_name

  def git_task(url, options = {})
    case url
    when %r{^git://([^/]+)/(.+).git$}
      repo = url
      name = "#{$1}_#{$2.split(%r{/}).join('-')}"
    when %r{^github://([^/]+)/(.+)$}
      repo = "git://github.com/#{$1}/#{$2}.git"
      name = "#{$1}_#{$2}"
    else
      raise "Unsupported git url format: #{repo}"
    end

    name = options[:name] || name
    path = options[:path] || bundle_path(name)
    parent = File.dirname(path)

    git_target  = File.join(path, '.git')
    task_name   = options[:task_name] || update_task_name(name)

    task task_name => [ git_target ] do
      puts "Updating #{name}…"
      Dir.chdir(path) {
        yield :pre_update if block_given?
        git.pull
        yield :post_update if block_given?
      }
    end
    task :install => [ task_name ]

    file git_target => [ parent ] do
      puts "Cloning #{name}…"
      yield :pre_clone if block_given?
      Dir.chdir(parent) {
        git.clone! repo, name
        yield :post_clone if block_given?
      }
    end

    task_name
  end

  def svn_task(name, repo)
    btsk = "update_#{name.gsub(%{[^_A-Za-z0-9]}, '-')}".to_sym
    bdir = bundle_path(name)
    bsvn = File.join(bdir, '.svn')

    task btsk => [ bsvn ] do
      Dir.chdir(bdir) { svn.up }
    end
    task :install => [ btsk ]

    file bsvn => [ bundle_path ] do
      Dir.chdir(bundle_path) { svn.checkout repo, name }
    end
  end

  def filecopy_task(path)
    name = File.basename(path)
    path = source('installable', path)
    btsk = "update_#{name}".to_sym
    bdir = bundle_path(name)

    task btsk => [ path ] do
      Dir.chdir(bundle_path) do
        fileops.cp_r(path, name)
      end
    end
    task :install => btsk
  end

  def base_tasks
    directory bundle_path
    directory partial_path
    task :install => [ bundle_path, partial_path ]

    file vimfiles_path('autoload', 'pathogen.vim') do |t|
      fileops.mkdir_p File.dirname(t.name)
      git.clone! 'git://github.com/tpope/vim-pathogen', 'tmp-pathogen'
      fileops.mv 'tmp-pathogen/autoload/pathogen.vim', t.name
      fileops.rm_rf 'tmp-pathogen'
    end
    task :pathogen => vimfiles_path('autoload', 'pathogen.vim')
    task :install => :pathogen

    task target('.vimrc') do |t|
      remove_file t.name
      link_file source('_vimrc'), t.name
    end
    desc 'Install the .vimrc'
    task :vimrc => target('.vimrc')
    task :install => :vimrc

    task target('.gvimrc') do |t|
      remove_file t.name
      link_file source('_gvimrc'), t.name
    end
    desc 'Install the .gvimrc'
    task :gvimrc => target('.gvimrc')
    task :install => :gvimrc

    task target('.vim') do |t|
      remove_file t.name
      link_file source('vimfiles'), t.name
    end
    desc 'Install the .vim directory.'
    task :vimdir => target('.vim')
    task :install => :vimdir

    task :helptags do
      sh %Q(vim -c 'silent! exe "call pathogen#helptags() | qa"')
    end
    task :install => :helptags
  end

  def simple_tasks(bundles)
    bundles.each_pair { |key, values|
      case key
      when :git
        values.each { |repo| git_task(repo) }
      when :svn
        values.each_pair { |name, repo| svn_task(name, repo) }
      when :copy
        values.each { |path| filecopy_task(path) }
      end
    }
  end

  def backup_file(target)
    if File.symlink? target
      true
    elsif File.directory? target
      puts "Backing up target directory #{File.basename(target)}…"
      fileops.mv target, "#{target}.backup"
    elsif File.file? target
      puts "Backing up target #{File.basename(target)}…"
      fileops.cp target, "#{target}.backup"
    else
      raise "Unknown type for #{File.basename(target)}!"
    end
  end

  def remove_file(target)
    if File.exist? target or File.symlink? target
      if backup_file target
        puts "Removing target #{File.basename(target)}…"
        fileops.rm target, :force => true
      end
    end
  end

  def link_file(source, target)
    puts "Linking source #{File.basename(source)} as target #{File.basename(target)}…"
    fileops.ln_s source, target
  end

  def try_replace_file(source, target = source)
    replace = false

    if File.exist? target
      if @replace_all
        replace = true
      else
        tn = File.join(File.basename(File.dirname(target)),
                       File.basename(target))
        print "Overwrite target #{tn}? [y/N/a/q] "
        case $stdin.gets.chomp
        when 'a'
          puts "Replacing all files."
          replace = @replace_all = true
        when 'y'
          replace = true
        when 'q'
          puts "Stopping."
          exit
        else
          puts "Skipping target #{File.basename(target)}…"
        end
      end
    else
      replace = true
    end

    replace_file(source, target) if replace
  end
end

desc "Install vim configuration ino the user's home directory."
task :install

inst = BundleInstaller.new(CURRENT_PATH, File.expand_path(ENV['HOME']))

inst.base_tasks
inst.simple_tasks(BUNDLES)

inst.git_task "github://vim-scripts/Arduino-syntax-file" do |mode|
  case mode
  when :post_update
    inst.fileops.mkdir_p 'ftdetect'
    File.open(File.join('ftdetect', 'arduino.vim'), 'w') do |file|
      file.puts <<-EOS
" Arduino File Detection Support
augroup arduinoFiles
  autocmd!
  autocmd BufNewFile,BufRead *.pde setfiletype arduino
augroup END
      EOS
    end
  end
end

inst.git_task "github://wincent/Command-T" do |mode|
  case mode
  when :post_update
    # TODO: Need a way to generically specify the 'system' Ruby regardless
    # of what platform or whether you're using rvm or rbenv.
    sh "/usr/bin/ruby -S rake make"
  end
end

# Install mustache.vim
partial = inst.partial_path('defunkt_mustache')
bundle  = inst.bundle_path('defunkt_mustache')
syntax  = File.join(bundle, 'syntax', 'mustache.vim')
detect  = File.join(bundle, 'ftdetect', 'mustache.vim')
options = { :path => partial, :task_name => 'partial_defunkt_mustache' }

name = inst.git_task "github://defunkt/mustache", options
file syntax => name do |t|
  source = File.join(partial, 'contrib', File.basename(t.name))
  inst.fileops.mkdir_p File.dirname(t.name)
  inst.fileops.cp source, t.name
end
file detect => name do |t|
  inst.fileops.mkdir_p File.dirname(t.name)
  File.open(t.name, 'w') do |f|
    f.puts <<-EOS
" Mustache File Detection Support
augroup mustacheFiles
  autocmd!
  autocmd BufNewFile,BufRead *.mustache setfiletype mustache
augroup END
    EOS
  end
end
task :update_defunkt_mustache => [ syntax, detect ]
task :install => :update_defunkt_mustache

desc "Sets the install target name."
task :target, [ :name ] do |t, args|
  inst.target_path = File.expand_path(args.name)
  puts "Setting install target to #{args.name}…"
end

desc "Turn all operations into noops. Does nothing on its own."
task :noop do
  inst.noop true
end

desc "Force operations. Does nothing on its own."
task :force do
  inst.replace_all true
end

task :default do
  Rake.application.tasks.each { |t|
    puts "rake #{t.name}  # #{t.comment}" unless t.comment.to_s.empty?
  }
end

# Something broke here.
Rake.application.tasks.each { |t|
  t.prerequisites.map! { |f|
    if f =~ /\~/
      File.expand_path(f)
    else
      f
    end
  }
}

# vim: syntax=ruby
