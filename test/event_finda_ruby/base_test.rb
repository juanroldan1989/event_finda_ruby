require "minitest/spec"
require "minitest/autorun"
require "event_finda_ruby"

describe Base do
  before do
    auth              = { username: "event_finda", password: "123123" }
    @event_finda_ruby = Base.new(auth)
  end

  it "must be instantiated with username/password arguments" do
    @event_finda_ruby.must_be_instance_of Base
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
    @event_finda_ruby.url.must_equal "#{Base::BASE_URL}.#{@event_finda_ruby.api_extension}?rows=20"
  end
end
