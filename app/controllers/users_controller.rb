class UsersController < ApplicationController
  before_action :correct_user

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "Account information successfully updated!"
      redirect_to user_path(@user)
    else
      flash[:error] = "Invalid input, please try again."
      render "show"
    end
  end

  def geolocate
    @user = User.find(params[:id])
    result = Geocoder.search(params[:address])
    lat = result.first.data["geometry"]["location"]["lat"]
    long = result.first.data["geometry"]["location"]["lng"]
    resp = OpenStates.new.geolocate_legislators(lat, long)
    resp = JSON.parse(resp.body)
    resp.each do |legislator|
      legislator = Legislator.find_by(external_id: legislator["leg_id"])
      UserLegislator.create(user_id: @user.id, legislator_id: legislator.id)
    end
    redirect_to user_path(@user)
  end

  def notifications
    @user = User.find(params[:id])
  end

  def notifications_opt_in
    @user = User.find(params[:id])
    @user.send_initial_email
    @user.update_attributes(receives_notifications: true)
    flash[:success] = "Email sent!"
    redirect_to notifications_user_path
  end

  def notifications_opt_out
    @user = User.find(params[:id])
    @user.update_attributes(receives_notifications: false)
    redirect_to notifications_user_path
  end

  private

  def user_params
    params.require(:user).permit(:provider, :uid, :name, :district, :email)
  end

  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_url, notice: "Unable to access restricted resource."
    end
  end
end
