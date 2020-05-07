require 'bundler'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new do |t|
  t.ruby_opts = ["-w"]
end

desc 'Build the package and publish it to rubygems.pkg.github.com'
task publish: :build do
  require 'lib/user_agent/version'

  raise 'Set environment variable GEM_PUSH_KEY to the name of a key in ~/.gem/credentials' unless ENV['GEM_PUSH_KEY']

  system("gem push --key #{ENV['GEM_PUSH_KEY']} --host https://rubygems.pkg.github.com/art19 " \
         "pkg/art19-useragent-#{UserAgent::VERSION}.gem")
end

task :default => :spec
task :release => :spec
