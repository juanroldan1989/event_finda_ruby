require "test_helper"

describe EventFindaRuby::Configuration do
  describe "#username" do
    describe "when no username has been setup" do
      it "should return default username" do
        EventFindaRuby::Configuration.new.username.must_equal "default_username"
      end
    end

    describe "when username has been setup" do
      it "should return custom username" do
        config          = EventFindaRuby::Configuration.new
        config.username = "event_finda"

        EventFindaRuby.configuration.username.must_equal "event_finda"
      end
    end
  end

  describe "#password" do
    describe "when no password has been setup" do
      it "should return default password" do
        EventFindaRuby::Configuration.new.password.must_equal "default_password"
      end
    end

    describe "when password has been setup" do
      it "should return custom password" do
        config          = EventFindaRuby::Configuration.new
        config.password = "123123"

        EventFindaRuby.configuration.password.must_equal "123123"
      end
    end
  end

end
