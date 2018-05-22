require 'airbrake'
Dir[File.expand_path('../../lib/**/*.rb', __FILE__)].each do |f|
  require f
end

# Prepend the original Airbrake module
module AirbrakeScrubber
  prepend Airbrake

  class << self
    def configure(notifier = :default, &block)
      super notifier, &block
      Blinkist::Airbrake::Scrubber.run!
    end
  end
end

# Set up the namespace and run every scrubber listed in SCRUBBERS
module Blinkist
  module Airbrake
    module Scrubber
      SCRUBBERS = [ MessageEmail ]
      FILTERED = '[Filtered]'

      def self.run!
        SCRUBBERS.each   { |scrubber| self.const_get(scrubber)::scrub! }
      end

    end
  end
end
