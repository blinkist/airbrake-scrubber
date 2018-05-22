module Blinkist
  module Airbrake
    module Scrubber
      class ParamsEmail

        def self.scrub!
          ::Airbrake.add_filter do |notice|
            if notice[:params] && notice[:params][:email]
              notice[:params][:email] = FILTERED
            end
            notice
          end
        end # def self.scrub!

      end
    end
  end
end
