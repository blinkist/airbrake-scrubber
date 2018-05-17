module Blinkist::Airbrake::Scrubber
  class MessageEmail
    REGEXP = /[\S]+@[\S]+/i

    def self.scrub!
      ::Airbrake.add_filter do |notice|
        notice[:errors].each { |error| error[:message].gsub!(REGEXP, FILTERED) }
      end
    end # def self.scrub!

  end
end
