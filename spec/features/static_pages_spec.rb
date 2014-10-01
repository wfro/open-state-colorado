require "rails_helper"

RSpec.describe "static pages", type: :feature do
  describe "home page" do
    before { visit root_path }
    subject { page }

    it { should have_content "Open State Colorado" }
  end

  describe "about page" do
  end

  describe "contact page" do
  end

  describe "layout links" do
    before { visit root_path }
    subject { page }

    xit { should have_link "About", href: about_path }
    xit { should have_link "Contact", href: contact_path }
    xit { should have_link "Log in", href: login_path }
    xit { should have_link "Open State Colorado", href: root_path }
  end
end
