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

  describe "#by_location" do
    it "should contain 'location' param inside URL" do
      @filter.by_location("123")
      @filter.url.must_include "location=123"
    end
  end

  describe "#by_location_slug" do
    it "should contain 'location_slug' param inside URL" do
      @filter.by_location_slug("auckland-central")
      @filter.url.must_include "location_slug=auckland-central"
    end
  end

  describe "#by_venue" do
    it "should contain 'venue' param inside URL" do
      @filter.by_venue("true")
      @filter.url.must_include "venue=true"

      @filter.by_venue("false")
      @filter.url.must_include "venue=false"
    end

    it "should not contain 'venue' param inside URL when wrong value is provided" do
      @filter.by_venue("other")
      @filter.url.wont_include "venue=other"
    end
  end

  describe "#by_point" do
    it "should contain 'point' param inside URL" do
      @filter.by_point("-36.84846,174.763332")
      @filter.url.must_include "point=-36.84846,174.763332"
    end
  end

  describe "#by_radius" do
    it "should contain 'radius' param inside URL" do
      @filter.by_radius("5")
      @filter.url.must_include "distance=5"
    end
  end

  describe "#sort_by" do
    it "should contain 'order' param inside URL" do
      @filter.sort_by("popularity")
      @filter.url.must_include "order=popularity"
    end
  end

  describe "#with_level" do
    it "should contain 'level' param inside URL" do
      @filter.with_level(2)
      @filter.url.must_include "levels=2"
    end
  end
end
