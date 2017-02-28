require_relative '../rails_helper'

feature "Signup process", :type => :feature do

  scenario "signs me up for an account" do
    visit '/users/sign_up'
    within("#new_user") do
      fill_in 'First name', with: 'Sally'
      fill_in 'Last name', with: 'bojangles'
      fill_in 'Email',      with: 'user@example.com'
      fill_in 'Password',   with: '1234567890'
      fill_in 'Password confirmation', with: '1234567890'
      fill_in 'Zipcode', with: '11106'
    end

    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario "Signing up for an account with a bad address will fail validation" do
    visit '/users/sign_up'

    click_button 'Sign up'

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Zipcode can't be blank"
    expect(page).to have_content "Zipcode is too short (minimum is 5 characters)"
    expect(page).to have_content "Zipcode is invalid"
  end

end
