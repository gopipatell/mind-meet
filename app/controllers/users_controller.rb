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
    @user = @current_user

    @actions_done = @user.actions.select{ |u| u.is_done }.count
    @actions_notdone = @user.actions.select{ |u| !u.is_done }.count
    if @user.actions.count == 0
      @actions_notdone_percent= 0
    else
    @actions_notdone_percent = @actions_done * 100 / @user.actions.count
  end
    @meetings_this_week = 'TODO'
    @meetings_this_month = 'TODO'
    @meetings_past = 'TODO'
    # @user.meetings.select{ |m| Date.parse(m.start.to_s).cweek == DateTime.now.cweek }.count

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
