Gem::Specification.new do |s|
  s.name    = 'art19-useragent'
  s.version = '0.16.11.pre.3b5e242'

  s.homepage    = 'https://github.com/gshutler/useragent'
  s.metadata    = { 'github_repo' => 'ssh://github.com/art19/useragent' }
  s.summary     = 'HTTP User Agent parser'
  s.description = 'HTTP User Agent parser'

  s.files = Dir['LICENSE', 'README.md', 'lib/**/*.rb']

  s.add_development_dependency 'pry', '~> 0.11.3'
  s.add_development_dependency 'rake', '~> 13.0.1'
  s.add_development_dependency 'rspec', '~> 3.9.0'
  
  s.authors = ['Joshua Peek', 'Garry Shutler']
  s.email   = 'garry@robustsoftware.co.uk'
  s.license = 'MIT'
end
