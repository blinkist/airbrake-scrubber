# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require_relative "lib/blinkist-airbrake-scrubber/version"

Gem::Specification.new do |gem|
  gem.name          = "blinkist-airbrake-scrubber"
  gem.version       = Blinkist::AirbrakeScrubber::VERSION
  gem.authors       = ["Blinkist"]
  gem.email         = ["operations@blinkist.com"]
  gem.description   = 'Email scrubbing configuration for Airbrake at Blinkist'
  gem.summary       = 'With this, Airbrake will not leak emails via exception notifications'
  gem.homepage      = "https://github.com/blinkist/airbrake-scrubber"
  gem.license       = "MIT"

  # Airbrake
  gem.add_dependency "airbrake", ">= 9", "< 11"

  gem.files         = Dir["{lib,spec}/**/*", "README.md", "Rakefile", "Gemfile", "*.gemspec"]
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
end
