require "minitest/spec"
require "minitest/autorun"
require "event_finda_ruby"

describe EventFindaRuby::Events do
  before do
    auth    = { username: "event_finda", password: "123123" }
    @filter = EventFindaRuby::Events.new(auth)
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

  describe "#by_keywords_or" do
    it "should contain 'q' param inside URL" do
      @filter.by_keywords_or(["beach", "fun"])
      @filter.url.must_include "q=beach+OR+fun"
    end
  end

  describe "#by_keywords_and" do
    it "should contain 'q' param inside URL" do
      @filter.by_keywords_and(["beach", "fun"])
      @filter.url.must_include "q=beach+AND+fun"
    end
  end

  describe "#by_query" do
    it "should contain 'q' param inside URL" do
      @filter.by_query("(cycling+AND+running+AND+swimming)+OR+triathlon")
      @filter.url.must_include "q=(cycling+AND+running+AND+swimming)+OR+triathlon"
    end
  end

  describe "#by_rows" do
    it "should contain 'rows' param inside URL" do
      rand_1_20 = (1..20).to_a.sample
      @filter.by_rows(rand_1_20)
      @filter.url.must_include "rows=#{rand_1_20}"
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
