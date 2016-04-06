require "httparty"

class Base
  include HTTParty

  BASE_URL = "http://api.eventfinda.co.nz/v2/events".freeze

  attr_reader :api_extension
  attr_reader :auth
  attr_reader :url

  def initialize(auth)
    @api_extension = "json"
    @auth          = auth
    @url           = base_path
  end

  def with_extension(extension)
    if ["json", "xml"].include? extension
      @api_extension = extension
    end
  end

  private

  # retrieving maximum set of results by default: 20
  def base_path
    "#{BASE_URL}.#{api_extension}?rows=20"
  end

  def apply_filter(filter_name, value)
    @url = "#{url}&#{filter_name}=#{value}"
  end
end
