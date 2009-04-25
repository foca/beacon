Gem::Specification.new do |s|
  s.name    = "beacon"
  s.version = "0.1"
  s.date    = "2009-04-25"

  s.description = "Simple and straightforward observers for your code"
  s.summary     = "Simple and straightforward observers for your code"
  s.homepage    = "http://github.com/foca/beacon"

  s.authors = ["Nicolás Sanguinetti"]
  s.email   = "contacto@nicolassanguinetti.info"

  s.require_paths     = ["lib"]
  s.has_rdoc          = true
  s.rubygems_version  = "1.3.1"

  if s.respond_to?(:add_development_dependency)
    s.add_development_dependency "sr-mg"
    s.add_development_dependency "rspec"
  end

  s.files = %w[
.gitignore
LICENSE
README.rdoc
Rakefile
beacon.gemspec
lib/beacon.rb
]
end
