require 'rails_helper'
require 'support/violate_check_constraint_matcher'

describe User do
  it { should have_many :services }
  it { should have_many :locations }
  it { should have_many :licenses }

  describe "username" do
    let(:user) {
      User.create!(email: "foo@example.com",
                   password: "qwertyuiop",
                   password_confirmation: "qwertyuiop",
                   username: "default",
                   first_name: 'harper',
                   last_name: 'samwise',
                   zipcode: '11104')
    }

    it "absolutely prevents duplicate usernames for users" do
      User.create!(email: "moreFoo@example.com",
                   password: "1234567890",
                   password_confirmation: "1234567890",
                   username: "foobar",
                   first_name: 'chip',
                   last_name: 'ahoy',
                   zipcode: '11100')

      expect {
        user.update_attribute(:username, "foobar")
      }.to violate_check_constraint(:index_users_on_username)

    end
  end
end

