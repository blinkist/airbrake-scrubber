module Blinkist
  module Airbrake
    module Scrubber
      class ParamsPassword

        def self.scrub!
          ::Airbrake.add_filter do |notice|
            notice[:params] = notice[:params].traverse do |key, value|
              value = FILTERED if key.to_s == 'password'
              [ key, value ]
            end
            notice
          end
        end # def self.scrub!

      end
    end
  end
end
