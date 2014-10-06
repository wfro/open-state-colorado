require "rails_helper"

RSpec.describe "User dashboard", type: :feature do

  before do
    visit "/"
    SessionsHelper.stub(:current_user).and_return(User.first)
    mock_auth_hash
    click_link "Log in"
    click_link "Welcome, facebook user"
  end

  context "before user has specified district" do
    it "displays a district form" do
      expect(page).to have_content "Add your district to see your state legislators"
    end
  end  

  context "after user has specified district" do
    it "displays district information" do
      fill_in "user[district]", with: "1"
      click_button "Add my district"
      expect(page).to have_content "Your district: 1"
      expect(page).not_to have_content "Add your district to see your state legislators"
    end
  end
end