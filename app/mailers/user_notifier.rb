class UserNotifier < ActionMailer::Base
  default from: "will@wamlut.com"

  def send_user_notification(user)
    @user = user
    mail(:to => @user.email,
         :subject => "Updates from wamlut.com")
  end
end
