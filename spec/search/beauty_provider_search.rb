require 'rails_helper'

describe BeautyProviderSearch do
  describe ".run" do

    let!(:betty) { create(:betty_from_beverly_hills) }
    let!(:bob) { create(:bob_from_brooklyn) }
    let!(:george) { create(:george_from_chicago) }
    let!(:nick) { create(:nick_from_new_york) }
    let!(:sally) { create(:sally_from_san_francisco) }

    context "When given a query with terms and a blank location." do
      it "Return beauty_providers with the letter b in their first or last name" do
        query = { query_type: 'beauty_provider', terms: 'b', location: '' }
        beauty_provider_search = BeautyProviderSearch.new(query)
        beauty_providers = beauty_provider_search.results

        expect(beauty_providers.length).to be >= 2
      end

      it "Will find someone named Brooklyn that lives in Chicago." do
        brooklyn = create(:george_from_chicago, first_name: 'Brooklyn')
        query = { query_type: 'beauty_provider', terms: 'brooklyn', location: '' }
        beauty_provider_search = BeautyProviderSearch.new(query)
        beauty_providers = beauty_provider_search.results

        expect(beauty_providers.first).to eq(brooklyn)
      end
    end

    context "When given a query with a location and no terms." do
      it "Return beauty_providers from matching locations." do
        query = { query_type: 'beauty_provider', terms: '', location: 'NY' }
        beauty_provider_search = BeautyProviderSearch.new(query)
        beauty_providers = beauty_provider_search.results

        expect(beauty_providers.length).to eq(2)
      end
    end

    context "When given a query with blank terms and blank location." do
      it "Return the top 20 beauty_providers." do

        FactoryGirl.create_list(:bob_from_brooklyn, 16)
        query = { query_type: 'beauty_provider', terms: '', location: '' }
        beauty_provider_search = BeautyProviderSearch.new(query)
        beauty_providers = beauty_provider_search.results

        expect(beauty_providers.length).to eq(20)
      end
    end

    context "When query is nil" do
      it "Return the top 20 beauty_providers." do
        FactoryGirl.create_list(:bob_from_brooklyn, 16)
        query = nil
        beauty_provider_search = BeautyProviderSearch.new(query)
        beauty_providers = beauty_provider_search.results

        expect(beauty_providers.length).to eq(20)
      end
    end

  end
end
