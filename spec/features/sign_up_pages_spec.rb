require "rails_helper"
require "spec_helper"

describe "signing up" do
  it "shows a success message when the password and password confirmation match" do
    visit root_path
    click_on "Sign up"
    fill_in "Username", with: "bencorn"
    fill_in "Password", with: 1234
    fill_in "Password confirmation", with: 1234
    click_on "Sign Up"
    expect(page).to have_content "Welcome to the club"
  end

  it "shows an error message when password and confirmation are different" do
    visit root_path
    click_on "Sign up"
    fill_in "Username", with: "bencorn"
    fill_in "Password", with: 1234
    fill_in "Password confirmation", with: 1324
    click_on "Sign Up"
    expect(page).to have_content "That didnt work..."
  end
end
