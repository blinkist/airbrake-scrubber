# frozen_string_literal: true

module Blinkist
  module AirbrakeScrubber
    class ParamsPassword

      def self.scrub!
        ::Airbrake.add_filter do |notice|
          notice[:params] = DeepTraversal.new(notice[:params]).traverse do |key, value|
            value = FILTERED if key.to_s == 'password'
            value
          end
          notice
        end
      end

    end
  end
end
