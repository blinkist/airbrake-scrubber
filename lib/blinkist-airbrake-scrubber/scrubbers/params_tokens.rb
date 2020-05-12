# frozen_string_literal: true

module Blinkist
  module AirbrakeScrubber
    class ParamsTokens

      def self.scrub!
        ::Airbrake.add_filter do |notice|
          notice[:params] = DeepTraversal.new(notice[:params]).traverse do |key, value|
            value = FILTERED if %w[facebook_access_token google_id_token].include?(key.to_s)
            value
          end
          notice
        end
      end

    end
  end
end
