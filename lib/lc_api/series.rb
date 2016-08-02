module LcApi
  class Series < Base
    has_many :messages, :class_name => "LcApi::Message"

    def find_image(name)
      (self.images.detect {|f| f.name.downcase == name.to_s.downcase})
    end

    def self.current(*args)
      options = args.slice!(0) || {}
      options[:params] = (options[:params] || {}).merge({include: options[:include].join(",")}) if options.has_key? :include
      options[:params] = (options[:params] || {}).merge({key: LcApi.key})

    	Series.get(:current, options[:params])
    end
  end
end
