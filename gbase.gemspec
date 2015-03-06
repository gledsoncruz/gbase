$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gbase/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gbase"
  s.version     = Gbase::VERSION
  s.authors     = ["Gledson Cruz"]
  s.email       = ["gledson.cruz@gmail.com"]
  s.homepage    = "https://github.com/gledsoncruz"
  s.summary     = "Modulo base de sistemas"
  s.description = "Description of Gbase."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "devise"
  s.add_dependency "jquery-rails", "~> 3.1.1"
  s.add_dependency "jquery-cookie-rails"
  s.add_dependency 'therubyracer'
  s.add_dependency 'less-rails-bootstrap'
  s.add_dependency 'bootstrap-validator-rails'
  s.add_dependency 'will_paginate-bootstrap'
  s.add_dependency 'bootstrap-select-rails'
  s.add_dependency 'ransack'
  s.add_dependency 'bootstrap_form'
  #s.add_dependency 'public_activity'
  s.add_dependency 'paper_trail', '~> 4.0.0.beta'
  s.add_dependency 'foreigner'
  s.add_dependency 'composite_primary_keys'
  s.add_dependency 'pundit'

  s.add_development_dependency "pg"
end
