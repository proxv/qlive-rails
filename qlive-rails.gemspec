$:.push File.expand_path("../lib", __FILE__)

require "qlive/version"

Gem::Specification.new do |s|
  s.name        = "qlive-rails"
  s.version     = Qlive::VERSION
  s.authors     = ["ProxV"]
  s.email       = ["support@proxv.com"]
  s.homepage    = "https://github.com/proxv/qlive-rails/"
  s.summary     = "Ruby on Rails engine for running qunit javascript tests using server-side factories and user login"
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "qlive", '~> 0.1'
  s.add_dependency "rails", "~> 3.2"
  s.add_development_dependency "rspec-rails", "~> 2.8.0"

end
