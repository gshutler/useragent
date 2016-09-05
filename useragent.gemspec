Gem::Specification.new do |s|
  s.name    = "useragent"
  s.version = "0.16.7"

  s.homepage    = "http://github.com/gshutler/useragent"
  s.summary     = "HTTP User Agent parser"
  s.description = <<-EOS
    HTTP User Agent parser
  EOS

  s.files = [
    "lib/user_agent.rb",
    "lib/user_agent/browsers.rb",
    "lib/user_agent/browsers/apple_core_media.rb",
    "lib/user_agent/browsers/base.rb",
    "lib/user_agent/browsers/chrome.rb",
    "lib/user_agent/browsers/edge.rb",
    "lib/user_agent/browsers/gecko.rb",
    "lib/user_agent/browsers/internet_explorer.rb",
    "lib/user_agent/browsers/itunes.rb",
    "lib/user_agent/browsers/libavformat.rb",
    "lib/user_agent/browsers/opera.rb",
    "lib/user_agent/browsers/playstation.rb",
    "lib/user_agent/browsers/podcast_addict.rb",
    "lib/user_agent/browsers/webkit.rb",
    "lib/user_agent/browsers/windows_media_player.rb",
    "lib/user_agent/operating_systems.rb",
    "lib/user_agent/version.rb",
    "lib/useragent.rb",
    "LICENSE",
    "README.md"
  ]

  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"

  s.authors  = ["Joshua Peek", "Garry Shutler"]
  s.email   = "garry@robustsoftware.co.uk"
  s.license = "MIT"
end
