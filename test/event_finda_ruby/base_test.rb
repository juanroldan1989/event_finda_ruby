require "test_helper"

describe Base do
  before do
    auth              = { username: "event_finda", password: "123123" }
    @event_finda_ruby = Base.new(auth)
  end

  it "should have JSON as default api extension" do
    @event_finda_ruby.api_extension.must_equal "json"
  end

  it "must be instantiated with username/password arguments" do
    @event_finda_ruby.must_be_instance_of Base
  end

  it "should have username/password pair setup" do
    @event_finda_ruby.auth[:username].wont_be_empty
    @event_finda_ruby.auth[:password].wont_be_empty
  end

  it "should have an empty string as 'filters' variable" do
    @event_finda_ruby.filters.must_equal ""
  end

  it "should allow to see current URL" do
    @event_finda_ruby.url.must_equal "#{Base::BASE_URL}.#{@event_finda_ruby.api_extension}?rows=20#{@event_finda_ruby.filters}"
  end

  # Common filters to all resources
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
  # Common filters to all resources

  describe "#with_extension" do
    it "should set api_extension to retrieve data" do
      @event_finda_ruby.with_extension("json")
      @event_finda_ruby.api_extension.must_equal "json"

      @event_finda_ruby.with_extension("xml")
      @event_finda_ruby.api_extension.must_equal "xml"
    end

    it "should set JSON as api_extension when wrong extension is provided" do
      @event_finda_ruby.with_extension("other_extension")
      @event_finda_ruby.api_extension.must_equal "json"
    end
  end
end
