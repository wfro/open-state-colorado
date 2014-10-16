require "rails_helper"

RSpec.describe UserNotifier, :type => :mailer do
  it "sends a notification email" do
    user = FactoryGirl.build :user

    expect { UserNotifier.send_initial_notification(user).deliver }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  describe "send_user_notification" do
    let(:user) { FactoryGirl.create :user }
    let(:mail) { UserNotifier.send_initial_notification(user) }

    it "renders the subject" do
      expect(mail.subject).to eq "Your first wamlut notification"
    end

    it "renders the receiver email" do
      expect(mail.to).to eq ["test@example.com"]
    end

    it "renders the sender email" do
      expect(mail.from).to eq ["will@wamlut.com"]
    end

    it "renders @name" do
      expect(mail.body.encoded).to match user.name
    end
  end
end
