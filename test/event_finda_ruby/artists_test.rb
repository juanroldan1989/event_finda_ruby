require "test_helper"

describe EventFindaRuby::Artists do
  before do
    auth    = { username: "event_finda", password: "123123" }
    @filter = EventFindaRuby::Artists.new(auth)
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

end
