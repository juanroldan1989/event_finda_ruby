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
        first_event["id"].must_equal               390907
        first_event["url"].must_equal              "http://www.eventfinda.co.nz/2017/southern-nationals-including-mike-pero-new-zealand-grand-prix/christchurch"
        first_event["url_slug"].must_equal         "2017/southern-nationals-including-mike-pero-new-zealand-grand-prix/christchurch"
        first_event["name"].must_equal             "Southern Nationals "
        first_event["description"].must_equal      "The first event in the four events NZ Motorcycle Road Race Series for 2017. The event features a range of exciting action across the amazing Superbikes, Superstock 1000, Supersport, Superlite, Sidecars, Pro Twins, 125 ..."
        first_event["datetime_start"].must_equal   "2017-01-07 09:00:00"
        first_event["datetime_end"].must_equal     "2017-01-08 17:00:00"
        first_event["location_summary"].must_equal "Mike Pero Motorsport Park, Christchurch"
        first_event["address"].must_equal          "107 Hasketts Road, Templeton, Christchurch"
        first_event["is_free"].must_equal          false
        first_event["is_featured"].must_equal      true
        first_event["is_cancelled"].must_equal     false
        first_event["restrictions"].must_equal     "All Ages"
        first_event["point"]["lat"].must_equal     -43.5326
        first_event["point"]["lng"].must_equal     172.4854
        first_event["datetime_summary"].must_equal "Sun  8 Jan"

        # event's location fields
        location = first_event["location"]
        location["id"].must_equal                   17277
        location["name"].must_equal                 "Mike Pero Motorsport Park"
        location["summary"].must_equal              "Mike Pero Motorsport Park, Christchurch"
        location["url_slug"].must_equal             "mike-pero-motorsport-park-christchurch-city"
        location["is_venue"].must_equal             true
        location["count_current_events"].must_equal 6
        location["description"].must_equal          ""

        # event's category fields
        category = first_event["category"]
        category["id"].must_equal                   46
        category["name"].must_equal                 "Motorsport"
        category["url_slug"].must_equal             "sports-outdoors-motorsport"
        category["parent_id"].must_equal            7
        category["count_current_events"].must_equal 84

        # event's ticket_types fields
        first_ticket = first_event["ticket_types"]["ticket_types"].first
        first_ticket["id"].must_equal                        479837
        first_ticket["name"].must_equal                      "Adult Weekend Pass"
        first_ticket["price"].must_equal                     "35.00"
        first_ticket["is_ticketed"].must_equal               true
        first_ticket["description"].must_equal               ""
        first_ticket["minimum_purchase_quantity"].must_equal 1
        first_ticket["is_addon"].must_equal                  false
        first_ticket["onsale_at"].must_equal                 '2017-01-01 09:00:00'
        first_ticket["offsale_at"].must_equal                nil
      end
    end
  end

end
