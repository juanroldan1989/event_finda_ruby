Gem::Specification.new do |s|
  s.name        = "event_finda_ruby"
  s.version     = "0.0.1"
  s.date        = "2016-04-05"
  s.summary     = "Eventfinda Ruby"
  s.description = "Ruby client to interact with Eventfinda API: www.eventfinda.co.nz"
  s.authors     = ["Juan Roldan"]
  s.email       = "juanroldan1989@gmail.com"
  s.files       = Dir["{lib}/**/*"]
  s.homepage    = "http://rubygems.org/gems/event_finda_ruby"
  s.license     = "MIT"

  s.add_dependency "httparty",  "~> 0.13.7"
end

# http://guides.rubygems.org/make-your-own-gem/
# https://quickleft.com/blog/engineering-lunch-series-step-by-step-guide-to-building-your-first-ruby-gem/
