require 'bundler'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new do |t|
  t.ruby_opts = ["-w"]
end

task :default => :spec
task :release => :spec
