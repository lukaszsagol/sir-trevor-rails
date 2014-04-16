# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sir_trevor_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "sir_trevor_rails"
  spec.version       = SirTrevorRails::VERSION
  spec.email         = ["andrew@madebymany.co.uk", "chris@madebymany.co.uk", "andy@madebymany.co.uk"]
  spec.authors       = ["Andrew Sprinz", "Chris Bell", "Andrew Walker"]
  spec.summary       = %q{A ruby wrapper for sir trevor content}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.homepage      = 'https://github.com/madebymany/sir-trevor-rails'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.4"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry-rails"
  spec.add_development_dependency "wrong"

  spec.add_dependency "rails"
  spec.add_dependency "redcarpet", "~> 2.0.1"
  spec.add_dependency "twitter-text", "~> 1.4"

end
