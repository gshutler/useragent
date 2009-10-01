Gem::Specification.new do |s|
  s.name = "useragent"
  s.version = "0.0.4"
  s.date = "2009-08-17"
  s.summary = "HTTP User Agent parser"
  s.email = "josh@joshpeek.com"
  s.homepage = "http://github.com/josh/useragent"
  s.rubyforge_project = "useragent"
  s.description = "UserAgent is a Ruby library that parses and compares HTTP User Agents."
  s.has_rdoc = false
  s.authors = ["Joshua Peek"]
  s.files = [
    "README.rdoc",
    "LICENSE",
    "lib/user_agent",
    "lib/user_agent/browsers",
    "lib/user_agent/browsers/all.rb",
    "lib/user_agent/browsers/gecko.rb",
    "lib/user_agent/browsers/internet_explorer.rb",
    "lib/user_agent/browsers/opera.rb",
    "lib/user_agent/browsers/webkit.rb",
    "lib/user_agent/browsers.rb",
    "lib/user_agent/comparable.rb",
    "lib/user_agent/operating_systems.rb",
    "lib/user_agent.rb",
    "lib/useragent.rb"
  ]
end
