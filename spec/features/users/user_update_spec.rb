require "rails_helper"

RSpec.describe "user update", type: :feature do
  before do
    visit "/"
    SessionsHelper.stub(:current_user).and_return(User.first)
    mock_auth_hash
    click_link "Log in"
    click_link "Welcome, facebook user"
  end

  describe "with valid address" do
    xit "brings the user their legislators" do
    end
  end

  describe "with invalid address" do
    xit "re-renders #show" do
    end
  end
end
