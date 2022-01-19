# frozen_string_literal: true

require 'spec_helper'
require 'blinkist-airbrake-scrubber/version'

describe Blinkist::AirbrakeScrubber::VERSION do
  it 'provides the current version' do
    version = Blinkist::AirbrakeScrubber::VERSION
    expect(version).to_not be nil
    expect(version).to be_a String
  end

  it 'equals 5.0.1 for auto-check purposes' do
    version = Blinkist::AirbrakeScrubber::VERSION
    expect(version).to eq '5.0.1'
  end
end
