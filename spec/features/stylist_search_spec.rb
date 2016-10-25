require 'rails_helper'

feature "Stylist Search" do
  def create_stylist(first_name: nil,
                     last_name: nil,
                     email: nil)

    first_name ||= Faker::Name.first_name
    last_name  ||= Faker::Name.last_name
    email      ||= "#{Faker::Internet.user_name}#{rand(1000)}@" +
                     "#{Faker::Internet.domain_name}"

    User.create!(
      first_name: first_name,
       last_name: last_name,
        username: "#{Faker::Internet.user_name}#{rand(1000)}",
           email: email
    )
  end

  let(:email) { "bob@example.com" }
  let(:password) { "password123" }

  before do
    User.create!(email: email,
                 password: password,
                 password_confirmation: password)

    create_stylist first_name: "Robert",
                     last_name: "Aaron"

    create_stylist first_name: "Bob",
                     last_name: "Johnson"

    create_stylist first_name: "JR",
                     last_name: "Bob"

    create_stylist first_name: "Bobby",
                     last_name: "Dobbs"

    create_stylist first_name: "Bob",
                     last_name: "Jones",
                         email: "bob123@somewhere.net"

    visit "/stylists"
    fill_in      "Email",    with: "bob@example.com"
    fill_in      "Password", with: "password123"
    click_button "Log in"
  end

  scenario "Search by Name" do
    within "section.search-form" do
      fill_in "stylist", with: "bob"
    end
  end
end
