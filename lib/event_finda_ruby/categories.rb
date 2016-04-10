module EventFindaRuby
  class Categories < Artists

    def results
      response = HTTParty.get("#{url}", basic_auth: auth)

      @results = response["categories"]
    end

    private

    def base_url
      "http://api.eventfinda.co.nz/v2/categories"
    end

  end
end
