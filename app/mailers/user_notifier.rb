class UserNotifier < ActionMailer::Base
  default from: "from@example.com"

  def send_user_notification(user)
    @user = user
    mail(:to => @user.email,
         :subject => "This is an example notification")
  end
end
