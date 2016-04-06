module EventFindaRuby
  class Events < Base

    BASE_URL = "http://api.eventfinda.co.nz/v2/events".freeze

    def by_end_date(end_date)
      @url = "#{url}&end_date=#{end_date}"

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
      @url = "#{url}&q=#{query}"

      self
    end

    def by_rows(rows)
      @url = "#{url}&rows=#{rows}"

      self
    end

    # price_max format "35.0" or "35"
    def by_price_max(price_max)
      @url = "#{url}&price_max=#{price_max}"

      self
    end

    # price_min format "35.0" or "35"
    def by_price_min(price_min)
      @url = "#{url}&price_min=#{price_min}"

      self
    end

    def by_start_date(start_date)
      @url = "#{url}&start_date=#{start_date}"

      self
    end

    def by_ticketed
      @url = "#{url}&ticketed=1"

      self
    end

    def by_username(username)
      @url = "#{url}&username=#{username}"

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
