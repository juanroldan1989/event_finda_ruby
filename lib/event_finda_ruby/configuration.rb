module EventFindaRuby
  class Configuration

    attr_accessor :username
    attr_accessor :password

    def initialize
      @username = "default_username"
      @password = "default_password"
    end
  end
end
