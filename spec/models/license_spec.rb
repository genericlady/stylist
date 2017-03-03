require 'rails_helper'

describe License, type: :model do
  it { should validate_presence_of(:expiration) }
  it { should validate_presence_of(:image) }
end
