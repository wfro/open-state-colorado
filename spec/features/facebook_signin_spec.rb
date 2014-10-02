require "rails_helper"

RSpec.describe "Facebook log in", type: :feature do

  describe "user with valid information" do
    it "is signed in successfully" do
      visit "/"
      mock_auth_hash
      click_link "Log in"
      expect(page).to have_content "Logged in as facebook user"
      expect(page).to have_content "Log out"
      expect(page).not_to have_content "Log in"
    end
  end

  describe "user with invalid information" do
    it "is redirected to root" do
      OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
      visit "/"
      click_link "Log in"
      expect(page).to have_content "Log in"
      expect(page).to have_selector "div.alert.alert-notice"
    end
  end
end
