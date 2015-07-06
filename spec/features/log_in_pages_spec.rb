require 'rails_helper'
require 'spec_helper'

describe 'logging in' do
  it 'redirects to the home page on successful login' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content("You've been logged in.")
  end

  it 'redirects to the login on failed login attempt' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'nope'
    click_on 'Log in'
    expect(page).to have_content("There was a problem logging you in.")
  end

end
