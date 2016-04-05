require "httparty"

class EventFindaRuby

  include HTTParty

  BASE_URL = "http://api.eventfinda.co.nz/v2/events".freeze

  attr_reader :api_extension
  attr_reader :auth
  attr_reader :results
  attr_reader :url

  def initialize(auth)
    @api_extension = "json"
    @auth          = auth
    @results       = []
    @url           = base_path
  end

  def by_end_date
    self
  end

  def by_featured
    @url = "#{url}&featured=1"

    self
  end

  def by_free
    @url = "#{url}&free=1"

    self
  end

  def by_location_id(location_id)
    self
  end

  def by_location_slug(location_slug)
    self
  end

  def by_name
    self
  end

  def by_keywords_and(keywords)
    @url = "#{url}&q=#{set_keywords_and(keywords)}"

    self
  end

  def by_keywords_or(keywords)
    @url = "#{url}&q=#{set_keywords_or(keywords)}"

    self
  end

  # allowing AND/OR behavior customized by developer
  # /events.xml?q=(cycling+AND+running+AND+swimming)+OR+triathlon
  def by_query(query)
    @url = "#{url}&q=#{query.to_s}"

    self
  end

  def by_rows(rows)
    @url = "#{url}&rows=#{rows.to_i}"

    self
  end

  def by_start_date
    
    self
  end

  def events
    response = HTTParty.get("#{url}", basic_auth: auth)

    @results = response["events"]
  end

  def with_extension(extension)
    if ["json", "xml"].include? extension
      @api_extension = extension
    end
  end

  private

  def base_path
    "#{BASE_URL}.#{api_extension}?rows=20"
  end

  def set_keywords_or(keywords)
    keywords.to_a.join("+OR+")
  end

  def set_keywords_and(keywords)
    keywords.to_a.join("+AND+")
  end
end

# Parameters to query the API
# http://www.eventfinda.co.nz/api/v2/events
# http://www.eventfinda.co.nz/api/v2/endpoints
