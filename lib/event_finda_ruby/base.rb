require "httparty"

class Base
  include HTTParty

  attr_reader :api_extension
  attr_reader :auth
  attr_reader :filters

  def initialize(auth)
    @api_extension = "json"
    @auth          = auth
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

  def url
    "#{base_url}.#{api_extension}?#{get_filters}"
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

  def base_url
    "http://api.eventfinda.co.nz/v2/base"
  end

  def get_filters
    filters.map { |k,v| "#{k}=#{v}" }.join("&")
  end

  def response
    HTTParty.get("#{url}", basic_auth: auth)
  end

  def set_keywords_or(keywords)
    keywords.join("+OR+")
  end

  def set_keywords_and(keywords)
    keywords.join("+AND+")
  end
end
