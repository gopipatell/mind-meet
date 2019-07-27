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
    puts "Current user #{session[:user_id]}"
    @user = User.find session[:user_id]
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
