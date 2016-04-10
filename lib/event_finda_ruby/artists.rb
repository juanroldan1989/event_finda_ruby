module EventFindaRuby
  class Artists < Base

    RESOURCE_SLUG = "artists".freeze

    def by_category(category)
      apply_filter "category", category

      self
    end

    def by_category_slug(slug)
      apply_filter "category_slug", slug

      self
    end

  end
end
