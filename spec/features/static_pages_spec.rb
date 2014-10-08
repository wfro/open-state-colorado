require "rails_helper"

RSpec.describe "static pages", type: :feature do
  describe "home page" do
    before { visit root_path }
    subject { page }

    it { should have_content "wamlut" }
  end

  describe "about page" do
  end

  describe "contact page" do
  end

  describe "header and footer links" do
    before { visit root_path }
    subject { page }

    it { should have_link "about", href: about_path }
    it { should have_link "home", href: root_path }
    it { should have_link "Contact", href: contact_path }
    it { should have_link "Log in", href: login_path }
    it { should have_link "wamlut", href: root_path }
  end
end
