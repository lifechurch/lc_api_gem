Gem::Specification.new do |s|
  s.name        = 'lc_api'
  s.version     = '0.1'
  s.summary     = 'LC API'
  s.description = 'A gem for consuming the LifeChurch.tv API - api.lifechurch.tv'
  s.date        = '2014-02-05'
  s.authors     = ["Scott Lesser"]
  s.email       = "interactive@lifechurch.tv"
  s.files       = [
      'lib/lc_api.rb',
      'lib/lc_api/base.rb',
      'lib/lc_api/location.rb',
      'lib/lc_api/message.rb',
      'lib/lc_api/series.rb'
    ]
  s.homepage    = "http://api.lifechurch.tv"  
end