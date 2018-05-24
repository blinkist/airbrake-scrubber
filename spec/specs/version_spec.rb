
require 'spec_helper'
require 'blinkist-airbrake-scrubber/version'

describe Blinkist::Airbrake::Scrubber::VERSION do

  it 'provides the current version' do
    version = Blinkist::Airbrake::Scrubber::VERSION
    expect(version).to_not be nil
    expect(version.instance_of?(String)).to be true
  end

  it 'equals 2.1.0 for auto-check purposes' do
    version = Blinkist::Airbrake::Scrubber::VERSION
    expect(version).to eq '2.1.0'
  end

end
