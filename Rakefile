require 'spec/rake/spectask'

begin
  require "hanna/rdoctask"
rescue LoadError
  require "rake/rdoctask"
end

begin
  require "metric_fu"
rescue LoadError
end

begin
  require "mg"
  MG.new("beacon.gemspec")
rescue LoadError
end

desc "Default: run all tests"
task :default => :spec

desc "Run library tests"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
end

Rake::RDocTask.new do |rd|
  rd.main = "README"
  rd.title = "Beacon Documentation"
  rd.rdoc_files.include("README.rdoc", "LICENSE", "lib/**/*.rb")
  rd.rdoc_dir = "doc"
end
