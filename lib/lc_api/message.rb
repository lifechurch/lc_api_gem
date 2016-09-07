module LcApi
  class Message < Base
    def audio
      find_format(:audio)
    end

    def high_quality_video
      find_format(:high_quality_video)
    end

    def low_quality_video
      find_format(:low_quality_video)
    end

    def self.latest(*args)
      options = args.slice!(0) || {}
      options[:params] = (options[:params] || {}).merge({include: options[:include].join(",")}) if options.has_key? :include
      options[:params] = (options[:params] || {}).merge({key: LcApi.key})

      Message.get(:latest, options[:params])
    end

    def self.previous(*args)
      options = args.slice!(0) || {}
      options[:params] = (options[:params] || {}).merge({include: options[:include].join(",")}) if options.has_key? :include
      options[:params] = (options[:params] || {}).merge({key: LcApi.key})

      Message.get(:previous, options[:params])
    end

    private

    def find_format(name)
      (self.formats.detect {|f| f.name.downcase.gsub(/\s+/, "_") == name.to_s.downcase})
    end
  end
end
