require "rspec/core/rake_task"
require "hanna/rdoctask"

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
