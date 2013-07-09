require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

# don't realease this gem publicly by accident
# so to be on the safe side, removing 'release' task
Rake::Task["release"].clear

RSpec::Core::RakeTask.new(:spec)
task :default => :spec
