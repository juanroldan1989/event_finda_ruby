module EventFindaRuby
  class Locations < Base

    def by_featured
      apply_filter "featured", 1

      self
    end

    def by_location(location)
      apply_filter "location", location

      self
    end

    def by_location_slug(slug)
      apply_filter "location_slug", slug

      self
    end

    def by_venue(value)
      if ["true", "false"].include? value
        apply_filter "venue", value
      end

      self
    end

    def results
      response = HTTParty.get("#{url}", basic_auth: auth)

      @results = response["locations"]
    end

    def sort_by(option)
      case option
      when "popularity"
        apply_filter "order", option
      when "distance"
      end

      self
    end

    def with_level(level)
      apply_filter "levels", level

      self
    end

    private

    def base_url
      "http://api.eventfinda.co.nz/v2/locations"
    end

  end
end
