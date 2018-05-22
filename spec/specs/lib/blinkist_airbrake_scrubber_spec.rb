require 'spec_helper'
require 'securerandom'
require 'blinkist-airbrake-scrubber'

describe Blinkist::Airbrake::Scrubber do
  let(:instantiate_airbrake) {
    Airbrake.configure :"notifier_#{ SecureRandom.uuid }" do |c|
      c.project_id  = 1
      c.project_key = 'whatever'
    end
  }

  describe "Constants" do
    it "has FILTERED constant" do
      expect(Blinkist::Airbrake::Scrubber.constants).to include(:FILTERED)
    end

    it "has explicit FILTERED constant content" do
      expect(Blinkist::Airbrake::Scrubber::FILTERED).to eq('[Filtered]')
    end

    it "has SCRUBBERS constant" do
      expect(Blinkist::Airbrake::Scrubber.constants).to include(:SCRUBBERS)
    end

    it "has list of scrubbers in SCRUBBERS" do
      expect(Blinkist::Airbrake::Scrubber::SCRUBBERS.is_a?(Array)).to be true
    end
  end

  describe ".configure(*args, &block)" do
    it "calls super Airbrake.configure(*args, &block)" do
      expect(Airbrake).to receive(:configure)
      instantiate_airbrake
    end

    it "calls Blinkist::Airbrake::Scrubber.run!" do
      expect(Blinkist::Airbrake::Scrubber).to receive(:run!)
      instantiate_airbrake
    end
  end

  describe "self.run!" do
    it "runs ::scrub! for every scrubber declared in SCRUBBERS" do
      Blinkist::Airbrake::Scrubber::SCRUBBERS.each do |scrubber|
        expect(scrubber).to receive(:scrub!)
      end
      instantiate_airbrake
    end
  end

end
