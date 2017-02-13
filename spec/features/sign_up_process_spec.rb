require 'rails_helper'

feature "Signup process", :type => :feature do

  it "signs me up for an account to provide beauty" do
    visit '/users/sign_up'
    within("#new_user") do
      fill_in 'First name', with: 'Susie'
      fill_in 'Last name',  with: 'Salamander'
      fill_in 'Email',      with: 'user@example.com'
      fill_in 'Address1',   with: '10 sheridan square'
      fill_in 'City',       with: 'new york'
      fill_in 'State',      with: 'NY'
      fill_in 'Zip',        with: '10014'
      fill_in 'Password',   with: '1234567890'
      fill_in 'Password confirmation', with: '1234567890'
    end

    click_button 'Sign up'
    expect(page).to have_content 'You have signed up successfully.'
  end

  # it "Signing up for an account with a bad address will fail validation" do
  #   visit '/users/sign_up'
  #   within("#new_user") do
  #     fill_in 'First name', with: 'Susie'
  #     fill_in 'Last name',  with: 'Salamander'
  #     fill_in 'Email',      with: 'user@example.com'
  #     fill_in 'Address1',   with: '666 Satan Ave'
  #     fill_in 'City',       with: 'new york'
  #     fill_in 'State',      with: 'NY'
  #     fill_in 'Zip',        with: '10014'
  #     fill_in 'Password',   with: '234567890'
  #     fill_in 'Password confirmation', with: '1234567890'
  #   end

  #   click_button 'Sign up'
  #   #expect(page).to have_content ''
  # end

end
