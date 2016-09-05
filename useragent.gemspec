Gem::Specification.new do |s|
  s.name    = "useragent"
  s.version = "0.16.8"

  s.homepage    = "https://github.com/gshutler/useragent"
  s.summary     = "HTTP User Agent parser"
  s.description = "HTTP User Agent parser"

  s.files = Dir["LICENSE", "README.md", "lib/**/*.rb"]

  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"

  s.authors  = ["Joshua Peek", "Garry Shutler"]
  s.email   = "garry@robustsoftware.co.uk"
  s.license = "MIT"
end
