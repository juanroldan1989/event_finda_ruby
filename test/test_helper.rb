require "coveralls"
Coveralls.wear!

require "minitest/spec"
require "minitest/autorun"
require "event_finda_ruby"

require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures"
  config.hook_into :webmock
end
