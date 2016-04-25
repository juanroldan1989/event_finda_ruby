require "test_helper"

describe EventFindaRuby::Events do
  before do
    @filter = EventFindaRuby::Events.new
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

  describe "#results" do
    it "should return an array of 'Event' JSON objects" do
      VCR.use_cassette("events") do
        @filter.by_rows(1)

        events      = @filter.results
        first_event = events.first

        # event's primary fields
        first_event["id"].must_equal               350269
        first_event["url"].must_equal              "http://www.eventfinda.co.nz/2016/mahana/auckland/papakura"
        first_event["url_slug"].must_equal         "2016/mahana/auckland/papakura"
        first_event["name"].must_equal             "Mahana"
        first_event["description"].must_equal      "1960s, East Coast of New Zealand. Two Maori sheep-shearing families, the Mahanas and the Poatas, are longstanding enemies and commercial rivals. 14-year-old Simeon Mahana, the youngest son of the youngest son is in ..."
        first_event["datetime_start"].must_equal   "2016-03-03 19:30:00"
        first_event["datetime_end"].must_equal     "2016-04-12 23:59:59"
        first_event["location_summary"].must_equal "Hawkins Theatre, Auckland"
        first_event["address"].must_equal          "13 Ray Small Drive, Auckland"
        first_event["is_free"].must_equal          false
        first_event["is_featured"].must_equal      true
        first_event["is_cancelled"].must_equal     false
        first_event["restrictions"].must_equal     "M"
        first_event["point"]["lat"].must_equal     -37.0656
        first_event["point"]["lng"].must_equal     174.9378
        first_event["datetime_summary"].must_equal "Tue 12 Apr"

        # event's location fields
        location = first_event["location"]
        location["id"].must_equal                   1654
        location["name"].must_equal                 "Hawkins Theatre"
        location["summary"].must_equal              "Hawkins Theatre, Auckland"
        location["url_slug"].must_equal             "auckland-south-hawkins-theatre"
        location["is_venue"].must_equal             true
        location["count_current_events"].must_equal 15
        location["description"].must_equal          "The Hawkins Theatre - Papakura opened on the 14th July 1990 by Governor General Paul Reeves, and was an exciting step for the community as the first purpose-built facility for the arts in the District. The facility won ..."

        # event's category fields
        category = first_event["category"]
        category["id"].must_equal                   25
        category["name"].must_equal                 "Film"
        category["url_slug"].must_equal             "film"
        category["parent_id"].must_equal            1
        category["count_current_events"].must_equal 79

        # event's ticket_types fields
        first_ticket = first_event["ticket_types"]["ticket_types"].first
        first_ticket["id"].must_equal                        440885
        first_ticket["name"].must_equal                      "In advance adult"
        first_ticket["price"].must_equal                     "9.00"
        first_ticket["is_ticketed"].must_equal               true
        first_ticket["description"].must_equal               ""
        first_ticket["minimum_purchase_quantity"].must_equal 1
        first_ticket["is_addon"].must_equal                  false
        first_ticket["onsale_at"].must_equal                 nil
        first_ticket["offsale_at"].must_equal                nil
      end
    end
  end

end
