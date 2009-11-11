Gem::Specification.new do |s|
  s.name        = 'useragent'
  s.version     = '0.1.1'
  s.date        = '2009-11-11'
  s.summary     = 'HTTP User Agent parser'
  s.description = <<-EOS
    UserAgent is a Ruby library that parses and compares HTTP User Agents.
  EOS

  s.files = [
    'lib/user_agent/browsers/all.rb',
    'lib/user_agent/browsers/gecko.rb',
    'lib/user_agent/browsers/internet_explorer.rb',
    'lib/user_agent/browsers/opera.rb',
    'lib/user_agent/browsers/webkit.rb',
    'lib/user_agent/browsers.rb',
    'lib/user_agent/comparable.rb',
    'lib/user_agent/operating_systems.rb',
    'lib/user_agent.rb',
    'lib/useragent.rb'
  ]

  s.author   = 'Joshua Peek'
  s.email    = 'josh@joshpeek.com'
  s.homepage = 'http://github.com/josh/useragent'
end
