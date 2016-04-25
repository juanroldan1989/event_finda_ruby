require "event_finda_ruby/version"
require "event_finda_ruby/base"
require "event_finda_ruby/artists"
require "event_finda_ruby/categories"
require "event_finda_ruby/configuration"
require "event_finda_ruby/events"
require "event_finda_ruby/locations"

module EventFindaRuby

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new

    yield(configuration)
  end

end
