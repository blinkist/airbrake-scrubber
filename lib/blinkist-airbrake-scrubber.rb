require 'airbrake'
Dir[File.expand_path('../../lib/**/*.rb', __FILE__)].each do |f|
  require f
end

# Override the original Airbrake module to piggy-back on the .configure method
module Airbrake
  class << self
    def overriden_configure(notifier = :default, &block)
      old_configure notifier, &block
      Blinkist::Airbrake::Scrubber.run!
    end

    alias old_configure configure
    alias configure overriden_configure
  end
end

# Set up the namespace and run everything class from Blinkist::Airbrake::Scrubber automatically
module Blinkist
  module Airbrake
    module Scrubber
      FILTERED = '[Filtered]'

      def self.run!
        self.constants
          .select { |const| self.const_get(const).is_a? Class}
          .each   { |klass| self.const_get(klass)::scrub! }
      end

    end
  end
end
