# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hotel_plugin/version'

Gem::Specification.new do |spec|
  spec.name          = "hotel_plugin"
  spec.version       = HotelPlugin::VERSION
  spec.authors       = ["sunchen115"]
  spec.email         = ["sunchen115work@gmail.com"]
  spec.summary       = %q{plugin for hotel system to find the cheapest hotel}
  spec.description   = %q{plugin for hotel system descpition}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails",'4.1.4'
  spec.add_development_dependency "rspec",'3.0.0'
end
