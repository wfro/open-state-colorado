require "rails_helper"

RSpec.describe "user update", type: :feature do
  before do
    visit "/"
    SessionsHelper.stub(:current_user).and_return(User.first)
    mock_auth_hash
    click_link "Log in"
    click_link "Logged in as facebook user"
  end

  describe "with valid address" do
    xit "brings the user their legislators" do
    end
  end

  describe "with invalid address" do
    xit "re-renders #show" do
    end
  end

  context "with no email associated with their account" do
    it "successfully adds an email address" do
      fill_in "user[email]", with: "john@example.com"
      within(".email-field") { click_button "submit" }
      expect(page).not_to have_content "Add my email"
      expect(page).to have_css "div.alert.alert-success", text: "Account information successfully updated!"
    end
  end
end
