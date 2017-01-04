require 'rails_helper'

describe LocationExpression do

  def query
    {
      type: 'stylist',
      terms: '',
      location: 'Brooklyn',
    }
  end

  describe ".create" do
    it "Takes a query hash and returns a location RegExp" do
      expression = LocationExpression.create(query)
      
      expect(expression).to eq(/Brooklyn\b/i)
    end
  end

end
