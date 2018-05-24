module Blinkist
  module Airbrake
    module Scrubber
      class MessageEmail
        REGEXP = /[\S]+@[\S]+/i

        def self.scrub!
          ::Airbrake.add_filter do |notice|
            # Cannot do gsub! coz of frozen literals
            notice[:errors].each { |error| error[:message] = scrub(error[:message]) }
          end
        end # def self.scrub!

        def self.scrub(message)
          message.gsub(REGEXP, FILTERED)
        end

      end
    end
  end
end
