# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lc_api_gem/version'

Gem::Specification.new do |spec|
  spec.name          = 'lc_api'
  spec.version       = LcApi::VERSION
  spec.authors       = ["Scott Lesser"]
  spec.email         = ["interactive@lifechurch.tv"]
  spec.summary       = 'LC API'
  spec.description   = 'A gem for consuming the LifeChurch.tv API - api.lifechurch.tv'
  spec.homepage      = "http://api.lifechurch.tv"  
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
