require "rails_helper"

RSpec.describe "Sign in with facebook", type: :feature do

  describe "user with valid information" do
    xit "is signed in successfully" do
      visit "/"
      expect(page).to have_content "Log in with Facebook!"
      mock_auth_hash
      click_link "Log in"
      expect(page).to have_content "facebook user"
      expect(page).to have_content "Log out"
      expect(page).not_to have_content "Log in"
    end
  end

  describe "user with invalid information" do
    xit "handles authentication errors" do
      OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
      visit "/"
      click_link "Log in"
      expect(page).to have_content "Sign in"
    end
  end
end
