# Prepend the original Airbrake module
module Airbrake
  class << self
    prepend Blinkist::Airbrake::Scrubber
  end
end
