module EventFindaRuby
  class Events < Base

    RESOURCE_SLUG = "events".freeze

    def by_end_date(end_date)
      apply_filter "end_date", end_date

      self
    end

    def by_featured
      apply_filter "featured", 1

      self
    end

    def by_free
      apply_filter "free", 1

      self
    end

    def by_price_max(price_max)
      apply_filter "price_max", price_max

      self
    end

    def by_price_min(price_min)
      apply_filter "price_min", price_min

      self
    end

    def by_start_date(start_date)
      apply_filter "start_date", start_date

      self
    end

    def by_ticketed
      apply_filter "ticketed", 1

      self
    end

    def by_username(username)
      apply_filter "username", username

      self
    end

  end
end
