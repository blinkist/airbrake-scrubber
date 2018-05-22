module Blinkist
  module Airbrake
    module Scrubber
      class ParamsPassword

        def self.scrub!
          ::Airbrake.add_filter do |notice|
            if notice[:params] && notice[:params][:password]
              notice[:params][:password] = FILTERED
            end
            notice
          end
        end # def self.scrub!

      end
    end
  end
end
