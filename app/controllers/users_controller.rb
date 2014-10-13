class UsersController < ApplicationController
  before_action :correct_user, only: [:show, :update]

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    result = Geocoder.search(params[:address])
    lat = result.data["geometry"]["location"]["lat"]
    long = result.data["geometry"]["location"]["long"]
    resp = OpenStates.new.geolocate_legislators(lat: lat, long: long)
    resp = JSON.parse(resp.body)
    resp.each { |leg_data| @user.legislators.create(leg_data) }

    if @user.update_attributes(user_params)
      flash[:success] = "District added."
      redirect_to user_path(@user)
    else
      flash[:error] = "Invalid input.  Please enter a district between 1 and 65."
      render "show"
    end
  end

  def send_notification
    UserNotifier.send_user_notification(@user).deliver
  end

  private

  def user_params
    params.require(:user).permit(:provider, :uid, :name, :district)
  end

  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_url, notice: "Unable to access restricted resource."
    end
  end
end
