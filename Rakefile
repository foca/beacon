require "rspec/core/rake_task"
require "hanna/rdoctask"
require "rubygems/package_task"

desc "Default: run all tests"
task default: :spec

desc "Run library tests"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
  t.rspec_opts = %w(-fs --color)
end

Rake::RDocTask.new do |rd|
  rd.title = "Beacon Documentation"
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "LICENSE", "lib/**/*.rb")
  rd.rdoc_dir = "doc"
end

gem_spec = eval(File.read("./beacon.gemspec")) rescue nil
Gem::PackageTask.new(gem_spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
end
