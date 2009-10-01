require 'rake/packagetask'
require 'rake/gempackagetask'

# load gemspec like github's gem builder to surface any SAFE issues.
Thread.new {
  require 'rubygems/specification'
  $spec = eval("$SAFE=3\n#{File.read('useragent.gemspec')}")
}.join

Rake::GemPackageTask.new($spec) do |package|
  package.gem_spec = $spec
end

desc 'Publish gem to RubyForge'
task :release => [ :package ] do
  group_id     = $spec.rubyforge_project
  package_id   = $spec.name
  release_name = $spec.version
  userfile     = File.expand_path("pkg/#{$spec.name}-#{$spec.version}.gem")

  sh "rubyforge add_release #{group_id} #{package_id} #{release_name} #{userfile}"
end

require 'spec/rake/spectask'

task :default => :spec

Spec::Rake::SpecTask.new do |t|
  t.libs << 'lib'
  t.warning = true
end
