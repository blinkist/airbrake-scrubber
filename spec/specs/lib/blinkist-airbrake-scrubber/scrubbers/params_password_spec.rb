require 'spec_helper'

describe Blinkist::Airbrake::Scrubber::ParamsPassword do
  let(:notifier) { Airbrake[:default] }
  let(:notice) {
    Airbrake[:default].build_notice(
      Exception.new('whatever'),
      { email: 'user@example.org', password: 'whatever', param: 'whatever' }
    )
  }

  describe "Structure" do
    it "has scrub! method" do
      expect(described_class).to respond_to(:scrub!)
    end
  end

  describe "self.scrub!" do
    it "adds the filter" do
      expect(Airbrake).to receive(:add_filter)
      described_class::scrub!
    end

    it "scrubs the password from the params hash" do
      notifier.instance_variable_get(:@filter_chain).refine(notice)
      expect(notice[:params][:password]).to eq(Blinkist::Airbrake::Scrubber::FILTERED)
    end
  end

end
