class UserNotifier < ActionMailer::Base
  default from: "will@wamlut.com"

  def send_initial_notification(user)
    @user = user
    mail(:to => @user.email,
         :subject => "Your first wamlut notification")
  end

  def send_periodic_notification(user)
    @user = user
    mail(:to => @user.email,
         :subject => "Updates from wamlut")
  end
end
