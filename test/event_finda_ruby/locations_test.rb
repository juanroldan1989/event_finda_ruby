require "test_helper"

describe EventFindaRuby::Locations do
  before do
    auth    = { username: "event_finda", password: "123123" }
    @filter = EventFindaRuby::Locations.new(auth)
  end

  it "should allow to see current URL" do
    @filter.url.must_equal "http://api.eventfinda.co.nz/v2/locations.json?rows=20"
  end

  describe "#by_featured" do
    it "should contain 'featured' param inside URL" do
      @filter.by_featured
      @filter.url.must_include "featured=1"
    end
  end

end
