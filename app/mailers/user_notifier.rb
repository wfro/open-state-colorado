class UserNotifier < ActionMailer::Base
  default from: "will@wamlut.com"

  def send_initial_notification(user)
    @user = user
    mail(:to => @user.email,
         :subject => "Your first wamlut notification")
  end
end
