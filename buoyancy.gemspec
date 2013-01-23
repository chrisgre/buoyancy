# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'buoyancy/version'

Gem::Specification.new do |gem|
  gem.name          = "buoyancy"
  gem.version       = Buoyancy::VERSION
  gem.authors       = ["Brandon Weiss"]
  gem.email         = ["brandon@anti-pattern.com"]
  gem.description   = %q{A Ruby gem for getting data from the NDBC (National Data Buoy Center)}
  gem.summary       = %q{A Ruby gem for getting data from the NDBC (National Data Buoy Center)}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_dependency "faraday", "~> 0.8.4"
end
