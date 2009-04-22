Gem::Specification.new do |s|
  s.name    = "master-n-servant"
  s.version = "0.1"
  s.date    = "2009-04-22"

  s.description = "Simple observers for your code"
  s.summary     = "Observing your codez"
  s.homepage    = "http://github.com/foca/master-n-servant"

  s.authors = ["Nicolás Sanguinetti"]
  s.email   = "contacto@nicolassanguinetti.info"

  s.require_paths     = ["lib"]
  s.has_rdoc          = true
  s.rubygems_version  = "1.3.1"

  if s.respond_to?(:add_development_dependency)
    s.add_development_dependency "sr-mg"
    s.add_development_dependency "contest"
    s.add_development_dependency "redgreen"
    s.add_development_dependency "ruby-debug"
  end

  s.files = %w[
.gitignore
LICENSE
README.rdoc
Rakefile
master_n_servant.gemspec
lib/master_n_servant.rb
]
end
