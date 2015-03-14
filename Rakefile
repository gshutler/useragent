require 'bundler'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks

task :default => :spec

RSpec::Core::RakeTask.new do |t|
  t.ruby_opts = ["-w"]
end
