require 'spec_helper'
require 'blinkist-airbrake-scrubber'

describe Hash do
  describe "Hash#traverse" do
    subject { { color: 'red', favorite: { color: 'blue' } } }

    it "returns Hash" do
      returned_object = subject.traverse { |k, v| [k, v] }
      expect(returned_object.class).to be Hash
    end

    it "runs block when not traversing" do
      returned_object = subject.traverse do |k, v|
        k = "new_#{k}".to_sym
        v = (v.is_a?(String) ? v.upcase : v)
        [ k, v ]
      end

      expect(returned_object[:new_color]).to eq 'RED'
    end

    it "runs block when traversing" do
      returned_object = subject.traverse do |k, v|
        k = "new_#{k}".to_sym
        v = (v.is_a?(String) ? v.upcase : v)
        [ k, v ]
      end

      expect(returned_object[:new_favorite][:new_color]).to eq 'BLUE'
    end

    it "returns updated key" do
      returned_object = subject.traverse do |k, v|
        k = "most_favorite".to_sym if k == :favorite
        [ k, v ]
      end

      expect(returned_object.keys).to eq %i( color most_favorite )
    end

    it "returns updated value" do
      returned_object = subject.traverse do |k, v|
        v = "Sky #{ v }" if v == 'blue'
        [ k, v ]
      end

      expect(returned_object[:favorite][:color]).to eq "Sky blue"
    end

  end
end
