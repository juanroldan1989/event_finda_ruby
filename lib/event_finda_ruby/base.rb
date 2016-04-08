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

  def by_keywords_and(keywords)
    apply_filter "q", set_keywords_and(keywords)

    self
  end

  def by_keywords_or(keywords)
    apply_filter "q", set_keywords_or(keywords)

    self
  end

  # allowing AND/OR behavior customized by developer
  # /events.xml?q=(cycling+AND+running+AND+swimming)+OR+triathlon
  def by_query(query)
    apply_filter "q", query

    self
  end

  def by_rows(rows)
    apply_filter "rows", rows

    self
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

  def set_keywords_or(keywords)
    keywords.join("+OR+")
  end

  def set_keywords_and(keywords)
    keywords.join("+AND+")
  end
end
