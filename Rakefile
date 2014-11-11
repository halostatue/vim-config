# -*- ruby encoding: utf-8 -*-

require 'fileutils'
require 'psych'
require 'yaml'
require 'pathname'

module VimConfig
  module NullFileUtils
    class << self
      def method_missing(sym, *args, &block)
        puts "#{sym} #{args.join(' ')}"
      end
    end
  end

  class VCS
    include ::Rake::DSL

    def initialize(vcs)
      @vcs = vcs
    end

    def method_missing(sym, *args, &block)
      sh "#{@vcs} #{sym.to_s.gsub(%r{!}, '')} #{args.join(' ')}"
    end
  end

  class NullVCS < VCS
    def method_missing(sym, *args, &block)
      $stdout.puts "#{@vcs} #{sym.to_s.gsub(%r{!}, '')} #{args.join(' ')}"
    end
  end

  def self.Installer(options = {})
    Installer.send(:new, options).tap { |installer|
      installer.send(:create_tasks)
    }
  end

  class Installer
    private_class_method :new

    include ::Rake::DSL

    Git      = VCS.new('git')
    NullGit  = NullVCS.new('git')

    def initialize(options = {})
      @source_path = Pathname(__FILE__).dirname.expand_path
      target_path options[:target] || :default
      noop options[:noop]
      force options[:force]
    end

    def target_path(value = nil)
      if value.nil?
        @target_path
      else
        value = ENV['HOME'] || '~' if value == :default
        value = Pathname(value).expand_path

        unless value.directory?
          raise ArgumentError, "Target must be a directory"
        end

        @target_path = Pathname(value).expand_path
      end
    end

    def noop(value)
      if (@noop = !!value)
        @fileops = NullFileUtils
        @git = NullGit
      else
        @fileops = FileUtils
        @git = Git
      end
    end

    def force(value)
      @force = !!value
    end

    private
    def create_tasks
      desc "Install vim configuration into the user's home directory."
      task :install

      directory bundle_path.to_s
      task install: bundle_path

      link_tasks 'vimrc', 'gvimrc', 'vim' => 'vimfiles'

      installer = self

      desc "Sets the install target location"
      task :target, [ :location ] do |t, args|
        target = args.location || :default
        puts "Setting install target to #{target.inspect}…"
        installer.target_path target

        Rake.application.instance_variable_get(:@tasks).clear
        installer.send(:create_tasks)
      end

      desc "Installation will be a dry run. Does nothing on its own."
      task :noop do
        installer.noop true
      end

      desc "Force operations (answers yes to prompts). Does nothing on its own."
      task :force do
        installer.force true
      end

      task :default do
        sh 'rake -D', verbose: false
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
    end

    def source(*args)
      source_path.join(*args)
    end

    def target(*args)
      target_path.join(*args)
    end

    def vimfiles_path(*args)
      source('vimfiles', *args)
    end

    def bundle_path(*args)
      vimfiles_path('bundle', *args)
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
          fileops.rm target, force: true
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
        if @force
          replace = true
        else
          tn = File.join(File.basename(File.dirname(target)),
                         File.basename(target))
          print "Overwrite target #{tn}? [y/N/a/q] "
          case $stdin.gets.chomp
          when 'a'
            puts "Replacing all files."
            replace = @force = true
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

    def link_tasks(*args)
      args.each { |arg| link_task(*Array(arg).flatten) }
    end

    def link_task(name, altname = nil)
      link_target = target(".#{name}")
      link_source = source(altname || "_#{name}")
      file link_target => link_source do |t|
        remove_file t.name
        link_file link_source, t.name
      end

      desc "Install #{link_target.basename} from #{link_source.basename}."
      task name => [ link_target ]
      task install: [ name ]
    end

    attr_reader :source_path, :fileops, :git
  end
end

VimConfig.Installer

# vim: syntax=ruby
