require 'rails_helper'

describe LocationExpression do

  describe ".create" do
    it "Takes a query hash and returns a location RegExp" do
      query =
        {
          type: 'stylist',
          terms: '',
          location: 'Brooklyn',
        }
      expression = LocationExpression.create(query)
      
      expect(expression).to eq(/Brooklyn\b/i)
    end

    it "Appends each location term with word boundary" do
      query =
        {
          type: 'stylist',
          terms: '',
          location: 'Brooklyn, NY',
        }
      expression = LocationExpression.create(query)

      expect(expression).to eq(/Brooklyn\b|NY\b/i)
    end
  end

end
