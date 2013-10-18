require "bundler/gem_tasks"
require 'rubygems'
require 'rspec'
require 'rake'
require "rake/clean"
require "rubygems/package_task"
require "rdoc/task"
require 'code_statistics'
require 'rspec/core/rake_task'
require 'yard'
require 'yard/rake/yardoc_task.rb'
require "github/markup"
require "redcarpet"
require "rake/tasklib"
require "roodi"
require "roodi_task"


RoodiTask.new() do | t |
t.patterns = %w(lib/**/*.rb)
t.config = "ultragreen_roodi_coding_convention.yml"
end


CLEAN.include('*.tmp','*.old')
CLOBBER.include('*.tmp', 'build/*','#*#')


content = File::readlines(File.join(File.dirname(__FILE__), 'attr_readonly.gemspec')).join
spec = eval(content)

RSpec::Core::RakeTask.new('spec')



YARD::Rake::YardocTask.new do |t|
   t.files   = [ 'lib/**/*.rb', '-','doc/**/*','spec/**/*_spec.rb']
   t.options = %w(--markup-provider=redcarpet --markup=markdown --main=README.md)
   t.options += ['-o', "yardoc"]	    	
end
YARD::Config.load_plugin('yard-rspec')

namespace :yardoc do
  task :clobber do
    rm_r "yardoc" rescue nil
    rm_r ".yardoc" rescue nil
  end
end
task :clobber => "yardoc:clobber"


Gem::PackageTask.new(spec) do |pkg|
  pkg.need_tar = true
  pkg.need_zip = true
end

task :default => [:gem]