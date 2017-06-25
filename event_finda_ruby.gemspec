$:.push File.expand_path("../lib", __FILE__)
require File.expand_path('../lib/event_finda_ruby/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "event_finda_ruby"
  s.version     = EventFindaRuby::VERSION
  s.date        = "2017-01-08"
  s.summary     = "EventFinda Ruby"
  s.description = "Ruby client to interact with EventFinda API - www.eventfinda.co.nz"
  s.authors     = ["Juan Roldan"]
  s.email       = "juanroldan1989@gmail.com"
  s.files       = Dir["{lib}/**/*"]
  s.homepage    = "http://rubygems.org/gems/event_finda_ruby"
  s.license     = "MIT"

  s.required_ruby_version = ">= 2.1.2"

  s.add_dependency "httparty", "~> 0.15.5"

  s.add_development_dependency "vcr",     "~> 3.0.3"
  s.add_development_dependency "webmock", "~> 2.3.2"
end
