require "test_helper"

describe EventFindaRuby::Events do
  before do
    auth    = { username: "event_finda", password: "123123" }
    @filter = EventFindaRuby::Events.new(auth)
  end

  it "should allow to see current URL" do
    @filter.url.must_equal "http://api.eventfinda.co.nz/v2/events.json?rows=20"
  end

  describe "#by_end_date" do
    it "should contain 'end_date' param inside URL" do
      @filter.by_end_date("2016-10-25")
      @filter.url.must_include "end_date=2016-10-25"
    end
  end

  describe "#by_featured" do
    it "should contain 'featured' param inside URL" do
      @filter.by_featured
      @filter.url.must_include "featured=1"
    end
  end

  describe "#by_free" do
    it "should contain 'free' param inside URL" do
      @filter.by_free
      @filter.url.must_include "free=1"
    end
  end

  describe "#by_price_max" do
    it "should contain 'price_max' param inside URL" do
      @filter.by_price_max("75.0")
      @filter.url.must_include "price_max=75.0"
    end
  end

  describe "#by_price_min" do
    it "should contain 'price_min' param inside URL" do
      @filter.by_price_min("25.0")
      @filter.url.must_include "price_min=25.0"
    end
  end

  describe "#by_start_date" do
    it "should contain 'start_date' param inside URL" do
      @filter.by_start_date("2016-08-19")
      @filter.url.must_include "start_date=2016-08-19"
    end
  end

  describe "#by_ticketed" do
    it "should contain 'ticketed' param inside URL" do
      @filter.by_ticketed
      @filter.url.must_include "ticketed=1"
    end
  end

  describe "#by_username" do
    it "should contain 'username' param inside URL" do
      @filter.by_username("batman")
      @filter.url.must_include "username=batman"
    end
  end

end
