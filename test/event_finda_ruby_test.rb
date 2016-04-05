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
  end
end

# http://ruby-doc.org/stdlib-2.0.0/libdoc/minitest/rdoc/MiniTest.html
# http://www.rubyinside.com/a-minitestspec-tutorial-elegant-spec-style-testing-that-comes-with-ruby-5354.html
