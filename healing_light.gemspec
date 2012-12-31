# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'healing_light/version'

Gem::Specification.new do |gem|
  gem.name          = "healing_light"
  gem.version       = HealingLight::VERSION
  gem.authors       = ["Peter Baker"]
  gem.email         = ["peter@finack.com"]
  gem.description   = %q{Control LED Lights}
  gem.summary       = %q{Very basic LED light controls for RasperryPI}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'gli'
end
