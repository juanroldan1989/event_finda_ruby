module EventFindaRuby
  class Locations < Base

    RESOURCE_SLUG = "locations".freeze

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

    def by_point(point)
      apply_filter "point", point

      self
    end

    def by_radius(radius)
      apply_filter "distance", radius

      self
    end

    def by_venue(value)
      if ["true", "false"].include? value
        apply_filter "venue", value
      end

      self
    end

    def sort_by(option)
      apply_filter "order", option

      self
    end

    def with_level(level)
      apply_filter "levels", level

      self
    end

  end
end
