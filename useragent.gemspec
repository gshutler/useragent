# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'user_agent/gem_version'

Gem::Specification.new do |s|
  s.name    = 'useragent'
  s.version = UserAgent::GemVersion::VERSION

  s.homepage    = 'https://github.com/gshutler/useragent'
  s.summary     = 'HTTP User Agent parser'
  s.description = 'HTTP User Agent parser'

  s.files = Dir['LICENSE', 'README.md', 'CHANGELOG.md', 'lib/**/*.rb']

  s.add_development_dependency 'pry',   '~> 0.11.3'
  s.add_development_dependency 'rake',  '~> 13.0.1'
  s.add_development_dependency 'rspec', '~> 3.9.0'
  s.add_development_dependency 'yard',  '~> 0.9.19'

  s.authors = ['Joshua Peek', 'Garry Shutler', 'Keith Gable', 'Siu Kit Wong', 'Louise Yang', 'Johannes Vetter']
  s.email   = ['garry@robustsoftware.co.uk', 'keith@art19.com', 'kit@art19.com', 'louise@art19.com', 'johannes@art19.com']
  s.license = 'MIT'
end
