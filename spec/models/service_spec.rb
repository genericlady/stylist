require 'rails_helper'

describe Service, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should belong_to(:user) }
end
