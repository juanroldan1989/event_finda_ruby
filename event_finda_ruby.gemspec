$:.push File.expand_path("../lib", __FILE__)
require File.expand_path('../lib/event_finda_ruby/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "event_finda_ruby"
  s.version     = EventFindaRuby::VERSION
  s.date        = "2016-04-10"
  s.summary     = "Eventfinda Ruby"
  s.description = "Ruby client to interact with EventFinda API - www.eventfinda.co.nz"
  s.authors     = ["Juan Roldan"]
  s.email       = "juanroldan1989@gmail.com"
  s.files       = Dir["{lib}/**/*"]
  s.homepage    = "http://rubygems.org/gems/event_finda_ruby"
  s.license     = "MIT"

  s.add_dependency "httparty",  "~> 0.13.7"
end

# http://guides.rubygems.org/make-your-own-gem/
# https://quickleft.com/blog/engineering-lunch-series-step-by-step-guide-to-building-your-first-ruby-gem/
