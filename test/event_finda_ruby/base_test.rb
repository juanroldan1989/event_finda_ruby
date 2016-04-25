require "test_helper"

describe Base do
  before do
    @filter = Base.new
  end

  it "should have JSON as default api extension" do
    @filter.api_extension.must_equal "json"
  end

  it "should have 20 results set by default" do
    rows = { "rows" => "20" }
    @filter.filters.must_equal rows
  end

  it "should allow to see current URL" do
    @filter.url.must_equal "http://api.eventfinda.co.nz/v2/base.json?rows=20"
  end

  # Common filters to all resources
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
  # Common filters to all resources

  describe "#with_extension" do
    it "should set api_extension to retrieve data" do
      @filter.with_extension("json")
      @filter.api_extension.must_equal "json"

      @filter.with_extension("xml")
      @filter.api_extension.must_equal "xml"
    end

    it "should set JSON as api_extension when wrong extension is provided" do
      @filter.with_extension("other_extension")
      @filter.api_extension.must_equal "json"
    end
  end
end
