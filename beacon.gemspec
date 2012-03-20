Gem::Specification.new do |s|
  s.name    = "beacon"
  s.version = "0.9.0"
  s.date    = "2012-03-20"

  s.description = "Simple and straightforward observers for your code"
  s.summary     = "Simple and straightforward observers for your code"
  s.homepage    = "http://github.com/foca/beacon"

  s.authors = ["Nicolas Sanguinetti"]
  s.email   = "contacto@nicolassanguinetti.info"

  s.require_paths     = ["lib"]
  s.has_rdoc          = true
  s.rubyforge_project = "beacon"

  s.add_development_dependency "rspec", "~> 2.0"
  s.add_development_dependency "hanna", "~> 0.1"

  s.files = `git ls-files`.split "\n"
  s.platform = Gem::Platform::RUBY
end
