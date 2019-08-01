# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # create new users
    @user = User.new user_params
    if params[:file].present?
      # Then call Cloudinary's upload method, passing in the file in params
      req = Cloudinary::Uploader.upload(params[:file])
      # Using the public_id allows us to use Cloudinary's powerful image
      # transformation methods.
      @user.image = req["public_id"]
    else
      @user.image = 'kisspng-united-states-avatar-organization-information-user-avatar-5ac20804a62b58.8673620215226654766806_fnfavj' #set detault image
    end
    if @user.save
      # create session
      session[:user_id] = @user.id
      # go to dashboad
      redirect_to dashboard_path
    else
      # go to signup page
      render :new
    end
  end

  def dashboard
    check_for_login
    populate_dashboard
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
