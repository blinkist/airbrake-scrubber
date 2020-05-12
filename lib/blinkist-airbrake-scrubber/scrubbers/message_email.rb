# frozen_string_literal: true

module Blinkist
  module AirbrakeScrubber
    class MessageEmail
      REGEXP = /[\S]+@[\S]+/i.freeze

      def self.scrub!
        ::Airbrake.add_filter do |notice|
          # Cannot do gsub! coz of frozen literals
          notice[:errors].each { |error| error[:message] = scrub(error[:message]) }
        end
      end

      def self.scrub(message)
        message&.gsub(REGEXP, FILTERED)
      end

    end
  end
end
