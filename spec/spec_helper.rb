require 'lc_api'
require 'fakeweb'
FakeWeb.allow_net_connect = false
LcApi.key = "1111"
SITE_URL = "http://api.lifechurch.tv/v1"

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(File.join(fixture_path, '/', file))
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end