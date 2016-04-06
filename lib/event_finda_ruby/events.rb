module EventFindaRuby
  class Events < Base

    BASE_URL = "http://api.eventfinda.co.nz/v2/events".freeze

    def by_end_date(end_date)
      use_filter "end_date", end_date

      self
    end

    def by_featured
      use_filter "featured", 1

      self
    end

    def by_free
      use_filter "free", 1

      self
    end

    def by_keywords_and(keywords)
      use_filter "q", set_keywords_and(keywords)

      self
    end

    def by_keywords_or(keywords)
      use_filter "q", set_keywords_or(keywords)

      self
    end

    # allowing AND/OR behavior customized by developer
    # /events.xml?q=(cycling+AND+running+AND+swimming)+OR+triathlon
    def by_query(query)
      use_filter "q", query

      self
    end

    def by_rows(rows)
      use_filter "rows", rows

      self
    end

    # price_max format "35.0" or "35"
    def by_price_max(price_max)
      use_filter "price_max", price_max

      self
    end

    # price_min format "35.0" or "35"
    def by_price_min(price_min)
      use_filter "price_min", price_min

      self
    end

    def by_start_date(start_date)
      use_filter "start_date", start_date

      self
    end

    def by_ticketed
      use_filter "ticketed", 1

      self
    end

    def by_username(username)
      use_filter "username", username

      self
    end

    def results
      response = HTTParty.get("#{url}", basic_auth: auth)

      @results = response["events"]
    end

    private

    def set_keywords_or(keywords)
      keywords.to_a.join("+OR+")
    end

    def set_keywords_and(keywords)
      keywords.to_a.join("+AND+")
    end
  end
end
