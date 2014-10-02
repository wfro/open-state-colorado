require "rails_helper"

RSpec.describe "log out" do
  it "logs out user successfully" do
    visit root_path
    mock_auth_hash
    click_link "Log in"
    expect(page).to have_content "Logged in as facebook user"
    click_link "Log out"
    expect(page).to have_content "Log in"
  end
end
