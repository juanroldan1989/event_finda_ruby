module EventFindaRuby
  class Artists < Base

    BASE_URL = "http://api.eventfinda.co.nz/v2/artists".freeze

    def by_category(category)
      apply_filter "category", category

      self
    end

    def by_category_slug(slug)
      apply_filter "category_slug", slug

      self
    end

    def results
      response = HTTParty.get("#{url}", basic_auth: auth)

      @results = response["artists"]
    end

  end
end
