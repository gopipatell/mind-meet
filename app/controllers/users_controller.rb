# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # create new users
    @user = User.new user_params
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
