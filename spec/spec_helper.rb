require 'lc_api'
require 'fakeweb'
FakeWeb.allow_net_connect = false
LcApi.key = "1111"
SITE_URL = "http://lctv-api.herokuapp.com/v1"