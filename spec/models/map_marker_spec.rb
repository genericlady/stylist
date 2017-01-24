require 'rails_helper'

describe MapMarker do

  let!(:stylists) do
    stylists = [
      create(:bob_from_brooklyn),
      create(:george_from_chicago)
    ]

    stylists.last.locations << create(:brooklyn)
    stylists
  end

  describe "#new_for_each(array)" do
    it "Given a collection of stylists can return a list of markers" do
      markers =
        MapMarker.
        new_for_each(stylists.as_json(include: :locations).
        map { |result| BeautyProviderResult.new(result) })
      expect(markers.length).to eq(3)
    end
  end

  describe "#new_for_each(array, expression)" do
    it "Given a array of user hashes with expression return a list of markers that match the expression" do
      markers =
        MapMarker.
        new_for_each(stylists.as_json(include: :locations).
        map { |result| BeautyProviderResult.new(result) }, /brooklyn\b/i)
      expect(markers.length).to eq(2)
    end
  end

end
