class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    redirect_to root_url, notice: "Logged in as #{user.name}"
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Logged out!"
  end

  def omniauth_failure
    redirect_to root_url, notice: "Authentication failed."
  end
end
