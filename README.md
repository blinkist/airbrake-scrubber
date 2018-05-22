# Blinkist::Airbrake::Scrubber

Blinkist::Airbrake::Scrubber provides an Airbrake scrubbing service to remove various sensitive informations from the notifications, e.g. emails. It does *not* replace Airbrake configuration, but provides some seamless functionality.

Note: WIP

## Installation

Add this line to your application's Gemfile:

    gem "blinkist-airbrake-scrubber", "0.0.1", github: "blinkist-airbrake-scrubber", tag: "v0.0.1"

And then execute:

    $ bundle install

Install it with

    Blinkist::Airbrake.configure do |c|
      # Your config here
    end

## Information

### Extending the functionality

To extend the functionality, create new scrubber in `lib/blinkist-airbrake-scrubber/scrubbers` folders, like the template:

```
module Blinkist::Airbrake::Scrubber
  class WubbaLubba
    REGEXP = /[\S]+@[\S]+/i

    def self.scrub!
      ::Airbrake.add_filter do |notice|
        # Rainbows and unicorns come here:
        notice[:errors].each { |error| error[:message].gsub!(REGEXP, FILTERED) }
      end
    end # def self.scrub!

  end
end
```

Then, add the class to Blinkist::Airbrake::Scrubber's SCRUBBERS list.

### Applications using this gem

There are a few applications available on GitHub that use this gem. For usage see:

* TBA

### Dependencies

This gem has dependency on airbrake gem, it will automatically add it unless already bundled.

## Maintainers

* Paweł Komarnicki (https://github.com/pawelkomarnicki)

## License

Copyright 2018 Blinks Labs GmbH. http://blinkist.com
