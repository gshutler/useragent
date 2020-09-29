# frozen_string_literal: true

require 'rspec/core/rake_task'
require 'rubygems'
require 'bundler'
require 'yard'

Bundler.require
Bundler::GemHelper.install_tasks

task :console do
  require 'irb'
  require 'irb/completion'
  require 'pry'
  require 'user_agent'
  ARGV.clear
  IRB.start
end

desc 'Build the package and publish it to rubygems.pkg.github.com'
task publish: :build do
  require 'user_agent'

  raise 'Set environment variable GEM_PUSH_KEY to the name of a key in ~/.gem/credentials' unless ENV['GEM_PUSH_KEY']

  system("gem push --key #{ENV['GEM_PUSH_KEY']} --host https://rubygems.pkg.github.com/art19 " \
         "pkg/useragent-#{UserAgent::GemVersion::VERSION}.gem")
end

task default: :spec

desc 'run specs'
RSpec::Core::RakeTask.new

desc 'build docs'
YARD::Rake::YardocTask.new
