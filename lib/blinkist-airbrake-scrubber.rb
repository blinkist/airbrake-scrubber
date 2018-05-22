require 'airbrake'
Dir[File.expand_path('../../lib/**/*.rb', __FILE__)].each do |f|
  require f
end

# Prepend the original Airbrake module
module Blinkist::Airbrake
  prepend Airbrake

  class << self
    def configure(notifier = :default, &block)
      Airbrake.configure notifier, &block
      Blinkist::Airbrake::Scrubber.run!
    end
  end
end

# Set up the namespace and run every scrubber listed in SCRUBBERS
module Blinkist
  module Airbrake
    module Scrubber
      FILTERED  = '[Filtered]'
      SCRUBBERS = [ MessageEmail ]

      def self.run!
        SCRUBBERS.each   { |scrubber| scrubber::scrub! }
      end

    end
  end
end
