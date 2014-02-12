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

    private

    def find_format(name)
      (self.formats.detect {|f| f.name.downcase.gsub(/\s+/, "_") == name.to_s.downcase})
    end
  end
end