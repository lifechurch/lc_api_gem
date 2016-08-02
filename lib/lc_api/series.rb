module LcApi
  class Series < Base
    has_many :messages, :class_name => "LcApi::Message"

    def find_image(name)
      (self.images.detect {|f| f.name.downcase == name.to_s.downcase})
    end
    def current
    	Series.get(:current)
    end
  end
end