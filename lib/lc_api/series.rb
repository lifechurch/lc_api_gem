module LcApi
  class Series < Base
    has_many :messages, :class_name => "LcApi::Message"
  end
end