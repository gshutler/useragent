begin
  require 'mg'
  MG.new('useragent.gemspec')
rescue LoadError
end

require 'spec/rake/spectask'

task :default => :spec

Spec::Rake::SpecTask.new do |t|
  t.warning = true
end
