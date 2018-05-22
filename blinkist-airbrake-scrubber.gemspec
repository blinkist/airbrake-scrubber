# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require_relative "lib/blinkist-airbrake-scrubber/version"

Gem::Specification.new do |gem|
  gem.name          = "blinkist-airbrake-scrubber"
  gem.version       = Blinkist::Airbrake::Scrubber::VERSION
  gem.authors       = ["Paweł Komarnicki", "Dinesh Vasudevan"]
  gem.email         = ["pawel@blinkist.com", "dinesh@blinkist.com"]
  gem.description   = %q{Email scrubbing configuration for Airbrake at Blinkist}
  gem.summary       = %q{With this, Airbrake will not leak emails via exception notifications}
  gem.homepage      = "https://github.com/blinkist/blinkist-airbrake-scrubber"
  gem.license       = "MIT"

  # Airbrake
  gem.add_dependency "airbrake", "~> 5"

  gem.files         = Dir["{lib,spec}/**/*", "README.md", "Rakefile", "Gemfile", "*.gemspec"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
end
