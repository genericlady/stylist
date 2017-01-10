require 'rails_helper'

describe StylistSearch do
  describe ".run" do

    let!(:betty) { create(:betty_from_beverly_hills) }
    let!(:bob) { create(:bob_from_brooklyn) }
    let!(:george) { create(:george_from_chicago) }
    let!(:nick) { create(:nick_from_new_york) }
    let!(:sally) { create(:sally_from_san_francisco) }

    context "When given a query with terms and a blank location." do
      it "Return stylists with the letter b in their first or last name" do
        query = { query_type: 'stylist', terms: 'b', location: '' }
        stylist_search = StylistSearch.new(query)
        stylists = stylist_search.results

        expect(stylists.length).to be >= 2
      end

      it "Will find someone named Brooklyn that lives in Chicago." do
        brooklyn = create(:george_from_chicago, first_name: 'Brooklyn')
        query = { query_type: 'stylist', terms: 'brooklyn', location: '' }
        stylist_search = StylistSearch.new(query)
        stylists = stylist_search.results

        expect(stylists.first).to eq(brooklyn)
      end
    end

    context "When given a query with a location and no terms." do
      it "Return stylists from matching locations." do
        query = { query_type: 'stylist', terms: '', location: 'NY' }
        stylist_search = StylistSearch.new(query)
        stylists = stylist_search.results

        expect(stylists.length).to eq(2)
      end
    end

    context "When given a query with blank terms and blank location." do
      it "Return the top 20 stylists." do

        FactoryGirl.create_list(:bob_from_brooklyn, 16)
        query = { query_type: 'stylist', terms: '', location: '' }
        stylist_search = StylistSearch.new(query)
        stylists = stylist_search.results

        expect(stylists.length).to eq(20)
      end
    end

    context "When query is nil" do
      it "Return the top 20 stylists." do
        FactoryGirl.create_list(:bob_from_brooklyn, 16)
        query = nil
        stylist_search = StylistSearch.new(query)
        stylists = stylist_search.results

        expect(stylists.length).to eq(20)
      end
    end

  end
end
