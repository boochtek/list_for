require 'bundler'
require 'rspec/core/rake_task'

desc 'Default: run specs'
task :default => :spec

desc 'Run specs'
RSpec::Core::RakeTask.new('spec') do |t|
  t.rspec_opts = ['--color', '--format progress']
  t.pattern = 'spec/**/*_spec.rb'
end

Bundler::GemHelper.install_tasks
