require 'active_resource'
require 'lc_api/base'
require 'lc_api/message'
require 'lc_api/series'
require 'lc_api/location'

module LcApi
  class << self 
    attr_accessor :key
  end
end