module EventFindaRuby
  class Locations < Base

    def by_featured
      apply_filter "featured", 1

      self
    end

    def sort_by(option)
      case option
      when "popularity"
        apply_filter "order", option
      when "distance"
      end

      self
    end

    def child_locations_from(location_id)
      apply_filter "location", location_id

      self
    end

    def with_level(level)
      apply_filter "levels", level

      self
    end


    def results
      response = HTTParty.get("#{url}", basic_auth: auth)

      @results = response["locations"]
    end

    private

    def base_url
      "http://api.eventfinda.co.nz/v2/locations"
    end

  end
end
