require "httparty"

class Base
  include HTTParty

  BASE_URL      = "http://api.eventfinda.co.nz/v2/".freeze
  RESOURCE_SLUG = "base"

  attr_reader :api_extension
  attr_reader :filters

  def initialize
    @api_extension = "json"
    @filters       = { "rows" => "20" }
  end

  def by_keywords_and(keywords)
    apply_filter "q", set_keywords_and(keywords)

    self
  end

  def by_keywords_or(keywords)
    apply_filter "q", set_keywords_or(keywords)

    self
  end

  def by_query(query)
    apply_filter "q", query

    self
  end

  def by_rows(rows)
    apply_filter "rows", rows

    self
  end

  def results
    @results = response[resource_slug]
  end

  def url
    "#{BASE_URL}#{resource_slug}.#{api_extension}?#{get_filters}"
  end

  def with_extension(extension)
    if ["json", "xml"].include? extension
      @api_extension = extension
    end

    self
  end

  private

  def apply_filter(filter_name, value)
    filters[filter_name] = value
  end

  def auth
    {
      username: EventFindaRuby.configuration.username,
      password: EventFindaRuby.configuration.password
    }
  end

  def get_filters
    filters.map { |k,v| "#{k}=#{v}" }.join("&")
  end

  def resource_slug
    self.class::RESOURCE_SLUG
  end

  def response
    HTTParty.get(url, basic_auth: auth)
  end

  # TODO: work in progress with exception catching
  # https://github.com/hexgnu/linkedin/blob/master/lib/linked_in/helpers/request.rb
  # https://github.com/stripe/stripe-ruby/blob/master/lib/stripe.rb#L76-L103
  # https://github.com/stripe/stripe-ruby/blob/master/lib/stripe.rb#L228-L264

  def response_2
    result = []

    begin
      result = HTTParty.get("#{url}", basic_auth: auth)

    rescue SocketError => error
      raise "Exception raised! #{error}"

    rescue Net::OpenTimeout, Net::ReadTimeout, Net::HTTPBadResponse,
           Net::HTTPHeaderSyntaxError, Net::ProtocolError => error
      raise "Exception raised! #{error}"

    rescue Timeout::Error => error
      raise "Exception raised! #{error}"
    end

    result
  end


  def set_keywords_or(keywords)
    keywords.join("+OR+")
  end

  def set_keywords_and(keywords)
    keywords.join("+AND+")
  end
end
