require "test_helper"

describe EventFindaRuby::Categories do
  before do
    @filter = EventFindaRuby::Categories.new
  end

  it "should allow to see current URL" do
    @filter.url.must_equal "http://api.eventfinda.co.nz/v2/categories.json?rows=20"
  end

  describe "#by_category" do
    it "should contain 'category' param inside URL" do
      @filter.by_category("123")
      @filter.url.must_include "category=123"
    end
  end

  describe "#by_category_slug" do
    it "should contain 'category_slug' param inside URL" do
      @filter.by_category_slug("punk-rock")
      @filter.url.must_include "category_slug=punk-rock"
    end
  end

  describe "#results" do
    it "should return an array of 'Category' JSON objects" do
      VCR.use_cassette("categories") do
        @filter.by_rows(1)

        categories     = @filter.results
        first_category = categories.first

        # category fields
        first_category["id"].must_equal                   246
        first_category["name"].must_equal                 "All Events"
        first_category["url_slug"].must_equal             "whatson"
        first_category["parent_id"].must_equal            nil
        first_category["count_current_events"].must_equal 7054
      end
    end
  end
end
