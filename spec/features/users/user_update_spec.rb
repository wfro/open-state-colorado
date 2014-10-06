require "rails_helper"

RSpec.describe "user update", type: :feature do
  before do
    visit "/"
    SessionsHelper.stub(:current_user).and_return(User.first)
    mock_auth_hash
    click_link "Log in"
    click_link "Welcome, facebook user"
  end

  describe "with valid district between 1 and 65" do
    it "can update district from their dashboard" do
      fill_in "user[district]", with: "65"
      click_button "Add my district"
      expect(page).to have_selector "div.alert.alert-success"
      expect(page).to have_content "District added."
    end
  end

  describe "with invalid district" do
    it "re-renders #show" do
      fill_in "user[district]", with: "100"
      click_button "Add my district"
      expect(page).to have_selector "div.alert.alert-error"
      expect(page).to have_content "Invalid input.  Please enter a district between 1 and 65."
    end
  end
end