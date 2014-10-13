require "rails_helper"

RSpec.describe "User dashboard", type: :feature do

  before do
    visit "/"
    SessionsHelper.stub(:current_user).and_return(User.first)
    mock_auth_hash
    click_link "Log in"
    click_link "Welcome, facebook user"
  end

  xit "displays a users district legislators" do
    expect(page).to have_content "John Doe"
    expect(page).to have_content "District 1"
  end
end
