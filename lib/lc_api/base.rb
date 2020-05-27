module LcApi
  class Base < ActiveResource::Base
    self.api_version_prefix = 'v1'
    self.site = "https://api.life.church/#{self.version_prefix}"

    class << self
      attr_accessor :api_key

      def set_api_version_prefix(version = 'v1')
        self.api_version_prefix = version
      end

    end

    def self.find(*args)
      scope   = args.slice!(0)
      options = args.slice!(0) || {}

      options[:params] = (options[:params] || {}).merge({include: options[:include].join(",")}) if options.has_key? :include
      options[:params] = (options[:params] || {}).merge({type: options[:type]}) if options.has_key? :type
      options[:params] = (options[:params] || {}).merge({key: LcApi.key})

      super(scope, options)
    end
  end
end