module EventFindaRuby
  class Categories < Artists

    BASE_URL = "http://api.eventfinda.co.nz/v2/categories".freeze

    def results
      response = HTTParty.get("#{url}", basic_auth: auth)

      @results = response["categories"]
    end

  end
end
