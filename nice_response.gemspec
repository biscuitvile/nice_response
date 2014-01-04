$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nice_response/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nice_response"
  s.version     = NiceResponse::VERSION
  s.authors     = ["Andy Borsz"]
  s.email       = ["andy.borsz@gmail.com"]
  s.homepage    = "https://github.com/biscuitvile/nice_response"
  s.summary     = "Lightweight JSON controller implementation for Rails 4"
  s.description = "Lightweight JSON controller implementation for Rails 4"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
