require 'rails_helper'
require 'support/violate_check_constraint_matcher'

describe User do
  it { should have_many :services }
  it { should have_many :locations }

  describe "username" do
    let(:user) {
      User.create!(email: "foo@example.com",
                   password: "qwertyuiop",
                   password_confirmation: "qwertyuiop",
                   username: "default")
    }

    it "absolutely prevents duplicate usernames for users" do
      User.create!(email: "moreFoo@example.com",
                   password: "1234567890",
                   password_confirmation: "1234567890",
                   username: "foobar")

      expect {
        user.update_attribute(:username, "foobar")
      }.to violate_check_constraint(:index_users_on_username)

    end
  end
end

