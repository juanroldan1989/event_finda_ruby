require "test_helper"

describe EventFindaRuby::Artists do
  before do
    auth    = { username: "event_finda", password: "123123" }
    @filter = EventFindaRuby::Artists.new(auth)
  end

  it "should allow to see current URL" do
    @filter.url.must_equal "http://api.eventfinda.co.nz/v2/artists.json?rows=20"
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
    it "should return an array of 'Artist' JSON objects" do
      VCR.use_cassette("artists") do
        @filter.by_rows(1)

        artists      = @filter.results
        first_artist = artists.first

        # artist's primary fields
        first_artist["id"].must_equal               1218
        first_artist["name"].must_equal             "10 String Symphony"
        first_artist["url_slug"].must_equal         "10-string-symphony"
        first_artist["url"].must_equal              "http:\/\/www.eventfinda.co.nz\/artist\/10-string-symphony"

        # artist's image fields
        first_image = first_artist["images"]["images"].first
        first_image["id"].must_equal                451715
        first_image["is_primary"].must_equal        true

        ## first_image's transform fields
        transform = first_image["transforms"]["transforms"].first
        transform["transformation_id"].must_equal   2
        transform["url"].must_equal                 "http://cdn.eventfinda.co.nz/uploads/artists/transformed/451715-1218-2.jpg"
        transform["width"].must_equal               80
        transform["height"].must_equal              53

        # artist's location fields
        location = first_artist["location"]
        location["id"].must_equal                   822
        location["name"].must_equal                 "United States"
        location["summary"].must_equal              "United States, International"
        location["url_slug"].must_equal             "united-states"
        location["is_venue"].must_equal             false
        location["count_current_events"].must_equal 0

        # artist's category fields
        category = first_artist["category"]
        category["id"].must_equal                   255
        category["name"].must_equal                 "Folk"
        category["url_slug"].must_equal             "folk"
        category["parent_id"].must_equal            6
        category["count_current_events"].must_equal 84
      end
    end
  end
end
