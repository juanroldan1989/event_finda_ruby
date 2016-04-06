require "minitest/spec"
require "minitest/autorun"
require "event_finda_ruby"

describe EventFindaRuby do
  before do
    auth              = { username: "event_finda", password: "123123" }
    @event_finda_ruby = EventFindaRuby.new(auth)
  end

  it "must be instantiated with username/password arguments" do
    @event_finda_ruby.must_be_instance_of EventFindaRuby
  end

  it "should have JSON as default api extension" do
    @event_finda_ruby.api_extension.must_equal "json"
  end

  it "should have username/password pair setup" do
    @event_finda_ruby.auth[:username].wont_be_empty
    @event_finda_ruby.auth[:password].wont_be_empty
  end

  it "should have empty results" do
    @event_finda_ruby.results.must_be_empty
  end

  it "should have a default URL" do
    @event_finda_ruby.url.must_equal "#{EventFindaRuby::BASE_URL}.#{@event_finda_ruby.api_extension}?rows=20"
  end

  describe "filters" do
    describe "#by_end_date" do
      it "should contain 'end_date' param inside URL" do
        @event_finda_ruby.by_end_date("2016-10-25")
        @event_finda_ruby.url.must_include "end_date=2016-10-25"
      end
    end

    describe "#by_featured" do
      it "should contain 'featured' param inside URL" do
        @event_finda_ruby.by_featured
        @event_finda_ruby.url.must_include "featured=1"
      end
    end

    describe "#by_free" do
      it "should contain 'free' param inside URL" do
        @event_finda_ruby.by_free
        @event_finda_ruby.url.must_include "free=1"
      end
    end

    describe "#by_keywords_or" do
      it "should contain 'q' param inside URL" do
        @event_finda_ruby.by_keywords_or(["beach", "fun"])
        @event_finda_ruby.url.must_include "q=beach+OR+fun"
      end
    end

    describe "#by_keywords_and" do
      it "should contain 'q' param inside URL" do
        @event_finda_ruby.by_keywords_and(["beach", "fun"])
        @event_finda_ruby.url.must_include "q=beach+AND+fun"
      end
    end

    describe "#by_query" do
      it "should contain 'q' param inside URL" do
        @event_finda_ruby.by_query("(cycling+AND+running+AND+swimming)+OR+triathlon")
        @event_finda_ruby.url.must_include "q=(cycling+AND+running+AND+swimming)+OR+triathlon"
      end
    end

    describe "#by_rows" do
      it "should contain 'rows' param inside URL" do
        rand_1_20 = (1..20).to_a.sample
        @event_finda_ruby.by_rows(rand_1_20)
        @event_finda_ruby.url.must_include "rows=#{rand_1_20}"
      end
    end

    describe "#by_price_max" do
      it "should contain 'price_max' param inside URL" do
        @event_finda_ruby.by_price_max("75.0")
        @event_finda_ruby.url.must_include "price_max=75.0"
      end
    end

    describe "#by_price_min" do
      it "should contain 'price_min' param inside URL" do
        @event_finda_ruby.by_price_min("25.0")
        @event_finda_ruby.url.must_include "price_min=25.0"
      end
    end

    describe "#by_start_date" do
      it "should contain 'start_date' param inside URL" do
        @event_finda_ruby.by_start_date("2016-08-19")
        @event_finda_ruby.url.must_include "start_date=2016-08-19"
      end
    end

    describe "#by_ticketed" do
      it "should contain 'ticketed' param inside URL" do
        @event_finda_ruby.by_ticketed
        @event_finda_ruby.url.must_include "ticketed=1"
      end
    end

    describe "#by_username" do
      it "should contain 'username' param inside URL" do
        @event_finda_ruby.by_username("batman")
        @event_finda_ruby.url.must_include "username=batman"
      end
    end

  end
end
