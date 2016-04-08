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

  it "should have a default URL" do
    @event_finda_ruby.url.must_equal "#{Base::BASE_URL}.#{@event_finda_ruby.api_extension}?rows=20"
  end

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
